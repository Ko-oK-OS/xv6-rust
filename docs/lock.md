# 锁

## 自旋锁（Spinlock）

我们实现的自旋锁的定义如下：

```rust
#[derive(Debug,Default)]
pub struct Spinlock<T: ?Sized>{
    locked:AtomicBool,
    name: &'static str,
    cpu_id: isize,
    data:UnsafeCell<T>,
}
```

`locked`由`core::atmoic::AtomicBool`来声明，这是一个原子布尔类型，即这是一个线程安全的值。而data的值则有`UnsafeCell`来包裹（wrap），这表明将有一些不安全的操作将作用在内部包裹的值中，使用该类型我们将没有办法获取内部变量的可变引用。我们可以通过`.get()`方法获取`*mut T`来对其内部进行操作。

对于一个锁变量，我们需要对其实现`acquire()`和`release()`方法：

```rust
pub fn acquire(&self) -> SpinlockGuard<'_, T> {
        while !self.locked.swap(true, Ordering::AcqRel){
            // Now we signals the processor that it is inside a busy-wait spin-loop 
            spin_loop();
        }
        SpinlockGuard{spinlock: &self}
    }

    pub fn release(&self) {
        self.locked.store(false, Ordering::Release);
    }
```

在我们的实现中，对于`acquire`方法，我们首先需要等待获取锁变量并对其进行原子上锁操作，在对变量上锁之后返回一个`SpinlockGuard`变量。而对于`release`方法，我们只需要将其原子性地释放锁即可。

而`SpinlockGuard`的定义如下：

```rust
pub struct SpinlockGuard<'a, T>{
    spinlock:&'a Spinlock<T>
}
```

锁守卫者返回一个锁变量供获得锁的线程进行操作。同时我们对解引用操作符进行重载，从而能够使得获得锁的线程调用data的方法进行操作:

```rust
impl<T> Deref for SpinlockGuard<'_, T>{
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe{
            &*self.spinlock.data.get()
        }
    }
}   

impl<T> DerefMut for SpinlockGuard<'_, T>{
    fn deref_mut(&mut self) -> &mut Self::Target{
        unsafe{
            &mut *self.spinlock.data.get()
        }
    }
}
```

由于没有实现线程，所以暂时没有`acquire`,`release`对于进程上下文的处理。

