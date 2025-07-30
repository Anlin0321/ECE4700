# Initialize memory base register x3
lui x3, 4
addi x3, x3, 0

sw x5, 704(x3)

# --- Starting Loop 1 (Depth: 1, break at 5, max 6) ---
addi x8, x0, 6
addi x9, x0, 5
addi x7, x0, 0
loop_start_1: # Loop body start

# --- Starting Loop 2 (Depth: 2, break at 2, max 3) ---
addi x1, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_2: # Loop body start
sw x11, 740(x3)
lw x11, 252(x3)
lw x10, 484(x3)
sw x9, 540(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 3 (Depth: 3, break at 5, max 8) ---
addi x2, x0, 8
addi x9, x0, 5
addi x7, x0, 0
loop_start_3: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x7, 784(x3)
and x9, x8, x10
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 4 (Depth: 4, break at 3, max 10) ---
addi x1, x0, 10
addi x10, x0, 3
addi x5, x0, 0
loop_start_4: # Loop body start
and x2, x9, x1
lw x7, 280(x3)
sw x6, 404(x3)
srl x11, x1, x10
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 4 (Depth: 4) ---
addi x5, x5, 1
beq x5, x10, loop_end_4  # Conditional break from loop
bge x5, x1, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x11, 608(x3)
xor x6, x11, x1
sw x6, 144(x3)
sw x11, 556(x3)
lw x2, 496(x3)
lw x8, 880(x3)
lw x10, 552(x3)

# --- Closing Loop 3 (Depth: 3) ---
addi x7, x7, 1
beq x7, x9, loop_end_3  # Conditional break from loop
bge x7, x2, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

sw x10, 768(x3)
lw x6, 444(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_end_2  # Conditional break from loop
bge x2, x1, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---

sw x5, 420(x3)
lw x11, 1000(x3)
lw x10, 288(x3)
sw x10, 496(x3)

# --- Closing Loop 1 (Depth: 1) ---
addi x7, x7, 1
beq x7, x9, loop_end_1  # Conditional break from loop
bge x7, x8, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---

lw x2, 620(x3)

# --- Starting Loop 5 (Depth: 1, break at 4, max 7) ---
addi x6, x0, 7
addi x4, x0, 4
addi x9, x0, 0
loop_start_5: # Loop body start
and x8, x2, x7
sll x10, x7, x11

# --- Starting Loop 6 (Depth: 2, break at 2, max 10) ---
addi x4, x0, 10
addi x8, x0, 2
addi x1, x0, 0
loop_start_6: # Loop body start
sw x7, 960(x3)

# --- Starting Loop 7 (Depth: 3, break at 3, max 4) ---
addi x6, x0, 4
addi x10, x0, 3
addi x1, x0, 0
loop_start_7: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 8 (Depth: 4, break at 5, max 8) ---
addi x7, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_8: # Loop body start
sw x11, 220(x3)
sw x9, 332(x3)
sub x7, x11, x4
sw x11, 808(x3)
sw x4, 728(x3)
lw x11, 604(x3)
sub x1, x4, x2
xor x9, x1, x1

# --- Closing Loop 8 (Depth: 4) ---
addi x5, x5, 1
beq x5, x4, loop_end_8  # Conditional break from loop
bge x5, x7, loop_end_8 # Main loop exit condition
j loop_start_8 # Jump back to loop start
loop_end_8: # --- Resuming code after Loop 8 ---

srl x5, x9, x2
sub x11, x5, x1

# --- Closing Loop 7 (Depth: 3) ---
addi x1, x1, 1
beq x1, x10, loop_end_7  # Conditional break from loop
bge x1, x6, loop_end_7 # Main loop exit condition
j loop_start_7 # Jump back to loop start
loop_end_7: # --- Resuming code after Loop 7 ---

lw x9, 440(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 148(x3)

# --- Starting Loop 9 (Depth: 3, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_9: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 10 (Depth: 4, break at 4, max 9) ---
addi x8, x0, 9
addi x6, x0, 4
addi x1, x0, 0
loop_start_10: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 352(x3)

# --- Starting Loop 11 (Depth: 5, break at 1, max 6) ---
addi x7, x0, 6
addi x2, x0, 1
addi x4, x0, 0
loop_start_11: # Loop body start
sw x8, 696(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 596(x3)
add x11, x9, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 896(x3)
lw x2, 384(x3)
sw x2, 720(x3)
lw x10, 48(x3)
sw x10, 104(x3)
sw x2, 608(x3)

# --- Closing Loop 11 (Depth: 5) ---
addi x4, x4, 1
beq x4, x2, loop_end_11  # Conditional break from loop
bge x4, x7, loop_end_11 # Main loop exit condition
j loop_start_11 # Jump back to loop start
loop_end_11: # --- Resuming code after Loop 11 ---

sll x9, x4, x7
lw x1, 132(x3)
sll x7, x10, x4
sw x10, 836(x3)

# --- Closing Loop 10 (Depth: 4) ---
addi x1, x1, 1
beq x1, x6, loop_end_10  # Conditional break from loop
bge x1, x8, loop_end_10 # Main loop exit condition
j loop_start_10 # Jump back to loop start
loop_end_10: # --- Resuming code after Loop 10 ---

lw x7, 740(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 44(x3)
lw x4, 156(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 12 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x7, x0, 5
addi x11, x0, 0
loop_start_12: # Loop body start
and x2, x5, x6
add x6, x8, x7
lw x1, 32(x3)
lw x10, 568(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x6, x11, x10
lw x5, 148(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
srl x4, x5, x5
srl x11, x5, x7
srl x6, x11, x11
xor x6, x10, x4

# --- Closing Loop 12 (Depth: 4) ---
addi x11, x11, 1
beq x11, x7, loop_end_12  # Conditional break from loop
bge x11, x8, loop_end_12 # Main loop exit condition
j loop_start_12 # Jump back to loop start
loop_end_12: # --- Resuming code after Loop 12 ---


# --- Closing Loop 9 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_end_9  # Conditional break from loop
bge x2, x5, loop_end_9 # Main loop exit condition
j loop_start_9 # Jump back to loop start
loop_end_9: # --- Resuming code after Loop 9 ---


# --- Starting Loop 13 (Depth: 3, break at 3, max 8) ---
addi x2, x0, 8
addi x7, x0, 3
addi x5, x0, 0
loop_start_13: # Loop body start
lw x10, 932(x3)
sll x4, x6, x10
sw x7, 580(x3)
and x5, x9, x8

# --- Closing Loop 13 (Depth: 3) ---
addi x5, x5, 1
beq x5, x7, loop_end_13  # Conditional break from loop
bge x5, x2, loop_end_13 # Main loop exit condition
j loop_start_13 # Jump back to loop start
loop_end_13: # --- Resuming code after Loop 13 ---

sw x5, 456(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 14 (Depth: 3, break at 5, max 9) ---
addi x11, x0, 9
addi x9, x0, 5
addi x4, x0, 0
loop_start_14: # Loop body start
sw x10, 812(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 712(x3)
and x5, x2, x4
sw x10, 600(x3)

# --- Closing Loop 14 (Depth: 3) ---
addi x4, x4, 1
beq x4, x9, loop_end_14  # Conditional break from loop
bge x4, x11, loop_end_14 # Main loop exit condition
j loop_start_14 # Jump back to loop start
loop_end_14: # --- Resuming code after Loop 14 ---

sw x9, 728(x3)
sw x6, 80(x3)
add x1, x8, x10
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 15 (Depth: 3, break at 1, max 4) ---
addi x2, x0, 4
addi x10, x0, 1
addi x11, x0, 0
loop_start_15: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 16 (Depth: 4, break at 4, max 9) ---
addi x9, x0, 9
addi x2, x0, 4
addi x10, x0, 0
loop_start_16: # Loop body start
lw x11, 148(x3)
or x10, x11, x6
sw x6, 828(x3)
lw x11, 708(x3)
xor x6, x11, x7
sw x10, 92(x3)

# --- Closing Loop 16 (Depth: 4) ---
addi x10, x10, 1
beq x10, x2, loop_end_16  # Conditional break from loop
bge x10, x9, loop_end_16 # Main loop exit condition
j loop_start_16 # Jump back to loop start
loop_end_16: # --- Resuming code after Loop 16 ---

add x10, x2, x11
sw x5, 404(x3)
lw x1, 812(x3)

# --- Closing Loop 15 (Depth: 3) ---
addi x11, x11, 1
beq x11, x10, loop_end_15  # Conditional break from loop
bge x11, x2, loop_end_15 # Main loop exit condition
j loop_start_15 # Jump back to loop start
loop_end_15: # --- Resuming code after Loop 15 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 17 (Depth: 3, break at 1, max 2) ---
addi x11, x0, 2
addi x4, x0, 1
addi x7, x0, 0
loop_start_17: # Loop body start

# --- Starting Loop 18 (Depth: 4, break at 1, max 2) ---
addi x5, x0, 2
addi x4, x0, 1
addi x9, x0, 0
loop_start_18: # Loop body start

# --- Closing Loop 18 (Depth: 4) ---
addi x9, x9, 1
beq x9, x4, loop_end_18  # Conditional break from loop
bge x9, x5, loop_end_18 # Main loop exit condition
j loop_start_18 # Jump back to loop start
loop_end_18: # --- Resuming code after Loop 18 ---


# --- Starting Loop 19 (Depth: 4, break at 4, max 10) ---
addi x2, x0, 10
addi x6, x0, 4
addi x7, x0, 0
loop_start_19: # Loop body start
sw x7, 912(x3)

# --- Closing Loop 19 (Depth: 4) ---
addi x7, x7, 1
beq x7, x6, loop_end_19  # Conditional break from loop
bge x7, x2, loop_end_19 # Main loop exit condition
j loop_start_19 # Jump back to loop start
loop_end_19: # --- Resuming code after Loop 19 ---

sub x11, x7, x1
sw x11, 552(x3)
srl x9, x10, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x6, x9, x7

# --- Closing Loop 17 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_end_17  # Conditional break from loop
bge x7, x11, loop_end_17 # Main loop exit condition
j loop_start_17 # Jump back to loop start
loop_end_17: # --- Resuming code after Loop 17 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x11, x4, x6
sw x11, 788(x3)

# --- Closing Loop 6 (Depth: 2) ---
addi x1, x1, 1
beq x1, x8, loop_end_6  # Conditional break from loop
bge x1, x4, loop_end_6 # Main loop exit condition
j loop_start_6 # Jump back to loop start
loop_end_6: # --- Resuming code after Loop 6 ---

sw x9, 552(x3)
sw x9, 156(x3)
sw x2, 756(x3)

# --- Starting Loop 20 (Depth: 2, break at 4, max 7) ---
addi x2, x0, 7
addi x10, x0, 4
addi x11, x0, 0
loop_start_20: # Loop body start
sw x2, 148(x3)
sub x9, x7, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x10, 520(x3)

# --- Starting Loop 21 (Depth: 3, break at 2, max 7) ---
addi x7, x0, 7
addi x1, x0, 2
addi x6, x0, 0
loop_start_21: # Loop body start
sw x7, 156(x3)
sw x7, 896(x3)
lw x7, 4(x3)
add x4, x5, x10

# --- Starting Loop 22 (Depth: 4, break at 2, max 6) ---
addi x7, x0, 6
addi x8, x0, 2
addi x10, x0, 0
loop_start_22: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x11, 644(x3)
add x9, x8, x2
lw x1, 744(x3)
lw x8, 788(x3)
lw x6, 312(x3)
xor x5, x4, x1
or x6, x5, x4
sw x9, 504(x3)

# --- Starting Loop 23 (Depth: 5, break at 5, max 8) ---
addi x4, x0, 8
addi x2, x0, 5
addi x11, x0, 0
loop_start_23: # Loop body start
sub x4, x11, x6
sll x7, x4, x6
sub x5, x9, x6
lw x7, 728(x3)
xor x11, x7, x1
sw x11, 316(x3)
add x6, x8, x7
sw x5, 596(x3)
sll x4, x9, x5
lw x10, 612(x3)

# --- Closing Loop 23 (Depth: 5) ---
addi x11, x11, 1
beq x11, x2, loop_end_23  # Conditional break from loop
bge x11, x4, loop_end_23 # Main loop exit condition
j loop_start_23 # Jump back to loop start
loop_end_23: # --- Resuming code after Loop 23 ---


# --- Starting Loop 24 (Depth: 5, break at 4, max 5) ---
addi x1, x0, 5
addi x5, x0, 4
addi x2, x0, 0
loop_start_24: # Loop body start
sw x6, 944(x3)
sw x6, 896(x3)
lw x2, 280(x3)

# --- Closing Loop 24 (Depth: 5) ---
addi x2, x2, 1
beq x2, x5, loop_end_24  # Conditional break from loop
bge x2, x1, loop_end_24 # Main loop exit condition
j loop_start_24 # Jump back to loop start
loop_end_24: # --- Resuming code after Loop 24 ---

add x8, x1, x7
sw x1, 524(x3)
and x7, x1, x4
sll x10, x4, x6
xor x1, x10, x6
sw x7, 328(x3)
sll x9, x11, x7
sw x9, 148(x3)
lw x6, 60(x3)
lw x7, 840(x3)

# --- Closing Loop 22 (Depth: 4) ---
addi x10, x10, 1
beq x10, x8, loop_end_22  # Conditional break from loop
bge x10, x7, loop_end_22 # Main loop exit condition
j loop_start_22 # Jump back to loop start
loop_end_22: # --- Resuming code after Loop 22 ---

xor x2, x7, x5

# --- Starting Loop 25 (Depth: 4, break at 5, max 9) ---
addi x7, x0, 9
addi x11, x0, 5
addi x1, x0, 0
loop_start_25: # Loop body start
sw x11, 404(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x11, x2, x7

# --- Starting Loop 26 (Depth: 5, break at 3, max 8) ---
addi x1, x0, 8
addi x10, x0, 3
addi x2, x0, 0
loop_start_26: # Loop body start
or x1, x2, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 356(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 884(x3)
sw x5, 852(x3)
and x2, x4, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 26 (Depth: 5) ---
addi x2, x2, 1
beq x2, x10, loop_end_26  # Conditional break from loop
bge x2, x1, loop_end_26 # Main loop exit condition
j loop_start_26 # Jump back to loop start
loop_end_26: # --- Resuming code after Loop 26 ---

lw x10, 984(x3)
lw x11, 4(x3)
sw x6, 652(x3)
sw x10, 840(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 27 (Depth: 5, break at 2, max 6) ---
addi x5, x0, 6
addi x2, x0, 2
addi x9, x0, 0
loop_start_27: # Loop body start
add x10, x5, x6
sw x10, 844(x3)
lw x7, 800(x3)
and x11, x7, x10
sw x6, 108(x3)
or x11, x5, x4
sw x11, 640(x3)
sw x9, 796(x3)
lw x7, 212(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x1, 468(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x9, x1, x5
sll x5, x6, x9
lw x2, 252(x3)

# --- Closing Loop 27 (Depth: 5) ---
addi x9, x9, 1
beq x9, x2, loop_end_27  # Conditional break from loop
bge x9, x5, loop_end_27 # Main loop exit condition
j loop_start_27 # Jump back to loop start
loop_end_27: # --- Resuming code after Loop 27 ---


# --- Closing Loop 25 (Depth: 4) ---
addi x1, x1, 1
beq x1, x11, loop_end_25  # Conditional break from loop
bge x1, x7, loop_end_25 # Main loop exit condition
j loop_start_25 # Jump back to loop start
loop_end_25: # --- Resuming code after Loop 25 ---

sub x4, x9, x7
sw x6, 244(x3)
add x4, x2, x1
and x9, x5, x11
srl x10, x9, x2
sw x10, 544(x3)
sw x7, 800(x3)
sw x4, 620(x3)
and x10, x5, x9
sw x5, 8(x3)
sw x6, 488(x3)
sub x2, x7, x9
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 21 (Depth: 3) ---
addi x6, x6, 1
beq x6, x1, loop_end_21  # Conditional break from loop
bge x6, x7, loop_end_21 # Main loop exit condition
j loop_start_21 # Jump back to loop start
loop_end_21: # --- Resuming code after Loop 21 ---


# --- Starting Loop 28 (Depth: 3, break at 5, max 9) ---
addi x7, x0, 9
addi x5, x0, 5
addi x8, x0, 0
loop_start_28: # Loop body start
sw x6, 556(x3)
add x6, x5, x2
sub x9, x7, x4

# --- Starting Loop 29 (Depth: 4, break at 3, max 8) ---
addi x8, x0, 8
addi x6, x0, 3
addi x2, x0, 0
loop_start_29: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x11, x1, x6
sw x4, 652(x3)
sw x8, 532(x3)
sw x6, 108(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 784(x3)

# --- Closing Loop 29 (Depth: 4) ---
addi x2, x2, 1
beq x2, x6, loop_end_29  # Conditional break from loop
bge x2, x8, loop_end_29 # Main loop exit condition
j loop_start_29 # Jump back to loop start
loop_end_29: # --- Resuming code after Loop 29 ---

or x6, x7, x5
sw x5, 732(x3)

# --- Closing Loop 28 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_end_28  # Conditional break from loop
bge x8, x7, loop_end_28 # Main loop exit condition
j loop_start_28 # Jump back to loop start
loop_end_28: # --- Resuming code after Loop 28 ---

xor x11, x6, x8

# --- Closing Loop 20 (Depth: 2) ---
addi x11, x11, 1
beq x11, x10, loop_end_20  # Conditional break from loop
bge x11, x2, loop_end_20 # Main loop exit condition
j loop_start_20 # Jump back to loop start
loop_end_20: # --- Resuming code after Loop 20 ---

xor x7, x11, x5

# --- Starting Loop 30 (Depth: 2, break at 2, max 9) ---
addi x1, x0, 9
addi x6, x0, 2
addi x9, x0, 0
loop_start_30: # Loop body start

# --- Starting Loop 31 (Depth: 3, break at 1, max 7) ---
addi x10, x0, 7
addi x5, x0, 1
addi x6, x0, 0
loop_start_31: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 32 (Depth: 4, break at 3, max 6) ---
addi x2, x0, 6
addi x11, x0, 3
addi x4, x0, 0
loop_start_32: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x7, 932(x3)
lw x2, 940(x3)
sw x5, 296(x3)

# --- Closing Loop 32 (Depth: 4) ---
addi x4, x4, 1
beq x4, x11, loop_end_32  # Conditional break from loop
bge x4, x2, loop_end_32 # Main loop exit condition
j loop_start_32 # Jump back to loop start
loop_end_32: # --- Resuming code after Loop 32 ---


# --- Starting Loop 33 (Depth: 4, break at 4, max 9) ---
addi x11, x0, 9
addi x8, x0, 4
addi x5, x0, 0
loop_start_33: # Loop body start
xor x10, x5, x1
sub x9, x10, x11
sw x9, 564(x3)
add x2, x10, x7
and x1, x6, x2

# --- Starting Loop 34 (Depth: 5, break at 4, max 10) ---
addi x7, x0, 10
addi x10, x0, 4
addi x11, x0, 0
loop_start_34: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 412(x3)
sw x9, 568(x3)

# --- Closing Loop 34 (Depth: 5) ---
addi x11, x11, 1
beq x11, x10, loop_end_34  # Conditional break from loop
bge x11, x7, loop_end_34 # Main loop exit condition
j loop_start_34 # Jump back to loop start
loop_end_34: # --- Resuming code after Loop 34 ---

and x9, x10, x2

# --- Starting Loop 35 (Depth: 5, break at 3, max 6) ---
addi x10, x0, 6
addi x2, x0, 3
addi x6, x0, 0
loop_start_35: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 36 (Depth: 6, break at 2, max 3) ---
addi x11, x0, 3
addi x4, x0, 2
addi x5, x0, 0
loop_start_36: # Loop body start
sw x5, 956(x3)
and x5, x9, x4
and x11, x4, x7
lw x4, 812(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x9, x4, x7
sw x9, 324(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x7, x6, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x10, x7, x4
sll x4, x9, x1
sw x4, 292(x3)
lw x5, 880(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 220(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x8, x4, x5
and x5, x2, x1
and x10, x2, x8
sw x5, 880(x3)
sw x8, 436(x3)
sw x9, 68(x3)

# --- Closing Loop 36 (Depth: 6) ---
addi x5, x5, 1
beq x5, x4, loop_end_36  # Conditional break from loop
bge x5, x11, loop_end_36 # Main loop exit condition
j loop_start_36 # Jump back to loop start
loop_end_36: # --- Resuming code after Loop 36 ---

sw x7, 144(x3)

# --- Closing Loop 35 (Depth: 5) ---
addi x6, x6, 1
beq x6, x2, loop_end_35  # Conditional break from loop
bge x6, x10, loop_end_35 # Main loop exit condition
j loop_start_35 # Jump back to loop start
loop_end_35: # --- Resuming code after Loop 35 ---

sw x4, 416(x3)
lw x9, 476(x3)
srl x9, x5, x6

# --- Starting Loop 37 (Depth: 5, break at 5, max 7) ---
addi x11, x0, 7
addi x10, x0, 5
addi x8, x0, 0
loop_start_37: # Loop body start
sw x4, 620(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x11, 12(x3)
xor x6, x4, x10
sw x4, 64(x3)
lw x5, 944(x3)
lw x11, 528(x3)
xor x7, x10, x11
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x8, x9, x4
sw x8, 772(x3)

# --- Starting Loop 38 (Depth: 6, break at 3, max 8) ---
addi x9, x0, 8
addi x6, x0, 3
addi x1, x0, 0
loop_start_38: # Loop body start
lw x7, 980(x3)
and x4, x7, x5

# --- Closing Loop 38 (Depth: 6) ---
addi x1, x1, 1
beq x1, x6, loop_end_38  # Conditional break from loop
bge x1, x9, loop_end_38 # Main loop exit condition
j loop_start_38 # Jump back to loop start
loop_end_38: # --- Resuming code after Loop 38 ---

sw x7, 164(x3)
and x6, x7, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x4, 344(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 116(x3)
sll x7, x5, x5
srl x2, x9, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 772(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x5, x8, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 244(x3)
lw x5, 764(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x9, x5, x10
lw x8, 616(x3)
sw x8, 392(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x2, x6, x4
sw x7, 120(x3)
sw x2, 296(x3)
srl x9, x1, x5

# --- Starting Loop 39 (Depth: 6, break at 4, max 9) ---
addi x1, x0, 9
addi x10, x0, 4
addi x7, x0, 0
loop_start_39: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 276(x3)
lw x1, 768(x3)
lw x2, 516(x3)
xor x8, x2, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 39 (Depth: 6) ---
addi x7, x7, 1
beq x7, x10, loop_end_39  # Conditional break from loop
bge x7, x1, loop_end_39 # Main loop exit condition
j loop_start_39 # Jump back to loop start
loop_end_39: # --- Resuming code after Loop 39 ---

sw x5, 272(x3)
and x6, x7, x9
sw x1, 196(x3)
sll x10, x5, x1
or x7, x8, x5
sub x1, x9, x4
srl x10, x6, x2
sw x10, 792(x3)
sw x1, 780(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x11, x4, x6
sw x11, 64(x3)
xor x5, x6, x2
sw x4, 212(x3)
lw x9, 324(x3)
xor x2, x8, x4
sw x6, 624(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 992(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x4, 568(x3)
lw x5, 0(x3)

# --- Starting Loop 40 (Depth: 6, break at 3, max 10) ---
addi x1, x0, 10
addi x11, x0, 3
addi x8, x0, 0
loop_start_40: # Loop body start
lw x10, 84(x3)
sub x4, x9, x10

# --- Closing Loop 40 (Depth: 6) ---
addi x8, x8, 1
beq x8, x11, loop_end_40  # Conditional break from loop
bge x8, x1, loop_end_40 # Main loop exit condition
j loop_start_40 # Jump back to loop start
loop_end_40: # --- Resuming code after Loop 40 ---

lw x6, 676(x3)
xor x7, x6, x9
sll x1, x4, x11

# --- Closing Loop 37 (Depth: 5) ---
addi x8, x8, 1
beq x8, x10, loop_end_37  # Conditional break from loop
bge x8, x11, loop_end_37 # Main loop exit condition
j loop_start_37 # Jump back to loop start
loop_end_37: # --- Resuming code after Loop 37 ---

lw x6, 948(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x2, 40(x3)

# --- Closing Loop 33 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_end_33  # Conditional break from loop
bge x5, x11, loop_end_33 # Main loop exit condition
j loop_start_33 # Jump back to loop start
loop_end_33: # --- Resuming code after Loop 33 ---


# --- Starting Loop 41 (Depth: 4, break at 4, max 7) ---
addi x8, x0, 7
addi x1, x0, 4
addi x5, x0, 0
loop_start_41: # Loop body start

# --- Starting Loop 42 (Depth: 5, break at 3, max 4) ---
addi x10, x0, 4
addi x9, x0, 3
addi x11, x0, 0
loop_start_42: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x11, 388(x3)
or x11, x10, x8

# --- Starting Loop 43 (Depth: 6, break at 1, max 9) ---
addi x6, x0, 9
addi x10, x0, 1
addi x7, x0, 0
loop_start_43: # Loop body start
sw x4, 188(x3)
sw x1, 916(x3)
sw x1, 428(x3)
sw x5, 144(x3)
add x6, x2, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 312(x3)
sub x8, x9, x4
lw x11, 888(x3)
sw x8, 684(x3)
lw x6, 404(x3)
sw x4, 860(x3)
lw x10, 32(x3)
xor x4, x10, x11
add x9, x4, x4
lw x9, 608(x3)
sw x1, 968(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x11, 696(x3)

# --- Closing Loop 43 (Depth: 6) ---
addi x7, x7, 1
beq x7, x10, loop_end_43  # Conditional break from loop
bge x7, x6, loop_end_43 # Main loop exit condition
j loop_start_43 # Jump back to loop start
loop_end_43: # --- Resuming code after Loop 43 ---

add x4, x6, x11
sw x4, 208(x3)
and x1, x11, x6
lw x1, 764(x3)
xor x6, x8, x4
lw x2, 524(x3)
and x2, x2, x6
or x5, x6, x8
sw x9, 908(x3)
or x10, x1, x6
sw x10, 628(x3)
sw x10, 212(x3)
sw x1, 196(x3)
lw x1, 264(x3)
xor x6, x11, x10
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x7, 808(x3)
sw x11, 800(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x7, 484(x3)
sw x2, 996(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 256(x3)
lw x11, 504(x3)
lw x6, 792(x3)

# --- Closing Loop 42 (Depth: 5) ---
addi x11, x11, 1
beq x11, x9, loop_end_42  # Conditional break from loop
bge x11, x10, loop_end_42 # Main loop exit condition
j loop_start_42 # Jump back to loop start
loop_end_42: # --- Resuming code after Loop 42 ---

sw x10, 280(x3)
sw x11, 748(x3)
lw x7, 428(x3)
sll x2, x7, x10

# --- Starting Loop 44 (Depth: 5, break at 5, max 7) ---
addi x1, x0, 7
addi x5, x0, 5
addi x8, x0, 0
loop_start_44: # Loop body start
sub x9, x11, x4

# --- Starting Loop 45 (Depth: 6, break at 3, max 9) ---
addi x1, x0, 9
addi x11, x0, 3
addi x10, x0, 0
loop_start_45: # Loop body start
xor x8, x4, x2
sw x6, 400(x3)
sw x10, 732(x3)
lw x2, 752(x3)
sw x2, 376(x3)

# --- Closing Loop 45 (Depth: 6) ---
addi x10, x10, 1
beq x10, x11, loop_end_45  # Conditional break from loop
bge x10, x1, loop_end_45 # Main loop exit condition
j loop_start_45 # Jump back to loop start
loop_end_45: # --- Resuming code after Loop 45 ---

sw x5, 596(x3)
xor x10, x8, x4
sw x10, 476(x3)
add x2, x5, x9
sw x10, 520(x3)
and x5, x6, x10
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x5, 620(x3)
lw x11, 380(x3)
sw x11, 400(x3)
sw x9, 364(x3)

# --- Closing Loop 44 (Depth: 5) ---
addi x8, x8, 1
beq x8, x5, loop_end_44  # Conditional break from loop
bge x8, x1, loop_end_44 # Main loop exit condition
j loop_start_44 # Jump back to loop start
loop_end_44: # --- Resuming code after Loop 44 ---

sw x5, 412(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x9, 740(x3)

# --- Closing Loop 41 (Depth: 4) ---
addi x5, x5, 1
beq x5, x1, loop_end_41  # Conditional break from loop
bge x5, x8, loop_end_41 # Main loop exit condition
j loop_start_41 # Jump back to loop start
loop_end_41: # --- Resuming code after Loop 41 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x6, x4, x2
srl x7, x6, x1
srl x7, x7, x6
sw x11, 176(x3)
lw x9, 604(x3)

# --- Closing Loop 31 (Depth: 3) ---
addi x6, x6, 1
beq x6, x5, loop_end_31  # Conditional break from loop
bge x6, x10, loop_end_31 # Main loop exit condition
j loop_start_31 # Jump back to loop start
loop_end_31: # --- Resuming code after Loop 31 ---


# --- Starting Loop 46 (Depth: 3, break at 4, max 10) ---
addi x8, x0, 10
addi x7, x0, 4
addi x6, x0, 0
loop_start_46: # Loop body start
sub x1, x6, x7

# --- Starting Loop 47 (Depth: 4, break at 2, max 7) ---
addi x2, x0, 7
addi x10, x0, 2
addi x7, x0, 0
loop_start_47: # Loop body start
sw x2, 780(x3)
sw x9, 912(x3)
sw x6, 492(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x9, x5, x8
sw x10, 964(x3)
sll x10, x1, x2
and x9, x4, x2
and x6, x9, x2

# --- Starting Loop 48 (Depth: 5, break at 2, max 9) ---
addi x8, x0, 9
addi x11, x0, 2
addi x5, x0, 0
loop_start_48: # Loop body start
srl x7, x9, x6
sub x5, x10, x9
lw x8, 544(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x5, x8, x10

# --- Closing Loop 48 (Depth: 5) ---
addi x5, x5, 1
beq x5, x11, loop_end_48  # Conditional break from loop
bge x5, x8, loop_end_48 # Main loop exit condition
j loop_start_48 # Jump back to loop start
loop_end_48: # --- Resuming code after Loop 48 ---

lw x7, 260(x3)
lw x2, 820(x3)
sw x1, 128(x3)
lw x8, 324(x3)
sw x1, 628(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 47 (Depth: 4) ---
addi x7, x7, 1
beq x7, x10, loop_end_47  # Conditional break from loop
bge x7, x2, loop_end_47 # Main loop exit condition
j loop_start_47 # Jump back to loop start
loop_end_47: # --- Resuming code after Loop 47 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x1, x8, x10
sw x1, 660(x3)
sw x2, 824(x3)
sw x5, 660(x3)
sll x11, x1, x6
lw x6, 516(x3)
add x4, x6, x5

# --- Starting Loop 49 (Depth: 4, break at 2, max 3) ---
addi x5, x0, 3
addi x1, x0, 2
addi x6, x0, 0
loop_start_49: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x9, x6, x1
or x8, x10, x5
sw x8, 716(x3)
lw x6, 204(x3)
lw x11, 412(x3)
sw x4, 956(x3)
sw x10, 4(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 50 (Depth: 5, break at 3, max 9) ---
addi x4, x0, 9
addi x7, x0, 3
addi x2, x0, 0
loop_start_50: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x11, 300(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x7, 948(x3)
xor x5, x11, x1
sw x1, 712(x3)
lw x7, 760(x3)
and x11, x10, x6

# --- Closing Loop 50 (Depth: 5) ---
addi x2, x2, 1
beq x2, x7, loop_end_50  # Conditional break from loop
bge x2, x4, loop_end_50 # Main loop exit condition
j loop_start_50 # Jump back to loop start
loop_end_50: # --- Resuming code after Loop 50 ---

lw x7, 884(x3)

# --- Starting Loop 51 (Depth: 5, break at 3, max 4) ---
addi x5, x0, 4
addi x6, x0, 3
addi x9, x0, 0
loop_start_51: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x6, 4(x3)

# --- Closing Loop 51 (Depth: 5) ---
addi x9, x9, 1
beq x9, x6, loop_end_51  # Conditional break from loop
bge x9, x5, loop_end_51 # Main loop exit condition
j loop_start_51 # Jump back to loop start
loop_end_51: # --- Resuming code after Loop 51 ---

and x1, x11, x7
sw x1, 96(x3)
lw x10, 36(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x7, x10, x8
and x11, x7, x10
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x11, 640(x3)
lw x6, 632(x3)
lw x11, 748(x3)
srl x7, x11, x5
sw x7, 928(x3)
sw x4, 696(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 49 (Depth: 4) ---
addi x6, x6, 1
beq x6, x1, loop_end_49  # Conditional break from loop
bge x6, x5, loop_end_49 # Main loop exit condition
j loop_start_49 # Jump back to loop start
loop_end_49: # --- Resuming code after Loop 49 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x8, x6, x4
sw x8, 380(x3)
srl x8, x7, x9

# --- Closing Loop 46 (Depth: 3) ---
addi x6, x6, 1
beq x6, x7, loop_end_46  # Conditional break from loop
bge x6, x8, loop_end_46 # Main loop exit condition
j loop_start_46 # Jump back to loop start
loop_end_46: # --- Resuming code after Loop 46 ---

sw x5, 32(x3)

# --- Starting Loop 52 (Depth: 3, break at 3, max 7) ---
addi x9, x0, 7
addi x8, x0, 3
addi x5, x0, 0
loop_start_52: # Loop body start
lw x11, 708(x3)

# --- Starting Loop 53 (Depth: 4, break at 4, max 10) ---
addi x5, x0, 10
addi x8, x0, 4
addi x7, x0, 0
loop_start_53: # Loop body start

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 53
addi x7, x7, 1
beq x7, x8, loop_end_53
bge x7, x5, loop_end_53
j loop_start_53
loop_end_53: # Loop exit

# Closing remaining Loop 52
addi x5, x5, 1
beq x5, x8, loop_end_52
bge x5, x9, loop_end_52
j loop_start_52
loop_end_52: # Loop exit

# Closing remaining Loop 30
addi x9, x9, 1
beq x9, x6, loop_end_30
bge x9, x1, loop_end_30
j loop_start_30
loop_end_30: # Loop exit

# Closing remaining Loop 5
addi x9, x9, 1
beq x9, x4, loop_end_5
bge x9, x6, loop_end_5
j loop_start_5
loop_end_5: # Loop exit

# Program exit
li a7, 93 # ecall: exit
ecall
