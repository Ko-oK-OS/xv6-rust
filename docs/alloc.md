# 动态内存分配

## 按页分配

在这个部分，我们将使用从`kernel data`的结束地址到`PHYSTOP`的地址来进行动态内存分配，在xv6的实现中，将使用物理帧按物理页分配，对于每个可用的物理页，我们使用一个结构体来描述：

```rust
pub struct Run{
    next: Option<NonNull<Run>>,
}
```

这个结构体是一个链表的结构，对于每个结构体的`next`取地址即可获得下一个可用的物理页。为了能够在多线程访问这个结构体，我们也需要为这个结构体添加`Send trait`：

``` rust
unsafe impl Send for Run{}
```

同时，我们需要为链表设置一些方法来便于操作：

```rust
impl Run{
    pub unsafe fn new(ptr: *mut u8) -> NonNull<Run>{
        let r = ptr as *mut Run;
        write(r, Run{next: None});
        NonNull::new(r).unwrap()
    }

    pub fn set_next(&mut self, value: Option<NonNull<Run>>){
        self.next = value
    }

    pub fn get_next(&mut self) -> Option<NonNull<Run>>{
        self.next.take()
    }
}
```

这个结构体接受一个`u8`类型的可变裸指针返回`NonNull<Run>`，之所以使用`NonNull`来包裹是因为如果使用`Option<Run>`将会发生infinite size，而直接使用`*mut T`裸指针，由于Rust允许`*const T`和`*mut T`互相转换，这将会发生一些不安全的操作。

我们为`Run`取了一个别名为`FreeList`来表示空闲的物理页：

同时我们创建了一个`KMEM`作为全局的空闲物理页表示：

```rust
lazy_static!{
    static ref KMEM: Spinlock<FreeList> = Spinlock::new(FreeList { next: None }, "kmem");
}
```

## 分配内存

对于分配内存，我们将使用一个`kalloc`的函数来实现：

```rust
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.

pub unsafe fn kalloc() -> Option<*mut u8>{
    let mut guard = (*KMEM).acquire();
    let r = guard.get_next();
    if let Some(mut addr) = r{
        guard.set_next(addr.as_mut().get_next());
    }
    drop(guard);
    (*KMEM).release();

    match r {
        Some(ptr) => {
            let addr = ptr.as_ptr() as usize;
            // for i in 0..PGSIZE{
            //     write_volatile((addr + i) as *mut u8 , 5);
            // }
            Some(addr as *mut u8)
        }
        None => None
    }
}
```

在我们的实现中，我们首先获取锁来获取一个锁守卫变量（关于锁的内容请查看关于lock的文档）。我们获取可用的内存地址并返回一个指针指向空闲物理页的首地址并且将这个物理页从空闲物理页列表中移除。如果能够找到物理页返回物理页首地址，否则返回None。

## 释放内存

同样，对于释放内存地址，我们使用`kfree`来实现：

```rust
pub unsafe fn kfree(pa: PhysicalAddress){
    let addr:usize = pa.into();

    if (addr % PGSIZE !=0) || (addr < end as usize) || addr > PHYSTOP.into(){
        panic!("kfree")
    }

    // Fill with junk to catch dangling refs.
    // for i in 0..PGSIZE {
    //     write_volatile((addr + i) as *mut u8, 1);
    // }

    let mut r:NonNull<FreeList> = FreeList::new(addr as *mut u8);
    let mut guard = (*KMEM).acquire();

    r.as_mut().set_next(guard.get_next());
    guard.set_next(Some(r));
    drop(guard);

    (*KMEM).release();

}
```

这个函数接受一个物理地址，首先判断它是否是合法的物理页首地址，然后将其添加到物理页空闲链表中。

## 初始化

除此之外，我们还要实现一个`freerange`函数，这个函数仅仅用来做初始化：

```rust
unsafe fn freerange(pa_start:PhysicalAddress, pa_end:PhysicalAddress){
    println!("enter freerange......");
    let mut p = pa_start.page_round_up();
    let end_addr:usize = pa_end.into();
    println!("enter loop......");
    println!("start addr: {:#x}", p);
    println!("end addr: {:#x}", end_addr);
    while p < end_addr{
        // println!("page addr: {:#x}", p);
        kfree(PhysicalAddress::new(p));
        p += PGSIZE;
    }
    println!("freerange done......")

}
```

可以看到，这个函数接受一个起始地址和结束地址用来将其加入到空闲物理页链表中。

而在初始化函数中，我们将`end`和`PHYSTOP`作为动态内存分配的起始地址和终止地址传入：

```rust
pub unsafe fn kinit(){
    println!("kinit......");
    println!("kinit: end={:#x}", end as usize);
    freerange(PhysicalAddress::new(end as usize), PhysicalAddress::new(PHYSTOP.into()));
    println!("kinit done......")

}
```



