lui x3, 1
addi x3, x3, 0
# LOOP 1 (depth 1, break at 5, max 8)
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_1:
lw x4, 992(x3)
# LOOP 2 (depth 2, break at 4, max 9)
addi x5, x0, 9
addi x2, x0, 4
addi x1, x0, 0
loop_start_2:
# LOOP 3 (depth 3, break at 5, max 8)
addi x7, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_3:
lw x1, 892(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 4 (depth 4, break at 5, max 7)
addi x5, x0, 7
addi x4, x0, 5
addi x7, x0, 0
loop_start_4:
srl x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_4  # Exit loop 4
j loop_exit_3  # Exit loop 3
sw x1, 692(x3)
lw x7, 140(x3)
sw x6, 456(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_2  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x4, x4, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_1  # Exit loop 1
sw x4, 324(x3)
# LOOP 5 (depth 1, break at 3, max 9)
addi x2, x0, 9
addi x1, x0, 3
addi x6, x0, 0
loop_start_5:
srl x2, x4, x2
xor x1, x4, x1
sw x5, 652(x3)
j loop_exit_5  # Exit loop 1
# LOOP 6 (depth 1, break at 1, max 5)
addi x7, x0, 5
addi x4, x0, 1
addi x2, x0, 0
loop_start_6:
sll x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_6  # Exit loop 1
# LOOP 7 (depth 1, break at 3, max 9)
addi x5, x0, 9
addi x7, x0, 3
addi x1, x0, 0
loop_start_7:
lw x1, 476(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 496(x3)
# LOOP 8 (depth 2, break at 3, max 8)
addi x7, x0, 8
addi x1, x0, 3
addi x6, x0, 0
loop_start_8:
lw x2, 480(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x1, x5, x1
lw x7, 520(x3)
j loop_exit_8  # Exit loop 2
# LOOP 9 (depth 2, break at 5, max 7)
addi x6, x0, 7
addi x5, x0, 5
addi x2, x0, 0
loop_start_9:
srl x6, x2, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_9  # Exit loop 2
sw x4, 292(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 10 (depth 2, break at 3, max 9)
addi x1, x0, 9
addi x2, x0, 3
addi x4, x0, 0
loop_start_10:
and x5, x2, x5
lw x2, 336(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x7, x7, x7
sw x5, 628(x3)
sw x5, 684(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 44(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x5, x4, x5
srl x2, x2, x2
srl x1, x6, x1
j loop_exit_10  # Exit loop 2
or x7, x1, x7
srl x5, x2, x5
and x7, x1, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_7  # Exit loop 1
sw x6, 520(x3)
or x1, x2, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 11 (depth 1, break at 2, max 5)
addi x6, x0, 5
addi x4, x0, 2
addi x2, x0, 0
loop_start_11:
# LOOP 12 (depth 2, break at 2, max 3)
addi x5, x0, 3
addi x7, x0, 2
addi x4, x0, 0
loop_start_12:
add x2, x4, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_12  # Exit loop 2
# LOOP 13 (depth 2, break at 3, max 5)
addi x4, x0, 5
addi x5, x0, 3
addi x7, x0, 0
loop_start_13:
or x2, x7, x2
j loop_exit_13  # Exit loop 2
srl x4, x5, x4
# LOOP 14 (depth 2, break at 1, max 8)
addi x7, x0, 8
addi x5, x0, 1
addi x1, x0, 0
loop_start_14:
lw x7, 628(x3)
j loop_exit_14  # Exit loop 2
sll x1, x4, x1
j loop_exit_11  # Exit loop 1
lw x1, 204(x3)
lw x6, 492(x3)
# LOOP 15 (depth 1, break at 3, max 5)
addi x7, x0, 5
addi x2, x0, 3
addi x4, x0, 0
loop_start_15:
sll x7, x1, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 924(x3)
lw x6, 104(x3)
j loop_exit_15  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 16 (depth 1, break at 4, max 10)
addi x7, x0, 10
addi x2, x0, 4
addi x5, x0, 0
loop_start_16:
add x4, x1, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 312(x3)
# LOOP 17 (depth 2, break at 1, max 5)
addi x2, x0, 5
addi x1, x0, 1
addi x6, x0, 0
loop_start_17:
# LOOP 18 (depth 3, break at 3, max 10)
addi x5, x0, 10
addi x4, x0, 3
addi x7, x0, 0
loop_start_18:
j loop_exit_18  # Exit loop 3
lw x7, 428(x3)
j loop_exit_17  # Exit loop 2
# LOOP 19 (depth 2, break at 5, max 7)
addi x2, x0, 7
addi x5, x0, 5
addi x6, x0, 0
loop_start_19:
sw x6, 696(x3)
lw x7, 656(x3)
lw x2, 356(x3)
# LOOP 20 (depth 3, break at 1, max 4)
addi x5, x0, 4
addi x6, x0, 1
addi x1, x0, 0
loop_start_20:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 28(x3)
srl x7, x2, x7
lw x2, 108(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x4, x1, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 888(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x6, x2, x6
j loop_exit_20  # Exit loop 3
j loop_exit_19  # Exit loop 2
# LOOP 21 (depth 2, break at 2, max 9)
addi x7, x0, 9
addi x2, x0, 2
addi x1, x0, 0
loop_start_21:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 588(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 36(x3)
lw x2, 456(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 236(x3)
j loop_exit_21  # Exit loop 2
lw x6, 504(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 22 (depth 2, break at 2, max 10)
addi x1, x0, 10
addi x4, x0, 2
addi x2, x0, 0
loop_start_22:
srl x6, x4, x6
j loop_exit_22  # Exit loop 2
# LOOP 23 (depth 2, break at 5, max 6)
addi x2, x0, 6
addi x5, x0, 5
addi x1, x0, 0
loop_start_23:
j loop_exit_23  # Exit loop 2
or x1, x1, x1
sub x4, x1, x4
sll x7, x6, x7
# LOOP 24 (depth 2, break at 4, max 10)
addi x1, x0, 10
addi x2, x0, 4
addi x4, x0, 0
loop_start_24:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 616(x3)
lw x2, 724(x3)
# LOOP 25 (depth 3, break at 2, max 9)
addi x7, x0, 9
addi x5, x0, 2
addi x4, x0, 0
loop_start_25:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_25  # Exit loop 3
sw x5, 260(x3)
sll x5, x6, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x6, x6, x6
# LOOP 26 (depth 3, break at 1, max 2)
addi x1, x0, 2
addi x7, x0, 1
addi x2, x0, 0
loop_start_26:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 27 (depth 4, break at 3, max 7)
addi x4, x0, 7
addi x6, x0, 3
addi x7, x0, 0
loop_start_27:
sw x1, 136(x3)
lw x5, 148(x3)
lw x7, 776(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x6, x2
sw x4, 428(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x5, x7, x5
sw x4, 560(x3)
xor x4, x4, x4
sub x5, x6, x5
j loop_exit_27  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x5, x5, x5
# LOOP 28 (depth 4, break at 2, max 3)
addi x6, x0, 3
addi x4, x0, 2
addi x2, x0, 0
loop_start_28:
sw x2, 504(x3)
lw x7, 224(x3)
sw x6, 360(x3)
lw x2, 672(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x1, x4, x1
sub x2, x1, x2
sll x1, x7, x1
sw x4, 764(x3)
and x5, x6, x5
sll x7, x7, x7
sll x4, x7, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 104(x3)
j loop_exit_28  # Exit loop 4
lw x2, 876(x3)
lw x1, 996(x3)
j loop_exit_26  # Exit loop 3
lw x4, 560(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 29 (depth 3, break at 5, max 6)
addi x6, x0, 6
addi x2, x0, 5
addi x5, x0, 0
loop_start_29:
lw x2, 292(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x1, x2, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 30 (depth 4, break at 4, max 10)
addi x5, x0, 10
addi x4, x0, 4
addi x6, x0, 0
loop_start_30:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 448(x3)
j loop_exit_30  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x5, x2, x5
j loop_exit_29  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 836(x3)
sw x7, 316(x3)
sw x7, 140(x3)
j loop_exit_24  # Exit loop 2
xor x1, x2, x1
j loop_exit_16  # Exit loop 1
# LOOP 31 (depth 1, break at 5, max 6)
addi x4, x0, 6
addi x2, x0, 5
addi x7, x0, 0
loop_start_31:
sw x5, 600(x3)
lw x1, 260(x3)
j loop_exit_31  # Exit loop 1
# LOOP 32 (depth 1, break at 2, max 7)
addi x6, x0, 7
addi x4, x0, 2
addi x5, x0, 0
loop_start_32:
# LOOP 33 (depth 2, break at 1, max 4)
addi x4, x0, 4
addi x6, x0, 1
addi x7, x0, 0
loop_start_33:
lw x4, 720(x3)
sll x6, x5, x6
sw x1, 224(x3)
srl x7, x5, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 588(x3)
or x6, x4, x6
j loop_exit_33  # Exit loop 2
# LOOP 34 (depth 2, break at 4, max 6)
addi x7, x0, 6
addi x4, x0, 4
addi x2, x0, 0
loop_start_34:
# LOOP 35 (depth 3, break at 5, max 9)
addi x7, x0, 9
addi x6, x0, 5
addi x1, x0, 0
loop_start_35:
sll x5, x4, x5
sw x7, 168(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_35  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x7, x4, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 360(x3)
j loop_exit_34  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 560(x3)
and x7, x1, x7
and x4, x7, x4
add x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 36 (depth 2, break at 3, max 4)
addi x1, x0, 4
addi x5, x0, 3
addi x7, x0, 0
loop_start_36:
and x5, x6, x5
j loop_exit_36  # Exit loop 2
# LOOP 37 (depth 2, break at 3, max 7)
addi x2, x0, 7
addi x7, x0, 3
addi x4, x0, 0
loop_start_37:
and x7, x2, x7
srl x1, x7, x1
sub x4, x4, x4
j loop_exit_37  # Exit loop 2
# LOOP 38 (depth 2, break at 1, max 8)
addi x6, x0, 8
addi x5, x0, 1
addi x7, x0, 0
loop_start_38:
sw x7, 804(x3)
# LOOP 39 (depth 3, break at 3, max 7)
addi x2, x0, 7
addi x4, x0, 3
addi x5, x0, 0
loop_start_39:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_39  # Exit loop 3
sw x7, 412(x3)
# LOOP 40 (depth 3, break at 4, max 7)
addi x4, x0, 7
addi x2, x0, 4
addi x6, x0, 0
loop_start_40:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_40  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 41 (depth 3, break at 2, max 8)
addi x7, x0, 8
addi x1, x0, 2
addi x5, x0, 0
loop_start_41:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x6, x1, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x1, x4, x1
or x4, x6, x4
lw x6, 444(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 776(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x5, x2
and x5, x1, x5
and x4, x2, x4
j loop_exit_41  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x7, x5, x7
sll x5, x4, x5
sll x1, x1, x1
j loop_exit_38  # Exit loop 2
lw x6, 412(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_32  # Exit loop 1
or x1, x6, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x4, x5, x4
# LOOP 42 (depth 1, break at 5, max 9)
addi x7, x0, 9
addi x6, x0, 5
addi x2, x0, 0
loop_start_42:
# LOOP 43 (depth 2, break at 5, max 8)
addi x6, x0, 8
addi x4, x0, 5
addi x1, x0, 0
loop_start_43:
# LOOP 44 (depth 3, break at 3, max 6)
addi x5, x0, 6
addi x2, x0, 3
addi x4, x0, 0
loop_start_44:
lw x5, 780(x3)
j loop_exit_44  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x5, x2
or x1, x4, x1
lw x5, 176(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_43  # Exit loop 2
# LOOP 45 (depth 2, break at 1, max 9)
addi x1, x0, 9
addi x2, x0, 1
addi x6, x0, 0
loop_start_45:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x7, x2, x7
xor x5, x1, x5
sub x5, x5, x5
# LOOP 46 (depth 3, break at 1, max 2)
addi x4, x0, 2
addi x6, x0, 1
addi x2, x0, 0
loop_start_46:
j loop_exit_46  # Exit loop 3
j loop_exit_45  # Exit loop 2
sw x5, 748(x3)
or x1, x4, x1
or x7, x1, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_42  # Exit loop 1
or x6, x4, x6
and x4, x2, x4
# LOOP 47 (depth 1, break at 1, max 6)
addi x6, x0, 6
addi x2, x0, 1
addi x1, x0, 0
loop_start_47:
srl x7, x1, x7
# LOOP 48 (depth 2, break at 1, max 7)
addi x1, x0, 7
addi x5, x0, 1
addi x6, x0, 0
loop_start_48:
# LOOP 49 (depth 3, break at 1, max 3)
addi x7, x0, 3
addi x4, x0, 1
addi x2, x0, 0
loop_start_49:
j loop_exit_49  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 50 (depth 3, break at 2, max 4)
addi x1, x0, 4
addi x5, x0, 2
addi x7, x0, 0
loop_start_50:
sll x1, x2, x1
sw x1, 852(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 208(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x2, x2, x2
j loop_exit_50  # Exit loop 3
j loop_exit_48  # Exit loop 2
# LOOP 51 (depth 2, break at 3, max 9)
addi x7, x0, 9
addi x5, x0, 3
addi x4, x0, 0
loop_start_51:
j loop_exit_51  # Exit loop 2
sw x5, 412(x3)
# LOOP 52 (depth 2, break at 1, max 3)
addi x1, x0, 3
addi x7, x0, 1
addi x5, x0, 0
loop_start_52:
j loop_exit_52  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_47  # Exit loop 1
# LOOP 53 (depth 1, break at 3, max 4)
addi x2, x0, 4
addi x7, x0, 3
addi x4, x0, 0
loop_start_53:
lw x5, 296(x3)
# LOOP 54 (depth 2, break at 2, max 10)
addi x4, x0, 10
addi x6, x0, 2
addi x1, x0, 0
loop_start_54:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x6, x1, x6
# LOOP 55 (depth 3, break at 3, max 8)
addi x4, x0, 8
addi x7, x0, 3
addi x2, x0, 0
loop_start_55:
sw x5, 752(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x6, x5, x6
j loop_exit_55  # Exit loop 3
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_54  # Exit loop 2
# LOOP 56 (depth 2, break at 2, max 3)
addi x2, x0, 3
addi x7, x0, 2
addi x5, x0, 0
loop_start_56:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x1, x2, x1
add x7, x7, x7
lw x7, 984(x3)
and x1, x2, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x5, x1, x5
sw x7, 868(x3)
lw x1, 76(x3)
j loop_exit_56  # Exit loop 2
j loop_exit_53  # Exit loop 1
sw x1, 656(x3)
sub x7, x4, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 57 (depth 1, break at 1, max 8)
addi x1, x0, 8
addi x4, x0, 1
addi x2, x0, 0
loop_start_57:
sw x5, 32(x3)
sll x5, x6, x5
# LOOP 58 (depth 2, break at 4, max 5)
addi x4, x0, 5
addi x2, x0, 4
addi x7, x0, 0
loop_start_58:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 59 (depth 3, break at 3, max 5)
addi x2, x0, 5
addi x4, x0, 3
addi x1, x0, 0
loop_start_59:
# LOOP 60 (depth 4, break at 2, max 4)
addi x2, x0, 4
addi x7, x0, 2
addi x5, x0, 0
loop_start_60:
j loop_exit_60  # Exit loop 4
# LOOP 61 (depth 4, break at 3, max 7)
addi x1, x0, 7
addi x4, x0, 3
addi x7, x0, 0
loop_start_61:
sw x4, 816(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x6, x5, x6
srl x1, x2, x1
sw x1, 952(x3)
sw x5, 676(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_61  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_59  # Exit loop 3
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 332(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 56(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_58  # Exit loop 2
and x4, x1, x4
add x2, x7, x2
j loop_exit_57  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 62 (depth 1, break at 3, max 10)
addi x5, x0, 10
addi x1, x0, 3
addi x6, x0, 0
loop_start_62:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 63 (depth 2, break at 2, max 9)
addi x2, x0, 9
addi x5, x0, 2
addi x1, x0, 0
loop_start_63:
# LOOP 64 (depth 3, break at 2, max 3)
addi x2, x0, 3
addi x6, x0, 2
addi x4, x0, 0
loop_start_64:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x1, x5, x1
srl x4, x1, x4
lw x2, 444(x3)
lw x2, 528(x3)
sw x2, 672(x3)
or x4, x7, x4
sll x1, x4, x1
j loop_exit_64  # Exit loop 3
j loop_exit_63  # Exit loop 2
and x4, x7, x4
lw x4, 300(x3)
or x4, x4, x4
sw x4, 532(x3)
sw x5, 708(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_62  # Exit loop 1
sw x2, 548(x3)
sw x7, 504(x3)
# LOOP 65 (depth 1, break at 1, max 5)
addi x6, x0, 5
addi x2, x0, 1
addi x7, x0, 0
loop_start_65:
# LOOP 66 (depth 2, break at 1, max 2)
addi x4, x0, 2
addi x5, x0, 1
addi x2, x0, 0
loop_start_66:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x1, x4
# LOOP 67 (depth 3, break at 3, max 7)
addi x1, x0, 7
addi x7, x0, 3
addi x2, x0, 0
loop_start_67:
sll x2, x2, x2
j loop_exit_67  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x4, x2, x4
j loop_exit_66  # Exit loop 2
sub x5, x7, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x7, x6, x7
lw x5, 540(x3)
sw x2, 712(x3)
j loop_exit_65  # Exit loop 1
# LOOP 68 (depth 1, break at 5, max 6)
addi x4, x0, 6
addi x7, x0, 5
addi x2, x0, 0
loop_start_68:
sw x5, 136(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 252(x3)
j loop_exit_68  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 284(x3)
sll x7, x5, x7
# LOOP 69 (depth 1, break at 3, max 6)
addi x6, x0, 6
addi x5, x0, 3
addi x2, x0, 0
loop_start_69:
sll x4, x5, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x5, x7, x5
sll x6, x2, x6
add x4, x2, x4
j loop_exit_69  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 340(x3)
lw x1, 700(x3)
sw x6, 656(x3)
sw x4, 788(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x7, x6, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x5, x4, x5
sw x1, 932(x3)
srl x7, x4, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x6, x2, x6
sw x1, 792(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 148(x3)
# LOOP 70 (depth 1, break at 4, max 10)
addi x2, x0, 10
addi x4, x0, 4
addi x1, x0, 0
loop_start_70:
j loop_exit_70  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 484(x3)
sub x7, x1, x7
sw x6, 12(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x4, x1, x4
lw x6, 548(x3)
# LOOP 71 (depth 1, break at 4, max 9)
addi x7, x0, 9
addi x5, x0, 4
addi x4, x0, 0
loop_start_71:
j loop_exit_71  # Exit loop 1
add x2, x5, x2
lw x2, 736(x3)
add x6, x2, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x1, x5, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x5, x1, x5
# LOOP 72 (depth 1, break at 3, max 6)
addi x4, x0, 6
addi x2, x0, 3
addi x6, x0, 0
loop_start_72:
lw x6, 420(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 344(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 388(x3)
sw x7, 372(x3)
# LOOP 73 (depth 2, break at 4, max 9)
addi x2, x0, 9
addi x1, x0, 4
addi x7, x0, 0
loop_start_73:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 74 (depth 3, break at 3, max 8)
addi x2, x0, 8
addi x1, x0, 3
addi x5, x0, 0
loop_start_74:
sub x6, x7, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x2, x6, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x6, x4, x6
add x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 75 (depth 4, break at 1, max 7)
addi x7, x0, 7
addi x2, x0, 1
addi x6, x0, 0
loop_start_75:
or x5, x2, x5
j loop_exit_75  # Exit loop 4
lw x2, 668(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x7, x2, x7
sw x1, 724(x3)
# LOOP 76 (depth 4, break at 3, max 10)
addi x6, x0, 10
addi x2, x0, 3
addi x1, x0, 0
loop_start_76:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 916(x3)
lw x4, 520(x3)
srl x4, x4, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x2, x7, x2
xor x1, x5, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x4, x1, x4
j loop_exit_76  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_74  # Exit loop 3
lw x4, 404(x3)
lw x2, 540(x3)
srl x4, x1, x4
and x7, x6, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 780(x3)
j loop_exit_73  # Exit loop 2
xor x4, x6, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_72  # Exit loop 1
sub x2, x5, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 77 (depth 1, break at 4, max 7)
addi x5, x0, 7
addi x6, x0, 4
addi x7, x0, 0
loop_start_77:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 808(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_77  # Exit loop 1
or x5, x5, x5
or x1, x2, x1
# LOOP 78 (depth 1, break at 1, max 5)
addi x7, x0, 5
addi x2, x0, 1
addi x5, x0, 0
loop_start_78:
# LOOP 79 (depth 2, break at 4, max 8)
addi x4, x0, 8
addi x1, x0, 4
addi x7, x0, 0
loop_start_79:
lw x6, 848(x3)
sw x6, 16(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 716(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x1, x2, x1
j loop_exit_79  # Exit loop 2
xor x7, x7, x7
sub x1, x2, x1
j loop_exit_78  # Exit loop 1
# LOOP 80 (depth 1, break at 4, max 9)
addi x4, x0, 9
addi x2, x0, 4
addi x5, x0, 0
loop_start_80:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x5, x5, x5
# LOOP 81 (depth 2, break at 3, max 4)
addi x4, x0, 4
addi x2, x0, 3
addi x1, x0, 0
loop_start_81:
# LOOP 82 (depth 3, break at 4, max 5)
addi x5, x0, 5
addi x2, x0, 4
addi x7, x0, 0
loop_start_82:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 300(x3)
sw x1, 484(x3)
xor x6, x7, x6
j loop_exit_82  # Exit loop 3
add x4, x1, x4
lw x2, 944(x3)
# LOOP 83 (depth 3, break at 5, max 10)
addi x6, x0, 10
addi x4, x0, 5
addi x7, x0, 0
loop_start_83:
j loop_exit_83  # Exit loop 3
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 4(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 84 (depth 3, break at 5, max 10)
addi x2, x0, 10
addi x4, x0, 5
addi x7, x0, 0
loop_start_84:
lw x7, 156(x3)
sub x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 708(x3)
j loop_exit_84  # Exit loop 3
lw x7, 516(x3)
srl x1, x6, x1
lw x2, 468(x3)
lw x7, 696(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 356(x3)
# LOOP 85 (depth 3, break at 3, max 7)
addi x1, x0, 7
addi x2, x0, 3
addi x6, x0, 0
loop_start_85:
# LOOP 86 (depth 4, break at 3, max 5)
addi x1, x0, 5
addi x5, x0, 3
addi x7, x0, 0
loop_start_86:
sw x2, 52(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 772(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x7, x1, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 404(x3)
sll x4, x5, x4
sub x2, x5, x2
sll x4, x2, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x7, x7, x7
j loop_exit_86  # Exit loop 4
lw x5, 392(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_85  # Exit loop 3
and x5, x5, x5
# LOOP 87 (depth 3, break at 4, max 7)
addi x4, x0, 7
addi x6, x0, 4
addi x2, x0, 0
loop_start_87:
and x6, x1, x6
and x4, x6, x4
sub x7, x6, x7
j loop_exit_87  # Exit loop 3
sw x7, 872(x3)
j loop_exit_81  # Exit loop 2
srl x2, x4, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 88 (depth 2, break at 1, max 8)
addi x4, x0, 8
addi x5, x0, 1
addi x6, x0, 0
loop_start_88:
sw x6, 4(x3)
lw x7, 228(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 40(x3)
j loop_exit_88  # Exit loop 2
# LOOP 89 (depth 2, break at 2, max 10)
addi x5, x0, 10
addi x2, x0, 2
addi x4, x0, 0
loop_start_89:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 90 (depth 3, break at 1, max 4)
addi x1, x0, 4
addi x6, x0, 1
addi x2, x0, 0
loop_start_90:
j loop_exit_90  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 284(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 91 (depth 3, break at 5, max 10)
addi x7, x0, 10
addi x1, x0, 5
addi x6, x0, 0
loop_start_91:
# LOOP 92 (depth 4, break at 5, max 8)
addi x2, x0, 8
addi x5, x0, 5
addi x4, x0, 0
loop_start_92:
sw x5, 804(x3)
sub x5, x7, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 932(x3)
j loop_exit_92  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x2, x2
sll x6, x2, x6
lw x1, 180(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 93 (depth 4, break at 3, max 6)
addi x5, x0, 6
addi x2, x0, 3
addi x4, x0, 0
loop_start_93:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x1, x4, x1
j loop_exit_93  # Exit loop 4
sw x1, 320(x3)
add x5, x4, x5
lw x5, 52(x3)
sw x5, 964(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x7, x7, x7
j loop_exit_91  # Exit loop 3
sw x7, 780(x3)
xor x4, x4, x4
# LOOP 94 (depth 3, break at 3, max 5)
addi x6, x0, 5
addi x5, x0, 3
addi x2, x0, 0
loop_start_94:
sll x6, x2, x6
and x1, x5, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 500(x3)
srl x4, x4, x4
and x2, x4, x2
or x6, x4, x6
and x4, x4, x4
lw x7, 868(x3)
sw x4, 568(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_94  # Exit loop 3
add x4, x5, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 744(x3)
lw x5, 696(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x1, x4, x1
lw x2, 736(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_89  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 928(x3)
# LOOP 95 (depth 2, break at 3, max 6)
addi x1, x0, 6
addi x4, x0, 3
addi x7, x0, 0
loop_start_95:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x5, x7, x5
# LOOP 96 (depth 3, break at 1, max 4)
addi x7, x0, 4
addi x4, x0, 1
addi x1, x0, 0
loop_start_96:
j loop_exit_96  # Exit loop 3
add x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x5, x2, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_95  # Exit loop 2
xor x7, x5, x7
srl x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 97 (depth 2, break at 1, max 5)
addi x4, x0, 5
addi x2, x0, 1
addi x7, x0, 0
loop_start_97:
sw x4, 740(x3)
j loop_exit_97  # Exit loop 2
j loop_exit_80  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x1, x1, x1
# LOOP 98 (depth 1, break at 3, max 4)
addi x2, x0, 4
addi x4, x0, 3
addi x5, x0, 0
loop_start_98:
# LOOP 99 (depth 2, break at 1, max 10)
addi x1, x0, 10
addi x2, x0, 1
addi x4, x0, 0
loop_start_99:
# LOOP 100 (depth 3, break at 1, max 4)
addi x5, x0, 4
addi x6, x0, 1
addi x1, x0, 0
loop_start_100:
j loop_exit_100  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 101 (depth 3, break at 3, max 4)
addi x2, x0, 4
addi x5, x0, 3
addi x6, x0, 0
loop_start_101:
lw x5, 912(x3)
sw x1, 172(x3)
lw x2, 224(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 412(x3)
sll x1, x6, x1
lw x4, 12(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_101  # Exit loop 3
xor x1, x5, x1
# LOOP 102 (depth 3, break at 3, max 8)
addi x6, x0, 8
addi x4, x0, 3
addi x5, x0, 0
loop_start_102:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 808(x3)
or x1, x4, x1
sw x1, 556(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 840(x3)
add x7, x2, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 596(x3)
sw x6, 400(x3)
sw x4, 112(x3)
sw x6, 800(x3)
# LOOP 103 (depth 4, break at 4, max 7)
addi x4, x0, 7
addi x7, x0, 4
addi x2, x0, 0
loop_start_103:
j loop_exit_103  # Exit loop 4
j loop_exit_102  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_99  # Exit loop 2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 196(x3)
sll x1, x1, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_98  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x7, x2
# LOOP 104 (depth 1, break at 4, max 9)
addi x6, x0, 9
addi x5, x0, 4
addi x1, x0, 0
loop_start_104:
j loop_exit_104  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 68(x3)
# LOOP 105 (depth 1, break at 5, max 6)
addi x7, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_105:
xor x2, x4, x2
j loop_exit_105  # Exit loop 1
and x6, x4, x6
or x7, x6, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 106 (depth 1, break at 2, max 4)
addi x5, x0, 4
addi x6, x0, 2
addi x4, x0, 0
loop_start_106:
j loop_exit_106  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x1, x2, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 300(x3)
sw x4, 876(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 107 (depth 1, break at 2, max 6)
addi x2, x0, 6
addi x4, x0, 2
addi x7, x0, 0
loop_start_107:
sw x1, 380(x3)
j loop_exit_107  # Exit loop 1
lw x6, 436(x3)
lw x1, 280(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x1, x2
sll x7, x6, x7
sw x5, 520(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x5, x1, x5
lw x5, 204(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 108 (depth 1, break at 5, max 7)
addi x1, x0, 7
addi x4, x0, 5
addi x6, x0, 0
loop_start_108:
j loop_exit_108  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 109 (depth 1, break at 3, max 6)
addi x7, x0, 6
addi x2, x0, 3
addi x1, x0, 0
loop_start_109:
sub x2, x1, x2
sll x1, x1, x1
# LOOP 110 (depth 2, break at 4, max 5)
addi x4, x0, 5
addi x5, x0, 4
addi x7, x0, 0
loop_start_110:
srl x6, x1, x6
j loop_exit_110  # Exit loop 2
j loop_exit_109  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x4, x6, x4
xor x6, x7, x6
lw x6, 592(x3)
lw x7, 60(x3)
# LOOP 111 (depth 1, break at 4, max 6)
addi x5, x0, 6
addi x1, x0, 4
addi x2, x0, 0
loop_start_111:
or x1, x4, x1
or x5, x7, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 884(x3)
lw x5, 872(x3)
# LOOP 112 (depth 2, break at 4, max 5)
addi x4, x0, 5
addi x7, x0, 4
addi x6, x0, 0
loop_start_112:
or x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_112  # Exit loop 2
j loop_exit_111  # Exit loop 1
srl x6, x2, x6
# LOOP 113 (depth 1, break at 5, max 10)
addi x7, x0, 10
addi x1, x0, 5
addi x2, x0, 0
loop_start_113:
# LOOP 114 (depth 2, break at 5, max 8)
addi x5, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_114:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x4, x4, x4
# LOOP 115 (depth 3, break at 5, max 10)
addi x6, x0, 10
addi x1, x0, 5
addi x5, x0, 0
loop_start_115:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 116 (depth 4, break at 3, max 9)
addi x4, x0, 9
addi x7, x0, 3
addi x2, x0, 0
loop_start_116:
sll x1, x4, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 24(x3)
xor x4, x7, x4
or x5, x6, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x6, x5, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x5, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 864(x3)
j loop_exit_116  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x2, x5, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 496(x3)
lw x7, 692(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 117 (depth 4, break at 5, max 6)
addi x6, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_117:
lw x5, 28(x3)
lw x6, 136(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 496(x3)
sw x4, 632(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_117  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x4, x4, x4
# LOOP 118 (depth 4, break at 5, max 8)
addi x5, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_118:
or x4, x6, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x1, x4, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 216(x3)
and x5, x4, x5
xor x1, x7, x1
lw x2, 664(x3)
sw x5, 28(x3)
xor x4, x7, x4
sw x4, 848(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x5, x1, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x4, x2
and x1, x4, x1
lw x5, 16(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_118  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x5, x5, x5
lw x5, 956(x3)
xor x2, x6, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 444(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_115  # Exit loop 3
sub x4, x5, x4
# LOOP 119 (depth 3, break at 5, max 8)
addi x2, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_119:
sll x7, x1, x7
# LOOP 120 (depth 4, break at 4, max 10)
addi x1, x0, 10
addi x4, x0, 4
addi x6, x0, 0
loop_start_120:
srl x1, x6, x1
lw x4, 116(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x2, x2, x2
j loop_exit_120  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 121 (depth 4, break at 5, max 9)
addi x7, x0, 9
addi x1, x0, 5
addi x6, x0, 0
loop_start_121:
add x2, x4, x2
sw x4, 328(x3)
and x6, x7, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 800(x3)
lw x4, 44(x3)
lw x2, 524(x3)
sw x4, 20(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x5, x6, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 500(x3)
sub x6, x1, x6
sw x6, 764(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x5, x7, x5
j loop_exit_121  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x5, x5, x5
# LOOP 122 (depth 4, break at 3, max 9)
addi x7, x0, 9
addi x4, x0, 3
addi x6, x0, 0
loop_start_122:
or x6, x6, x6
j loop_exit_122  # Exit loop 4
j loop_exit_119  # Exit loop 3
j loop_exit_114  # Exit loop 2
and x2, x1, x2
lw x5, 748(x3)
lw x5, 476(x3)
lw x6, 680(x3)
j loop_exit_113  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 123 (depth 1, break at 4, max 7)
addi x2, x0, 7
addi x4, x0, 4
addi x7, x0, 0
loop_start_123:
# LOOP 124 (depth 2, break at 2, max 7)
addi x1, x0, 7
addi x4, x0, 2
addi x5, x0, 0
loop_start_124:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 92(x3)
j loop_exit_124  # Exit loop 2
or x7, x6, x7
lw x5, 728(x3)
sw x2, 364(x3)
or x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 125 (depth 2, break at 3, max 7)
addi x7, x0, 7
addi x6, x0, 3
addi x1, x0, 0
loop_start_125:
# LOOP 126 (depth 3, break at 4, max 6)
addi x7, x0, 6
addi x4, x0, 4
addi x2, x0, 0
loop_start_126:
lw x4, 912(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 788(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x6, x2, x6
j loop_exit_126  # Exit loop 3
lw x1, 460(x3)
sw x1, 484(x3)
j loop_exit_125  # Exit loop 2
lw x4, 424(x3)
# LOOP 127 (depth 2, break at 4, max 10)
addi x1, x0, 10
addi x7, x0, 4
addi x2, x0, 0
loop_start_127:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 584(x3)
j loop_exit_127  # Exit loop 2
sw x2, 516(x3)
j loop_exit_123  # Exit loop 1
# LOOP 128 (depth 1, break at 2, max 6)
addi x1, x0, 6
addi x7, x0, 2
addi x5, x0, 0
loop_start_128:
lw x5, 988(x3)
j loop_exit_128  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 632(x3)
lw x7, 84(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x7, x7, x7
# LOOP 129 (depth 1, break at 4, max 6)
addi x2, x0, 6
addi x1, x0, 4
addi x6, x0, 0
loop_start_129:
j loop_exit_129  # Exit loop 1
lw x6, 312(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 130 (depth 1, break at 5, max 7)
addi x2, x0, 7
addi x1, x0, 5
addi x7, x0, 0
loop_start_130:
j loop_exit_130  # Exit loop 1
sw x4, 420(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x5, x1, x5
and x4, x5, x4
srl x7, x6, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x1, x2
lw x4, 356(x3)
srl x7, x7, x7
sw x4, 312(x3)
xor x1, x6, x1
# LOOP 131 (depth 1, break at 4, max 8)
addi x5, x0, 8
addi x6, x0, 4
addi x7, x0, 0
loop_start_131:
j loop_exit_131  # Exit loop 1
# LOOP 132 (depth 1, break at 4, max 6)
addi x1, x0, 6
addi x6, x0, 4
addi x2, x0, 0
loop_start_132:
add x6, x2, x6
add x5, x4, x5
add x6, x5, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 248(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x2, x2, x2
j loop_exit_132  # Exit loop 1
lw x2, 24(x3)
# LOOP 133 (depth 1, break at 3, max 6)
addi x1, x0, 6
addi x4, x0, 3
addi x6, x0, 0
loop_start_133:
xor x2, x1, x2
add x2, x2, x2
# LOOP 134 (depth 2, break at 1, max 3)
addi x1, x0, 3
addi x4, x0, 1
addi x7, x0, 0
loop_start_134:
add x4, x4, x4
lw x4, 568(x3)
or x6, x4, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_134  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 135 (depth 2, break at 2, max 9)
addi x4, x0, 9
addi x5, x0, 2
addi x2, x0, 0
loop_start_135:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_135  # Exit loop 2
# LOOP 136 (depth 2, break at 5, max 9)
addi x1, x0, 9
addi x5, x0, 5
addi x7, x0, 0
loop_start_136:
lw x1, 188(x3)
sw x1, 348(x3)
sw x7, 972(x3)
# LOOP 137 (depth 3, break at 5, max 7)
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_137:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_137  # Exit loop 3
# LOOP 138 (depth 3, break at 1, max 6)
addi x2, x0, 6
addi x6, x0, 1
addi x1, x0, 0
loop_start_138:
and x4, x1, x4
xor x1, x2, x1
sub x6, x4, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 644(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x7, x2
lw x2, 228(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x1, x1, x1
lw x4, 84(x3)
sw x7, 484(x3)
sll x5, x2, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x4, x2, x4
sw x5, 444(x3)
sll x5, x6, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_138  # Exit loop 3
xor x6, x5, x6
sw x7, 368(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 84(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 444(x3)
and x5, x7, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x1, x5, x1
lw x1, 984(x3)
# LOOP 139 (depth 3, break at 5, max 7)
addi x5, x0, 7
addi x6, x0, 5
addi x7, x0, 0
loop_start_139:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 860(x3)
sw x4, 668(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_139  # Exit loop 3
# LOOP 140 (depth 3, break at 5, max 8)
addi x2, x0, 8
addi x4, x0, 5
addi x6, x0, 0
loop_start_140:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 388(x3)
lw x5, 76(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x6, x4, x6
# LOOP 141 (depth 4, break at 2, max 4)
addi x4, x0, 4
addi x7, x0, 2
addi x5, x0, 0
loop_start_141:
j loop_exit_141  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 544(x3)
sw x7, 536(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 108(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x4, x5, x4
srl x2, x6, x2
j loop_exit_140  # Exit loop 3
sw x4, 684(x3)
# LOOP 142 (depth 3, break at 1, max 9)
addi x6, x0, 9
addi x1, x0, 1
addi x5, x0, 0
loop_start_142:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x1, x6, x1
j loop_exit_142  # Exit loop 3
and x2, x1, x2
lw x7, 900(x3)
lw x5, 368(x3)
j loop_exit_136  # Exit loop 2
sw x6, 180(x3)
sub x1, x6, x1
lw x6, 548(x3)
or x1, x2, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 528(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 656(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_133  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 143 (depth 1, break at 2, max 10)
addi x6, x0, 10
addi x4, x0, 2
addi x1, x0, 0
loop_start_143:
j loop_exit_143  # Exit loop 1
sll x5, x1, x5
lw x7, 824(x3)
# LOOP 144 (depth 1, break at 3, max 8)
addi x2, x0, 8
addi x5, x0, 3
addi x1, x0, 0
loop_start_144:
# LOOP 145 (depth 2, break at 2, max 4)
addi x2, x0, 4
addi x4, x0, 2
addi x7, x0, 0
loop_start_145:
add x7, x7, x7
j loop_exit_145  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 532(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_144  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x1, x2, x1
sw x1, 328(x3)
sub x2, x6, x2
sub x5, x1, x5
# LOOP 146 (depth 1, break at 3, max 8)
addi x1, x0, 8
addi x2, x0, 3
addi x4, x0, 0
loop_start_146:
# LOOP 147 (depth 2, break at 3, max 9)
addi x6, x0, 9
addi x5, x0, 3
addi x1, x0, 0
loop_start_147:
# LOOP 148 (depth 3, break at 1, max 9)
addi x4, x0, 9
addi x5, x0, 1
addi x2, x0, 0
loop_start_148:
sll x2, x2, x2
or x7, x1, x7
and x4, x7, x4
lw x2, 848(x3)
sw x4, 680(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x7, x4, x7
j loop_exit_148  # Exit loop 3
lw x6, 832(x3)
lw x2, 32(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_147  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 149 (depth 2, break at 3, max 4)
addi x4, x0, 4
addi x6, x0, 3
addi x7, x0, 0
loop_start_149:
xor x2, x5, x2
j loop_exit_149  # Exit loop 2
j loop_exit_146  # Exit loop 1
# LOOP 150 (depth 1, break at 1, max 2)
addi x5, x0, 2
addi x1, x0, 1
addi x4, x0, 0
loop_start_150:
sub x1, x4, x1
sw x4, 520(x3)
j loop_exit_150  # Exit loop 1
add x4, x4, x4
# LOOP 151 (depth 1, break at 5, max 10)
addi x2, x0, 10
addi x5, x0, 5
addi x6, x0, 0
loop_start_151:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 64(x3)
j loop_exit_151  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x4, x7, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 820(x3)
# LOOP 152 (depth 1, break at 3, max 9)
addi x2, x0, 9
addi x5, x0, 3
addi x1, x0, 0
loop_start_152:
# LOOP 153 (depth 2, break at 3, max 6)
addi x4, x0, 6
addi x5, x0, 3
addi x7, x0, 0
loop_start_153:
addi x7, x7, 1
beq x7, x5, 8   # Break to skip next instruction
blt x7, x4, loop_start_153
loop_exit_153:
addi x1, x1, 1
beq x1, x5, 8   # Break to skip next instruction
blt x1, x2, loop_start_152
loop_exit_152:

# Program exit
addi a0, zero, 0     # Set exit code to 0
addi a7, zero, 93    # Exit syscall number
ecall
