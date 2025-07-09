# Initialize memory base register x3
lui x3, 4
addi x3, x3, 0

sw x5, 704(x3)

# --- Starting Loop 1 (Depth: 1, break at 5, max 6) ---
addi x8, x0, 6
addi x9, x0, 5
addi x7, x0, 0
loop_start_1:

# --- Starting Loop 2 (Depth: 2, break at 2, max 3) ---
addi x1, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_2:
sw x11, 740(x3)
lw x11, 252(x3)
lw x10, 484(x3)
sw x9, 540(x3)
beq x0, x0, skip_taken_1 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_1:

# --- Starting Loop 3 (Depth: 3, break at 5, max 8) ---
addi x2, x0, 8
addi x9, x0, 5
addi x7, x0, 0
loop_start_3:
beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:
sw x7, 784(x3)
and x9, x8, x8
beq x0, x0, skip_taken_3 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_3:

# --- Starting Loop 4 (Depth: 4, break at 3, max 10) ---
addi x1, x0, 10
addi x10, x0, 3
addi x5, x0, 0
loop_start_4:
and x2, x10, x1
lw x7, 280(x3)
sw x6, 404(x3)
srl x11, x1, x9
beq x0, x0, skip_taken_4 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_4:

# --- Closing Loop 4 (Depth: 4) ---
addi x5, x5, 1
beq x5, x10, loop_exit_4  # Conditional break from loop
blt x5, x1, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---

bne x0, x0, skip_nottaken_5 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_5:
sw x11, 608(x3)
xor x6, x11, x1
sw x6, 144(x3)
sw x11, 556(x3)
lw x2, 496(x3)
lw x8, 880(x3)
lw x10, 552(x3)

# --- Closing Loop 3 (Depth: 3) ---
addi x7, x7, 1
beq x7, x9, loop_exit_3  # Conditional break from loop
blt x7, x2, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

sw x10, 768(x3)
lw x6, 444(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_exit_2  # Conditional break from loop
blt x2, x1, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

sw x5, 420(x3)
lw x11, 1000(x3)
lw x10, 288(x3)
sw x10, 496(x3)

# --- Closing Loop 1 (Depth: 1) ---
addi x7, x7, 1
beq x7, x9, loop_exit_1  # Conditional break from loop
blt x7, x8, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

lw x2, 620(x3)

# --- Starting Loop 5 (Depth: 1, break at 4, max 7) ---
addi x6, x0, 7
addi x4, x0, 4
addi x9, x0, 0
loop_start_5:
and x8, x2, x6
sll x10, x7, x11

# --- Starting Loop 6 (Depth: 2, break at 2, max 10) ---
addi x4, x0, 10
addi x8, x0, 2
addi x1, x0, 0
loop_start_6:
sw x7, 960(x3)

# --- Starting Loop 7 (Depth: 3, break at 3, max 4) ---
addi x6, x0, 4
addi x10, x0, 3
addi x1, x0, 0
loop_start_7:
bne x0, x0, skip_nottaken_6 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_6:
bne x0, x0, skip_nottaken_7 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_7:

# --- Starting Loop 8 (Depth: 4, break at 5, max 8) ---
addi x7, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_8:
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
beq x5, x4, loop_exit_8  # Conditional break from loop
blt x5, x7, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---

srl x5, x9, x2
sub x11, x5, x1

# --- Closing Loop 7 (Depth: 3) ---
addi x1, x1, 1
beq x1, x10, loop_exit_7  # Conditional break from loop
blt x1, x6, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---

lw x9, 440(x3)
bne x0, x0, skip_nottaken_8 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_8:
sw x6, 148(x3)

# --- Starting Loop 9 (Depth: 3, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_9:
beq x0, x0, skip_taken_9 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_9:

# --- Starting Loop 10 (Depth: 4, break at 4, max 9) ---
addi x8, x0, 9
addi x6, x0, 4
addi x1, x0, 0
loop_start_10:
bne x0, x0, skip_nottaken_10 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_10:
bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:
bne x0, x0, skip_nottaken_12 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_12:
sw x5, 352(x3)

# --- Starting Loop 11 (Depth: 5, break at 1, max 6) ---
addi x7, x0, 6
addi x2, x0, 1
addi x4, x0, 0
loop_start_11:
sw x8, 696(x3)
bne x0, x0, skip_nottaken_13 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_13:
lw x1, 596(x3)
add x11, x10, x9
bne x0, x0, skip_nottaken_14 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_14:
sw x2, 896(x3)
lw x2, 384(x3)
sw x2, 720(x3)
lw x10, 48(x3)
sw x10, 104(x3)
sw x2, 608(x3)

# --- Closing Loop 11 (Depth: 5) ---
addi x4, x4, 1
beq x4, x2, loop_exit_11  # Conditional break from loop
blt x4, x7, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---

sll x9, x4, x6
lw x1, 132(x3)
sll x7, x11, x5
sw x10, 836(x3)

# --- Closing Loop 10 (Depth: 4) ---
addi x1, x1, 1
beq x1, x6, loop_exit_10  # Conditional break from loop
blt x1, x8, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---

lw x7, 740(x3)
bne x0, x0, skip_nottaken_15 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_15:
sw x8, 44(x3)
lw x4, 156(x3)
bne x0, x0, skip_nottaken_16 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_16:

# --- Starting Loop 12 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x7, x0, 5
addi x11, x0, 0
loop_start_12:
and x2, x5, x5
add x6, x9, x8
lw x1, 32(x3)
lw x10, 568(x3)
bne x0, x0, skip_nottaken_17 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_17:
sll x6, x11, x7

# --- Starting Loop 13 (Depth: 5, break at 2, max 5) ---
addi x4, x0, 5
addi x5, x0, 2
addi x2, x0, 0
loop_start_13:

# --- Closing Loop 13 (Depth: 5) ---
addi x2, x2, 1
beq x2, x5, loop_exit_13  # Conditional break from loop
blt x2, x4, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

srl x4, x6, x5
sw x4, 672(x3)
lw x10, 332(x3)
sw x5, 776(x3)
sub x11, x1, x1

# --- Starting Loop 14 (Depth: 5, break at 3, max 10) ---
addi x7, x0, 10
addi x10, x0, 3
addi x2, x0, 0
loop_start_14:
sw x2, 552(x3)
lw x5, 996(x3)

# --- Closing Loop 14 (Depth: 5) ---
addi x2, x2, 1
beq x2, x10, loop_exit_14  # Conditional break from loop
blt x2, x7, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---

and x11, x7, x8
sub x8, x7, x6
beq x0, x0, skip_taken_18 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_18:
beq x0, x0, skip_taken_19 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_19:
lw x7, 568(x3)
sw x7, 764(x3)
sw x1, 36(x3)
lw x1, 712(x3)
sw x11, 836(x3)
beq x0, x0, skip_taken_20 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_20:
sw x9, 620(x3)
sw x10, 600(x3)

# --- Closing Loop 12 (Depth: 4) ---
addi x11, x11, 1
beq x11, x7, loop_exit_12  # Conditional break from loop
blt x11, x8, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

sw x9, 728(x3)
sw x6, 80(x3)
add x1, x8, x9
bne x0, x0, skip_nottaken_21 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_21:

# --- Starting Loop 15 (Depth: 4, break at 1, max 4) ---
addi x2, x0, 4
addi x10, x0, 1
addi x11, x0, 0
loop_start_15:
bne x0, x0, skip_nottaken_22 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_22:
or x2, x4, x1
srl x11, x2, x4
or x10, x6, x5
sw x10, 788(x3)
lw x7, 904(x3)
sll x6, x7, x11
lw x2, 944(x3)
beq x0, x0, skip_taken_23 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_23:
sw x4, 932(x3)
beq x0, x0, skip_taken_24 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_24:
sw x4, 36(x3)
sw x7, 416(x3)
sw x11, 132(x3)
sub x2, x6, x1
lw x1, 140(x3)

# --- Closing Loop 15 (Depth: 4) ---
addi x11, x11, 1
beq x11, x10, loop_exit_15  # Conditional break from loop
blt x11, x2, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---

sw x2, 732(x3)
bne x0, x0, skip_nottaken_25 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_25:
sw x9, 912(x3)

# --- Closing Loop 9 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_exit_9  # Conditional break from loop
blt x2, x5, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---

sub x11, x7, x1
sw x11, 552(x3)
srl x9, x10, x8
beq x0, x0, skip_taken_26 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_26:
sll x6, x9, x7

# --- Closing Loop 6 (Depth: 2) ---
addi x1, x1, 1
beq x1, x8, loop_exit_6  # Conditional break from loop
blt x1, x4, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---

beq x0, x0, skip_taken_27 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_27:
or x11, x4, x5
sw x11, 788(x3)

# --- Closing Loop 5 (Depth: 1) ---
addi x9, x9, 1
beq x9, x4, loop_exit_5  # Conditional break from loop
blt x9, x6, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---

lw x1, 908(x3)
sw x11, 412(x3)
lw x4, 600(x3)

# --- Starting Loop 16 (Depth: 1, break at 1, max 6) ---
addi x1, x0, 6
addi x7, x0, 1
addi x9, x0, 0
loop_start_16:
sw x9, 940(x3)
lw x4, 232(x3)
bne x0, x0, skip_nottaken_28 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_28:
lw x2, 812(x3)
lw x8, 664(x3)
and x4, x2, x5
sw x1, 284(x3)

# --- Starting Loop 17 (Depth: 2, break at 5, max 7) ---
addi x6, x0, 7
addi x11, x0, 5
addi x4, x0, 0
loop_start_17:
srl x7, x4, x1
lw x9, 804(x3)

# --- Closing Loop 17 (Depth: 2) ---
addi x4, x4, 1
beq x4, x11, loop_exit_17  # Conditional break from loop
blt x4, x6, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---

lw x2, 576(x3)

# --- Closing Loop 16 (Depth: 1) ---
addi x9, x9, 1
beq x9, x7, loop_exit_16  # Conditional break from loop
blt x9, x1, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---


# --- Starting Loop 18 (Depth: 1, break at 3, max 7) ---
addi x8, x0, 7
addi x9, x0, 3
addi x10, x0, 0
loop_start_18:
lw x9, 844(x3)
sub x11, x2, x10
lw x6, 660(x3)
sw x6, 536(x3)
or x10, x6, x6
xor x5, x4, x1
or x6, x7, x4
sw x9, 504(x3)

# --- Starting Loop 19 (Depth: 2, break at 5, max 8) ---
addi x4, x0, 8
addi x2, x0, 5
addi x11, x0, 0
loop_start_19:
sub x4, x11, x6
sll x7, x5, x6
sub x5, x10, x6
lw x7, 728(x3)
xor x11, x7, x1

# --- Starting Loop 20 (Depth: 3, break at 3, max 6) ---
addi x6, x0, 6
addi x10, x0, 3
addi x5, x0, 0
loop_start_20:

# --- Starting Loop 21 (Depth: 4, break at 3, max 10) ---
addi x7, x0, 10
addi x10, x0, 3
addi x6, x0, 0
loop_start_21:
sw x5, 596(x3)
sll x4, x9, x5
lw x10, 612(x3)

# --- Closing Loop 21 (Depth: 4) ---
addi x6, x6, 1
beq x6, x10, loop_exit_21  # Conditional break from loop
blt x6, x7, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---


# --- Starting Loop 22 (Depth: 4, break at 4, max 5) ---
addi x1, x0, 5
addi x5, x0, 4
addi x2, x0, 0
loop_start_22:
sw x6, 944(x3)
sw x6, 896(x3)
lw x2, 280(x3)

# --- Closing Loop 22 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_exit_22  # Conditional break from loop
blt x2, x1, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

add x8, x1, x7
sw x1, 524(x3)
and x7, x1, x2
sll x10, x4, x5
xor x1, x11, x6
sw x7, 328(x3)
sll x9, x11, x7
sw x9, 148(x3)
lw x6, 60(x3)
lw x7, 840(x3)

# --- Closing Loop 20 (Depth: 3) ---
addi x5, x5, 1
beq x5, x10, loop_exit_20  # Conditional break from loop
blt x5, x6, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---

xor x2, x7, x5

# --- Starting Loop 23 (Depth: 3, break at 5, max 9) ---
addi x7, x0, 9
addi x11, x0, 5
addi x1, x0, 0
loop_start_23:
sw x11, 404(x3)
beq x0, x0, skip_taken_29 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_29:
or x11, x2, x6

# --- Starting Loop 24 (Depth: 4, break at 3, max 8) ---
addi x1, x0, 8
addi x10, x0, 3
addi x2, x0, 0
loop_start_24:
or x1, x2, x5
bne x0, x0, skip_nottaken_30 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_30:
beq x0, x0, skip_taken_31 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_31:
sw x1, 356(x3)
beq x0, x0, skip_taken_32 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_32:
sw x1, 884(x3)
sw x5, 852(x3)
and x2, x4, x7
beq x0, x0, skip_taken_33 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_33:

# --- Closing Loop 24 (Depth: 4) ---
addi x2, x2, 1
beq x2, x10, loop_exit_24  # Conditional break from loop
blt x2, x1, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---

lw x10, 984(x3)
lw x11, 4(x3)
sw x6, 652(x3)
sw x10, 840(x3)
beq x0, x0, skip_taken_34 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_34:

# --- Starting Loop 25 (Depth: 4, break at 2, max 6) ---
addi x5, x0, 6
addi x2, x0, 2
addi x9, x0, 0
loop_start_25:
add x10, x5, x5
sw x10, 844(x3)
lw x7, 800(x3)
and x11, x7, x10
sw x6, 108(x3)
or x11, x5, x4
sw x11, 640(x3)
sw x9, 796(x3)
lw x7, 212(x3)
beq x0, x0, skip_taken_35 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_35:
lw x1, 468(x3)
bne x0, x0, skip_nottaken_36 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_36:
sll x9, x1, x5

# --- Starting Loop 26 (Depth: 5, break at 2, max 6) ---
addi x5, x0, 6
addi x7, x0, 2
addi x11, x0, 0
loop_start_26:
sub x9, x1, x2
sub x4, x9, x9
sw x4, 244(x3)
add x4, x2, x1
and x9, x6, x11
srl x10, x9, x2
sw x10, 544(x3)
sw x7, 800(x3)
sw x4, 620(x3)
and x10, x5, x8
sw x5, 8(x3)
sw x6, 488(x3)
sub x2, x7, x8
beq x0, x0, skip_taken_37 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_37:

# --- Closing Loop 26 (Depth: 5) ---
addi x11, x11, 1
beq x11, x7, loop_exit_26  # Conditional break from loop
blt x11, x5, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---


# --- Starting Loop 27 (Depth: 5, break at 5, max 9) ---
addi x7, x0, 9
addi x5, x0, 5
addi x8, x0, 0
loop_start_27:
sw x6, 556(x3)
add x6, x5, x11
sw x6, 480(x3)
bne x0, x0, skip_nottaken_38 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_38:
bne x0, x0, skip_nottaken_39 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_39:
beq x0, x0, skip_taken_40 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_40:
or x5, x10, x10
sw x5, 976(x3)
lw x10, 820(x3)
sll x8, x9, x6
or x11, x8, x5
sw x9, 460(x3)
sll x1, x9, x9
add x11, x1, x5
lw x7, 72(x3)
sw x6, 968(x3)
sw x4, 532(x3)
beq x0, x0, skip_taken_41 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_41:
add x2, x10, x1
beq x0, x0, skip_taken_42 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_42:
sub x9, x11, x11
sw x6, 484(x3)
beq x0, x0, skip_taken_43 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_43:

# --- Closing Loop 27 (Depth: 5) ---
addi x8, x8, 1
beq x8, x5, loop_exit_27  # Conditional break from loop
blt x8, x7, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---


# --- Starting Loop 28 (Depth: 5, break at 3, max 4) ---
addi x2, x0, 4
addi x4, x0, 3
addi x5, x0, 0
loop_start_28:
sll x10, x5, x7
sw x5, 84(x3)
beq x0, x0, skip_taken_44 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_44:
and x4, x1, x1
sub x1, x10, x7
beq x0, x0, skip_taken_45 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_45:
sw x1, 132(x3)
lw x2, 604(x3)
lw x10, 796(x3)

# --- Closing Loop 28 (Depth: 5) ---
addi x5, x5, 1
beq x5, x4, loop_exit_28  # Conditional break from loop
blt x5, x2, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---

sw x10, 928(x3)
lw x5, 576(x3)
sw x5, 296(x3)

# --- Closing Loop 25 (Depth: 4) ---
addi x9, x9, 1
beq x9, x2, loop_exit_25  # Conditional break from loop
blt x9, x5, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

xor x7, x2, x11
lw x5, 412(x3)
sw x9, 568(x3)

# --- Closing Loop 23 (Depth: 3) ---
addi x1, x1, 1
beq x1, x11, loop_exit_23  # Conditional break from loop
blt x1, x7, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

and x9, x10, x2

# --- Starting Loop 29 (Depth: 3, break at 3, max 6) ---
addi x10, x0, 6
addi x2, x0, 3
addi x6, x0, 0
loop_start_29:
beq x0, x0, skip_taken_46 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_46:

# --- Starting Loop 30 (Depth: 4, break at 2, max 3) ---
addi x11, x0, 3
addi x4, x0, 2
addi x5, x0, 0
loop_start_30:
lw x6, 956(x3)
sub x8, x2, x9
sw x8, 20(x3)
sw x7, 584(x3)
xor x9, x7, x6
sll x1, x10, x8
or x6, x9, x5

# --- Closing Loop 30 (Depth: 4) ---
addi x5, x5, 1
beq x5, x4, loop_exit_30  # Conditional break from loop
blt x5, x11, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---


# --- Starting Loop 31 (Depth: 4, break at 5, max 10) ---
addi x4, x0, 10
addi x10, x0, 5
addi x7, x0, 0
loop_start_31:
beq x0, x0, skip_taken_47 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_47:
lw x5, 952(x3)
lw x9, 172(x3)
sub x11, x9, x4

# --- Starting Loop 32 (Depth: 5, break at 4, max 5) ---
addi x6, x0, 5
addi x1, x0, 4
addi x8, x0, 0
loop_start_32:
and x5, x2, x1
lw x10, 88(x3)
srl x9, x10, x10
sw x2, 64(x3)
lw x7, 144(x3)
sw x7, 416(x3)
lw x9, 476(x3)
srl x9, x5, x5
sw x4, 624(x3)
lw x7, 772(x3)
bne x0, x0, skip_nottaken_48 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_48:
lw x2, 724(x3)

# --- Closing Loop 32 (Depth: 5) ---
addi x8, x8, 1
beq x8, x1, loop_exit_32  # Conditional break from loop
blt x8, x6, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---

lw x4, 280(x3)
sw x4, 128(x3)

# --- Closing Loop 31 (Depth: 4) ---
addi x7, x7, 1
beq x7, x10, loop_exit_31  # Conditional break from loop
blt x7, x4, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---

sll x11, x8, x1
and x2, x9, x7
sw x2, 156(x3)
bne x0, x0, skip_nottaken_49 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_49:
sw x2, 648(x3)
beq x0, x0, skip_taken_50 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_50:
lw x9, 728(x3)
srl x1, x9, x7

# --- Starting Loop 33 (Depth: 4, break at 2, max 5) ---
addi x6, x0, 5
addi x4, x0, 2
addi x2, x0, 0
loop_start_33:
sw x2, 164(x3)
and x6, x7, x4
bne x0, x0, skip_nottaken_51 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_51:
beq x0, x0, skip_taken_52 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_52:
lw x4, 344(x3)
beq x0, x0, skip_taken_53 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_53:
lw x5, 116(x3)
sll x7, x5, x5
srl x2, x10, x9
bne x0, x0, skip_nottaken_54 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_54:
sw x2, 772(x3)
bne x0, x0, skip_nottaken_55 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_55:
or x5, x8, x1

# --- Starting Loop 34 (Depth: 5, break at 2, max 9) ---
addi x1, x0, 9
addi x2, x0, 2
addi x11, x0, 0
loop_start_34:
or x9, x1, x2
lw x6, 776(x3)
beq x0, x0, skip_taken_56 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_56:
sll x2, x6, x6
bne x0, x0, skip_nottaken_57 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_57:

# --- Closing Loop 34 (Depth: 5) ---
addi x11, x11, 1
beq x11, x2, loop_exit_34  # Conditional break from loop
blt x11, x1, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---

beq x0, x0, skip_taken_58 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_58:
sw x2, 424(x3)
lw x1, 164(x3)

# --- Starting Loop 35 (Depth: 5, break at 4, max 9) ---
addi x7, x0, 9
addi x10, x0, 4
addi x8, x0, 0
loop_start_35:
sw x8, 596(x3)
beq x0, x0, skip_taken_59 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_59:
xor x8, x2, x10
lw x9, 252(x3)
xor x6, x9, x8
sw x1, 196(x3)
sll x10, x5, x1
or x7, x8, x5
sub x1, x10, x4
srl x10, x7, x4
sw x10, 792(x3)
sw x1, 780(x3)
bne x0, x0, skip_nottaken_60 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_60:
beq x0, x0, skip_taken_61 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_61:
beq x0, x0, skip_taken_62 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_62:
bne x0, x0, skip_nottaken_63 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_63:
srl x11, x4, x10
sw x10, 64(x3)
xor x5, x6, x2
sw x4, 212(x3)
lw x9, 324(x3)
xor x2, x8, x4
sw x6, 624(x3)
bne x0, x0, skip_nottaken_64 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_64:
lw x1, 992(x3)
beq x0, x0, skip_taken_65 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_65:
sw x4, 568(x3)
lw x5, 0(x3)

# --- Starting Loop 36 (Depth: 6, break at 3, max 10) ---
addi x1, x0, 10
addi x11, x0, 3
addi x8, x0, 0
loop_start_36:
lw x10, 84(x3)
sub x4, x9, x9

# --- Closing Loop 36 (Depth: 6) ---
addi x8, x8, 1
beq x8, x11, loop_exit_36  # Conditional break from loop
blt x8, x1, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

lw x6, 676(x3)
xor x7, x6, x9
sll x1, x4, x11

# --- Closing Loop 35 (Depth: 5) ---
addi x8, x8, 1
beq x8, x10, loop_exit_35  # Conditional break from loop
blt x8, x7, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---

lw x6, 948(x3)
bne x0, x0, skip_nottaken_66 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_66:
lw x2, 40(x3)

# --- Closing Loop 33 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_exit_33  # Conditional break from loop
blt x2, x6, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---


# --- Starting Loop 37 (Depth: 4, break at 4, max 7) ---
addi x8, x0, 7
addi x1, x0, 4
addi x5, x0, 0
loop_start_37:

# --- Starting Loop 38 (Depth: 5, break at 3, max 4) ---
addi x10, x0, 4
addi x9, x0, 3
addi x11, x0, 0
loop_start_38:
beq x0, x0, skip_taken_67 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_67:
sw x11, 388(x3)
or x11, x10, x8

# --- Starting Loop 39 (Depth: 6, break at 1, max 9) ---
addi x6, x0, 9
addi x10, x0, 1
addi x7, x0, 0
loop_start_39:
sw x4, 188(x3)
sw x1, 916(x3)
sw x1, 428(x3)
sw x5, 144(x3)
add x6, x2, x1
bne x0, x0, skip_nottaken_68 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_68:
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
beq x0, x0, skip_taken_69 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_69:
lw x11, 696(x3)

# --- Closing Loop 39 (Depth: 6) ---
addi x7, x7, 1
beq x7, x10, loop_exit_39  # Conditional break from loop
blt x7, x6, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---

add x4, x6, x10
sw x4, 208(x3)
and x1, x11, x6
lw x1, 764(x3)
xor x6, x9, x5
lw x2, 524(x3)
and x2, x2, x6
or x5, x7, x8
sw x9, 908(x3)
or x10, x1, x5
sw x10, 628(x3)
sw x10, 212(x3)
sw x1, 196(x3)
lw x1, 264(x3)
xor x6, x11, x9

# --- Closing Loop 38 (Depth: 5) ---
addi x11, x11, 1
beq x11, x9, loop_exit_38  # Conditional break from loop
blt x11, x10, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---

sw x7, 808(x3)
sw x11, 800(x3)
beq x0, x0, skip_taken_70 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_70:
sw x7, 484(x3)
sw x2, 996(x3)
bne x0, x0, skip_nottaken_71 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_71:
bne x0, x0, skip_nottaken_72 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_72:
lw x9, 256(x3)
lw x11, 504(x3)
lw x6, 792(x3)

# --- Closing Loop 37 (Depth: 4) ---
addi x5, x5, 1
beq x5, x1, loop_exit_37  # Conditional break from loop
blt x5, x8, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

sw x10, 280(x3)
sw x11, 748(x3)
lw x7, 428(x3)

# --- Starting Loop 40 (Depth: 4, break at 4, max 5) ---
addi x2, x0, 5
addi x9, x0, 4
addi x5, x0, 0
loop_start_40:

# --- Starting Loop 41 (Depth: 5, break at 2, max 5) ---
addi x4, x0, 5
addi x10, x0, 2
addi x2, x0, 0
loop_start_41:
sub x8, x5, x11
lw x1, 120(x3)

# --- Closing Loop 41 (Depth: 5) ---
addi x2, x2, 1
beq x2, x10, loop_exit_41  # Conditional break from loop
blt x2, x4, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---


# --- Closing Loop 40 (Depth: 4) ---
addi x5, x5, 1
beq x5, x9, loop_exit_40  # Conditional break from loop
blt x5, x2, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---


# --- Starting Loop 42 (Depth: 4, break at 3, max 6) ---
addi x8, x0, 6
addi x4, x0, 3
addi x2, x0, 0
loop_start_42:
sll x8, x7, x1
sw x8, 376(x3)

# --- Closing Loop 42 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_exit_42  # Conditional break from loop
blt x2, x8, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---

sw x5, 596(x3)
xor x10, x8, x11
xor x10, x9, x6

# --- Starting Loop 43 (Depth: 4, break at 2, max 8) ---
addi x11, x0, 8
addi x4, x0, 2
addi x6, x0, 0
loop_start_43:
lw x9, 512(x3)
srl x5, x10, x6
beq x0, x0, skip_taken_73 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_73:
sw x5, 380(x3)
sw x7, 308(x3)

# --- Starting Loop 44 (Depth: 5, break at 2, max 3) ---
addi x8, x0, 3
addi x10, x0, 2
addi x2, x0, 0
loop_start_44:

# --- Closing Loop 44 (Depth: 5) ---
addi x2, x2, 1
beq x2, x10, loop_exit_44  # Conditional break from loop
blt x2, x8, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---

sw x8, 832(x3)

# --- Closing Loop 43 (Depth: 4) ---
addi x6, x6, 1
beq x6, x4, loop_exit_43  # Conditional break from loop
blt x6, x11, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---

beq x0, x0, skip_taken_74 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_74:
sub x9, x1, x1
or x7, x6, x4
sw x2, 464(x3)
lw x5, 968(x3)
sw x1, 112(x3)
beq x0, x0, skip_taken_75 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_75:
sll x2, x10, x5
or x10, x4, x1
lw x7, 292(x3)
sub x1, x6, x6

# --- Starting Loop 45 (Depth: 4, break at 2, max 7) ---
addi x2, x0, 7
addi x10, x0, 2
addi x7, x0, 0
loop_start_45:
sw x2, 780(x3)
sw x9, 912(x3)
sw x6, 492(x3)
bne x0, x0, skip_nottaken_76 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_76:
beq x0, x0, skip_taken_77 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_77:
bne x0, x0, skip_nottaken_78 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_78:
sll x9, x5, x7
sw x10, 964(x3)
sll x10, x1, x1
and x9, x4, x2
and x6, x10, x2

# --- Starting Loop 46 (Depth: 5, break at 2, max 9) ---
addi x8, x0, 9
addi x11, x0, 2
addi x5, x0, 0
loop_start_46:
srl x7, x10, x8
sub x5, x11, x10
lw x8, 544(x3)
beq x0, x0, skip_taken_79 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_79:
or x5, x8, x10

# --- Closing Loop 46 (Depth: 5) ---
addi x5, x5, 1
beq x5, x11, loop_exit_46  # Conditional break from loop
blt x5, x8, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

lw x7, 260(x3)
lw x2, 820(x3)
sw x1, 128(x3)
lw x8, 324(x3)
sw x1, 628(x3)
bne x0, x0, skip_nottaken_80 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_80:

# --- Closing Loop 45 (Depth: 4) ---
addi x7, x7, 1
beq x7, x10, loop_exit_45  # Conditional break from loop
blt x7, x2, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---

beq x0, x0, skip_taken_81 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_81:
bne x0, x0, skip_nottaken_82 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_82:
xor x1, x8, x9
sw x1, 660(x3)
sw x2, 824(x3)
sw x5, 660(x3)
sll x11, x1, x5
lw x6, 516(x3)
add x4, x6, x5

# --- Starting Loop 47 (Depth: 4, break at 2, max 3) ---
addi x5, x0, 3
addi x1, x0, 2
addi x6, x0, 0
loop_start_47:
bne x0, x0, skip_nottaken_83 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_83:
add x9, x6, x1
or x8, x11, x5
sw x8, 716(x3)
lw x6, 204(x3)
lw x11, 412(x3)
sw x4, 956(x3)
sw x10, 4(x3)
beq x0, x0, skip_taken_84 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_84:

# --- Starting Loop 48 (Depth: 5, break at 3, max 9) ---
addi x4, x0, 9
addi x7, x0, 3
addi x2, x0, 0
loop_start_48:
beq x0, x0, skip_taken_85 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_85:
sw x11, 300(x3)
beq x0, x0, skip_taken_86 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_86:
sw x7, 948(x3)
xor x5, x11, x1
sw x1, 712(x3)
lw x7, 760(x3)
and x11, x6, x4
lw x7, 884(x3)

# --- Starting Loop 49 (Depth: 6, break at 3, max 4) ---
addi x5, x0, 4
addi x6, x0, 3
addi x9, x0, 0
loop_start_49:
sw x2, 680(x3)
sw x6, 832(x3)
beq x0, x0, skip_taken_87 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_87:

# --- Closing Loop 49 (Depth: 6) ---
addi x9, x9, 1
beq x9, x6, loop_exit_49  # Conditional break from loop
blt x9, x5, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---

lw x1, 528(x3)
bne x0, x0, skip_nottaken_88 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_88:
sub x7, x1, x11
sw x7, 268(x3)
sw x7, 332(x3)
sw x7, 320(x3)
sw x9, 172(x3)
xor x10, x6, x8
sub x4, x10, x8
lw x6, 112(x3)
beq x0, x0, skip_taken_89 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_89:
sub x5, x1, x4
sw x4, 656(x3)
sub x8, x10, x1
xor x11, x8, x4
sw x11, 380(x3)
srl x8, x7, x7

# --- Closing Loop 48 (Depth: 5) ---
addi x2, x2, 1
beq x2, x7, loop_exit_48  # Conditional break from loop
blt x2, x4, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---

sw x5, 32(x3)

# --- Starting Loop 50 (Depth: 5, break at 3, max 7) ---
addi x9, x0, 7
addi x8, x0, 3
addi x5, x0, 0
loop_start_50:
lw x11, 708(x3)
sw x11, 652(x3)
lw x7, 716(x3)
add x11, x7, x6
sll x9, x8, x5
beq x0, x0, skip_taken_90 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_90:
lw x8, 44(x3)
lw x8, 868(x3)
beq x0, x0, skip_taken_91 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_91:
lw x1, 824(x3)
lw x5, 820(x3)
sw x9, 972(x3)
add x2, x5, x9
lw x9, 920(x3)
or x2, x9, x10

# --- Starting Loop 51 (Depth: 6, break at 2, max 3) ---
addi x8, x0, 3
addi x1, x0, 2
addi x11, x0, 0
loop_start_51:
xor x10, x8, x5
or x6, x8, x7
sw x6, 12(x3)
sw x5, 376(x3)

# --- Closing Loop 51 (Depth: 6) ---
addi x11, x11, 1
beq x11, x1, loop_exit_51  # Conditional break from loop
blt x11, x8, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---

lw x8, 588(x3)

# --- Closing Loop 50 (Depth: 5) ---
addi x5, x5, 1
beq x5, x8, loop_exit_50  # Conditional break from loop
blt x5, x9, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

beq x0, x0, skip_taken_92 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_92:
sw x8, 432(x3)
sw x2, 212(x3)
sw x11, 704(x3)

# --- Closing Loop 47 (Depth: 4) ---
addi x6, x6, 1
beq x6, x1, loop_exit_47  # Conditional break from loop
blt x6, x5, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---


# --- Starting Loop 52 (Depth: 4, break at 5, max 10) ---
addi x5, x0, 10
addi x6, x0, 5
addi x2, x0, 0
loop_start_52:
lw x6, 36(x3)

# --- Closing Loop 52 (Depth: 4) ---
addi x2, x2, 1
beq x2, x6, loop_exit_52  # Conditional break from loop
blt x2, x5, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---

sw x1, 156(x3)
sub x9, x8, x7
bne x0, x0, skip_nottaken_93 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_93:
xor x1, x9, x6
bne x0, x0, skip_nottaken_94 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_94:
lw x11, 408(x3)
xor x7, x5, x4
and x1, x7, x10
sw x1, 856(x3)
sw x7, 636(x3)
and x11, x5, x9
xor x8, x10, x9

# --- Starting Loop 53 (Depth: 4, break at 4, max 7) ---
addi x5, x0, 7
addi x1, x0, 4
addi x2, x0, 0
loop_start_53:
sw x2, 544(x3)
lw x10, 592(x3)

# --- Closing Loop 53 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_exit_53  # Conditional break from loop
blt x2, x5, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---


# --- Closing Loop 29 (Depth: 3) ---
addi x6, x6, 1
beq x6, x2, loop_exit_29  # Conditional break from loop
blt x6, x10, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---

and x2, x6, x6
lw x9, 852(x3)

# --- Closing Loop 19 (Depth: 2) ---
addi x11, x11, 1
beq x11, x2, loop_exit_19  # Conditional break from loop
blt x11, x4, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---

lw x1, 604(x3)

# --- Starting Loop 54 (Depth: 2, break at 4, max 10) ---
addi x4, x0, 10
addi x6, x0, 4
addi x8, x0, 0
loop_start_54:
sw x1, 512(x3)
lw x5, 180(x3)

# --- Starting Loop 55 (Depth: 3, break at 4, max 8) ---
addi x7, x0, 8
addi x2, x0, 4
addi x6, x0, 0
loop_start_55:
xor x4, x7, x8
xor x11, x2, x5
sub x4, x5, x7
sub x7, x4, x10
bne x0, x0, skip_nottaken_95 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_95:

# --- Closing Loop 55 (Depth: 3) ---
addi x6, x6, 1
beq x6, x2, loop_exit_55  # Conditional break from loop
blt x6, x7, loop_start_55 # Branch back to loop start
loop_exit_55: # Define loop exit label
# --- Resuming code after Loop 55 ---

and x8, x7, x1
bne x0, x0, skip_nottaken_96 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_96:
sw x8, 412(x3)
sub x1, x8, x8
add x7, x8, x5
sll x1, x5, x4
add x6, x7, x2

# --- Starting Loop 56 (Depth: 3, break at 3, max 4) ---
addi x4, x0, 4
addi x8, x0, 3
addi x7, x0, 0
loop_start_56:

# --- Starting Loop 57 (Depth: 4, break at 1, max 3) ---
addi x1, x0, 3
addi x10, x0, 1
addi x6, x0, 0
loop_start_57:
beq x0, x0, skip_taken_97 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_97:
sub x11, x9, x8
xor x1, x10, x6
sw x11, 532(x3)
lw x1, 168(x3)

# --- Starting Loop 58 (Depth: 5, break at 1, max 5) ---
addi x10, x0, 5
addi x5, x0, 1
addi x11, x0, 0
loop_start_58:
lw x5, 500(x3)
lw x6, 448(x3)
sw x6, 504(x3)
lw x5, 720(x3)
sw x8, 928(x3)
sw x11, 948(x3)

# --- Closing Loop 58 (Depth: 5) ---
addi x11, x11, 1
beq x11, x5, loop_exit_58  # Conditional break from loop
blt x11, x10, loop_start_58 # Branch back to loop start
loop_exit_58: # Define loop exit label
# --- Resuming code after Loop 58 ---


# --- Closing Loop 57 (Depth: 4) ---
addi x6, x6, 1
beq x6, x10, loop_exit_57  # Conditional break from loop
blt x6, x1, loop_start_57 # Branch back to loop start
loop_exit_57: # Define loop exit label
# --- Resuming code after Loop 57 ---

lw x7, 556(x3)

# --- Closing Loop 56 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_exit_56  # Conditional break from loop
blt x7, x4, loop_start_56 # Branch back to loop start
loop_exit_56: # Define loop exit label
# --- Resuming code after Loop 56 ---

bne x0, x0, skip_nottaken_98 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_98:
lw x4, 556(x3)

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 54
addi x8, x8, 1
beq x8, x6, loop_exit_54
blt x8, x4, loop_start_54
loop_exit_54:

# Closing remaining Loop 18
addi x10, x10, 1
beq x10, x9, loop_exit_18
blt x10, x8, loop_start_18
loop_exit_18:

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
