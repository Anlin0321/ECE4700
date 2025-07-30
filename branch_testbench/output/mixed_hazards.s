# Initialize memory base register x3
lui x3, 3
addi x3, x3, 0

lw x5, 400(x3)
sw x5, 932(x3)

# --- Starting Loop 1 (Depth: 1, break at 2, max 4) ---
addi x2, x0, 4
addi x7, x0, 2
addi x4, x0, 0
loop_start_1: # Loop body start

# --- Closing Loop 1 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_end_1  # Conditional break from loop
bge x4, x2, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 640(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 100(x3)

# --- Starting Loop 2 (Depth: 1, break at 1, max 4) ---
addi x6, x0, 4
addi x9, x0, 1
addi x5, x0, 0
loop_start_2: # Loop body start

# --- Closing Loop 2 (Depth: 1) ---
addi x5, x5, 1
beq x5, x9, loop_end_2  # Conditional break from loop
bge x5, x6, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---

srl x2, x5, x1
lw x9, 644(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 3 (Depth: 1, break at 2, max 6) ---
addi x2, x0, 6
addi x1, x0, 2
addi x5, x0, 0
loop_start_3: # Loop body start
and x5, x5, x8

# --- Closing Loop 3 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_end_3  # Conditional break from loop
bge x5, x2, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x9, 528(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 4 (Depth: 1, break at 4, max 8) ---
addi x5, x0, 8
addi x6, x0, 4
addi x1, x0, 0
loop_start_4: # Loop body start
sub x2, x9, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 5 (Depth: 2, break at 2, max 3) ---
addi x8, x0, 3
addi x6, x0, 2
addi x7, x0, 0
loop_start_5: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 6 (Depth: 3, break at 3, max 8) ---
addi x2, x0, 8
addi x5, x0, 3
addi x9, x0, 0
loop_start_6: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 280(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x9, 572(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 168(x3)

# --- Closing Loop 6 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_end_6  # Conditional break from loop
bge x9, x2, loop_end_6 # Main loop exit condition
j loop_start_6 # Jump back to loop start
loop_end_6: # --- Resuming code after Loop 6 ---


# --- Starting Loop 7 (Depth: 3, break at 3, max 4) ---
addi x2, x0, 4
addi x9, x0, 3
addi x6, x0, 0
loop_start_7: # Loop body start
sw x6, 280(x3)

# --- Closing Loop 7 (Depth: 3) ---
addi x6, x6, 1
beq x6, x9, loop_end_7  # Conditional break from loop
bge x6, x2, loop_end_7 # Main loop exit condition
j loop_start_7 # Jump back to loop start
loop_end_7: # --- Resuming code after Loop 7 ---

or x5, x7, x9
sub x8, x5, x4
sw x8, 844(x3)
sw x4, 244(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 184(x3)
sw x4, 4(x3)
lw x1, 148(x3)
sll x5, x1, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 948(x3)
lw x7, 480(x3)
lw x1, 404(x3)
lw x8, 108(x3)
sll x4, x7, x1
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x4, 280(x3)

# --- Closing Loop 5 (Depth: 2) ---
addi x7, x7, 1
beq x7, x6, loop_end_5  # Conditional break from loop
bge x7, x8, loop_end_5 # Main loop exit condition
j loop_start_5 # Jump back to loop start
loop_end_5: # --- Resuming code after Loop 5 ---


# --- Closing Loop 4 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_end_4  # Conditional break from loop
bge x1, x5, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---


# --- Starting Loop 8 (Depth: 1, break at 5, max 9) ---
addi x4, x0, 9
addi x8, x0, 5
addi x2, x0, 0
loop_start_8: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 8 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_end_8  # Conditional break from loop
bge x2, x4, loop_end_8 # Main loop exit condition
j loop_start_8 # Jump back to loop start
loop_end_8: # --- Resuming code after Loop 8 ---

sw x2, 780(x3)

# --- Starting Loop 9 (Depth: 1, break at 2, max 4) ---
addi x8, x0, 4
addi x6, x0, 2
addi x9, x0, 0
loop_start_9: # Loop body start
sub x7, x9, x8

# --- Closing Loop 9 (Depth: 1) ---
addi x9, x9, 1
beq x9, x6, loop_end_9  # Conditional break from loop
bge x9, x8, loop_end_9 # Main loop exit condition
j loop_start_9 # Jump back to loop start
loop_end_9: # --- Resuming code after Loop 9 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 10 (Depth: 1, break at 2, max 9) ---
addi x5, x0, 9
addi x8, x0, 2
addi x6, x0, 0
loop_start_10: # Loop body start

# --- Closing Loop 10 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_end_10  # Conditional break from loop
bge x6, x5, loop_end_10 # Main loop exit condition
j loop_start_10 # Jump back to loop start
loop_end_10: # --- Resuming code after Loop 10 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x9, x6, x5

# --- Starting Loop 11 (Depth: 1, break at 5, max 8) ---
addi x4, x0, 8
addi x8, x0, 5
addi x5, x0, 0
loop_start_11: # Loop body start

# --- Closing Loop 11 (Depth: 1) ---
addi x5, x5, 1
beq x5, x8, loop_end_11  # Conditional break from loop
bge x5, x4, loop_end_11 # Main loop exit condition
j loop_start_11 # Jump back to loop start
loop_end_11: # --- Resuming code after Loop 11 ---

lw x1, 588(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 12 (Depth: 1, break at 3, max 6) ---
addi x5, x0, 6
addi x2, x0, 3
addi x7, x0, 0
loop_start_12: # Loop body start

# --- Closing Loop 12 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_end_12  # Conditional break from loop
bge x7, x5, loop_end_12 # Main loop exit condition
j loop_start_12 # Jump back to loop start
loop_end_12: # --- Resuming code after Loop 12 ---

lw x8, 548(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 13 (Depth: 1, break at 5, max 10) ---
addi x5, x0, 10
addi x6, x0, 5
addi x7, x0, 0
loop_start_13: # Loop body start

# --- Starting Loop 14 (Depth: 2, break at 4, max 10) ---
addi x1, x0, 10
addi x4, x0, 4
addi x5, x0, 0
loop_start_14: # Loop body start

# --- Closing Loop 14 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_end_14  # Conditional break from loop
bge x5, x1, loop_end_14 # Main loop exit condition
j loop_start_14 # Jump back to loop start
loop_end_14: # --- Resuming code after Loop 14 ---

lw x7, 100(x3)

# --- Starting Loop 15 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x9, x0, 3
addi x8, x0, 0
loop_start_15: # Loop body start
lw x8, 480(x3)
sw x6, 40(x3)

# --- Closing Loop 15 (Depth: 2) ---
addi x8, x8, 1
beq x8, x9, loop_end_15  # Conditional break from loop
bge x8, x1, loop_end_15 # Main loop exit condition
j loop_start_15 # Jump back to loop start
loop_end_15: # --- Resuming code after Loop 15 ---


# --- Closing Loop 13 (Depth: 1) ---
addi x7, x7, 1
beq x7, x6, loop_end_13  # Conditional break from loop
bge x7, x5, loop_end_13 # Main loop exit condition
j loop_start_13 # Jump back to loop start
loop_end_13: # --- Resuming code after Loop 13 ---


# --- Starting Loop 16 (Depth: 1, break at 3, max 8) ---
addi x5, x0, 8
addi x8, x0, 3
addi x6, x0, 0
loop_start_16: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 496(x3)
sw x5, 788(x3)

# --- Closing Loop 16 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_end_16  # Conditional break from loop
bge x6, x5, loop_end_16 # Main loop exit condition
j loop_start_16 # Jump back to loop start
loop_end_16: # --- Resuming code after Loop 16 ---

sw x2, 260(x3)
lw x2, 792(x3)
lw x2, 560(x3)
lw x2, 976(x3)
sw x9, 836(x3)
sw x1, 800(x3)
sw x4, 616(x3)
lw x6, 940(x3)
sll x2, x1, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 912(x3)

# --- Starting Loop 17 (Depth: 1, break at 2, max 10) ---
addi x4, x0, 10
addi x7, x0, 2
addi x8, x0, 0
loop_start_17: # Loop body start
lw x2, 256(x3)

# --- Closing Loop 17 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_end_17  # Conditional break from loop
bge x8, x4, loop_end_17 # Main loop exit condition
j loop_start_17 # Jump back to loop start
loop_end_17: # --- Resuming code after Loop 17 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sub x7, x2, x9
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 364(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x8, 828(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 18 (Depth: 1, break at 2, max 7) ---
addi x4, x0, 7
addi x5, x0, 2
addi x6, x0, 0
loop_start_18: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 18 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_end_18  # Conditional break from loop
bge x6, x4, loop_end_18 # Main loop exit condition
j loop_start_18 # Jump back to loop start
loop_end_18: # --- Resuming code after Loop 18 ---

and x4, x7, x1
sw x4, 268(x3)
add x6, x2, x1
lw x7, 512(x3)
lw x8, 832(x3)
sw x5, 564(x3)
sll x8, x9, x5
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x9, x8, x7
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 19 (Depth: 1, break at 4, max 10) ---
addi x4, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_19: # Loop body start

# --- Starting Loop 20 (Depth: 2, break at 5, max 7) ---
addi x9, x0, 7
addi x7, x0, 5
addi x8, x0, 0
loop_start_20: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 952(x3)
sw x8, 780(x3)

# --- Closing Loop 20 (Depth: 2) ---
addi x8, x8, 1
beq x8, x7, loop_end_20  # Conditional break from loop
bge x8, x9, loop_end_20 # Main loop exit condition
j loop_start_20 # Jump back to loop start
loop_end_20: # --- Resuming code after Loop 20 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 19 (Depth: 1) ---
addi x6, x6, 1
beq x6, x2, loop_end_19  # Conditional break from loop
bge x6, x4, loop_end_19 # Main loop exit condition
j loop_start_19 # Jump back to loop start
loop_end_19: # --- Resuming code after Loop 19 ---

lw x4, 780(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 344(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x6, x2, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x8, x6, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 480(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x8, 592(x3)

# --- Starting Loop 21 (Depth: 1, break at 4, max 9) ---
addi x7, x0, 9
addi x4, x0, 4
addi x5, x0, 0
loop_start_21: # Loop body start

# --- Starting Loop 22 (Depth: 2, break at 1, max 7) ---
addi x6, x0, 7
addi x9, x0, 1
addi x2, x0, 0
loop_start_22: # Loop body start

# --- Closing Loop 22 (Depth: 2) ---
addi x2, x2, 1
beq x2, x9, loop_end_22  # Conditional break from loop
bge x2, x6, loop_end_22 # Main loop exit condition
j loop_start_22 # Jump back to loop start
loop_end_22: # --- Resuming code after Loop 22 ---

add x2, x2, x7
xor x2, x2, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 21 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_21  # Conditional break from loop
bge x5, x7, loop_end_21 # Main loop exit condition
j loop_start_21 # Jump back to loop start
loop_end_21: # --- Resuming code after Loop 21 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x2, 456(x3)
lw x5, 372(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x5, 632(x3)
sw x5, 348(x3)
lw x2, 196(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 844(x3)
lw x7, 976(x3)
sw x7, 740(x3)
srl x6, x9, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 316(x3)
lw x6, 724(x3)
lw x2, 756(x3)

# --- Starting Loop 23 (Depth: 1, break at 4, max 10) ---
addi x9, x0, 10
addi x8, x0, 4
addi x7, x0, 0
loop_start_23: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 23 (Depth: 1) ---
addi x7, x7, 1
beq x7, x8, loop_end_23  # Conditional break from loop
bge x7, x9, loop_end_23 # Main loop exit condition
j loop_start_23 # Jump back to loop start
loop_end_23: # --- Resuming code after Loop 23 ---

sw x7, 324(x3)
sw x9, 488(x3)
sw x2, 772(x3)
sll x4, x8, x1
add x7, x4, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 608(x3)

# --- Starting Loop 24 (Depth: 1, break at 3, max 7) ---
addi x7, x0, 7
addi x6, x0, 3
addi x8, x0, 0
loop_start_24: # Loop body start

# --- Closing Loop 24 (Depth: 1) ---
addi x8, x8, 1
beq x8, x6, loop_end_24  # Conditional break from loop
bge x8, x7, loop_end_24 # Main loop exit condition
j loop_start_24 # Jump back to loop start
loop_end_24: # --- Resuming code after Loop 24 ---


# --- Starting Loop 25 (Depth: 1, break at 1, max 4) ---
addi x9, x0, 4
addi x4, x0, 1
addi x7, x0, 0
loop_start_25: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x9, 516(x3)

# --- Closing Loop 25 (Depth: 1) ---
addi x7, x7, 1
beq x7, x4, loop_end_25  # Conditional break from loop
bge x7, x9, loop_end_25 # Main loop exit condition
j loop_start_25 # Jump back to loop start
loop_end_25: # --- Resuming code after Loop 25 ---


# --- Starting Loop 26 (Depth: 1, break at 2, max 8) ---
addi x8, x0, 8
addi x7, x0, 2
addi x6, x0, 0
loop_start_26: # Loop body start
srl x4, x6, x8

# --- Starting Loop 27 (Depth: 2, break at 2, max 3) ---
addi x6, x0, 3
addi x2, x0, 2
addi x7, x0, 0
loop_start_27: # Loop body start

# --- Closing Loop 27 (Depth: 2) ---
addi x7, x7, 1
beq x7, x2, loop_end_27  # Conditional break from loop
bge x7, x6, loop_end_27 # Main loop exit condition
j loop_start_27 # Jump back to loop start
loop_end_27: # --- Resuming code after Loop 27 ---


# --- Starting Loop 28 (Depth: 2, break at 5, max 8) ---
addi x5, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_28: # Loop body start
lw x1, 600(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x2, 884(x3)

# --- Closing Loop 28 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_end_28  # Conditional break from loop
bge x4, x5, loop_end_28 # Main loop exit condition
j loop_start_28 # Jump back to loop start
loop_end_28: # --- Resuming code after Loop 28 ---


# --- Closing Loop 26 (Depth: 1) ---
addi x6, x6, 1
beq x6, x7, loop_end_26  # Conditional break from loop
bge x6, x8, loop_end_26 # Main loop exit condition
j loop_start_26 # Jump back to loop start
loop_end_26: # --- Resuming code after Loop 26 ---

sw x2, 404(x3)
sw x9, 228(x3)
srl x2, x7, x5

# --- Starting Loop 29 (Depth: 1, break at 5, max 10) ---
addi x8, x0, 10
addi x1, x0, 5
addi x6, x0, 0
loop_start_29: # Loop body start
and x7, x6, x6

# --- Closing Loop 29 (Depth: 1) ---
addi x6, x6, 1
beq x6, x1, loop_end_29  # Conditional break from loop
bge x6, x8, loop_end_29 # Main loop exit condition
j loop_start_29 # Jump back to loop start
loop_end_29: # --- Resuming code after Loop 29 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 956(x3)
sw x9, 448(x3)

# --- Starting Loop 30 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x9, x0, 5
addi x2, x0, 0
loop_start_30: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 30 (Depth: 1) ---
addi x2, x2, 1
beq x2, x9, loop_end_30  # Conditional break from loop
bge x2, x6, loop_end_30 # Main loop exit condition
j loop_start_30 # Jump back to loop start
loop_end_30: # --- Resuming code after Loop 30 ---

sw x2, 512(x3)
or x8, x9, x1
lw x8, 36(x3)
sw x2, 584(x3)

# --- Starting Loop 31 (Depth: 1, break at 5, max 6) ---
addi x9, x0, 6
addi x8, x0, 5
addi x2, x0, 0
loop_start_31: # Loop body start
sw x7, 692(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x8, x2, x5
sw x8, 608(x3)
lw x5, 840(x3)
lw x5, 476(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 32 (Depth: 2, break at 5, max 10) ---
addi x4, x0, 10
addi x2, x0, 5
addi x1, x0, 0
loop_start_32: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 32 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_end_32  # Conditional break from loop
bge x1, x4, loop_end_32 # Main loop exit condition
j loop_start_32 # Jump back to loop start
loop_end_32: # --- Resuming code after Loop 32 ---


# --- Closing Loop 31 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_end_31  # Conditional break from loop
bge x2, x9, loop_end_31 # Main loop exit condition
j loop_start_31 # Jump back to loop start
loop_end_31: # --- Resuming code after Loop 31 ---

sw x1, 400(x3)
sll x8, x6, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 448(x3)
sub x1, x6, x2
lw x2, 104(x3)
lw x9, 884(x3)

# --- Starting Loop 33 (Depth: 1, break at 4, max 6) ---
addi x4, x0, 6
addi x7, x0, 4
addi x8, x0, 0
loop_start_33: # Loop body start

# --- Closing Loop 33 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_end_33  # Conditional break from loop
bge x8, x4, loop_end_33 # Main loop exit condition
j loop_start_33 # Jump back to loop start
loop_end_33: # --- Resuming code after Loop 33 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x2, 808(x3)
lw x4, 752(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 34 (Depth: 1, break at 1, max 3) ---
addi x5, x0, 3
addi x2, x0, 1
addi x7, x0, 0
loop_start_34: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 35 (Depth: 2, break at 3, max 9) ---
addi x8, x0, 9
addi x6, x0, 3
addi x9, x0, 0
loop_start_35: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x4, x9, x1

# --- Closing Loop 35 (Depth: 2) ---
addi x9, x9, 1
beq x9, x6, loop_end_35  # Conditional break from loop
bge x9, x8, loop_end_35 # Main loop exit condition
j loop_start_35 # Jump back to loop start
loop_end_35: # --- Resuming code after Loop 35 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 34 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_end_34  # Conditional break from loop
bge x7, x5, loop_end_34 # Main loop exit condition
j loop_start_34 # Jump back to loop start
loop_end_34: # --- Resuming code after Loop 34 ---

sw x4, 336(x3)
lw x1, 92(x3)
lw x8, 796(x3)

# --- Starting Loop 36 (Depth: 1, break at 1, max 3) ---
addi x6, x0, 3
addi x2, x0, 1
addi x7, x0, 0
loop_start_36: # Loop body start

# --- Closing Loop 36 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_end_36  # Conditional break from loop
bge x7, x6, loop_end_36 # Main loop exit condition
j loop_start_36 # Jump back to loop start
loop_end_36: # --- Resuming code after Loop 36 ---


# --- Starting Loop 37 (Depth: 1, break at 2, max 6) ---
addi x2, x0, 6
addi x1, x0, 2
addi x5, x0, 0
loop_start_37: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 37 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_end_37  # Conditional break from loop
bge x5, x2, loop_end_37 # Main loop exit condition
j loop_start_37 # Jump back to loop start
loop_end_37: # --- Resuming code after Loop 37 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 916(x3)

# --- Starting Loop 38 (Depth: 1, break at 5, max 10) ---
addi x2, x0, 10
addi x8, x0, 5
addi x4, x0, 0
loop_start_38: # Loop body start
sw x5, 976(x3)

# --- Closing Loop 38 (Depth: 1) ---
addi x4, x4, 1
beq x4, x8, loop_end_38  # Conditional break from loop
bge x4, x2, loop_end_38 # Main loop exit condition
j loop_start_38 # Jump back to loop start
loop_end_38: # --- Resuming code after Loop 38 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 112(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 252(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 456(x3)

# --- Starting Loop 39 (Depth: 1, break at 5, max 7) ---
addi x4, x0, 7
addi x7, x0, 5
addi x2, x0, 0
loop_start_39: # Loop body start

# --- Closing Loop 39 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_39  # Conditional break from loop
bge x2, x4, loop_end_39 # Main loop exit condition
j loop_start_39 # Jump back to loop start
loop_end_39: # --- Resuming code after Loop 39 ---


# --- Starting Loop 40 (Depth: 1, break at 1, max 9) ---
addi x7, x0, 9
addi x6, x0, 1
addi x8, x0, 0
loop_start_40: # Loop body start

# --- Starting Loop 41 (Depth: 2, break at 5, max 9) ---
addi x4, x0, 9
addi x6, x0, 5
addi x5, x0, 0
loop_start_41: # Loop body start
and x8, x5, x2

# --- Starting Loop 42 (Depth: 3, break at 4, max 9) ---
addi x7, x0, 9
addi x1, x0, 4
addi x2, x0, 0
loop_start_42: # Loop body start
and x4, x2, x9

# --- Closing Loop 42 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_end_42  # Conditional break from loop
bge x2, x7, loop_end_42 # Main loop exit condition
j loop_start_42 # Jump back to loop start
loop_end_42: # --- Resuming code after Loop 42 ---

sw x5, 84(x3)
sw x5, 360(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 576(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 41 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_end_41  # Conditional break from loop
bge x5, x4, loop_end_41 # Main loop exit condition
j loop_start_41 # Jump back to loop start
loop_end_41: # --- Resuming code after Loop 41 ---

sw x1, 740(x3)
lw x9, 720(x3)
lw x1, 744(x3)
sw x1, 840(x3)
sw x7, 184(x3)
lw x4, 904(x3)
srl x6, x4, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x6, x6, x4

# --- Starting Loop 43 (Depth: 2, break at 1, max 9) ---
addi x9, x0, 9
addi x7, x0, 1
addi x5, x0, 0
loop_start_43: # Loop body start

# --- Closing Loop 43 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_end_43  # Conditional break from loop
bge x5, x9, loop_end_43 # Main loop exit condition
j loop_start_43 # Jump back to loop start
loop_end_43: # --- Resuming code after Loop 43 ---

lw x4, 20(x3)
lw x2, 540(x3)

# --- Starting Loop 44 (Depth: 2, break at 1, max 9) ---
addi x5, x0, 9
addi x9, x0, 1
addi x1, x0, 0
loop_start_44: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
srl x7, x1, x1
and x2, x7, x6
srl x4, x9, x6
lw x7, 840(x3)

# --- Starting Loop 45 (Depth: 3, break at 1, max 6) ---
addi x4, x0, 6
addi x1, x0, 1
addi x2, x0, 0
loop_start_45: # Loop body start

# --- Closing Loop 45 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_end_45  # Conditional break from loop
bge x2, x4, loop_end_45 # Main loop exit condition
j loop_start_45 # Jump back to loop start
loop_end_45: # --- Resuming code after Loop 45 ---

lw x7, 564(x3)

# --- Closing Loop 44 (Depth: 2) ---
addi x1, x1, 1
beq x1, x9, loop_end_44  # Conditional break from loop
bge x1, x5, loop_end_44 # Main loop exit condition
j loop_start_44 # Jump back to loop start
loop_end_44: # --- Resuming code after Loop 44 ---


# --- Starting Loop 46 (Depth: 2, break at 1, max 8) ---
addi x9, x0, 8
addi x8, x0, 1
addi x1, x0, 0
loop_start_46: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x4, x7, x1
add x2, x5, x4
sub x9, x2, x6
sw x9, 520(x3)

# --- Closing Loop 46 (Depth: 2) ---
addi x1, x1, 1
beq x1, x8, loop_end_46  # Conditional break from loop
bge x1, x9, loop_end_46 # Main loop exit condition
j loop_start_46 # Jump back to loop start
loop_end_46: # --- Resuming code after Loop 46 ---

or x1, x7, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x2, x1, x6

# --- Starting Loop 47 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x5, x0, 3
addi x6, x0, 0
loop_start_47: # Loop body start
lw x9, 548(x3)

# --- Closing Loop 47 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_end_47  # Conditional break from loop
bge x6, x1, loop_end_47 # Main loop exit condition
j loop_start_47 # Jump back to loop start
loop_end_47: # --- Resuming code after Loop 47 ---


# --- Closing Loop 40 (Depth: 1) ---
addi x8, x8, 1
beq x8, x6, loop_end_40  # Conditional break from loop
bge x8, x7, loop_end_40 # Main loop exit condition
j loop_start_40 # Jump back to loop start
loop_end_40: # --- Resuming code after Loop 40 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x2, x6, x9
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x1, x2, x4
lw x4, 68(x3)
and x2, x4, x7

# --- Starting Loop 48 (Depth: 1, break at 3, max 8) ---
addi x4, x0, 8
addi x9, x0, 3
addi x7, x0, 0
loop_start_48: # Loop body start
lw x1, 268(x3)
lw x5, 332(x3)

# --- Closing Loop 48 (Depth: 1) ---
addi x7, x7, 1
beq x7, x9, loop_end_48  # Conditional break from loop
bge x7, x4, loop_end_48 # Main loop exit condition
j loop_start_48 # Jump back to loop start
loop_end_48: # --- Resuming code after Loop 48 ---

sll x7, x2, x1
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x7, 972(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 268(x3)
lw x8, 140(x3)

# --- Starting Loop 49 (Depth: 1, break at 5, max 9) ---
addi x9, x0, 9
addi x5, x0, 5
addi x6, x0, 0
loop_start_49: # Loop body start
sw x6, 520(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 460(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
add x1, x4, x5

# --- Closing Loop 49 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_end_49  # Conditional break from loop
bge x6, x9, loop_end_49 # Main loop exit condition
j loop_start_49 # Jump back to loop start
loop_end_49: # --- Resuming code after Loop 49 ---

sll x2, x1, x6
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x2, 264(x3)
or x9, x6, x5
sw x9, 844(x3)

# --- Starting Loop 50 (Depth: 1, break at 2, max 9) ---
addi x5, x0, 9
addi x4, x0, 2
addi x6, x0, 0
loop_start_50: # Loop body start

# --- Closing Loop 50 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_end_50  # Conditional break from loop
bge x6, x5, loop_end_50 # Main loop exit condition
j loop_start_50 # Jump back to loop start
loop_end_50: # --- Resuming code after Loop 50 ---


# --- Starting Loop 51 (Depth: 1, break at 3, max 6) ---
addi x4, x0, 6
addi x2, x0, 3
addi x1, x0, 0
loop_start_51: # Loop body start
srl x8, x1, x9
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 51 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_end_51  # Conditional break from loop
bge x1, x4, loop_end_51 # Main loop exit condition
j loop_start_51 # Jump back to loop start
loop_end_51: # --- Resuming code after Loop 51 ---


# --- Starting Loop 52 (Depth: 1, break at 1, max 7) ---
addi x2, x0, 7
addi x1, x0, 1
addi x7, x0, 0
loop_start_52: # Loop body start
sub x6, x7, x7
sw x6, 136(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 52 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_end_52  # Conditional break from loop
bge x7, x2, loop_end_52 # Main loop exit condition
j loop_start_52 # Jump back to loop start
loop_end_52: # --- Resuming code after Loop 52 ---

lw x1, 864(x3)

# --- Starting Loop 53 (Depth: 1, break at 1, max 9) ---
addi x7, x0, 9
addi x6, x0, 1
addi x5, x0, 0
loop_start_53: # Loop body start
lw x2, 332(x3)
and x2, x2, x7
lw x7, 272(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x1, x6, x5
add x9, x8, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x9, 880(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 53 (Depth: 1) ---
addi x5, x5, 1
beq x5, x6, loop_end_53  # Conditional break from loop
bge x5, x7, loop_end_53 # Main loop exit condition
j loop_start_53 # Jump back to loop start
loop_end_53: # --- Resuming code after Loop 53 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 964(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x8, x2, x6
or x8, x8, x1
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
add x4, x8, x6
sw x4, 904(x3)

# --- Starting Loop 54 (Depth: 1, break at 4, max 7) ---
addi x7, x0, 7
addi x5, x0, 4
addi x8, x0, 0
loop_start_54: # Loop body start

# --- Starting Loop 55 (Depth: 2, break at 1, max 2) ---
addi x1, x0, 2
addi x2, x0, 1
addi x7, x0, 0
loop_start_55: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 336(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 55 (Depth: 2) ---
addi x7, x7, 1
beq x7, x2, loop_end_55  # Conditional break from loop
bge x7, x1, loop_end_55 # Main loop exit condition
j loop_start_55 # Jump back to loop start
loop_end_55: # --- Resuming code after Loop 55 ---

or x6, x4, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 56 (Depth: 2, break at 3, max 6) ---
addi x4, x0, 6
addi x5, x0, 3
addi x7, x0, 0
loop_start_56: # Loop body start
sw x7, 276(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 56 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_end_56  # Conditional break from loop
bge x7, x4, loop_end_56 # Main loop exit condition
j loop_start_56 # Jump back to loop start
loop_end_56: # --- Resuming code after Loop 56 ---


# --- Closing Loop 54 (Depth: 1) ---
addi x8, x8, 1
beq x8, x5, loop_end_54  # Conditional break from loop
bge x8, x7, loop_end_54 # Main loop exit condition
j loop_start_54 # Jump back to loop start
loop_end_54: # --- Resuming code after Loop 54 ---

sub x4, x5, x9
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 648(x3)
lw x4, 436(x3)
lw x1, 244(x3)
lw x6, 236(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 57 (Depth: 1, break at 1, max 8) ---
addi x8, x0, 8
addi x5, x0, 1
addi x9, x0, 0
loop_start_57: # Loop body start

# --- Closing Loop 57 (Depth: 1) ---
addi x9, x9, 1
beq x9, x5, loop_end_57  # Conditional break from loop
bge x9, x8, loop_end_57 # Main loop exit condition
j loop_start_57 # Jump back to loop start
loop_end_57: # --- Resuming code after Loop 57 ---

lw x5, 160(x3)

# --- Starting Loop 58 (Depth: 1, break at 5, max 9) ---
addi x6, x0, 9
addi x7, x0, 5
addi x1, x0, 0
loop_start_58: # Loop body start
sub x4, x1, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x1, x4, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 548(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 58 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_end_58  # Conditional break from loop
bge x1, x6, loop_end_58 # Main loop exit condition
j loop_start_58 # Jump back to loop start
loop_end_58: # --- Resuming code after Loop 58 ---

add x5, x9, x2
sw x5, 752(x3)

# --- Starting Loop 59 (Depth: 1, break at 2, max 4) ---
addi x4, x0, 4
addi x2, x0, 2
addi x5, x0, 0
loop_start_59: # Loop body start

# --- Closing Loop 59 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_end_59  # Conditional break from loop
bge x5, x4, loop_end_59 # Main loop exit condition
j loop_start_59 # Jump back to loop start
loop_end_59: # --- Resuming code after Loop 59 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x7, 452(x3)

# --- Starting Loop 60 (Depth: 1, break at 1, max 3) ---
addi x6, x0, 3
addi x5, x0, 1
addi x9, x0, 0
loop_start_60: # Loop body start

# --- Closing Loop 60 (Depth: 1) ---
addi x9, x9, 1
beq x9, x5, loop_end_60  # Conditional break from loop
bge x9, x6, loop_end_60 # Main loop exit condition
j loop_start_60 # Jump back to loop start
loop_end_60: # --- Resuming code after Loop 60 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x6, 492(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x7, x1, x9
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 61 (Depth: 1, break at 4, max 7) ---
addi x9, x0, 7
addi x8, x0, 4
addi x6, x0, 0
loop_start_61: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 62 (Depth: 2, break at 4, max 5) ---
addi x2, x0, 5
addi x9, x0, 4
addi x1, x0, 0
loop_start_62: # Loop body start
sw x9, 464(x3)

# --- Closing Loop 62 (Depth: 2) ---
addi x1, x1, 1
beq x1, x9, loop_end_62  # Conditional break from loop
bge x1, x2, loop_end_62 # Main loop exit condition
j loop_start_62 # Jump back to loop start
loop_end_62: # --- Resuming code after Loop 62 ---


# --- Starting Loop 63 (Depth: 2, break at 1, max 8) ---
addi x8, x0, 8
addi x6, x0, 1
addi x5, x0, 0
loop_start_63: # Loop body start

# --- Closing Loop 63 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_end_63  # Conditional break from loop
bge x5, x8, loop_end_63 # Main loop exit condition
j loop_start_63 # Jump back to loop start
loop_end_63: # --- Resuming code after Loop 63 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 61 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_end_61  # Conditional break from loop
bge x6, x9, loop_end_61 # Main loop exit condition
j loop_start_61 # Jump back to loop start
loop_end_61: # --- Resuming code after Loop 61 ---

sw x5, 200(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 696(x3)

# --- Starting Loop 64 (Depth: 1, break at 4, max 5) ---
addi x6, x0, 5
addi x9, x0, 4
addi x1, x0, 0
loop_start_64: # Loop body start
add x6, x1, x8
lw x4, 836(x3)
sw x4, 988(x3)
add x9, x8, x4

# --- Starting Loop 65 (Depth: 2, break at 1, max 7) ---
addi x1, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_65: # Loop body start

# --- Starting Loop 66 (Depth: 3, break at 2, max 4) ---
addi x7, x0, 4
addi x4, x0, 2
addi x5, x0, 0
loop_start_66: # Loop body start
lw x9, 888(x3)
sw x9, 388(x3)
xor x6, x1, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 66
addi x5, x5, 1
beq x5, x4, loop_end_66
bge x5, x7, loop_end_66
j loop_start_66
loop_end_66: # Loop exit

# Closing remaining Loop 65
addi x6, x6, 1
beq x6, x4, loop_end_65
bge x6, x1, loop_end_65
j loop_start_65
loop_end_65: # Loop exit

# Closing remaining Loop 64
addi x1, x1, 1
beq x1, x9, loop_end_64
bge x1, x6, loop_end_64
j loop_start_64
loop_end_64: # Loop exit

# Program exit
li a7, 93 # ecall: exit
ecall
