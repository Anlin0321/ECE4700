# Initialize memory base register x3
lui x3, 2
addi x3, x3, 0

bne x0, x0, 8 # Never branch
nop # Executed instruction
or x4, x7, x6

# --- Starting Loop 1 (Depth: 1, break at 5, max 10) ---
addi x6, x0, 10
addi x7, x0, 5
addi x2, x0, 0
loop_start_1: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x6, x2, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 1 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_1  # Conditional break from loop
bge x2, x6, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---

srl x5, x2, x4

# --- Starting Loop 2 (Depth: 1, break at 2, max 7) ---
addi x7, x0, 7
addi x4, x0, 2
addi x6, x0, 0
loop_start_2: # Loop body start
sll x6, x2, x7

# --- Closing Loop 2 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_end_2  # Conditional break from loop
bge x6, x7, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---

sub x6, x6, x4
sw x2, 312(x3)

# --- Starting Loop 3 (Depth: 1, break at 5, max 9) ---
addi x7, x0, 9
addi x4, x0, 5
addi x5, x0, 0
loop_start_3: # Loop body start
sll x2, x4, x7
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 3 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_3  # Conditional break from loop
bge x5, x7, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x5, 192(x3)
add x5, x2, x7
lw x4, 92(x3)
lw x7, 856(x3)
sub x1, x5, x6
sub x7, x2, x1
lw x4, 704(x3)
sw x1, 708(x3)
sw x2, 136(x3)
or x7, x1, x5
lw x2, 812(x3)

# --- Starting Loop 4 (Depth: 1, break at 5, max 8) ---
addi x1, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_4: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 564(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 716(x3)

# --- Closing Loop 4 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_4  # Conditional break from loop
bge x5, x1, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x4, x6, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 5 (Depth: 1, break at 3, max 6) ---
addi x5, x0, 6
addi x6, x0, 3
addi x1, x0, 0
loop_start_5: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 6 (Depth: 2, break at 1, max 6) ---
addi x5, x0, 6
addi x2, x0, 1
addi x7, x0, 0
loop_start_6: # Loop body start
sw x2, 260(x3)
lw x7, 980(x3)
sw x1, 648(x3)

# --- Closing Loop 6 (Depth: 2) ---
addi x7, x7, 1
beq x7, x2, loop_end_6  # Conditional break from loop
bge x7, x5, loop_end_6 # Main loop exit condition
j loop_start_6 # Jump back to loop start
loop_end_6: # --- Resuming code after Loop 6 ---

srl x4, x5, x2

# --- Closing Loop 5 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_end_5  # Conditional break from loop
bge x1, x5, loop_end_5 # Main loop exit condition
j loop_start_5 # Jump back to loop start
loop_end_5: # --- Resuming code after Loop 5 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 0(x3)
or x7, x6, x2
lw x5, 832(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x2, x5, x7
add x5, x2, x1
sw x1, 912(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 7 (Depth: 1, break at 4, max 9) ---
addi x7, x0, 9
addi x1, x0, 4
addi x2, x0, 0
loop_start_7: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
srl x1, x2, x6

# --- Starting Loop 8 (Depth: 2, break at 1, max 9) ---
addi x4, x0, 9
addi x6, x0, 1
addi x7, x0, 0
loop_start_8: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 8 (Depth: 2) ---
addi x7, x7, 1
beq x7, x6, loop_end_8  # Conditional break from loop
bge x7, x4, loop_end_8 # Main loop exit condition
j loop_start_8 # Jump back to loop start
loop_end_8: # --- Resuming code after Loop 8 ---

sw x7, 660(x3)
sw x5, 748(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x2, x7, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 884(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 532(x3)
sub x6, x5, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 200(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x2, x4, x1
lw x4, 696(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x5, 236(x3)
and x1, x6, x7
sw x6, 284(x3)
sw x6, 708(x3)

# --- Starting Loop 9 (Depth: 2, break at 1, max 2) ---
addi x7, x0, 2
addi x5, x0, 1
addi x4, x0, 0
loop_start_9: # Loop body start
sw x1, 116(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x2, x5, x1
or x5, x1, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 9 (Depth: 2) ---
addi x4, x4, 1
beq x4, x5, loop_end_9  # Conditional break from loop
bge x4, x7, loop_end_9 # Main loop exit condition
j loop_start_9 # Jump back to loop start
loop_end_9: # --- Resuming code after Loop 9 ---

lw x1, 288(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 864(x3)
lw x4, 580(x3)

# --- Closing Loop 7 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_end_7  # Conditional break from loop
bge x2, x7, loop_end_7 # Main loop exit condition
j loop_start_7 # Jump back to loop start
loop_end_7: # --- Resuming code after Loop 7 ---

sub x2, x4, x5
srl x7, x2, x2
sw x2, 672(x3)
sw x4, 180(x3)
sll x4, x6, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 10 (Depth: 1, break at 4, max 6) ---
addi x6, x0, 6
addi x7, x0, 4
addi x1, x0, 0
loop_start_10: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x1, x5, x2

# --- Starting Loop 11 (Depth: 2, break at 2, max 9) ---
addi x7, x0, 9
addi x2, x0, 2
addi x6, x0, 0
loop_start_11: # Loop body start
lw x1, 248(x3)
xor x2, x1, x4
lw x4, 372(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 11 (Depth: 2) ---
addi x6, x6, 1
beq x6, x2, loop_end_11  # Conditional break from loop
bge x6, x7, loop_end_11 # Main loop exit condition
j loop_start_11 # Jump back to loop start
loop_end_11: # --- Resuming code after Loop 11 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x2, 828(x3)

# --- Closing Loop 10 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_end_10  # Conditional break from loop
bge x1, x6, loop_end_10 # Main loop exit condition
j loop_start_10 # Jump back to loop start
loop_end_10: # --- Resuming code after Loop 10 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x7, x2, x4
and x5, x2, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 256(x3)

# --- Starting Loop 12 (Depth: 1, break at 4, max 6) ---
addi x2, x0, 6
addi x6, x0, 4
addi x4, x0, 0
loop_start_12: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x1, x5, x2
sll x6, x7, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 12 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_end_12  # Conditional break from loop
bge x4, x2, loop_end_12 # Main loop exit condition
j loop_start_12 # Jump back to loop start
loop_end_12: # --- Resuming code after Loop 12 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x6, x6, x5
sw x4, 892(x3)
sw x7, 192(x3)
lw x2, 372(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 880(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 13 (Depth: 1, break at 3, max 10) ---
addi x4, x0, 10
addi x5, x0, 3
addi x1, x0, 0
loop_start_13: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 232(x3)
xor x7, x1, x6

# --- Closing Loop 13 (Depth: 1) ---
addi x1, x1, 1
beq x1, x5, loop_end_13  # Conditional break from loop
bge x1, x4, loop_end_13 # Main loop exit condition
j loop_start_13 # Jump back to loop start
loop_end_13: # --- Resuming code after Loop 13 ---

lw x2, 304(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 14 (Depth: 1, break at 4, max 6) ---
addi x5, x0, 6
addi x7, x0, 4
addi x1, x0, 0
loop_start_14: # Loop body start
srl x2, x1, x7
sub x1, x5, x6

# --- Closing Loop 14 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_end_14  # Conditional break from loop
bge x1, x5, loop_end_14 # Main loop exit condition
j loop_start_14 # Jump back to loop start
loop_end_14: # --- Resuming code after Loop 14 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 160(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x4, x6, x1
and x5, x6, x4
sw x7, 76(x3)
add x4, x7, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x1, x2, x7
or x5, x2, x1
lw x7, 64(x3)
srl x1, x2, x6
sw x5, 644(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x5, x2, x1

# --- Starting Loop 15 (Depth: 1, break at 2, max 4) ---
addi x1, x0, 4
addi x7, x0, 2
addi x6, x0, 0
loop_start_15: # Loop body start
sw x1, 656(x3)
sw x1, 800(x3)

# --- Closing Loop 15 (Depth: 1) ---
addi x6, x6, 1
beq x6, x7, loop_end_15  # Conditional break from loop
bge x6, x1, loop_end_15 # Main loop exit condition
j loop_start_15 # Jump back to loop start
loop_end_15: # --- Resuming code after Loop 15 ---

xor x4, x5, x2

# --- Starting Loop 16 (Depth: 1, break at 2, max 5) ---
addi x5, x0, 5
addi x6, x0, 2
addi x1, x0, 0
loop_start_16: # Loop body start

# --- Closing Loop 16 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_end_16  # Conditional break from loop
bge x1, x5, loop_end_16 # Main loop exit condition
j loop_start_16 # Jump back to loop start
loop_end_16: # --- Resuming code after Loop 16 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 72(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 160(x3)
lw x5, 556(x3)
xor x1, x4, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 620(x3)
sw x2, 784(x3)
sw x4, 308(x3)

# --- Starting Loop 17 (Depth: 1, break at 5, max 9) ---
addi x1, x0, 9
addi x4, x0, 5
addi x5, x0, 0
loop_start_17: # Loop body start
xor x4, x5, x7
add x6, x5, x2

# --- Starting Loop 18 (Depth: 2, break at 3, max 9) ---
addi x1, x0, 9
addi x7, x0, 3
addi x4, x0, 0
loop_start_18: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 18 (Depth: 2) ---
addi x4, x4, 1
beq x4, x7, loop_end_18  # Conditional break from loop
bge x4, x1, loop_end_18 # Main loop exit condition
j loop_start_18 # Jump back to loop start
loop_end_18: # --- Resuming code after Loop 18 ---


# --- Closing Loop 17 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_17  # Conditional break from loop
bge x5, x1, loop_end_17 # Main loop exit condition
j loop_start_17 # Jump back to loop start
loop_end_17: # --- Resuming code after Loop 17 ---

lw x7, 44(x3)

# --- Starting Loop 19 (Depth: 1, break at 1, max 4) ---
addi x1, x0, 4
addi x4, x0, 1
addi x5, x0, 0
loop_start_19: # Loop body start
sw x5, 852(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x2, x1, x6

# --- Closing Loop 19 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_19  # Conditional break from loop
bge x5, x1, loop_end_19 # Main loop exit condition
j loop_start_19 # Jump back to loop start
loop_end_19: # --- Resuming code after Loop 19 ---

lw x1, 872(x3)
sw x6, 676(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x1, x6, x7
sw x4, 20(x3)
lw x5, 908(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 640(x3)
sll x2, x1, x6

# --- Starting Loop 20 (Depth: 1, break at 1, max 5) ---
addi x1, x0, 5
addi x7, x0, 1
addi x4, x0, 0
loop_start_20: # Loop body start
lw x6, 592(x3)
add x4, x6, x7

# --- Closing Loop 20 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_end_20  # Conditional break from loop
bge x4, x1, loop_end_20 # Main loop exit condition
j loop_start_20 # Jump back to loop start
loop_end_20: # --- Resuming code after Loop 20 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x7, x4, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 620(x3)

# --- Starting Loop 21 (Depth: 1, break at 1, max 9) ---
addi x2, x0, 9
addi x6, x0, 1
addi x4, x0, 0
loop_start_21: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x1, x4, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 21 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_end_21  # Conditional break from loop
bge x4, x2, loop_end_21 # Main loop exit condition
j loop_start_21 # Jump back to loop start
loop_end_21: # --- Resuming code after Loop 21 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x4, x1, x7
sw x6, 696(x3)

# --- Starting Loop 22 (Depth: 1, break at 5, max 8) ---
addi x7, x0, 8
addi x1, x0, 5
addi x5, x0, 0
loop_start_22: # Loop body start
and x7, x5, x1
sub x1, x2, x4
sw x4, 844(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x1, x4, x7
lw x5, 184(x3)
srl x7, x4, x2
sw x4, 868(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 23 (Depth: 2, break at 2, max 8) ---
addi x7, x0, 8
addi x6, x0, 2
addi x4, x0, 0
loop_start_23: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 23 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_end_23  # Conditional break from loop
bge x4, x7, loop_end_23 # Main loop exit condition
j loop_start_23 # Jump back to loop start
loop_end_23: # --- Resuming code after Loop 23 ---


# --- Closing Loop 22 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_end_22  # Conditional break from loop
bge x5, x7, loop_end_22 # Main loop exit condition
j loop_start_22 # Jump back to loop start
loop_end_22: # --- Resuming code after Loop 22 ---

srl x1, x4, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x7, x1, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x7, x4, x6
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 24 (Depth: 1, break at 5, max 8) ---
addi x2, x0, 8
addi x1, x0, 5
addi x5, x0, 0
loop_start_24: # Loop body start
srl x7, x5, x1

# --- Starting Loop 25 (Depth: 2, break at 3, max 8) ---
addi x5, x0, 8
addi x4, x0, 3
addi x1, x0, 0
loop_start_25: # Loop body start
lw x7, 140(x3)
sw x1, 748(x3)
srl x6, x7, x5
sw x5, 852(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 25 (Depth: 2) ---
addi x1, x1, 1
beq x1, x4, loop_end_25  # Conditional break from loop
bge x1, x5, loop_end_25 # Main loop exit condition
j loop_start_25 # Jump back to loop start
loop_end_25: # --- Resuming code after Loop 25 ---

sw x7, 164(x3)
srl x1, x7, x4

# --- Closing Loop 24 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_end_24  # Conditional break from loop
bge x5, x2, loop_end_24 # Main loop exit condition
j loop_start_24 # Jump back to loop start
loop_end_24: # --- Resuming code after Loop 24 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 684(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x2, x1, x4
or x2, x7, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x4, x7, x2
sw x4, 112(x3)

# --- Starting Loop 26 (Depth: 1, break at 5, max 6) ---
addi x1, x0, 6
addi x7, x0, 5
addi x2, x0, 0
loop_start_26: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x2, x2, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 356(x3)

# --- Starting Loop 27 (Depth: 2, break at 1, max 7) ---
addi x6, x0, 7
addi x2, x0, 1
addi x4, x0, 0
loop_start_27: # Loop body start
srl x7, x2, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 996(x3)
sub x4, x5, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 27 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_end_27  # Conditional break from loop
bge x4, x6, loop_end_27 # Main loop exit condition
j loop_start_27 # Jump back to loop start
loop_end_27: # --- Resuming code after Loop 27 ---

srl x4, x6, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 26 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_26  # Conditional break from loop
bge x2, x1, loop_end_26 # Main loop exit condition
j loop_start_26 # Jump back to loop start
loop_end_26: # --- Resuming code after Loop 26 ---

sub x7, x5, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 320(x3)
or x4, x7, x2
sw x2, 568(x3)
sw x4, 620(x3)
xor x1, x6, x5
sw x2, 208(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x2, 928(x3)
and x5, x2, x1

# --- Starting Loop 28 (Depth: 1, break at 4, max 6) ---
addi x2, x0, 6
addi x4, x0, 4
addi x6, x0, 0
loop_start_28: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 28 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_end_28  # Conditional break from loop
bge x6, x2, loop_end_28 # Main loop exit condition
j loop_start_28 # Jump back to loop start
loop_end_28: # --- Resuming code after Loop 28 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x7, x6, x4
sw x7, 220(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x1, x5, x6

# --- Starting Loop 29 (Depth: 1, break at 4, max 8) ---
addi x6, x0, 8
addi x7, x0, 4
addi x2, x0, 0
loop_start_29: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
srl x2, x5, x7
sw x7, 604(x3)

# --- Closing Loop 29 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_29  # Conditional break from loop
bge x2, x6, loop_end_29 # Main loop exit condition
j loop_start_29 # Jump back to loop start
loop_end_29: # --- Resuming code after Loop 29 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x4, x1, x5
lw x5, 328(x3)
sw x4, 524(x3)
lw x5, 408(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x4, x5, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 288(x3)
and x7, x4, x1
lw x4, 712(x3)
lw x5, 12(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x4, x5, x2
srl x1, x4, x7
lw x4, 52(x3)
xor x7, x4, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 360(x3)
xor x1, x2, x4
sw x7, 120(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 952(x3)
xor x5, x4, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 128(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x5, x2, x7
sw x6, 36(x3)
sw x1, 200(x3)
lw x4, 592(x3)
srl x5, x4, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x2, x7, x1
add x5, x1, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 700(x3)
lw x1, 180(x3)
sw x2, 924(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 756(x3)
sub x1, x4, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 684(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 464(x3)
sll x1, x4, x6
add x6, x1, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 30 (Depth: 1, break at 5, max 8) ---
addi x7, x0, 8
addi x4, x0, 5
addi x1, x0, 0
loop_start_30: # Loop body start
sw x1, 376(x3)
sw x7, 932(x3)

# --- Closing Loop 30 (Depth: 1) ---
addi x1, x1, 1
beq x1, x4, loop_end_30  # Conditional break from loop
bge x1, x7, loop_end_30 # Main loop exit condition
j loop_start_30 # Jump back to loop start
loop_end_30: # --- Resuming code after Loop 30 ---


# --- Starting Loop 31 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x1, x0, 5
addi x5, x0, 0
loop_start_31: # Loop body start
sw x6, 60(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 31 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_end_31  # Conditional break from loop
bge x5, x6, loop_end_31 # Main loop exit condition
j loop_start_31 # Jump back to loop start
loop_end_31: # --- Resuming code after Loop 31 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 44(x3)
lw x7, 596(x3)
sw x7, 296(x3)
srl x2, x5, x7
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 32 (Depth: 1, break at 4, max 8) ---
addi x4, x0, 8
addi x5, x0, 4
addi x1, x0, 0
loop_start_32: # Loop body start

# --- Closing Loop 32 (Depth: 1) ---
addi x1, x1, 1
beq x1, x5, loop_end_32  # Conditional break from loop
bge x1, x4, loop_end_32 # Main loop exit condition
j loop_start_32 # Jump back to loop start
loop_end_32: # --- Resuming code after Loop 32 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x6, x5, x1
sw x6, 36(x3)
sll x6, x1, x2
lw x1, 12(x3)
lw x7, 0(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x6, x1, x7
and x2, x4, x1
lw x2, 216(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 224(x3)
and x2, x1, x4
sw x5, 892(x3)

# --- Starting Loop 33 (Depth: 1, break at 2, max 4) ---
addi x5, x0, 4
addi x4, x0, 2
addi x1, x0, 0
loop_start_33: # Loop body start

# --- Closing Loop 33 (Depth: 1) ---
addi x1, x1, 1
beq x1, x4, loop_end_33  # Conditional break from loop
bge x1, x5, loop_end_33 # Main loop exit condition
j loop_start_33 # Jump back to loop start
loop_end_33: # --- Resuming code after Loop 33 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
and x4, x1, x5
xor x7, x4, x6

# --- Starting Loop 34 (Depth: 1, break at 3, max 8) ---
addi x4, x0, 8
addi x6, x0, 3
addi x5, x0, 0
loop_start_34: # Loop body start
xor x1, x7, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x5, x6, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 320(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x4, x1, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 34 (Depth: 1) ---
addi x5, x5, 1
beq x5, x6, loop_end_34  # Conditional break from loop
bge x5, x4, loop_end_34 # Main loop exit condition
j loop_start_34 # Jump back to loop start
loop_end_34: # --- Resuming code after Loop 34 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 872(x3)
sub x5, x4, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x6, x4, x7
srl x5, x6, x4
srl x2, x6, x5
xor x5, x6, x4
add x2, x5, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x6, x4, x5
lw x5, 180(x3)
sw x6, 696(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x1, x4, x2
sll x7, x5, x6

# --- Starting Loop 35 (Depth: 1, break at 2, max 3) ---
addi x6, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_35: # Loop body start
and x4, x6, x7

# --- Starting Loop 36 (Depth: 2, break at 2, max 6) ---
addi x2, x0, 6
addi x7, x0, 2
addi x5, x0, 0
loop_start_36: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 36 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_end_36  # Conditional break from loop
bge x5, x2, loop_end_36 # Main loop exit condition
j loop_start_36 # Jump back to loop start
loop_end_36: # --- Resuming code after Loop 36 ---

sw x6, 448(x3)

# --- Starting Loop 37 (Depth: 2, break at 3, max 6) ---
addi x1, x0, 6
addi x2, x0, 3
addi x4, x0, 0
loop_start_37: # Loop body start
xor x4, x5, x7

# --- Closing Loop 37 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_end_37  # Conditional break from loop
bge x4, x1, loop_end_37 # Main loop exit condition
j loop_start_37 # Jump back to loop start
loop_end_37: # --- Resuming code after Loop 37 ---


# --- Closing Loop 35 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_end_35  # Conditional break from loop
bge x2, x6, loop_end_35 # Main loop exit condition
j loop_start_35 # Jump back to loop start
loop_end_35: # --- Resuming code after Loop 35 ---

lw x7, 384(x3)
add x4, x2, x1

# --- Starting Loop 38 (Depth: 1, break at 2, max 4) ---
addi x2, x0, 4
addi x7, x0, 2
addi x5, x0, 0
loop_start_38: # Loop body start
or x7, x6, x2
sub x6, x1, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 684(x3)

# --- Closing Loop 38 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_end_38  # Conditional break from loop
bge x5, x2, loop_end_38 # Main loop exit condition
j loop_start_38 # Jump back to loop start
loop_end_38: # --- Resuming code after Loop 38 ---

add x1, x7, x4
sw x1, 600(x3)
lw x4, 880(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x1, x5, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 39 (Depth: 1, break at 1, max 6) ---
addi x2, x0, 6
addi x4, x0, 1
addi x6, x0, 0
loop_start_39: # Loop body start

# --- Closing Loop 39 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_end_39  # Conditional break from loop
bge x6, x2, loop_end_39 # Main loop exit condition
j loop_start_39 # Jump back to loop start
loop_end_39: # --- Resuming code after Loop 39 ---

xor x1, x6, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 40 (Depth: 1, break at 1, max 4) ---
addi x4, x0, 4
addi x5, x0, 1
addi x2, x0, 0
loop_start_40: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 128(x3)

# --- Closing Loop 40 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_end_40  # Conditional break from loop
bge x2, x4, loop_end_40 # Main loop exit condition
j loop_start_40 # Jump back to loop start
loop_end_40: # --- Resuming code after Loop 40 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 468(x3)
lw x5, 336(x3)
lw x4, 124(x3)
lw x1, 820(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x1, x1, x5

# --- Starting Loop 41 (Depth: 1, break at 5, max 8) ---
addi x5, x0, 8
addi x2, x0, 5
addi x7, x0, 0
loop_start_41: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 41 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_end_41  # Conditional break from loop
bge x7, x5, loop_end_41 # Main loop exit condition
j loop_start_41 # Jump back to loop start
loop_end_41: # --- Resuming code after Loop 41 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x7, x6, x1
lw x6, 192(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x4, x2, x6
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 420(x3)
sw x6, 140(x3)

# --- Starting Loop 42 (Depth: 1, break at 3, max 10) ---
addi x1, x0, 10
addi x7, x0, 3
addi x4, x0, 0
loop_start_42: # Loop body start
sub x4, x1, x6

# --- Closing Loop 42 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_end_42  # Conditional break from loop
bge x4, x1, loop_end_42 # Main loop exit condition
j loop_start_42 # Jump back to loop start
loop_end_42: # --- Resuming code after Loop 42 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 80(x3)
srl x4, x7, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x1, x4, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x5, x1, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 664(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x6, x7, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 696(x3)
xor x4, x5, x2
xor x5, x4, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x5, x1, x6
lw x7, 184(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 704(x3)
or x2, x4, x7
lw x5, 696(x3)
lw x2, 564(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x5, x1, x6
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 43 (Depth: 1, break at 1, max 5) ---
addi x6, x0, 5
addi x1, x0, 1
addi x7, x0, 0
loop_start_43: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x7, x1, x6
sw x5, 284(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 124(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x4, x7, x1

# --- Closing Loop 43 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_end_43  # Conditional break from loop
bge x7, x6, loop_end_43 # Main loop exit condition
j loop_start_43 # Jump back to loop start
loop_end_43: # --- Resuming code after Loop 43 ---

lw x4, 560(x3)
lw x6, 916(x3)
sw x4, 192(x3)
sll x4, x7, x5
sll x5, x1, x7
sw x1, 212(x3)
sw x1, 24(x3)
lw x1, 764(x3)

# --- Starting Loop 44 (Depth: 1, break at 1, max 9) ---
addi x7, x0, 9
addi x5, x0, 1
addi x2, x0, 0
loop_start_44: # Loop body start
lw x1, 800(x3)

# --- Closing Loop 44 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_end_44  # Conditional break from loop
bge x2, x7, loop_end_44 # Main loop exit condition
j loop_start_44 # Jump back to loop start
loop_end_44: # --- Resuming code after Loop 44 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Final cleanup: Closing all remaining open loops ---

# Program exit
li a7, 93 # ecall: exit
ecall
