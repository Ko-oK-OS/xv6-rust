.global __fork
__fork:
li a7, 0
ecall
ret

.global __exit
__exit:
li a7, 1
ecall
ret

.global __wait
__wait:
li a7, 2
ecall
ret

.global __pipe
__pipe:
li a7, 3
ecall
ret

.global __read
__read:
li a7, 4
ecall
ret

.global __write
__write:
li a7, 5
ecall
ret

.global __close
__close:
li a7, 6
ecall
ret

.global __kill
__kill:
li a7, 7
ecall
ret

.global __exec
__exec:
li a7, 8
ecall
ret

.global __open
__open:
li a7, 9
ecall
ret

.global __mknod
__mknod:
li a7, 10
ecall
ret


.global __unlink
__unlink:
li a7, 11
ecall
ret

.global __fstat
__fstat:
li a7, 12
ecall
ret

.global __link 
__link:
li a7, 13
ecall
ret 

.global __mkdir 
__mkdir:
li a7, 14
ecall
ret 

.global __chidr
__chdir:
li a7, 15
ecall
ret

.global __dup
__dup:
li a7, 16
ecall
ret

.global __getpid
__getpid:
li a7, 17
ecall
ret 

.global __sbrk
__sbrk:
li a7, 18
ecall
ret

.global __sleep
__sleep:
li a7, 19
ecall
ret

.global __uptime
__uptime:
li a7, 20
ecall
ret
