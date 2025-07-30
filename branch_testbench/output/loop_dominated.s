# Initialize memory base register x3
lui x3, 3
addi x3, x3, 0


# --- Starting Loop 1 (Depth: 1, break at 1, max 2) ---
addi x6, x0, 2
addi x9, x0, 1
addi x8, x0, 0
loop_start_1: # Loop body start
sw x8, 100(x3)
or x8, x9, x5
sw x8, 624(x3)
sw x6, 60(x3)
lw x2, 364(x3)
sw x8, 976(x3)
sw x9, 844(x3)
srl x2, x7, x6
sw x2, 872(x3)
sw x1, 560(x3)

# --- Starting Loop 2 (Depth: 2, break at 2, max 8) ---
addi x8, x0, 8
addi x5, x0, 2
addi x6, x0, 0
loop_start_2: # Loop body start

# --- Starting Loop 3 (Depth: 3, break at 1, max 7) ---
addi x5, x0, 7
addi x7, x0, 1
addi x4, x0, 0
loop_start_3: # Loop body start

# --- Closing Loop 3 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_end_3  # Conditional break from loop
bge x4, x5, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

lw x4, 444(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x4, x8, x7
sw x4, 852(x3)
lw x9, 780(x3)
sw x9, 660(x3)
sw x5, 676(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x2, 236(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 572(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_end_2  # Conditional break from loop
bge x6, x8, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---


# --- Starting Loop 4 (Depth: 2, break at 3, max 10) ---
addi x9, x0, 10
addi x5, x0, 3
addi x8, x0, 0
loop_start_4: # Loop body start

# --- Starting Loop 5 (Depth: 3, break at 2, max 7) ---
addi x9, x0, 7
addi x7, x0, 2
addi x2, x0, 0
loop_start_5: # Loop body start
or x1, x2, x8
sw x1, 520(x3)

# --- Closing Loop 5 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_end_5  # Conditional break from loop
bge x2, x9, loop_end_5 # Main loop exit condition
j loop_start_5 # Jump back to loop start
loop_end_5: # --- Resuming code after Loop 5 ---

sw x7, 628(x3)
lw x2, 924(x3)

# --- Starting Loop 6 (Depth: 3, break at 5, max 10) ---
addi x9, x0, 10
addi x5, x0, 5
addi x8, x0, 0
loop_start_6: # Loop body start
or x4, x8, x9
xor x6, x4, x1
sw x8, 404(x3)
xor x2, x9, x7

# --- Closing Loop 6 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_end_6  # Conditional break from loop
bge x8, x9, loop_end_6 # Main loop exit condition
j loop_start_6 # Jump back to loop start
loop_end_6: # --- Resuming code after Loop 6 ---

lw x9, 892(x3)
and x7, x9, x6

# --- Closing Loop 4 (Depth: 2) ---
addi x8, x8, 1
beq x8, x5, loop_end_4  # Conditional break from loop
bge x8, x9, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---

sw x9, 132(x3)
sw x6, 332(x3)

# --- Starting Loop 7 (Depth: 2, break at 3, max 5) ---
addi x6, x0, 5
addi x2, x0, 3
addi x5, x0, 0
loop_start_7: # Loop body start
add x8, x1, x2

# --- Closing Loop 7 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_end_7  # Conditional break from loop
bge x5, x6, loop_end_7 # Main loop exit condition
j loop_start_7 # Jump back to loop start
loop_end_7: # --- Resuming code after Loop 7 ---


# --- Closing Loop 1 (Depth: 1) ---
addi x8, x8, 1
beq x8, x9, loop_end_1  # Conditional break from loop
bge x8, x6, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 8 (Depth: 1, break at 2, max 5) ---
addi x9, x0, 5
addi x7, x0, 2
addi x5, x0, 0
loop_start_8: # Loop body start
sw x5, 368(x3)
or x9, x4, x5
sll x2, x6, x5

# --- Starting Loop 9 (Depth: 2, break at 2, max 8) ---
addi x4, x0, 8
addi x5, x0, 2
addi x9, x0, 0
loop_start_9: # Loop body start
or x8, x9, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 10 (Depth: 3, break at 5, max 7) ---
addi x2, x0, 7
addi x7, x0, 5
addi x4, x0, 0
loop_start_10: # Loop body start

# --- Starting Loop 11 (Depth: 4, break at 3, max 8) ---
addi x1, x0, 8
addi x6, x0, 3
addi x2, x0, 0
loop_start_11: # Loop body start
or x1, x9, x8
lw x4, 512(x3)
sw x5, 196(x3)

# --- Closing Loop 11 (Depth: 4) ---
addi x2, x2, 1
beq x2, x6, loop_end_11  # Conditional break from loop
bge x2, x1, loop_end_11 # Main loop exit condition
j loop_start_11 # Jump back to loop start
loop_end_11: # --- Resuming code after Loop 11 ---


# --- Starting Loop 12 (Depth: 4, break at 2, max 10) ---
addi x9, x0, 10
addi x2, x0, 2
addi x5, x0, 0
loop_start_12: # Loop body start
lw x8, 624(x3)
lw x1, 504(x3)

# --- Closing Loop 12 (Depth: 4) ---
addi x5, x5, 1
beq x5, x2, loop_end_12  # Conditional break from loop
bge x5, x9, loop_end_12 # Main loop exit condition
j loop_start_12 # Jump back to loop start
loop_end_12: # --- Resuming code after Loop 12 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x4, 524(x3)
lw x4, 164(x3)
sw x4, 672(x3)
sll x4, x8, x2
or x6, x2, x8

# --- Starting Loop 13 (Depth: 4, break at 2, max 10) ---
addi x4, x0, 10
addi x2, x0, 2
addi x1, x0, 0
loop_start_13: # Loop body start
sll x6, x1, x9

# --- Closing Loop 13 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_end_13  # Conditional break from loop
bge x1, x4, loop_end_13 # Main loop exit condition
j loop_start_13 # Jump back to loop start
loop_end_13: # --- Resuming code after Loop 13 ---

sw x6, 652(x3)
lw x6, 224(x3)
sw x9, 824(x3)
and x2, x6, x9

# --- Closing Loop 10 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_end_10  # Conditional break from loop
bge x4, x2, loop_end_10 # Main loop exit condition
j loop_start_10 # Jump back to loop start
loop_end_10: # --- Resuming code after Loop 10 ---

lw x5, 192(x3)
lw x9, 616(x3)
lw x8, 332(x3)
sw x5, 480(x3)
xor x6, x2, x5

# --- Starting Loop 14 (Depth: 3, break at 5, max 9) ---
addi x5, x0, 9
addi x4, x0, 5
addi x8, x0, 0
loop_start_14: # Loop body start

# --- Closing Loop 14 (Depth: 3) ---
addi x8, x8, 1
beq x8, x4, loop_end_14  # Conditional break from loop
bge x8, x5, loop_end_14 # Main loop exit condition
j loop_start_14 # Jump back to loop start
loop_end_14: # --- Resuming code after Loop 14 ---


# --- Closing Loop 9 (Depth: 2) ---
addi x9, x9, 1
beq x9, x5, loop_end_9  # Conditional break from loop
bge x9, x4, loop_end_9 # Main loop exit condition
j loop_start_9 # Jump back to loop start
loop_end_9: # --- Resuming code after Loop 9 ---


# --- Starting Loop 15 (Depth: 2, break at 1, max 9) ---
addi x4, x0, 9
addi x2, x0, 1
addi x5, x0, 0
loop_start_15: # Loop body start
sw x4, 832(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x6, x4, x5
xor x4, x2, x7
sw x4, 324(x3)
sw x4, 1000(x3)
sw x1, 404(x3)

# --- Starting Loop 16 (Depth: 3, break at 1, max 10) ---
addi x4, x0, 10
addi x8, x0, 1
addi x7, x0, 0
loop_start_16: # Loop body start
xor x4, x7, x8
sw x4, 88(x3)
lw x2, 968(x3)

# --- Starting Loop 17 (Depth: 4, break at 5, max 10) ---
addi x6, x0, 10
addi x1, x0, 5
addi x8, x0, 0
loop_start_17: # Loop body start
sll x2, x8, x9
lw x4, 288(x3)
sub x4, x4, x1
lw x6, 380(x3)
sll x6, x1, x2
sll x5, x4, x9
xor x8, x5, x7
add x1, x8, x7
sw x8, 296(x3)
lw x4, 568(x3)
or x2, x9, x1
sw x7, 876(x3)

# --- Starting Loop 18 (Depth: 5, break at 5, max 10) ---
addi x2, x0, 10
addi x1, x0, 5
addi x9, x0, 0
loop_start_18: # Loop body start
sw x7, 864(x3)
sw x8, 652(x3)
lw x5, 376(x3)
lw x1, 632(x3)
add x7, x1, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 996(x3)
sw x1, 468(x3)

# --- Closing Loop 18 (Depth: 5) ---
addi x9, x9, 1
beq x9, x1, loop_end_18  # Conditional break from loop
bge x9, x2, loop_end_18 # Main loop exit condition
j loop_start_18 # Jump back to loop start
loop_end_18: # --- Resuming code after Loop 18 ---

or x5, x2, x6
lw x9, 556(x3)

# --- Starting Loop 19 (Depth: 5, break at 2, max 8) ---
addi x1, x0, 8
addi x4, x0, 2
addi x6, x0, 0
loop_start_19: # Loop body start
sw x7, 520(x3)

# --- Closing Loop 19 (Depth: 5) ---
addi x6, x6, 1
beq x6, x4, loop_end_19  # Conditional break from loop
bge x6, x1, loop_end_19 # Main loop exit condition
j loop_start_19 # Jump back to loop start
loop_end_19: # --- Resuming code after Loop 19 ---

lw x5, 124(x3)
lw x6, 572(x3)
xor x5, x7, x2

# --- Closing Loop 17 (Depth: 4) ---
addi x8, x8, 1
beq x8, x1, loop_end_17  # Conditional break from loop
bge x8, x6, loop_end_17 # Main loop exit condition
j loop_start_17 # Jump back to loop start
loop_end_17: # --- Resuming code after Loop 17 ---

lw x5, 584(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 740(x3)
sll x2, x6, x4
lw x8, 40(x3)
sw x8, 596(x3)

# --- Starting Loop 20 (Depth: 4, break at 5, max 6) ---
addi x9, x0, 6
addi x5, x0, 5
addi x8, x0, 0
loop_start_20: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 20 (Depth: 4) ---
addi x8, x8, 1
beq x8, x5, loop_end_20  # Conditional break from loop
bge x8, x9, loop_end_20 # Main loop exit condition
j loop_start_20 # Jump back to loop start
loop_end_20: # --- Resuming code after Loop 20 ---

lw x2, 364(x3)

# --- Starting Loop 21 (Depth: 4, break at 1, max 5) ---
addi x6, x0, 5
addi x8, x0, 1
addi x5, x0, 0
loop_start_21: # Loop body start
lw x9, 528(x3)
xor x5, x9, x4

# --- Starting Loop 22 (Depth: 5, break at 4, max 5) ---
addi x4, x0, 5
addi x7, x0, 4
addi x6, x0, 0
loop_start_22: # Loop body start
and x1, x4, x7
xor x5, x1, x1

# --- Closing Loop 22 (Depth: 5) ---
addi x6, x6, 1
beq x6, x7, loop_end_22  # Conditional break from loop
bge x6, x4, loop_end_22 # Main loop exit condition
j loop_start_22 # Jump back to loop start
loop_end_22: # --- Resuming code after Loop 22 ---

sw x4, 872(x3)
sw x4, 564(x3)
sw x5, 232(x3)
lw x2, 172(x3)
add x4, x9, x8
xor x5, x1, x6
lw x7, 16(x3)

# --- Starting Loop 23 (Depth: 5, break at 3, max 7) ---
addi x8, x0, 7
addi x2, x0, 3
addi x1, x0, 0
loop_start_23: # Loop body start
lw x7, 92(x3)

# --- Closing Loop 23 (Depth: 5) ---
addi x1, x1, 1
beq x1, x2, loop_end_23  # Conditional break from loop
bge x1, x8, loop_end_23 # Main loop exit condition
j loop_start_23 # Jump back to loop start
loop_end_23: # --- Resuming code after Loop 23 ---

sw x7, 872(x3)

# --- Starting Loop 24 (Depth: 5, break at 5, max 8) ---
addi x8, x0, 8
addi x5, x0, 5
addi x1, x0, 0
loop_start_24: # Loop body start
sw x1, 756(x3)
sw x9, 972(x3)
xor x6, x2, x7
lw x2, 564(x3)
or x4, x9, x8
srl x1, x5, x4
sll x7, x5, x9
lw x8, 480(x3)
lw x9, 848(x3)
and x5, x9, x4
lw x8, 400(x3)

# --- Closing Loop 24 (Depth: 5) ---
addi x1, x1, 1
beq x1, x5, loop_end_24  # Conditional break from loop
bge x1, x8, loop_end_24 # Main loop exit condition
j loop_start_24 # Jump back to loop start
loop_end_24: # --- Resuming code after Loop 24 ---

lw x4, 456(x3)
sw x5, 740(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
add x2, x7, x8
srl x1, x8, x9
sw x5, 204(x3)
lw x5, 944(x3)
and x1, x5, x8

# --- Closing Loop 21 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_end_21  # Conditional break from loop
bge x5, x6, loop_end_21 # Main loop exit condition
j loop_start_21 # Jump back to loop start
loop_end_21: # --- Resuming code after Loop 21 ---


# --- Starting Loop 25 (Depth: 4, break at 2, max 9) ---
addi x7, x0, 9
addi x8, x0, 2
addi x2, x0, 0
loop_start_25: # Loop body start
sw x9, 512(x3)
sw x4, 620(x3)
and x8, x7, x2
or x1, x8, x5

# --- Starting Loop 26 (Depth: 5, break at 1, max 3) ---
addi x8, x0, 3
addi x5, x0, 1
addi x4, x0, 0
loop_start_26: # Loop body start
sw x4, 532(x3)
add x6, x9, x4

# --- Closing Loop 26 (Depth: 5) ---
addi x4, x4, 1
beq x4, x5, loop_end_26  # Conditional break from loop
bge x4, x8, loop_end_26 # Main loop exit condition
j loop_start_26 # Jump back to loop start
loop_end_26: # --- Resuming code after Loop 26 ---


# --- Closing Loop 25 (Depth: 4) ---
addi x2, x2, 1
beq x2, x8, loop_end_25  # Conditional break from loop
bge x2, x7, loop_end_25 # Main loop exit condition
j loop_start_25 # Jump back to loop start
loop_end_25: # --- Resuming code after Loop 25 ---

srl x7, x6, x2

# --- Starting Loop 27 (Depth: 4, break at 3, max 7) ---
addi x6, x0, 7
addi x9, x0, 3
addi x1, x0, 0
loop_start_27: # Loop body start

# --- Starting Loop 28 (Depth: 5, break at 3, max 10) ---
addi x5, x0, 10
addi x9, x0, 3
addi x2, x0, 0
loop_start_28: # Loop body start

# --- Closing Loop 28 (Depth: 5) ---
addi x2, x2, 1
beq x2, x9, loop_end_28  # Conditional break from loop
bge x2, x5, loop_end_28 # Main loop exit condition
j loop_start_28 # Jump back to loop start
loop_end_28: # --- Resuming code after Loop 28 ---

xor x2, x9, x1
sll x9, x2, x5

# --- Closing Loop 27 (Depth: 4) ---
addi x1, x1, 1
beq x1, x9, loop_end_27  # Conditional break from loop
bge x1, x6, loop_end_27 # Main loop exit condition
j loop_start_27 # Jump back to loop start
loop_end_27: # --- Resuming code after Loop 27 ---


# --- Closing Loop 16 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_end_16  # Conditional break from loop
bge x7, x4, loop_end_16 # Main loop exit condition
j loop_start_16 # Jump back to loop start
loop_end_16: # --- Resuming code after Loop 16 ---


# --- Starting Loop 29 (Depth: 3, break at 2, max 9) ---
addi x6, x0, 9
addi x2, x0, 2
addi x1, x0, 0
loop_start_29: # Loop body start
lw x1, 560(x3)
sll x9, x1, x8
lw x6, 656(x3)
sub x7, x6, x9
and x9, x7, x5
or x9, x9, x2
and x7, x9, x2
srl x5, x6, x1

# --- Starting Loop 30 (Depth: 4, break at 5, max 8) ---
addi x9, x0, 8
addi x8, x0, 5
addi x6, x0, 0
loop_start_30: # Loop body start
lw x9, 680(x3)

# --- Closing Loop 30 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_end_30  # Conditional break from loop
bge x6, x9, loop_end_30 # Main loop exit condition
j loop_start_30 # Jump back to loop start
loop_end_30: # --- Resuming code after Loop 30 ---


# --- Starting Loop 31 (Depth: 4, break at 1, max 8) ---
addi x5, x0, 8
addi x8, x0, 1
addi x4, x0, 0
loop_start_31: # Loop body start
sll x5, x2, x1
lw x2, 620(x3)
lw x4, 680(x3)
lw x9, 392(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 32 (Depth: 5, break at 1, max 9) ---
addi x4, x0, 9
addi x8, x0, 1
addi x7, x0, 0
loop_start_32: # Loop body start

# --- Closing Loop 32 (Depth: 5) ---
addi x7, x7, 1
beq x7, x8, loop_end_32  # Conditional break from loop
bge x7, x4, loop_end_32 # Main loop exit condition
j loop_start_32 # Jump back to loop start
loop_end_32: # --- Resuming code after Loop 32 ---

sw x7, 16(x3)

# --- Starting Loop 33 (Depth: 5, break at 4, max 6) ---
addi x4, x0, 6
addi x9, x0, 4
addi x8, x0, 0
loop_start_33: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 288(x3)
lw x9, 48(x3)
sw x6, 664(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x1, 304(x3)
sw x2, 292(x3)

# --- Closing Loop 33 (Depth: 5) ---
addi x8, x8, 1
beq x8, x9, loop_end_33  # Conditional break from loop
bge x8, x4, loop_end_33 # Main loop exit condition
j loop_start_33 # Jump back to loop start
loop_end_33: # --- Resuming code after Loop 33 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 388(x3)
sw x2, 432(x3)
sw x2, 572(x3)
xor x8, x9, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x5, x2, x6
lw x4, 0(x3)
lw x5, 920(x3)

# --- Closing Loop 31 (Depth: 4) ---
addi x4, x4, 1
beq x4, x8, loop_end_31  # Conditional break from loop
bge x4, x5, loop_end_31 # Main loop exit condition
j loop_start_31 # Jump back to loop start
loop_end_31: # --- Resuming code after Loop 31 ---

and x6, x5, x8

# --- Starting Loop 34 (Depth: 4, break at 2, max 6) ---
addi x1, x0, 6
addi x4, x0, 2
addi x2, x0, 0
loop_start_34: # Loop body start

# --- Starting Loop 35 (Depth: 5, break at 5, max 7) ---
addi x1, x0, 7
addi x8, x0, 5
addi x4, x0, 0
loop_start_35: # Loop body start

# --- Closing Loop 35 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_end_35  # Conditional break from loop
bge x4, x1, loop_end_35 # Main loop exit condition
j loop_start_35 # Jump back to loop start
loop_end_35: # --- Resuming code after Loop 35 ---

sub x6, x4, x2
lw x2, 512(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 144(x3)
add x5, x6, x2

# --- Closing Loop 34 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_end_34  # Conditional break from loop
bge x2, x1, loop_end_34 # Main loop exit condition
j loop_start_34 # Jump back to loop start
loop_end_34: # --- Resuming code after Loop 34 ---

add x6, x5, x1
sw x5, 24(x3)
or x4, x7, x8
lw x9, 20(x3)
or x9, x9, x2
lw x5, 932(x3)

# --- Closing Loop 29 (Depth: 3) ---
addi x1, x1, 1
beq x1, x2, loop_end_29  # Conditional break from loop
bge x1, x6, loop_end_29 # Main loop exit condition
j loop_start_29 # Jump back to loop start
loop_end_29: # --- Resuming code after Loop 29 ---


# --- Starting Loop 36 (Depth: 3, break at 2, max 8) ---
addi x9, x0, 8
addi x6, x0, 2
addi x2, x0, 0
loop_start_36: # Loop body start

# --- Closing Loop 36 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_end_36  # Conditional break from loop
bge x2, x9, loop_end_36 # Main loop exit condition
j loop_start_36 # Jump back to loop start
loop_end_36: # --- Resuming code after Loop 36 ---


# --- Starting Loop 37 (Depth: 3, break at 5, max 8) ---
addi x8, x0, 8
addi x4, x0, 5
addi x6, x0, 0
loop_start_37: # Loop body start
lw x6, 444(x3)
sw x1, 528(x3)

# --- Closing Loop 37 (Depth: 3) ---
addi x6, x6, 1
beq x6, x4, loop_end_37  # Conditional break from loop
bge x6, x8, loop_end_37 # Main loop exit condition
j loop_start_37 # Jump back to loop start
loop_end_37: # --- Resuming code after Loop 37 ---


# --- Starting Loop 38 (Depth: 3, break at 3, max 7) ---
addi x2, x0, 7
addi x1, x0, 3
addi x4, x0, 0
loop_start_38: # Loop body start

# --- Closing Loop 38 (Depth: 3) ---
addi x4, x4, 1
beq x4, x1, loop_end_38  # Conditional break from loop
bge x4, x2, loop_end_38 # Main loop exit condition
j loop_start_38 # Jump back to loop start
loop_end_38: # --- Resuming code after Loop 38 ---

and x2, x4, x9
sw x2, 972(x3)
lw x1, 864(x3)
sw x1, 88(x3)
add x2, x1, x6
sub x1, x5, x8
sw x5, 840(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 15 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_end_15  # Conditional break from loop
bge x5, x4, loop_end_15 # Main loop exit condition
j loop_start_15 # Jump back to loop start
loop_end_15: # --- Resuming code after Loop 15 ---


# --- Starting Loop 39 (Depth: 2, break at 3, max 5) ---
addi x8, x0, 5
addi x6, x0, 3
addi x1, x0, 0
loop_start_39: # Loop body start
or x6, x1, x1

# --- Starting Loop 40 (Depth: 3, break at 2, max 5) ---
addi x9, x0, 5
addi x5, x0, 2
addi x2, x0, 0
loop_start_40: # Loop body start
lw x5, 352(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 41 (Depth: 4, break at 1, max 9) ---
addi x1, x0, 9
addi x4, x0, 1
addi x8, x0, 0
loop_start_41: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 41 (Depth: 4) ---
addi x8, x8, 1
beq x8, x4, loop_end_41  # Conditional break from loop
bge x8, x1, loop_end_41 # Main loop exit condition
j loop_start_41 # Jump back to loop start
loop_end_41: # --- Resuming code after Loop 41 ---

srl x8, x8, x6
and x7, x8, x5

# --- Closing Loop 40 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_end_40  # Conditional break from loop
bge x2, x9, loop_end_40 # Main loop exit condition
j loop_start_40 # Jump back to loop start
loop_end_40: # --- Resuming code after Loop 40 ---

lw x6, 84(x3)
sll x6, x6, x9
add x8, x6, x7
lw x1, 364(x3)
sw x1, 692(x3)
and x9, x2, x5
lw x2, 184(x3)

# --- Starting Loop 42 (Depth: 3, break at 5, max 10) ---
addi x8, x0, 10
addi x1, x0, 5
addi x6, x0, 0
loop_start_42: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x1, 748(x3)
sw x1, 524(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 43 (Depth: 4, break at 2, max 3) ---
addi x2, x0, 3
addi x8, x0, 2
addi x7, x0, 0
loop_start_43: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x6, x5, x9
lw x9, 148(x3)
add x1, x9, x8
lw x4, 704(x3)
lw x8, 156(x3)
lw x5, 28(x3)

# --- Closing Loop 43 (Depth: 4) ---
addi x7, x7, 1
beq x7, x8, loop_end_43  # Conditional break from loop
bge x7, x2, loop_end_43 # Main loop exit condition
j loop_start_43 # Jump back to loop start
loop_end_43: # --- Resuming code after Loop 43 ---

sll x6, x5, x9
lw x2, 860(x3)

# --- Closing Loop 42 (Depth: 3) ---
addi x6, x6, 1
beq x6, x1, loop_end_42  # Conditional break from loop
bge x6, x8, loop_end_42 # Main loop exit condition
j loop_start_42 # Jump back to loop start
loop_end_42: # --- Resuming code after Loop 42 ---


# --- Starting Loop 44 (Depth: 3, break at 1, max 8) ---
addi x5, x0, 8
addi x8, x0, 1
addi x7, x0, 0
loop_start_44: # Loop body start
sw x5, 804(x3)
add x6, x5, x4
srl x9, x6, x4

# --- Closing Loop 44 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_end_44  # Conditional break from loop
bge x7, x5, loop_end_44 # Main loop exit condition
j loop_start_44 # Jump back to loop start
loop_end_44: # --- Resuming code after Loop 44 ---

lw x5, 976(x3)
sw x5, 852(x3)

# --- Closing Loop 39 (Depth: 2) ---
addi x1, x1, 1
beq x1, x6, loop_end_39  # Conditional break from loop
bge x1, x8, loop_end_39 # Main loop exit condition
j loop_start_39 # Jump back to loop start
loop_end_39: # --- Resuming code after Loop 39 ---


# --- Starting Loop 45 (Depth: 2, break at 4, max 10) ---
addi x2, x0, 10
addi x4, x0, 4
addi x1, x0, 0
loop_start_45: # Loop body start
sw x1, 792(x3)
or x5, x8, x6

# --- Closing Loop 45 (Depth: 2) ---
addi x1, x1, 1
beq x1, x4, loop_end_45  # Conditional break from loop
bge x1, x2, loop_end_45 # Main loop exit condition
j loop_start_45 # Jump back to loop start
loop_end_45: # --- Resuming code after Loop 45 ---


# --- Closing Loop 8 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_end_8  # Conditional break from loop
bge x5, x9, loop_end_8 # Main loop exit condition
j loop_start_8 # Jump back to loop start
loop_end_8: # --- Resuming code after Loop 8 ---

lw x6, 992(x3)

# --- Starting Loop 46 (Depth: 1, break at 4, max 8) ---
addi x8, x0, 8
addi x5, x0, 4
addi x9, x0, 0
loop_start_46: # Loop body start
xor x8, x9, x6

# --- Starting Loop 47 (Depth: 2, break at 2, max 4) ---
addi x6, x0, 4
addi x5, x0, 2
addi x9, x0, 0
loop_start_47: # Loop body start
lw x4, 212(x3)

# --- Closing Loop 47 (Depth: 2) ---
addi x9, x9, 1
beq x9, x5, loop_end_47  # Conditional break from loop
bge x9, x6, loop_end_47 # Main loop exit condition
j loop_start_47 # Jump back to loop start
loop_end_47: # --- Resuming code after Loop 47 ---


# --- Closing Loop 46 (Depth: 1) ---
addi x9, x9, 1
beq x9, x5, loop_end_46  # Conditional break from loop
bge x9, x8, loop_end_46 # Main loop exit condition
j loop_start_46 # Jump back to loop start
loop_end_46: # --- Resuming code after Loop 46 ---

sw x5, 80(x3)
srl x6, x9, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 48 (Depth: 1, break at 5, max 9) ---
addi x4, x0, 9
addi x8, x0, 5
addi x2, x0, 0
loop_start_48: # Loop body start

# --- Starting Loop 49 (Depth: 2, break at 1, max 6) ---
addi x6, x0, 6
addi x1, x0, 1
addi x4, x0, 0
loop_start_49: # Loop body start
lw x7, 172(x3)
sw x7, 420(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x4, x5, x9

# --- Closing Loop 49 (Depth: 2) ---
addi x4, x4, 1
beq x4, x1, loop_end_49  # Conditional break from loop
bge x4, x6, loop_end_49 # Main loop exit condition
j loop_start_49 # Jump back to loop start
loop_end_49: # --- Resuming code after Loop 49 ---

xor x1, x8, x6

# --- Starting Loop 50 (Depth: 2, break at 3, max 6) ---
addi x7, x0, 6
addi x8, x0, 3
addi x9, x0, 0
loop_start_50: # Loop body start

# --- Starting Loop 51 (Depth: 3, break at 1, max 2) ---
addi x5, x0, 2
addi x8, x0, 1
addi x2, x0, 0
loop_start_51: # Loop body start

# --- Closing Loop 51 (Depth: 3) ---
addi x2, x2, 1
beq x2, x8, loop_end_51  # Conditional break from loop
bge x2, x5, loop_end_51 # Main loop exit condition
j loop_start_51 # Jump back to loop start
loop_end_51: # --- Resuming code after Loop 51 ---

sw x4, 500(x3)

# --- Closing Loop 50 (Depth: 2) ---
addi x9, x9, 1
beq x9, x8, loop_end_50  # Conditional break from loop
bge x9, x7, loop_end_50 # Main loop exit condition
j loop_start_50 # Jump back to loop start
loop_end_50: # --- Resuming code after Loop 50 ---

sw x4, 712(x3)
sw x4, 212(x3)
sw x6, 104(x3)
srl x5, x1, x8

# --- Starting Loop 52 (Depth: 2, break at 4, max 6) ---
addi x9, x0, 6
addi x7, x0, 4
addi x2, x0, 0
loop_start_52: # Loop body start
or x9, x2, x4
sw x1, 428(x3)
srl x6, x7, x8
lw x7, 224(x3)
lw x6, 524(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 52 (Depth: 2) ---
addi x2, x2, 1
beq x2, x7, loop_end_52  # Conditional break from loop
bge x2, x9, loop_end_52 # Main loop exit condition
j loop_start_52 # Jump back to loop start
loop_end_52: # --- Resuming code after Loop 52 ---


# --- Closing Loop 48 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_end_48  # Conditional break from loop
bge x2, x4, loop_end_48 # Main loop exit condition
j loop_start_48 # Jump back to loop start
loop_end_48: # --- Resuming code after Loop 48 ---

sw x6, 348(x3)
lw x9, 296(x3)
sw x7, 268(x3)
xor x8, x5, x1
lw x4, 124(x3)

# --- Starting Loop 53 (Depth: 1, break at 2, max 10) ---
addi x7, x0, 10
addi x8, x0, 2
addi x6, x0, 0
loop_start_53: # Loop body start

# --- Closing Loop 53 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_end_53  # Conditional break from loop
bge x6, x7, loop_end_53 # Main loop exit condition
j loop_start_53 # Jump back to loop start
loop_end_53: # --- Resuming code after Loop 53 ---

sw x9, 612(x3)
sub x1, x5, x6
sll x6, x1, x4

# --- Starting Loop 54 (Depth: 1, break at 4, max 10) ---
addi x8, x0, 10
addi x9, x0, 4
addi x1, x0, 0
loop_start_54: # Loop body start

# --- Closing Loop 54 (Depth: 1) ---
addi x1, x1, 1
beq x1, x9, loop_end_54  # Conditional break from loop
bge x1, x8, loop_end_54 # Main loop exit condition
j loop_start_54 # Jump back to loop start
loop_end_54: # --- Resuming code after Loop 54 ---

lw x7, 228(x3)
lw x8, 172(x3)

# --- Starting Loop 55 (Depth: 1, break at 3, max 4) ---
addi x1, x0, 4
addi x7, x0, 3
addi x6, x0, 0
loop_start_55: # Loop body start
lw x2, 676(x3)

# --- Starting Loop 56 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x5, x0, 3
addi x4, x0, 0
loop_start_56: # Loop body start
or x1, x4, x7
lw x8, 500(x3)
sw x4, 596(x3)

# --- Closing Loop 56 (Depth: 2) ---
addi x4, x4, 1
beq x4, x5, loop_end_56  # Conditional break from loop
bge x4, x1, loop_end_56 # Main loop exit condition
j loop_start_56 # Jump back to loop start
loop_end_56: # --- Resuming code after Loop 56 ---

sw x5, 724(x3)

# --- Closing Loop 55 (Depth: 1) ---
addi x6, x6, 1
beq x6, x7, loop_end_55  # Conditional break from loop
bge x6, x1, loop_end_55 # Main loop exit condition
j loop_start_55 # Jump back to loop start
loop_end_55: # --- Resuming code after Loop 55 ---


# --- Starting Loop 57 (Depth: 1, break at 4, max 6) ---
addi x2, x0, 6
addi x1, x0, 4
addi x9, x0, 0
loop_start_57: # Loop body start
sw x6, 68(x3)

# --- Closing Loop 57 (Depth: 1) ---
addi x9, x9, 1
beq x9, x1, loop_end_57  # Conditional break from loop
bge x9, x2, loop_end_57 # Main loop exit condition
j loop_start_57 # Jump back to loop start
loop_end_57: # --- Resuming code after Loop 57 ---

sw x2, 192(x3)
lw x1, 120(x3)
and x5, x6, x7
lw x8, 404(x3)

# --- Starting Loop 58 (Depth: 1, break at 1, max 2) ---
addi x1, x0, 2
addi x7, x0, 1
addi x2, x0, 0
loop_start_58: # Loop body start

# --- Closing Loop 58 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_58  # Conditional break from loop
bge x2, x1, loop_end_58 # Main loop exit condition
j loop_start_58 # Jump back to loop start
loop_end_58: # --- Resuming code after Loop 58 ---

sub x9, x2, x6
lw x1, 56(x3)

# --- Starting Loop 59 (Depth: 1, break at 5, max 8) ---
addi x8, x0, 8
addi x7, x0, 5
addi x2, x0, 0
loop_start_59: # Loop body start

# --- Closing Loop 59 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_59  # Conditional break from loop
bge x2, x8, loop_end_59 # Main loop exit condition
j loop_start_59 # Jump back to loop start
loop_end_59: # --- Resuming code after Loop 59 ---

lw x6, 176(x3)

# --- Starting Loop 60 (Depth: 1, break at 5, max 9) ---
addi x7, x0, 9
addi x5, x0, 5
addi x2, x0, 0
loop_start_60: # Loop body start
sw x2, 488(x3)

# --- Starting Loop 61 (Depth: 2, break at 4, max 7) ---
addi x7, x0, 7
addi x4, x0, 4
addi x9, x0, 0
loop_start_61: # Loop body start
sw x7, 4(x3)
xor x2, x8, x7

# --- Closing Loop 61 (Depth: 2) ---
addi x9, x9, 1
beq x9, x4, loop_end_61  # Conditional break from loop
bge x9, x7, loop_end_61 # Main loop exit condition
j loop_start_61 # Jump back to loop start
loop_end_61: # --- Resuming code after Loop 61 ---

add x2, x7, x1
srl x9, x2, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 62 (Depth: 2, break at 3, max 6) ---
addi x5, x0, 6
addi x8, x0, 3
addi x6, x0, 0
loop_start_62: # Loop body start

# --- Closing Loop 62 (Depth: 2) ---
addi x6, x6, 1
beq x6, x8, loop_end_62  # Conditional break from loop
bge x6, x5, loop_end_62 # Main loop exit condition
j loop_start_62 # Jump back to loop start
loop_end_62: # --- Resuming code after Loop 62 ---


# --- Starting Loop 63 (Depth: 2, break at 3, max 5) ---
addi x2, x0, 5
addi x4, x0, 3
addi x1, x0, 0
loop_start_63: # Loop body start
lw x8, 800(x3)

# --- Closing Loop 63 (Depth: 2) ---
addi x1, x1, 1
beq x1, x4, loop_end_63  # Conditional break from loop
bge x1, x2, loop_end_63 # Main loop exit condition
j loop_start_63 # Jump back to loop start
loop_end_63: # --- Resuming code after Loop 63 ---

lw x9, 576(x3)
sub x9, x7, x4
sw x5, 700(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 60 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_end_60  # Conditional break from loop
bge x2, x7, loop_end_60 # Main loop exit condition
j loop_start_60 # Jump back to loop start
loop_end_60: # --- Resuming code after Loop 60 ---


# --- Starting Loop 64 (Depth: 1, break at 2, max 9) ---
addi x8, x0, 9
addi x9, x0, 2
addi x5, x0, 0
loop_start_64: # Loop body start

# --- Closing Loop 64 (Depth: 1) ---
addi x5, x5, 1
beq x5, x9, loop_end_64  # Conditional break from loop
bge x5, x8, loop_end_64 # Main loop exit condition
j loop_start_64 # Jump back to loop start
loop_end_64: # --- Resuming code after Loop 64 ---

sw x9, 64(x3)
sw x4, 752(x3)

# --- Starting Loop 65 (Depth: 1, break at 3, max 10) ---
addi x2, x0, 10
addi x4, x0, 3
addi x5, x0, 0
loop_start_65: # Loop body start

# --- Starting Loop 66 (Depth: 2, break at 5, max 7) ---
addi x4, x0, 7
addi x2, x0, 5
addi x8, x0, 0
loop_start_66: # Loop body start
sw x8, 772(x3)
sw x7, 720(x3)

# --- Starting Loop 67 (Depth: 3, break at 2, max 7) ---
addi x6, x0, 7
addi x7, x0, 2
addi x8, x0, 0
loop_start_67: # Loop body start
sw x8, 300(x3)
add x5, x6, x8
sw x9, 640(x3)
sw x4, 688(x3)
lw x5, 0(x3)
sw x5, 132(x3)
srl x8, x4, x5
sw x6, 740(x3)
sw x4, 388(x3)
sw x9, 504(x3)
sw x7, 584(x3)
xor x6, x8, x4

# --- Starting Loop 68 (Depth: 4, break at 1, max 4) ---
addi x1, x0, 4
addi x2, x0, 1
addi x8, x0, 0
loop_start_68: # Loop body start
add x2, x6, x7
srl x1, x2, x4
add x6, x1, x5
lw x2, 44(x3)
lw x2, 684(x3)
lw x9, 780(x3)

# --- Closing Loop 68 (Depth: 4) ---
addi x8, x8, 1
beq x8, x2, loop_end_68  # Conditional break from loop
bge x8, x1, loop_end_68 # Main loop exit condition
j loop_start_68 # Jump back to loop start
loop_end_68: # --- Resuming code after Loop 68 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 67 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_end_67  # Conditional break from loop
bge x8, x6, loop_end_67 # Main loop exit condition
j loop_start_67 # Jump back to loop start
loop_end_67: # --- Resuming code after Loop 67 ---

lw x9, 836(x3)
sw x9, 992(x3)
sw x7, 320(x3)
sw x5, 148(x3)

# --- Starting Loop 69 (Depth: 3, break at 4, max 6) ---
addi x8, x0, 6
addi x5, x0, 4
addi x9, x0, 0
loop_start_69: # Loop body start

# --- Starting Loop 70 (Depth: 4, break at 5, max 6) ---
addi x6, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_70: # Loop body start
lw x6, 136(x3)

# --- Closing Loop 70 (Depth: 4) ---
addi x4, x4, 1
beq x4, x5, loop_end_70  # Conditional break from loop
bge x4, x6, loop_end_70 # Main loop exit condition
j loop_start_70 # Jump back to loop start
loop_end_70: # --- Resuming code after Loop 70 ---


# --- Closing Loop 69 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_end_69  # Conditional break from loop
bge x9, x8, loop_end_69 # Main loop exit condition
j loop_start_69 # Jump back to loop start
loop_end_69: # --- Resuming code after Loop 69 ---

lw x5, 760(x3)

# --- Closing Loop 66 (Depth: 2) ---
addi x8, x8, 1
beq x8, x2, loop_end_66  # Conditional break from loop
bge x8, x4, loop_end_66 # Main loop exit condition
j loop_start_66 # Jump back to loop start
loop_end_66: # --- Resuming code after Loop 66 ---

lw x7, 724(x3)

# --- Starting Loop 71 (Depth: 2, break at 1, max 8) ---
addi x6, x0, 8
addi x9, x0, 1
addi x4, x0, 0
loop_start_71: # Loop body start
xor x7, x4, x9
and x7, x4, x6

# --- Closing Loop 71 (Depth: 2) ---
addi x4, x4, 1
beq x4, x9, loop_end_71  # Conditional break from loop
bge x4, x6, loop_end_71 # Main loop exit condition
j loop_start_71 # Jump back to loop start
loop_end_71: # --- Resuming code after Loop 71 ---


# --- Closing Loop 65 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_end_65  # Conditional break from loop
bge x5, x2, loop_end_65 # Main loop exit condition
j loop_start_65 # Jump back to loop start
loop_end_65: # --- Resuming code after Loop 65 ---


# --- Starting Loop 72 (Depth: 1, break at 4, max 9) ---
addi x2, x0, 9
addi x5, x0, 4
addi x8, x0, 0
loop_start_72: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
srl x9, x8, x2

# --- Starting Loop 73 (Depth: 2, break at 2, max 6) ---
addi x6, x0, 6
addi x1, x0, 2
addi x4, x0, 0
loop_start_73: # Loop body start
lw x1, 508(x3)

# --- Starting Loop 74 (Depth: 3, break at 2, max 9) ---
addi x5, x0, 9
addi x6, x0, 2
addi x2, x0, 0
loop_start_74: # Loop body start

# --- Starting Loop 75 (Depth: 4, break at 5, max 6) ---
addi x8, x0, 6
addi x4, x0, 5
addi x9, x0, 0
loop_start_75: # Loop body start

# --- Starting Loop 76 (Depth: 5, break at 4, max 9) ---
addi x1, x0, 9
addi x6, x0, 4
addi x8, x0, 0
loop_start_76: # Loop body start
sub x9, x8, x7
sw x9, 516(x3)
lw x5, 664(x3)
sll x8, x7, x2

# --- Closing Loop 76 (Depth: 5) ---
addi x8, x8, 1
beq x8, x6, loop_end_76  # Conditional break from loop
bge x8, x1, loop_end_76 # Main loop exit condition
j loop_start_76 # Jump back to loop start
loop_end_76: # --- Resuming code after Loop 76 ---

lw x7, 436(x3)
lw x4, 100(x3)
sw x2, 916(x3)
add x4, x1, x5
sll x8, x7, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 75 (Depth: 4) ---
addi x9, x9, 1
beq x9, x4, loop_end_75  # Conditional break from loop
bge x9, x8, loop_end_75 # Main loop exit condition
j loop_start_75 # Jump back to loop start
loop_end_75: # --- Resuming code after Loop 75 ---


# --- Closing Loop 74 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_end_74  # Conditional break from loop
bge x2, x5, loop_end_74 # Main loop exit condition
j loop_start_74 # Jump back to loop start
loop_end_74: # --- Resuming code after Loop 74 ---


# --- Closing Loop 73 (Depth: 2) ---
addi x4, x4, 1
beq x4, x1, loop_end_73  # Conditional break from loop
bge x4, x6, loop_end_73 # Main loop exit condition
j loop_start_73 # Jump back to loop start
loop_end_73: # --- Resuming code after Loop 73 ---

sub x5, x1, x2
lw x4, 316(x3)
xor x7, x4, x9

# --- Starting Loop 77 (Depth: 2, break at 5, max 8) ---
addi x1, x0, 8
addi x6, x0, 5
addi x2, x0, 0
loop_start_77: # Loop body start

# --- Starting Loop 78 (Depth: 3, break at 1, max 7) ---
addi x7, x0, 7
addi x1, x0, 1
addi x9, x0, 0
loop_start_78: # Loop body start
lw x7, 892(x3)
sw x7, 412(x3)
and x8, x1, x9
or x2, x6, x9

# --- Starting Loop 79 (Depth: 4, break at 1, max 9) ---
addi x6, x0, 9
addi x9, x0, 1
addi x7, x0, 0
loop_start_79: # Loop body start
sw x7, 288(x3)

# --- Closing Loop 79 (Depth: 4) ---
addi x7, x7, 1
beq x7, x9, loop_end_79  # Conditional break from loop
bge x7, x6, loop_end_79 # Main loop exit condition
j loop_start_79 # Jump back to loop start
loop_end_79: # --- Resuming code after Loop 79 ---

lw x7, 924(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x8, 512(x3)
sw x4, 508(x3)

# --- Starting Loop 80 (Depth: 4, break at 4, max 8) ---
addi x6, x0, 8
addi x1, x0, 4
addi x2, x0, 0
loop_start_80: # Loop body start

# --- Starting Loop 81 (Depth: 5, break at 5, max 6) ---
addi x4, x0, 6
addi x7, x0, 5
addi x6, x0, 0
loop_start_81: # Loop body start
lw x2, 36(x3)
lw x8, 876(x3)
sw x4, 12(x3)

# --- Closing Loop 81 (Depth: 5) ---
addi x6, x6, 1
beq x6, x7, loop_end_81  # Conditional break from loop
bge x6, x4, loop_end_81 # Main loop exit condition
j loop_start_81 # Jump back to loop start
loop_end_81: # --- Resuming code after Loop 81 ---

sw x8, 608(x3)

# --- Starting Loop 82 (Depth: 5, break at 4, max 10) ---
addi x5, x0, 10
addi x6, x0, 4
addi x4, x0, 0
loop_start_82: # Loop body start
lw x9, 876(x3)
sw x2, 372(x3)
sw x9, 904(x3)
lw x8, 980(x3)
and x5, x8, x9
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 82 (Depth: 5) ---
addi x4, x4, 1
beq x4, x6, loop_end_82  # Conditional break from loop
bge x4, x5, loop_end_82 # Main loop exit condition
j loop_start_82 # Jump back to loop start
loop_end_82: # --- Resuming code after Loop 82 ---

lw x9, 20(x3)
srl x1, x9, x5
sw x9, 32(x3)
lw x6, 472(x3)
sw x6, 172(x3)
srl x4, x7, x8
or x8, x1, x9
lw x5, 32(x3)

# --- Closing Loop 80 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_end_80  # Conditional break from loop
bge x2, x6, loop_end_80 # Main loop exit condition
j loop_start_80 # Jump back to loop start
loop_end_80: # --- Resuming code after Loop 80 ---


# --- Starting Loop 83 (Depth: 4, break at 5, max 10) ---
addi x2, x0, 10
addi x8, x0, 5
addi x9, x0, 0
loop_start_83: # Loop body start
srl x4, x2, x6
sll x8, x4, x9
lw x5, 312(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 83
addi x9, x9, 1
beq x9, x8, loop_end_83
bge x9, x2, loop_end_83
j loop_start_83
loop_end_83: # Loop exit

# Closing remaining Loop 78
addi x9, x9, 1
beq x9, x1, loop_end_78
bge x9, x7, loop_end_78
j loop_start_78
loop_end_78: # Loop exit

# Closing remaining Loop 77
addi x2, x2, 1
beq x2, x6, loop_end_77
bge x2, x1, loop_end_77
j loop_start_77
loop_end_77: # Loop exit

# Closing remaining Loop 72
addi x8, x8, 1
beq x8, x5, loop_end_72
bge x8, x2, loop_end_72
j loop_start_72
loop_end_72: # Loop exit

# Program exit
li a7, 93 # ecall: exit
ecall
