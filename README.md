# rdpmc

# instr23.asm
instr23.asm example code returns uops count

Compile with NASM:
```
nasm -felf64 instr23.asm
ld instr23.o -o instr23
```

```
./instr23
echo $?
```
output 0 means that perf counters are not enabled, use `perf stat ./instr23`
