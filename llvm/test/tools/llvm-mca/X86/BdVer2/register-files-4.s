# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=bdver2 -iterations=22 -dispatch-stats -register-file-stats -resource-pressure=false -timeline -timeline-max-iterations=3 < %s | FileCheck %s

idiv %eax

# CHECK:      Iterations:        22
# CHECK-NEXT: Instructions:      22
# CHECK-NEXT: Total Cycles:      542
# CHECK-NEXT: Total uOps:        44

# CHECK:      Dispatch Width:    4
# CHECK-NEXT: uOps Per Cycle:    0.08
# CHECK-NEXT: IPC:               0.04
# CHECK-NEXT: Block RThroughput: 25.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      14    25.00                 U     idivl	%eax

# CHECK:      Dynamic Dispatch Stall Cycles:
# CHECK-NEXT: RAT     - Register unavailable:                      0
# CHECK-NEXT: RCU     - Retire tokens unavailable:                 0
# CHECK-NEXT: SCHEDQ  - Scheduler full:                            0
# CHECK-NEXT: LQ      - Load queue full:                           0
# CHECK-NEXT: SQ      - Store queue full:                          0
# CHECK-NEXT: GROUP   - Static restrictions on the dispatch group: 0
# CHECK-NEXT: USH     - Uncategorised Structural Hazard:           0

# CHECK:      Dispatch Logic - number of cycles where we saw N micro opcodes dispatched:
# CHECK-NEXT: [# dispatched], [# cycles]
# CHECK-NEXT:  0,              531  (98.0%)
# CHECK-NEXT:  4,              11  (2.0%)

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    66
# CHECK-NEXT: Max number of mappings used:         66

# CHECK:      *  Register File #1 -- PdFpuPRF:
# CHECK-NEXT:    Number of physical registers:     160
# CHECK-NEXT:    Total number of mappings created: 0
# CHECK-NEXT:    Max number of mappings used:      0

# CHECK:      *  Register File #2 -- PdIntegerPRF:
# CHECK-NEXT:    Number of physical registers:     96
# CHECK-NEXT:    Total number of mappings created: 66
# CHECK-NEXT:    Max number of mappings used:      66

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789          0123456789          0123456789
# CHECK-NEXT: Index     0123456789          0123456789          0123456789          0123456

# CHECK:      [0,0]     DeeeeeeeeeeeeeeER   .    .    .    .    .    .    .    .    .    ..   idivl	%eax
# CHECK-NEXT: [1,0]     D=========================eeeeeeeeeeeeeeER   .    .    .    .    ..   idivl	%eax
# CHECK-NEXT: [2,0]     .D=================================================eeeeeeeeeeeeeeER   idivl	%eax

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     3     25.7   7.7    0.0       idivl	%eax