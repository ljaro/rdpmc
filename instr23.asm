; nasm compiler

; How to compile:
; nasm -felf64 instr23.asm
; ld instr23.o -o instr23
;
; run ./instr23 and check output echo $?
; output 0 means that perf counters are not enabled, use perf stat ./instr23

segment .text
global _start

_start:
    mov   ecx, 1<<30      ; fixed counter: instructions
    rdpmc
    mov   edi, eax        ; start

    mov   edx, 10
.loop:
    dec   edx
    jnz   .loop

    rdpmc               ; ecx = same counter as before

    sub   eax, edi       ; end - start

    mov   edi, eax
    mov   eax, 231
    syscall             ; sys_exit_group(rdpmc).  sys_exit isn't wrong, but glibc uses exit_group.
    
