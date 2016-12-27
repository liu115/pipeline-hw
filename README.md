# pipeline-hw
## Introduction
A simple pipeline CPU that support below MIPS instructions.

- and
- or
- add
- sub
- mul
- addi
- lw
- sw
- beq
- j


And also support hazard handling such as,

- Forwarding
- Stall
- Pipeline Flush
- Memory Hierarchy

## How to run
Environment: linux
Dependency: iverilog
```
cd src
sh com.sh
vvp test.vvp
```
