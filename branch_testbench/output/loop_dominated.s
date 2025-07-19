# Initialize memory base register x3
lui x3, 3
addi x3, x3, 0


# --- Starting Loop 1 (Depth: 1, break at 1, max 2) ---
addi x6, x0, 2
addi x9, x0, 1
addi x8, x0, 0
loop_start_1:
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
loop_start_2:

# --- Starting Loop 3 (Depth: 3, break at 1, max 7) ---
addi x5, x0, 7
addi x7, x0, 1
addi x4, x0, 0
loop_start_3:

# --- Closing Loop 3 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_exit_3  # Conditional break from loop
blt x4, x5, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

lw x4, 444(x3)
beq x0, x0, skip_taken_1 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_1:
xor x4, x8, x7
sw x4, 852(x3)
lw x9, 780(x3)
sw x9, 660(x3)
sw x5, 676(x3)
beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:
lw x2, 236(x3)
bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:
sw x2, 572(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_2  # Conditional break from loop
blt x6, x8, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---


# --- Starting Loop 4 (Depth: 2, break at 3, max 10) ---
addi x9, x0, 10
addi x5, x0, 3
addi x8, x0, 0
loop_start_4:

# --- Starting Loop 5 (Depth: 3, break at 2, max 7) ---
addi x9, x0, 7
addi x7, x0, 2
addi x2, x0, 0
loop_start_5:
or x1, x2, x8
sw x1, 520(x3)

# --- Closing Loop 5 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_exit_5  # Conditional break from loop
blt x2, x9, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---

sw x7, 628(x3)
lw x2, 924(x3)

# --- Starting Loop 6 (Depth: 3, break at 5, max 10) ---
addi x9, x0, 10
addi x5, x0, 5
addi x8, x0, 0
loop_start_6:
or x4, x9, x9
xor x6, x5, x1
sw x8, 404(x3)
xor x2, x9, x7

# --- Closing Loop 6 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_exit_6  # Conditional break from loop
blt x8, x9, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---

lw x9, 892(x3)
and x7, x9, x6

# --- Closing Loop 4 (Depth: 2) ---
addi x8, x8, 1
beq x8, x5, loop_exit_4  # Conditional break from loop
blt x8, x9, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---

sw x9, 132(x3)
sw x6, 332(x3)

# --- Starting Loop 7 (Depth: 2, break at 3, max 5) ---
addi x6, x0, 5
addi x2, x0, 3
addi x5, x0, 0
loop_start_7:
add x8, x1, x1

# --- Closing Loop 7 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_exit_7  # Conditional break from loop
blt x5, x6, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---


# --- Closing Loop 1 (Depth: 1) ---
addi x8, x8, 1
beq x8, x9, loop_exit_1  # Conditional break from loop
blt x8, x6, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

bne x0, x0, skip_nottaken_4 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_4:

# --- Starting Loop 8 (Depth: 1, break at 2, max 5) ---
addi x9, x0, 5
addi x7, x0, 2
addi x5, x0, 0
loop_start_8:
sw x5, 368(x3)
or x9, x4, x8

# --- Starting Loop 9 (Depth: 2, break at 3, max 6) ---
addi x2, x0, 6
addi x5, x0, 3
addi x4, x0, 0
loop_start_9:

# --- Starting Loop 10 (Depth: 3, break at 2, max 8) ---
addi x2, x0, 8
addi x1, x0, 2
addi x7, x0, 0
loop_start_10:
sub x1, x9, x9
sw x1, 692(x3)
add x7, x6, x6
lw x2, 640(x3)
sw x2, 772(x3)
lw x6, 1000(x3)
xor x1, x4, x7
sw x5, 340(x3)
lw x6, 924(x3)
sw x6, 504(x3)

# --- Starting Loop 11 (Depth: 4, break at 1, max 10) ---
addi x7, x0, 10
addi x1, x0, 1
addi x8, x0, 0
loop_start_11:
sw x8, 700(x3)
lw x4, 164(x3)
sw x4, 672(x3)
sll x4, x8, x2
or x6, x2, x8

# --- Starting Loop 12 (Depth: 5, break at 2, max 10) ---
addi x4, x0, 10
addi x2, x0, 2
addi x1, x0, 0
loop_start_12:
sub x6, x1, x9

# --- Closing Loop 12 (Depth: 5) ---
addi x1, x1, 1
beq x1, x2, loop_exit_12  # Conditional break from loop
blt x1, x4, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

sw x6, 652(x3)
lw x6, 224(x3)
sw x9, 824(x3)
and x2, x6, x8

# --- Closing Loop 11 (Depth: 4) ---
addi x8, x8, 1
beq x8, x1, loop_exit_11  # Conditional break from loop
blt x8, x7, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---

lw x5, 192(x3)
lw x9, 616(x3)
lw x8, 332(x3)
sw x5, 480(x3)
xor x6, x2, x4
lw x8, 300(x3)
sw x7, 796(x3)

# --- Closing Loop 10 (Depth: 3) ---
addi x7, x7, 1
beq x7, x1, loop_exit_10  # Conditional break from loop
blt x7, x2, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---

sll x2, x7, x6
lw x9, 904(x3)

# --- Closing Loop 9 (Depth: 2) ---
addi x4, x4, 1
beq x4, x5, loop_exit_9  # Conditional break from loop
blt x4, x2, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---

sw x9, 36(x3)

# --- Closing Loop 8 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_exit_8  # Conditional break from loop
blt x5, x9, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---

xor x6, x4, x9
sll x7, x2, x4

# --- Starting Loop 13 (Depth: 1, break at 4, max 8) ---
addi x4, x0, 8
addi x5, x0, 4
addi x2, x0, 0
loop_start_13:
lw x4, 1000(x3)
sw x4, 196(x3)
bne x0, x0, skip_nottaken_5 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_5:

# --- Closing Loop 13 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_13  # Conditional break from loop
blt x2, x4, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

srl x8, x6, x2
sw x8, 264(x3)

# --- Starting Loop 14 (Depth: 1, break at 4, max 9) ---
addi x6, x0, 9
addi x1, x0, 4
addi x7, x0, 0
loop_start_14:

# --- Starting Loop 15 (Depth: 2, break at 5, max 10) ---
addi x6, x0, 10
addi x1, x0, 5
addi x8, x0, 0
loop_start_15:
sll x2, x8, x9
lw x4, 288(x3)
sub x4, x4, x1
lw x6, 380(x3)

# --- Starting Loop 16 (Depth: 3, break at 2, max 5) ---
addi x8, x0, 5
addi x7, x0, 2
addi x2, x0, 0
loop_start_16:
sw x7, 664(x3)

# --- Closing Loop 16 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_exit_16  # Conditional break from loop
blt x2, x8, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---

xor x8, x7, x9

# --- Starting Loop 17 (Depth: 3, break at 1, max 2) ---
addi x2, x0, 2
addi x5, x0, 1
addi x9, x0, 0
loop_start_17:

# --- Closing Loop 17 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_exit_17  # Conditional break from loop
blt x9, x2, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---

lw x4, 204(x3)

# --- Closing Loop 15 (Depth: 2) ---
addi x8, x8, 1
beq x8, x1, loop_exit_15  # Conditional break from loop
blt x8, x6, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---


# --- Closing Loop 14 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_exit_14  # Conditional break from loop
blt x7, x6, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---


# --- Starting Loop 18 (Depth: 1, break at 2, max 8) ---
addi x7, x0, 8
addi x8, x0, 2
addi x9, x0, 0
loop_start_18:
lw x2, 224(x3)
lw x6, 388(x3)
lw x5, 376(x3)
beq x0, x0, skip_taken_6 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_6:
add x7, x5, x1

# --- Starting Loop 19 (Depth: 2, break at 3, max 4) ---
addi x4, x0, 4
addi x1, x0, 3
addi x5, x0, 0
loop_start_19:
or x5, x5, x2
lw x9, 956(x3)
bne x0, x0, skip_nottaken_7 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_7:
beq x0, x0, skip_taken_8 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_8:
or x6, x9, x7
bne x0, x0, skip_nottaken_9 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_9:

# --- Starting Loop 20 (Depth: 3, break at 4, max 9) ---
addi x2, x0, 9
addi x5, x0, 4
addi x4, x0, 0
loop_start_20:
bne x0, x0, skip_nottaken_10 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_10:

# --- Closing Loop 20 (Depth: 3) ---
addi x4, x4, 1
beq x4, x5, loop_exit_20  # Conditional break from loop
blt x4, x2, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---

lw x5, 584(x3)
bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:
lw x9, 740(x3)
sll x2, x6, x4
lw x8, 40(x3)
sw x8, 596(x3)

# --- Starting Loop 21 (Depth: 3, break at 5, max 6) ---
addi x9, x0, 6
addi x5, x0, 5
addi x8, x0, 0
loop_start_21:
bne x0, x0, skip_nottaken_12 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_12:

# --- Closing Loop 21 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_exit_21  # Conditional break from loop
blt x8, x9, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---

lw x2, 364(x3)

# --- Starting Loop 22 (Depth: 3, break at 1, max 5) ---
addi x6, x0, 5
addi x8, x0, 1
addi x5, x0, 0
loop_start_22:
lw x9, 528(x3)
xor x5, x9, x4

# --- Starting Loop 23 (Depth: 4, break at 4, max 5) ---
addi x4, x0, 5
addi x7, x0, 4
addi x6, x0, 0
loop_start_23:
lw x5, 832(x3)
lw x5, 24(x3)

# --- Closing Loop 23 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_exit_23  # Conditional break from loop
blt x6, x4, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

sw x4, 872(x3)
sw x4, 564(x3)
sw x5, 232(x3)
lw x2, 172(x3)
add x4, x9, x8
sub x2, x6, x5
sll x7, x1, x1

# --- Starting Loop 24 (Depth: 4, break at 3, max 7) ---
addi x8, x0, 7
addi x2, x0, 3
addi x1, x0, 0
loop_start_24:
xor x5, x1, x1
beq x0, x0, skip_taken_13 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_13:
beq x0, x0, skip_taken_14 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_14:
or x9, x5, x1
sw x9, 64(x3)
sw x5, 468(x3)
and x9, x8, x8
or x4, x9, x9

# --- Closing Loop 24 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_exit_24  # Conditional break from loop
blt x1, x8, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---


# --- Closing Loop 22 (Depth: 3) ---
addi x5, x5, 1
beq x5, x8, loop_exit_22  # Conditional break from loop
blt x5, x6, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

lw x1, 264(x3)
sw x1, 492(x3)
lw x8, 480(x3)
lw x9, 848(x3)
lw x7, 692(x3)
srl x2, x7, x7
sw x9, 932(x3)
sub x5, x6, x2

# --- Closing Loop 19 (Depth: 2) ---
addi x5, x5, 1
beq x5, x1, loop_exit_19  # Conditional break from loop
blt x5, x4, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---


# --- Starting Loop 25 (Depth: 2, break at 3, max 8) ---
addi x6, x0, 8
addi x7, x0, 3
addi x1, x0, 0
loop_start_25:
sw x2, 708(x3)
beq x0, x0, skip_taken_15 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_15:
sw x2, 192(x3)
sw x5, 944(x3)

# --- Closing Loop 25 (Depth: 2) ---
addi x1, x1, 1
beq x1, x7, loop_exit_25  # Conditional break from loop
blt x1, x6, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

and x1, x8, x2
sw x4, 884(x3)

# --- Starting Loop 26 (Depth: 2, break at 3, max 10) ---
addi x5, x0, 10
addi x7, x0, 3
addi x9, x0, 0
loop_start_26:
sw x4, 740(x3)

# --- Starting Loop 27 (Depth: 3, break at 3, max 10) ---
addi x6, x0, 10
addi x9, x0, 3
addi x5, x0, 0
loop_start_27:
lw x7, 592(x3)

# --- Starting Loop 28 (Depth: 4, break at 3, max 5) ---
addi x1, x0, 5
addi x9, x0, 3
addi x8, x0, 0
loop_start_28:
beq x0, x0, skip_taken_16 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_16:
beq x0, x0, skip_taken_17 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_17:
beq x0, x0, skip_taken_18 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_18:
beq x0, x0, skip_taken_19 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_19:

# --- Closing Loop 28 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_exit_28  # Conditional break from loop
blt x8, x1, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---


# --- Closing Loop 27 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_exit_27  # Conditional break from loop
blt x5, x6, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---


# --- Starting Loop 29 (Depth: 3, break at 2, max 8) ---
addi x5, x0, 8
addi x1, x0, 2
addi x7, x0, 0
loop_start_29:

# --- Closing Loop 29 (Depth: 3) ---
addi x7, x7, 1
beq x7, x1, loop_exit_29  # Conditional break from loop
blt x7, x5, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---

xor x6, x8, x1

# --- Starting Loop 30 (Depth: 3, break at 3, max 10) ---
addi x5, x0, 10
addi x9, x0, 3
addi x2, x0, 0
loop_start_30:

# --- Closing Loop 30 (Depth: 3) ---
addi x2, x2, 1
beq x2, x9, loop_exit_30  # Conditional break from loop
blt x2, x5, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---

xor x2, x9, x1

# --- Starting Loop 31 (Depth: 3, break at 4, max 8) ---
addi x9, x0, 8
addi x5, x0, 4
addi x1, x0, 0
loop_start_31:
sub x8, x1, x7
lw x1, 860(x3)
and x6, x4, x2
lw x1, 560(x3)
sll x9, x1, x8
lw x6, 656(x3)
sub x7, x6, x9
and x9, x7, x5
or x9, x9, x2
and x7, x9, x2
srl x5, x6, x1

# --- Starting Loop 32 (Depth: 4, break at 5, max 8) ---
addi x9, x0, 8
addi x8, x0, 5
addi x6, x0, 0
loop_start_32:
lw x9, 680(x3)

# --- Closing Loop 32 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_exit_32  # Conditional break from loop
blt x6, x9, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---


# --- Starting Loop 33 (Depth: 4, break at 1, max 8) ---
addi x5, x0, 8
addi x8, x0, 1
addi x4, x0, 0
loop_start_33:
sll x5, x2, x1
lw x2, 620(x3)
lw x4, 680(x3)
lw x9, 392(x3)
bne x0, x0, skip_nottaken_20 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_20:

# --- Starting Loop 34 (Depth: 5, break at 1, max 9) ---
addi x4, x0, 9
addi x8, x0, 1
addi x7, x0, 0
loop_start_34:

# --- Closing Loop 34 (Depth: 5) ---
addi x7, x7, 1
beq x7, x8, loop_exit_34  # Conditional break from loop
blt x7, x4, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---

sw x7, 16(x3)

# --- Starting Loop 35 (Depth: 5, break at 4, max 6) ---
addi x4, x0, 6
addi x9, x0, 4
addi x8, x0, 0
loop_start_35:
bne x0, x0, skip_nottaken_21 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_21:
sw x8, 288(x3)
lw x9, 48(x3)
sw x6, 664(x3)
bne x0, x0, skip_nottaken_22 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_22:
beq x0, x0, skip_taken_23 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_23:
lw x1, 304(x3)
sw x2, 292(x3)

# --- Closing Loop 35 (Depth: 5) ---
addi x8, x8, 1
beq x8, x9, loop_exit_35  # Conditional break from loop
blt x8, x4, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---

bne x0, x0, skip_nottaken_24 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_24:
sw x7, 388(x3)
sw x2, 432(x3)
sw x2, 572(x3)
xor x8, x9, x4
beq x0, x0, skip_taken_25 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_25:
xor x5, x2, x4
lw x4, 0(x3)
lw x5, 920(x3)

# --- Closing Loop 33 (Depth: 4) ---
addi x4, x4, 1
beq x4, x8, loop_exit_33  # Conditional break from loop
blt x4, x5, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---

and x6, x5, x8

# --- Starting Loop 36 (Depth: 4, break at 2, max 6) ---
addi x1, x0, 6
addi x4, x0, 2
addi x2, x0, 0
loop_start_36:

# --- Starting Loop 37 (Depth: 5, break at 5, max 7) ---
addi x1, x0, 7
addi x8, x0, 5
addi x4, x0, 0
loop_start_37:

# --- Closing Loop 37 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_exit_37  # Conditional break from loop
blt x4, x1, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

sub x6, x4, x2
lw x2, 512(x3)
bne x0, x0, skip_nottaken_26 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_26:
lw x7, 144(x3)
add x5, x6, x2

# --- Closing Loop 36 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_exit_36  # Conditional break from loop
blt x2, x1, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

add x6, x5, x1
sw x5, 24(x3)
or x4, x7, x7
lw x9, 20(x3)
or x9, x9, x2
lw x5, 932(x3)

# --- Closing Loop 31 (Depth: 3) ---
addi x1, x1, 1
beq x1, x5, loop_exit_31  # Conditional break from loop
blt x1, x9, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---


# --- Starting Loop 38 (Depth: 3, break at 2, max 8) ---
addi x9, x0, 8
addi x6, x0, 2
addi x2, x0, 0
loop_start_38:

# --- Closing Loop 38 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_38  # Conditional break from loop
blt x2, x9, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---


# --- Starting Loop 39 (Depth: 3, break at 5, max 8) ---
addi x8, x0, 8
addi x4, x0, 5
addi x6, x0, 0
loop_start_39:
lw x6, 444(x3)
sw x1, 528(x3)

# --- Closing Loop 39 (Depth: 3) ---
addi x6, x6, 1
beq x6, x4, loop_exit_39  # Conditional break from loop
blt x6, x8, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---


# --- Starting Loop 40 (Depth: 3, break at 3, max 7) ---
addi x2, x0, 7
addi x1, x0, 3
addi x4, x0, 0
loop_start_40:

# --- Closing Loop 40 (Depth: 3) ---
addi x4, x4, 1
beq x4, x1, loop_exit_40  # Conditional break from loop
blt x4, x2, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---

and x2, x4, x9
sw x2, 972(x3)
lw x1, 864(x3)
sw x1, 88(x3)
add x2, x1, x9
bne x0, x0, skip_nottaken_27 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_27:

# --- Starting Loop 41 (Depth: 3, break at 5, max 7) ---
addi x4, x0, 7
addi x6, x0, 5
addi x9, x0, 0
loop_start_41:
lw x2, 584(x3)

# --- Starting Loop 42 (Depth: 4, break at 1, max 3) ---
addi x4, x0, 3
addi x7, x0, 1
addi x9, x0, 0
loop_start_42:
sll x2, x9, x9
srl x1, x2, x4
lw x4, 324(x3)
and x5, x6, x9
srl x2, x5, x5

# --- Closing Loop 42 (Depth: 4) ---
addi x9, x9, 1
beq x9, x7, loop_exit_42  # Conditional break from loop
blt x9, x4, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---


# --- Closing Loop 41 (Depth: 3) ---
addi x9, x9, 1
beq x9, x6, loop_exit_41  # Conditional break from loop
blt x9, x4, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---

sw x2, 468(x3)

# --- Starting Loop 43 (Depth: 3, break at 5, max 10) ---
addi x1, x0, 10
addi x4, x0, 5
addi x8, x0, 0
loop_start_43:
beq x0, x0, skip_taken_28 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_28:

# --- Closing Loop 43 (Depth: 3) ---
addi x8, x8, 1
beq x8, x4, loop_exit_43  # Conditional break from loop
blt x8, x1, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---

srl x8, x8, x6
and x7, x8, x5

# --- Closing Loop 26 (Depth: 2) ---
addi x9, x9, 1
beq x9, x7, loop_exit_26  # Conditional break from loop
blt x9, x5, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---

lw x6, 84(x3)
sll x6, x6, x9
add x8, x6, x7
lw x1, 364(x3)
sw x1, 692(x3)
and x9, x2, x4
lw x2, 184(x3)

# --- Starting Loop 44 (Depth: 2, break at 5, max 10) ---
addi x8, x0, 10
addi x1, x0, 5
addi x6, x0, 0
loop_start_44:
beq x0, x0, skip_taken_29 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_29:
lw x1, 748(x3)
sw x1, 524(x3)
beq x0, x0, skip_taken_30 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_30:

# --- Starting Loop 45 (Depth: 3, break at 2, max 3) ---
addi x2, x0, 3
addi x8, x0, 2
addi x7, x0, 0
loop_start_45:
bne x0, x0, skip_nottaken_31 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_31:
and x6, x5, x9
lw x9, 148(x3)
add x1, x8, x6

# --- Starting Loop 46 (Depth: 4, break at 2, max 5) ---
addi x4, x0, 5
addi x5, x0, 2
addi x6, x0, 0
loop_start_46:
and x9, x7, x2
and x2, x9, x5
sll x9, x5, x1

# --- Closing Loop 46 (Depth: 4) ---
addi x6, x6, 1
beq x6, x5, loop_exit_46  # Conditional break from loop
blt x6, x4, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

lw x2, 700(x3)
sw x2, 940(x3)
sw x6, 680(x3)
bne x0, x0, skip_nottaken_32 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_32:
sw x7, 4(x3)
sw x7, 796(x3)
lw x6, 100(x3)

# --- Starting Loop 47 (Depth: 4, break at 1, max 10) ---
addi x2, x0, 10
addi x8, x0, 1
addi x1, x0, 0
loop_start_47:
lw x7, 32(x3)
sw x7, 792(x3)
or x5, x8, x6

# --- Closing Loop 47 (Depth: 4) ---
addi x1, x1, 1
beq x1, x8, loop_exit_47  # Conditional break from loop
blt x1, x2, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---


# --- Closing Loop 45 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_exit_45  # Conditional break from loop
blt x7, x2, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---

lw x5, 796(x3)
or x9, x5, x1
or x5, x4, x2

# --- Starting Loop 48 (Depth: 3, break at 3, max 7) ---
addi x8, x0, 7
addi x4, x0, 3
addi x7, x0, 0
loop_start_48:
lw x4, 212(x3)

# --- Closing Loop 48 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_exit_48  # Conditional break from loop
blt x7, x8, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---


# --- Closing Loop 44 (Depth: 2) ---
addi x6, x6, 1
beq x6, x1, loop_exit_44  # Conditional break from loop
blt x6, x8, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---

add x5, x8, x6
lw x1, 744(x3)
sw x1, 376(x3)
sw x6, 932(x3)
sw x6, 24(x3)
lw x7, 432(x3)
bne x0, x0, skip_nottaken_33 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_33:
sw x5, 260(x3)
lw x7, 788(x3)

# --- Starting Loop 49 (Depth: 2, break at 1, max 4) ---
addi x1, x0, 4
addi x4, x0, 1
addi x6, x0, 0
loop_start_49:
lw x8, 288(x3)
sll x7, x9, x6
bne x0, x0, skip_nottaken_34 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_34:
lw x8, 88(x3)
srl x2, x8, x7

# --- Closing Loop 49 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_49  # Conditional break from loop
blt x6, x1, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---

sw x2, 712(x3)
sw x4, 212(x3)
sw x6, 104(x3)
srl x5, x1, x9
sw x8, 72(x3)
sub x4, x6, x5
and x1, x4, x7
srl x6, x1, x7

# --- Closing Loop 18 (Depth: 1) ---
addi x9, x9, 1
beq x9, x8, loop_exit_18  # Conditional break from loop
blt x9, x7, loop_start_18 # Branch back to loop start
loop_exit_18: # Define loop exit label
# --- Resuming code after Loop 18 ---

sw x7, 224(x3)
sw x7, 400(x3)
xor x1, x9, x2
sw x1, 968(x3)
lw x7, 808(x3)

# --- Starting Loop 50 (Depth: 1, break at 5, max 9) ---
addi x5, x0, 9
addi x1, x0, 5
addi x4, x0, 0
loop_start_50:

# --- Starting Loop 51 (Depth: 2, break at 3, max 8) ---
addi x1, x0, 8
addi x6, x0, 3
addi x2, x0, 0
loop_start_51:
sw x2, 992(x3)
sw x7, 8(x3)
and x8, x9, x2
and x4, x2, x9

# --- Starting Loop 52 (Depth: 3, break at 4, max 10) ---
addi x7, x0, 10
addi x6, x0, 4
addi x1, x0, 0
loop_start_52:

# --- Starting Loop 53 (Depth: 4, break at 1, max 4) ---
addi x7, x0, 4
addi x2, x0, 1
addi x6, x0, 0
loop_start_53:
lw x2, 32(x3)

# --- Starting Loop 54 (Depth: 5, break at 4, max 5) ---
addi x4, x0, 5
addi x1, x0, 4
addi x9, x0, 0
loop_start_54:

# --- Closing Loop 54 (Depth: 5) ---
addi x9, x9, 1
beq x9, x1, loop_exit_54  # Conditional break from loop
blt x9, x4, loop_start_54 # Branch back to loop start
loop_exit_54: # Define loop exit label
# --- Resuming code after Loop 54 ---

lw x2, 60(x3)
sw x2, 716(x3)

# --- Closing Loop 53 (Depth: 4) ---
addi x6, x6, 1
beq x6, x2, loop_exit_53  # Conditional break from loop
blt x6, x7, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---


# --- Starting Loop 55 (Depth: 4, break at 4, max 10) ---
addi x6, x0, 10
addi x9, x0, 4
addi x5, x0, 0
loop_start_55:

# --- Starting Loop 56 (Depth: 5, break at 5, max 7) ---
addi x6, x0, 7
addi x4, x0, 5
addi x2, x0, 0
loop_start_56:
lw x4, 72(x3)
lw x6, 820(x3)
or x2, x4, x9
beq x0, x0, skip_taken_35 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_35:
lw x5, 456(x3)
lw x9, 404(x3)
sw x8, 264(x3)
add x1, x6, x4
sw x1, 240(x3)

# --- Closing Loop 56 (Depth: 5) ---
addi x2, x2, 1
beq x2, x4, loop_exit_56  # Conditional break from loop
blt x2, x6, loop_start_56 # Branch back to loop start
loop_exit_56: # Define loop exit label
# --- Resuming code after Loop 56 ---

bne x0, x0, skip_nottaken_36 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_36:
lw x8, 648(x3)
lw x6, 772(x3)
beq x0, x0, skip_taken_37 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_37:

# --- Closing Loop 55 (Depth: 4) ---
addi x5, x5, 1
beq x5, x9, loop_exit_55  # Conditional break from loop
blt x5, x6, loop_start_55 # Branch back to loop start
loop_exit_55: # Define loop exit label
# --- Resuming code after Loop 55 ---

and x2, x1, x9
sll x5, x8, x8

# --- Closing Loop 52 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_exit_52  # Conditional break from loop
blt x1, x7, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---

or x6, x8, x8
or x6, x8, x9
xor x7, x6, x1
or x6, x2, x1

# --- Closing Loop 51 (Depth: 2) ---
addi x2, x2, 1
beq x2, x6, loop_exit_51  # Conditional break from loop
blt x2, x1, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---

lw x8, 808(x3)
and x1, x2, x2
sw x1, 224(x3)

# --- Closing Loop 50 (Depth: 1) ---
addi x4, x4, 1
beq x4, x1, loop_exit_50  # Conditional break from loop
blt x4, x5, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

beq x0, x0, skip_taken_38 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_38:
lw x6, 180(x3)

# --- Starting Loop 57 (Depth: 1, break at 4, max 6) ---
addi x1, x0, 6
addi x9, x0, 4
addi x8, x0, 0
loop_start_57:
sw x5, 644(x3)
sw x7, 312(x3)
sw x5, 140(x3)

# --- Starting Loop 58 (Depth: 2, break at 2, max 10) ---
addi x6, x0, 10
addi x7, x0, 2
addi x8, x0, 0
loop_start_58:
srl x1, x8, x2

# --- Closing Loop 58 (Depth: 2) ---
addi x8, x8, 1
beq x8, x7, loop_exit_58  # Conditional break from loop
blt x8, x6, loop_start_58 # Branch back to loop start
loop_exit_58: # Define loop exit label
# --- Resuming code after Loop 58 ---


# --- Starting Loop 59 (Depth: 2, break at 5, max 9) ---
addi x8, x0, 9
addi x6, x0, 5
addi x4, x0, 0
loop_start_59:
lw x1, 724(x3)

# --- Starting Loop 60 (Depth: 3, break at 3, max 10) ---
addi x2, x0, 10
addi x4, x0, 3
addi x5, x0, 0
loop_start_60:
lw x4, 900(x3)
sw x1, 804(x3)
sw x7, 720(x3)
sw x6, 304(x3)
lw x6, 308(x3)

# --- Starting Loop 61 (Depth: 4, break at 3, max 4) ---
addi x4, x0, 4
addi x2, x0, 3
addi x8, x0, 0
loop_start_61:
lw x5, 28(x3)
sw x7, 916(x3)
sub x7, x6, x5
srl x2, x4, x1
lw x6, 740(x3)
and x5, x7, x7
lw x8, 808(x3)
sw x8, 852(x3)
sw x1, 976(x3)
beq x0, x0, skip_taken_39 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_39:
sw x5, 232(x3)
sw x2, 440(x3)

# --- Starting Loop 62 (Depth: 5, break at 3, max 4) ---
addi x6, x0, 4
addi x7, x0, 3
addi x1, x0, 0
loop_start_62:
sw x1, 204(x3)

# --- Closing Loop 62 (Depth: 5) ---
addi x1, x1, 1
beq x1, x7, loop_exit_62  # Conditional break from loop
blt x1, x6, loop_start_62 # Branch back to loop start
loop_exit_62: # Define loop exit label
# --- Resuming code after Loop 62 ---

lw x6, 336(x3)
sw x1, 0(x3)

# --- Closing Loop 61 (Depth: 4) ---
addi x8, x8, 1
beq x8, x2, loop_exit_61  # Conditional break from loop
blt x8, x4, loop_start_61 # Branch back to loop start
loop_exit_61: # Define loop exit label
# --- Resuming code after Loop 61 ---

lw x2, 684(x3)
lw x9, 780(x3)

# --- Closing Loop 60 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_exit_60  # Conditional break from loop
blt x5, x2, loop_start_60 # Branch back to loop start
loop_exit_60: # Define loop exit label
# --- Resuming code after Loop 60 ---

beq x0, x0, skip_taken_40 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_40:
bne x0, x0, skip_nottaken_41 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_41:
bne x0, x0, skip_nottaken_42 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_42:

# --- Closing Loop 59 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_exit_59  # Conditional break from loop
blt x4, x8, loop_start_59 # Branch back to loop start
loop_exit_59: # Define loop exit label
# --- Resuming code after Loop 59 ---

lw x9, 836(x3)
sw x9, 992(x3)
sw x7, 320(x3)
sw x5, 148(x3)

# --- Starting Loop 63 (Depth: 2, break at 4, max 6) ---
addi x8, x0, 6
addi x5, x0, 4
addi x9, x0, 0
loop_start_63:

# --- Starting Loop 64 (Depth: 3, break at 5, max 6) ---
addi x6, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_64:
lw x6, 136(x3)

# --- Closing Loop 64 (Depth: 3) ---
addi x4, x4, 1
beq x4, x5, loop_exit_64  # Conditional break from loop
blt x4, x6, loop_start_64 # Branch back to loop start
loop_exit_64: # Define loop exit label
# --- Resuming code after Loop 64 ---


# --- Closing Loop 63 (Depth: 2) ---
addi x9, x9, 1
beq x9, x5, loop_exit_63  # Conditional break from loop
blt x9, x8, loop_start_63 # Branch back to loop start
loop_exit_63: # Define loop exit label
# --- Resuming code after Loop 63 ---

lw x5, 760(x3)

# --- Closing Loop 57 (Depth: 1) ---
addi x8, x8, 1
beq x8, x9, loop_exit_57  # Conditional break from loop
blt x8, x1, loop_start_57 # Branch back to loop start
loop_exit_57: # Define loop exit label
# --- Resuming code after Loop 57 ---


# --- Starting Loop 65 (Depth: 1, break at 3, max 6) ---
addi x9, x0, 6
addi x6, x0, 3
addi x4, x0, 0
loop_start_65:
sw x8, 464(x3)
xor x4, x1, x8
lw x6, 528(x3)

# --- Closing Loop 65 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_exit_65  # Conditional break from loop
blt x4, x9, loop_start_65 # Branch back to loop start
loop_exit_65: # Define loop exit label
# --- Resuming code after Loop 65 ---

sw x7, 624(x3)
and x7, x2, x6

# --- Starting Loop 66 (Depth: 1, break at 4, max 5) ---
addi x6, x0, 5
addi x4, x0, 4
addi x5, x0, 0
loop_start_66:

# --- Starting Loop 67 (Depth: 2, break at 4, max 8) ---
addi x4, x0, 8
addi x9, x0, 4
addi x2, x0, 0
loop_start_67:
lw x1, 180(x3)
srl x6, x1, x7

# --- Starting Loop 68 (Depth: 3, break at 3, max 6) ---
addi x8, x0, 6
addi x2, x0, 3
addi x7, x0, 0
loop_start_68:
lw x8, 64(x3)

# --- Starting Loop 69 (Depth: 4, break at 1, max 10) ---
addi x5, x0, 10
addi x6, x0, 1
addi x2, x0, 0
loop_start_69:

# --- Starting Loop 70 (Depth: 5, break at 5, max 6) ---
addi x8, x0, 6
addi x4, x0, 5
addi x9, x0, 0
loop_start_70:
bne x0, x0, skip_nottaken_43 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_43:
lw x8, 612(x3)

# --- Closing Loop 70 (Depth: 5) ---
addi x9, x9, 1
beq x9, x4, loop_exit_70  # Conditional break from loop
blt x9, x8, loop_start_70 # Branch back to loop start
loop_exit_70: # Define loop exit label
# --- Resuming code after Loop 70 ---


# --- Closing Loop 69 (Depth: 4) ---
addi x2, x2, 1
beq x2, x6, loop_exit_69  # Conditional break from loop
blt x2, x5, loop_start_69 # Branch back to loop start
loop_exit_69: # Define loop exit label
# --- Resuming code after Loop 69 ---

lw x6, 388(x3)
sub x8, x2, x7
srl x4, x8, x5

# --- Closing Loop 68 (Depth: 3) ---
addi x7, x7, 1
beq x7, x2, loop_exit_68  # Conditional break from loop
blt x7, x8, loop_start_68 # Branch back to loop start
loop_exit_68: # Define loop exit label
# --- Resuming code after Loop 68 ---

add x4, x9, x2
or x7, x9, x6

# --- Closing Loop 67 (Depth: 2) ---
addi x2, x2, 1
beq x2, x9, loop_exit_67  # Conditional break from loop
blt x2, x4, loop_start_67 # Branch back to loop start
loop_exit_67: # Define loop exit label
# --- Resuming code after Loop 67 ---

add x2, x7, x8

# --- Closing Loop 66 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_66  # Conditional break from loop
blt x5, x6, loop_start_66 # Branch back to loop start
loop_exit_66: # Define loop exit label
# --- Resuming code after Loop 66 ---


# --- Starting Loop 71 (Depth: 1, break at 2, max 3) ---
addi x5, x0, 3
addi x7, x0, 2
addi x8, x0, 0
loop_start_71:
lw x2, 844(x3)

# --- Closing Loop 71 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_71  # Conditional break from loop
blt x8, x5, loop_start_71 # Branch back to loop start
loop_exit_71: # Define loop exit label
# --- Resuming code after Loop 71 ---


# --- Starting Loop 72 (Depth: 1, break at 1, max 3) ---
addi x9, x0, 3
addi x7, x0, 1
addi x1, x0, 0
loop_start_72:
add x5, x1, x8
or x1, x5, x9
lw x7, 436(x3)
beq x0, x0, skip_taken_44 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_44:
bne x0, x0, skip_nottaken_45 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_45:
sll x9, x7, x4
or x6, x5, x8

# --- Starting Loop 73 (Depth: 2, break at 4, max 6) ---
addi x8, x0, 6
addi x1, x0, 4
addi x7, x0, 0
loop_start_73:

# --- Starting Loop 74 (Depth: 3, break at 3, max 4) ---
addi x8, x0, 4
addi x1, x0, 3
addi x5, x0, 0
loop_start_74:
srl x9, x7, x4

# --- Closing Loop 74 (Depth: 3) ---
addi x5, x5, 1
beq x5, x1, loop_exit_74  # Conditional break from loop
blt x5, x8, loop_start_74 # Branch back to loop start
loop_exit_74: # Define loop exit label
# --- Resuming code after Loop 74 ---

sw x6, 288(x3)

# --- Closing Loop 73 (Depth: 2) ---
addi x7, x7, 1
beq x7, x1, loop_exit_73  # Conditional break from loop
blt x7, x8, loop_start_73 # Branch back to loop start
loop_exit_73: # Define loop exit label
# --- Resuming code after Loop 73 ---

lw x7, 924(x3)
beq x0, x0, skip_taken_46 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_46:

# --- Starting Loop 75 (Depth: 2, break at 5, max 9) ---
addi x8, x0, 9
addi x6, x0, 5
addi x5, x0, 0
loop_start_75:
lw x9, 880(x3)
lw x2, 160(x3)

# --- Starting Loop 76 (Depth: 3, break at 5, max 6) ---
addi x4, x0, 6
addi x7, x0, 5
addi x6, x0, 0
loop_start_76:
add x9, x1, x7
sw x9, 12(x3)

# --- Closing Loop 76 (Depth: 3) ---
addi x6, x6, 1
beq x6, x7, loop_exit_76  # Conditional break from loop
blt x6, x4, loop_start_76 # Branch back to loop start
loop_exit_76: # Define loop exit label
# --- Resuming code after Loop 76 ---


# --- Starting Loop 77 (Depth: 3, break at 3, max 10) ---
addi x8, x0, 10
addi x6, x0, 3
addi x2, x0, 0
loop_start_77:
xor x4, x5, x6
lw x4, 96(x3)

# --- Starting Loop 78 (Depth: 4, break at 4, max 9) ---
addi x6, x0, 9
addi x9, x0, 4
addi x5, x0, 0
loop_start_78:

# --- Closing Loop 78 (Depth: 4) ---
addi x5, x5, 1
beq x5, x9, loop_exit_78  # Conditional break from loop
blt x5, x6, loop_start_78 # Branch back to loop start
loop_exit_78: # Define loop exit label
# --- Resuming code after Loop 78 ---

sub x4, x9, x1

# --- Closing Loop 77 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_77  # Conditional break from loop
blt x2, x8, loop_start_77 # Branch back to loop start
loop_exit_77: # Define loop exit label
# --- Resuming code after Loop 77 ---

sw x9, 20(x3)
xor x9, x8, x6
lw x9, 496(x3)
beq x0, x0, skip_taken_47 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_47:
lw x5, 948(x3)
sub x5, x6, x9

# --- Starting Loop 79 (Depth: 3, break at 5, max 7) ---
addi x9, x0, 7
addi x6, x0, 5
addi x2, x0, 0
loop_start_79:
lw x8, 724(x3)
beq x0, x0, skip_taken_48 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_48:
lw x5, 576(x3)
add x7, x1, x4

# --- Closing Loop 79 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_79  # Conditional break from loop
blt x2, x9, loop_start_79 # Branch back to loop start
loop_exit_79: # Define loop exit label
# --- Resuming code after Loop 79 ---


# --- Starting Loop 80 (Depth: 3, break at 1, max 7) ---
addi x2, x0, 7
addi x9, x0, 1
addi x5, x0, 0
loop_start_80:
lw x6, 992(x3)
add x2, x6, x8
sw x2, 372(x3)
sw x5, 416(x3)
lw x2, 804(x3)
sw x7, 800(x3)

# --- Starting Loop 81 (Depth: 4, break at 1, max 5) ---
addi x6, x0, 5
addi x5, x0, 1
addi x1, x0, 0
loop_start_81:
sw x1, 16(x3)
add x7, x1, x5
beq x0, x0, skip_taken_49 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_49:

# --- Closing Loop 81 (Depth: 4) ---
addi x1, x1, 1
beq x1, x5, loop_exit_81  # Conditional break from loop
blt x1, x6, loop_start_81 # Branch back to loop start
loop_exit_81: # Define loop exit label
# --- Resuming code after Loop 81 ---

sw x2, 528(x3)

# --- Starting Loop 82 (Depth: 4, break at 2, max 7) ---
addi x1, x0, 7
addi x6, x0, 2
addi x5, x0, 0
loop_start_82:
lw x8, 536(x3)

# --- Closing Loop 82 (Depth: 4) ---
addi x5, x5, 1
beq x5, x6, loop_exit_82  # Conditional break from loop
blt x5, x1, loop_start_82 # Branch back to loop start
loop_exit_82: # Define loop exit label
# --- Resuming code after Loop 82 ---


# --- Starting Loop 83 (Depth: 4, break at 4, max 10) ---
addi x4, x0, 10
addi x9, x0, 4
addi x5, x0, 0
loop_start_83:
sw x5, 804(x3)
sw x1, 496(x3)
or x7, x4, x9
lw x9, 812(x3)
xor x1, x9, x5
lw x4, 388(x3)
lw x7, 60(x3)
lw x5, 1000(x3)
lw x7, 692(x3)

# --- Closing Loop 83 (Depth: 4) ---
addi x5, x5, 1
beq x5, x9, loop_exit_83  # Conditional break from loop
blt x5, x4, loop_start_83 # Branch back to loop start
loop_exit_83: # Define loop exit label
# --- Resuming code after Loop 83 ---

lw x2, 924(x3)

# --- Starting Loop 84 (Depth: 4, break at 5, max 7) ---
addi x7, x0, 7
addi x5, x0, 5
addi x1, x0, 0
loop_start_84:
sw x8, 220(x3)
sw x7, 72(x3)
or x5, x8, x9
and x1, x7, x9

# --- Starting Loop 85 (Depth: 5, break at 5, max 7) ---
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_85:
lw x7, 660(x3)
sub x5, x9, x6
sw x9, 772(x3)
sll x2, x5, x1
sw x2, 336(x3)
sll x5, x9, x2
and x8, x1, x2
sw x8, 720(x3)
or x1, x7, x2
sll x6, x2, x5
sll x9, x7, x4
lw x1, 232(x3)
lw x2, 864(x3)
srl x7, x2, x5
lw x9, 132(x3)
srl x8, x1, x1
srl x9, x1, x2

# --- Closing Loop 85 (Depth: 5) ---
addi x5, x5, 1
beq x5, x4, loop_exit_85  # Conditional break from loop
blt x5, x6, loop_start_85 # Branch back to loop start
loop_exit_85: # Define loop exit label
# --- Resuming code after Loop 85 ---

xor x8, x9, x2
lw x5, 332(x3)
lw x2, 956(x3)
sub x7, x2, x4
beq x0, x0, skip_taken_50 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_50:

# --- Closing Loop 84 (Depth: 4) ---
addi x1, x1, 1
beq x1, x5, loop_exit_84  # Conditional break from loop
blt x1, x7, loop_start_84 # Branch back to loop start
loop_exit_84: # Define loop exit label
# --- Resuming code after Loop 84 ---


# --- Starting Loop 86 (Depth: 4, break at 1, max 4) ---
addi x5, x0, 4
addi x1, x0, 1
addi x4, x0, 0
loop_start_86:
sw x7, 260(x3)
add x7, x8, x6
sll x6, x1, x1
lw x4, 840(x3)
lw x6, 996(x3)
lw x1, 860(x3)
lw x4, 572(x3)

# --- Closing Loop 86 (Depth: 4) ---
addi x4, x4, 1
beq x4, x1, loop_exit_86  # Conditional break from loop
blt x4, x5, loop_start_86 # Branch back to loop start
loop_exit_86: # Define loop exit label
# --- Resuming code after Loop 86 ---

xor x9, x4, x2
lw x1, 388(x3)

# --- Closing Loop 80 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_exit_80  # Conditional break from loop
blt x5, x2, loop_start_80 # Branch back to loop start
loop_exit_80: # Define loop exit label
# --- Resuming code after Loop 80 ---

or x5, x8, x6

# --- Closing Loop 75 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_exit_75  # Conditional break from loop
blt x5, x8, loop_start_75 # Branch back to loop start
loop_exit_75: # Define loop exit label
# --- Resuming code after Loop 75 ---

srl x1, x9, x8
sw x9, 944(x3)

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 72
addi x1, x1, 1
beq x1, x7, loop_exit_72
blt x1, x9, loop_start_72
loop_exit_72:

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
