# 调度器

xv6-rust 使用多核 FIFO 调度器。每个 hart 都运行同一个调度循环，从全局
运行队列中取得最早进入 `RUNNABLE` 状态的进程槽位。

## 为什么进程表仍然是固定数组

`ProcManager` 继续使用 `[Process; NPROC]` 保存进程，而不是直接保存
`VecDeque<Process>`。这是一个地址稳定性要求，并非遗留实现：

- `parent` 保存指向父进程槽位的裸指针；
- 每个 CPU 保存当前 `Process` 的 `NonNull` 指针；
- 内核栈虚拟地址由进程槽位序号计算；
- 用户线程的私有 trapframe 虚拟地址同样由槽位序号计算。

移动 `Process` 会让这些引用和地址失效。因此，`VecDeque` 只承担就绪队列的
职责，并保存稳定的槽位索引：

```rust
proc: [Process; NPROC],
run_queue: Spinlock<VecDeque<usize>>,
```

这个设计将“对象存储”和“调度顺序”分开：进程表提供稳定地址，运行队列提供
O(1) 的入队和出队，并避免每轮调度从槽位 0 开始扫描造成的偏置。

## 队列不变量

每个 `ProcMeta` 都包含一个由进程锁保护的 `queued` 标志。调度器维护以下
不变量：

1. `queued == true` 表示运行队列中恰好有一个该槽位的条目；
2. 将进程发布为 `RUNNABLE` 时，在同一个进程锁临界区内设置状态和
   `queued`，然后把槽位追加到队尾；
3. 调度器从队首弹出槽位后，将 `queued` 清零，再把状态从 `RUNNABLE`
   改为调度中的 `ALLOCATED`；
4. 重复入队会立即触发 panic，因为重复条目可能使两个 hart 同时运行同一份
   上下文；
5. 队列在堆初始化后一次性为 `NPROC` 个条目预留容量，避免中断或唤醒路径
   因扩容而分配内存。

所有产生 `RUNNABLE` 的路径都必须通过 `ProcManager::make_runnable` 或内部的
`publish_runnable`，包括首次启动、`fork`、创建 system/user thread、`yield`、
`wakeup`，以及唤醒被终止的睡眠进程。

## 锁顺序

生产者先持有目标进程锁，再短暂获取运行队列锁。调度器则只在 `pop_front`
期间持有队列锁，释放它以后才获取对应进程锁。调度器不能同时持有这两把锁，
否则会与 `yield` 或 `wakeup` 形成反向锁依赖。

`yield` 会在切回调度器之前入队，但仍然持有自身进程锁。其他 hart 可以取出
该槽位，却必须等原 hart 完成上下文切换并释放进程锁后才能运行它，因此同一
上下文不会并发执行。

## 状态转换

| 事件 | 原状态 | 新状态 | 队列操作 |
| --- | --- | --- | --- |
| 首次启动、`fork`、创建线程 | `ALLOCATED` | `RUNNABLE` | 加入队尾 |
| `yield` | `RUNNING` | `RUNNABLE` | 加入队尾 |
| `wakeup` / 唤醒被 kill 的进程 | `SLEEPING` | `RUNNABLE` | 加入队尾 |
| 调度器选中 | `RUNNABLE` | `ALLOCATED`，随后为 `RUNNING` | 从队首移除 |
| `sleep` | `RUNNING` | `SLEEPING` | 无 |
| `exit` / thread 返回 | `RUNNING` | `ZOMBIE` | 无 |
| `wait` / `join` 回收 | `ZOMBIE` | `UNUSED` | 无 |

## 回归测试

在仓库根目录运行：

```sh
python3 tests/qemu_user_program.py scheduler-queue
```

该测试在同一次三核 QEMU 启动中依次运行两轮 `forktest` 和一轮
`threadtest`，覆盖进程表填满、槽位回收、线程 sleep/wakeup，以及队列条目
复用。最后再次运行 shell 命令，确认调度器仍能继续提供服务。
