lui x3, 1
addi x3, x3, 0
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x6, x4, x6
lw x7, 532(x3)
lw x5, 232(x3)
# LOOP 1 (depth 1, break at 1, max 4)
addi x6, x0, 4
addi x2, x0, 1
addi x7, x0, 0
loop_start_1:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_1  # Exit loop 1
srl x2, x5, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x6, x6, x6
sw x4, 652(x3)
and x7, x5, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x6, x4
sw x2, 312(x3)
# LOOP 2 (depth 1, break at 5, max 9)
addi x7, x0, 9
addi x2, x0, 5
addi x6, x0, 0
loop_start_2:
j loop_exit_2  # Exit loop 1
sub x5, x2, x5
# LOOP 3 (depth 1, break at 2, max 9)
addi x4, x0, 9
addi x2, x0, 2
addi x1, x0, 0
loop_start_3:
j loop_exit_3  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x5, x1, x5
lw x5, 204(x3)
lw x5, 812(x3)
sub x1, x4, x1
lw x7, 856(x3)
sub x4, x1, x4
sll x2, x4, x2
or x4, x1, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x2, x2, x2
add x6, x4, x6
sub x2, x6, x2
sw x6, 152(x3)
sub x1, x1, x1
sw x4, 516(x3)
sub x4, x5, x4
sw x4, 716(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 104(x3)
sub x1, x7, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x5, x4, x5
sub x5, x5, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 52(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 540(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 400(x3)
# LOOP 4 (depth 1, break at 2, max 10)
addi x7, x0, 10
addi x5, x0, 2
addi x2, x0, 0
loop_start_4:
j loop_exit_4  # Exit loop 1
sw x2, 704(x3)
sw x1, 648(x3)
add x4, x6, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 5 (depth 1, break at 2, max 6)
addi x7, x0, 6
addi x1, x0, 2
addi x2, x0, 0
loop_start_5:
lw x6, 596(x3)
srl x1, x5, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 804(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 6 (depth 2, break at 1, max 6)
addi x2, x0, 6
addi x7, x0, 1
addi x5, x0, 0
loop_start_6:
sub x6, x5, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 36(x3)
add x7, x1, x7
sw x4, 276(x3)
sub x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x2, x4, x2
lw x2, 472(x3)
j loop_exit_6  # Exit loop 2
sw x6, 380(x3)
j loop_exit_5  # Exit loop 1
sw x7, 612(x3)
lw x1, 424(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 7 (depth 1, break at 5, max 7)
addi x2, x0, 7
addi x7, x0, 5
addi x5, x0, 0
loop_start_7:
j loop_exit_7  # Exit loop 1
lw x4, 380(x3)
sub x6, x4, x6
add x7, x6, x7
xor x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x7, x4
# LOOP 8 (depth 1, break at 4, max 7)
addi x2, x0, 7
addi x6, x0, 4
addi x5, x0, 0
loop_start_8:
sw x4, 500(x3)
lw x1, 628(x3)
sw x6, 176(x3)
lw x2, 380(x3)
or x1, x5, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x1, x1, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 492(x3)
add x6, x7, x6
j loop_exit_8  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 9 (depth 1, break at 4, max 5)
addi x7, x0, 5
addi x2, x0, 4
addi x1, x0, 0
loop_start_9:
sll x4, x1, x4
sw x4, 660(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_9  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 672(x3)
or x1, x2, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x7, x4, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 764(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 10 (depth 1, break at 5, max 8)
addi x4, x0, 8
addi x2, x0, 5
addi x6, x0, 0
loop_start_10:
sw x4, 372(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_10  # Exit loop 1
lw x4, 556(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x1, x2, x1
sw x1, 744(x3)
sub x7, x2, x7
or x5, x2, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 688(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 768(x3)
# LOOP 11 (depth 1, break at 3, max 6)
addi x4, x0, 6
addi x2, x0, 3
addi x7, x0, 0
loop_start_11:
sw x5, 40(x3)
sll x2, x5, x2
sub x5, x1, x5
j loop_exit_11  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x6, x6, x6
sw x6, 196(x3)
lw x1, 828(x3)
lw x4, 360(x3)
sll x5, x6, x5
sub x2, x1, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 92(x3)
# LOOP 12 (depth 1, break at 5, max 8)
addi x4, x0, 8
addi x7, x0, 5
addi x2, x0, 0
loop_start_12:
lw x2, 232(x3)
xor x1, x7, x1
j loop_exit_12  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 13 (depth 1, break at 3, max 8)
addi x5, x0, 8
addi x2, x0, 3
addi x7, x0, 0
loop_start_13:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x6, x2, x6
sub x7, x1, x7
and x4, x2, x4
sub x6, x7, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x6, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_13  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 956(x3)
and x5, x7, x5
or x2, x1, x2
lw x2, 684(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 14 (depth 1, break at 3, max 10)
addi x5, x0, 10
addi x7, x0, 3
addi x6, x0, 0
loop_start_14:
sw x1, 456(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x2, x5, x2
# LOOP 15 (depth 2, break at 5, max 8)
addi x5, x0, 8
addi x6, x0, 5
addi x1, x0, 0
loop_start_15:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 128(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x1, x6, x1
j loop_exit_15  # Exit loop 2
and x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x6, x4
lw x7, 956(x3)
xor x2, x1, x2
lw x5, 436(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x5, x4
sll x5, x7, x5
lw x4, 276(x3)
or x6, x1, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x7, x1, x7
# LOOP 16 (depth 2, break at 1, max 3)
addi x5, x0, 3
addi x1, x0, 1
addi x2, x0, 0
loop_start_16:
j loop_exit_16  # Exit loop 2
add x6, x7, x6
sub x2, x6, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_14  # Exit loop 1
lw x2, 12(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x5, x1, x5
# LOOP 17 (depth 1, break at 2, max 4)
addi x7, x0, 4
addi x1, x0, 2
addi x2, x0, 0
loop_start_17:
sll x7, x2, x7
j loop_exit_17  # Exit loop 1
lw x6, 80(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x4, x1, x4
# LOOP 18 (depth 1, break at 3, max 6)
addi x1, x0, 6
addi x7, x0, 3
addi x5, x0, 0
loop_start_18:
j loop_exit_18  # Exit loop 1
sub x4, x7, x4
lw x1, 828(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 19 (depth 1, break at 1, max 9)
addi x2, x0, 9
addi x6, x0, 1
addi x4, x0, 0
loop_start_19:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x1, x4, x1
add x4, x5, x4
lw x4, 300(x3)
sw x4, 636(x3)
sw x6, 368(x3)
sw x5, 240(x3)
j loop_exit_19  # Exit loop 1
add x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 100(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 880(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x5, x6, x5
sw x5, 1000(x3)
add x4, x1, x4
srl x5, x5, x5
and x1, x2, x1
sw x4, 868(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 160(x3)
srl x1, x1, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x6, x2, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 8(x3)
sw x5, 684(x3)
# LOOP 20 (depth 1, break at 5, max 7)
addi x4, x0, 7
addi x7, x0, 5
addi x2, x0, 0
loop_start_20:
or x7, x7, x7
lw x5, 372(x3)
sw x5, 984(x3)
j loop_exit_20  # Exit loop 1
or x6, x2, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 908(x3)
lw x1, 684(x3)
sll x5, x2, x5
sw x5, 824(x3)
xor x2, x1, x2
add x1, x7, x1
sw x6, 632(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 21 (depth 1, break at 5, max 7)
addi x2, x0, 7
addi x6, x0, 5
addi x5, x0, 0
loop_start_21:
sw x5, 696(x3)
or x6, x4, x6
j loop_exit_21  # Exit loop 1
sw x7, 112(x3)
# LOOP 22 (depth 1, break at 5, max 6)
addi x1, x0, 6
addi x7, x0, 5
addi x2, x0, 0
loop_start_22:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x2, x2, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x5, x4, x5
j loop_exit_22  # Exit loop 1
# LOOP 23 (depth 1, break at 3, max 8)
addi x7, x0, 8
addi x2, x0, 3
addi x4, x0, 0
loop_start_23:
lw x7, 864(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x7, x4
# LOOP 24 (depth 2, break at 5, max 6)
addi x5, x0, 6
addi x1, x0, 5
addi x7, x0, 0
loop_start_24:
j loop_exit_24  # Exit loop 2
sw x2, 856(x3)
lw x4, 176(x3)
or x4, x4, x4
# LOOP 25 (depth 2, break at 4, max 8)
addi x2, x0, 8
addi x6, x0, 4
addi x7, x0, 0
loop_start_25:
xor x5, x1, x5
lw x2, 116(x3)
j loop_exit_25  # Exit loop 2
j loop_exit_23  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 980(x3)
# LOOP 26 (depth 1, break at 5, max 8)
addi x6, x0, 8
addi x5, x0, 5
addi x1, x0, 0
loop_start_26:
j loop_exit_26  # Exit loop 1
srl x2, x2, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 27 (depth 1, break at 1, max 4)
addi x6, x0, 4
addi x5, x0, 1
addi x4, x0, 0
loop_start_27:
# LOOP 28 (depth 2, break at 1, max 5)
addi x6, x0, 5
addi x5, x0, 1
addi x1, x0, 0
loop_start_28:
lw x4, 288(x3)
j loop_exit_28  # Exit loop 2
and x6, x4, x6
j loop_exit_27  # Exit loop 1
# LOOP 29 (depth 1, break at 5, max 7)
addi x1, x0, 7
addi x7, x0, 5
addi x4, x0, 0
loop_start_29:
sll x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_29  # Exit loop 1
or x4, x5, x4
sub x7, x7, x7
sub x1, x7, x1
sw x7, 760(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 612(x3)
lw x5, 920(x3)
sw x1, 332(x3)
sll x7, x4, x7
lw x4, 292(x3)
xor x4, x4, x4
# LOOP 30 (depth 1, break at 4, max 10)
addi x5, x0, 10
addi x2, x0, 4
addi x1, x0, 0
loop_start_30:
j loop_exit_30  # Exit loop 1
# LOOP 31 (depth 1, break at 3, max 6)
addi x5, x0, 6
addi x4, x0, 3
addi x7, x0, 0
loop_start_31:
xor x1, x1, x1
sw x7, 120(x3)
# LOOP 32 (depth 2, break at 3, max 6)
addi x5, x0, 6
addi x4, x0, 3
addi x7, x0, 0
loop_start_32:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_32  # Exit loop 2
j loop_exit_31  # Exit loop 1
sw x6, 128(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x2, x5, x2
srl x4, x4, x4
# LOOP 33 (depth 1, break at 3, max 5)
addi x1, x0, 5
addi x2, x0, 3
addi x6, x0, 0
loop_start_33:
and x5, x5, x5
sw x4, 952(x3)
j loop_exit_33  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x6, x4, x6
srl x4, x7, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x1, x7, x1
srl x1, x1, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 756(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 34 (depth 1, break at 1, max 7)
addi x1, x0, 7
addi x5, x0, 1
addi x2, x0, 0
loop_start_34:
sw x6, 488(x3)
# LOOP 35 (depth 2, break at 3, max 9)
addi x5, x0, 9
addi x1, x0, 3
addi x7, x0, 0
loop_start_35:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_35  # Exit loop 2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 376(x3)
sw x2, 656(x3)
j loop_exit_34  # Exit loop 1
sll x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x4, x7, x4
add x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 784(x3)
# LOOP 36 (depth 1, break at 1, max 6)
addi x4, x0, 6
addi x6, x0, 1
addi x2, x0, 0
loop_start_36:
add x1, x2, x1
add x4, x7, x4
j loop_exit_36  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 48(x3)
# LOOP 37 (depth 1, break at 5, max 9)
addi x7, x0, 9
addi x6, x0, 5
addi x1, x0, 0
loop_start_37:
lw x1, 12(x3)
lw x1, 0(x3)
add x7, x7, x7
sw x4, 620(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_37  # Exit loop 1
sw x4, 220(x3)
sw x2, 704(x3)
sw x5, 744(x3)
sw x1, 88(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 864(x3)
lw x1, 584(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x6, x1, x6
sw x4, 384(x3)
# LOOP 38 (depth 1, break at 4, max 10)
addi x4, x0, 10
addi x7, x0, 4
addi x5, x0, 0
loop_start_38:
j loop_exit_38  # Exit loop 1
sub x6, x4, x6
sw x5, 840(x3)
xor x2, x4, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 39 (depth 1, break at 5, max 7)
addi x7, x0, 7
addi x1, x0, 5
addi x5, x0, 0
loop_start_39:
j loop_exit_39  # Exit loop 1
sub x6, x2, x6
sw x4, 320(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x1, x7, x1
sw x5, 12(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x4, x4
lw x4, 824(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 160(x3)
add x7, x6, x7
and x2, x7, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x4, x5, x4
srl x5, x2, x5
and x4, x7, x4
and x2, x1, x2
and x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x6, x6, x6
add x2, x7, x2
sw x7, 536(x3)
xor x4, x5, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 40 (depth 1, break at 1, max 10)
addi x6, x0, 10
addi x5, x0, 1
addi x7, x0, 0
loop_start_40:
j loop_exit_40  # Exit loop 1
srl x5, x6, x5
# LOOP 41 (depth 1, break at 5, max 8)
addi x2, x0, 8
addi x4, x0, 5
addi x7, x0, 0
loop_start_41:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 756(x3)
sw x5, 824(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 860(x3)
j loop_exit_41  # Exit loop 1
xor x4, x5, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 224(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 664(x3)
lw x7, 0(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 884(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 420(x3)
srl x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x1, x5
or x1, x5, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 168(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 256(x3)
and x6, x5, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 20(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 42 (depth 1, break at 1, max 6)
addi x4, x0, 6
addi x1, x0, 1
addi x7, x0, 0
loop_start_42:
j loop_exit_42  # Exit loop 1
sw x7, 1000(x3)
# LOOP 43 (depth 1, break at 1, max 4)
addi x5, x0, 4
addi x1, x0, 1
addi x2, x0, 0
loop_start_43:
and x6, x2, x6
j loop_exit_43  # Exit loop 1
sll x1, x6, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 732(x3)
lw x4, 424(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 44 (depth 1, break at 3, max 10)
addi x5, x0, 10
addi x2, x0, 3
addi x7, x0, 0
loop_start_44:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_44  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x6, x1, x6
lw x6, 580(x3)
lw x6, 608(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 308(x3)
sll x2, x5, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 564(x3)
sw x4, 140(x3)
# LOOP 45 (depth 1, break at 3, max 10)
addi x1, x0, 10
addi x7, x0, 3
addi x4, x0, 0
loop_start_45:
sub x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_45  # Exit loop 1
sw x2, 80(x3)
srl x6, x4, x6
add x1, x4, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x2, x7, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x5, x1, x5
sw x4, 744(x3)
xor x7, x6, x7
xor x4, x2, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 408(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 372(x3)
srl x2, x7, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 292(x3)
lw x5, 68(x3)
# LOOP 46 (depth 1, break at 5, max 9)
addi x6, x0, 9
addi x7, x0, 5
addi x4, x0, 0
loop_start_46:
j loop_exit_46  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x7, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 984(x3)
add x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 876(x3)
and x5, x2, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 684(x3)
srl x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x5, x2
xor x6, x6, x6
sw x7, 224(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x7, x4
sw x5, 324(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x7, x5, x7
# LOOP 47 (depth 1, break at 4, max 10)
addi x4, x0, 10
addi x6, x0, 4
addi x1, x0, 0
loop_start_47:
xor x4, x5, x4
j loop_exit_47  # Exit loop 1
lw x6, 92(x3)
lw x1, 804(x3)
or x7, x4, x7
xor x5, x4, x5
sw x6, 476(x3)
lw x1, 584(x3)
sub x4, x1, x4
sw x2, 672(x3)
and x6, x7, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x1, x7, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 924(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 804(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 876(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 48 (depth 1, break at 2, max 8)
addi x1, x0, 8
addi x5, x0, 2
addi x6, x0, 0
loop_start_48:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x5, x4, x5
# LOOP 49 (depth 2, break at 5, max 7)
addi x1, x0, 7
addi x6, x0, 5
addi x4, x0, 0
loop_start_49:
j loop_exit_49  # Exit loop 2
sll x1, x5, x1
j loop_exit_48  # Exit loop 1
sub x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 816(x3)
or x7, x4, x7
sw x7, 140(x3)
lw x5, 432(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 688(x3)
sub x6, x6, x6
sw x1, 872(x3)
lw x4, 840(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 288(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 864(x3)
lw x2, 688(x3)
lw x2, 528(x3)
lw x2, 424(x3)
sw x4, 996(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 50 (depth 1, break at 5, max 7)
addi x5, x0, 7
addi x1, x0, 5
addi x7, x0, 0
loop_start_50:
and x4, x1, x4
j loop_exit_50  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x5, x5, x5
xor x7, x6, x7
# LOOP 51 (depth 1, break at 3, max 10)
addi x6, x0, 10
addi x5, x0, 3
addi x1, x0, 0
loop_start_51:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_51  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x4, x6, x4
# LOOP 52 (depth 1, break at 1, max 10)
addi x2, x0, 10
addi x5, x0, 1
addi x6, x0, 0
loop_start_52:
j loop_exit_52  # Exit loop 1
or x7, x5, x7
sw x2, 812(x3)
sw x5, 260(x3)
sw x5, 928(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x2, x4, x2
xor x4, x7, x4
# LOOP 53 (depth 1, break at 2, max 6)
addi x6, x0, 6
addi x7, x0, 2
addi x2, x0, 0
loop_start_53:
j loop_exit_53  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 280(x3)
add x2, x4, x2
sub x7, x5, x7
sll x4, x5, x4
add x7, x7, x7
# LOOP 54 (depth 1, break at 1, max 3)
addi x2, x0, 3
addi x5, x0, 1
addi x6, x0, 0
loop_start_54:
lw x4, 160(x3)
j loop_exit_54  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 168(x3)
sw x6, 672(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x7, x2, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x5, x7, x5
sw x2, 292(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 296(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 55 (depth 1, break at 1, max 4)
addi x4, x0, 4
addi x1, x0, 1
addi x7, x0, 0
loop_start_55:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 360(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x4, x4, x4
sw x5, 412(x3)
j loop_exit_55  # Exit loop 1
lw x6, 336(x3)
and x5, x5, x5
sw x2, 420(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x7, x2, x7
# LOOP 56 (depth 1, break at 4, max 6)
addi x2, x0, 6
addi x1, x0, 4
addi x4, x0, 0
loop_start_56:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x6, x6, x6
j loop_exit_56  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 468(x3)
# LOOP 57 (depth 1, break at 3, max 8)
addi x2, x0, 8
addi x7, x0, 3
addi x4, x0, 0
loop_start_57:
j loop_exit_57  # Exit loop 1
# LOOP 58 (depth 1, break at 3, max 7)
addi x6, x0, 7
addi x7, x0, 3
addi x2, x0, 0
loop_start_58:
j loop_exit_58  # Exit loop 1
add x1, x5, x1
lw x1, 224(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 20(x3)
sll x4, x5, x4
lw x4, 236(x3)
sub x4, x4, x4
lw x5, 492(x3)
lw x5, 800(x3)
# LOOP 59 (depth 1, break at 4, max 10)
addi x2, x0, 10
addi x4, x0, 4
addi x7, x0, 0
loop_start_59:
j loop_exit_59  # Exit loop 1
or x1, x7, x1
or x6, x7, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 36(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x5, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x4, x4, x4
or x2, x4, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 312(x3)
sw x5, 732(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 484(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 408(x3)
sll x6, x4, x6
lw x6, 260(x3)
# LOOP 60 (depth 1, break at 5, max 8)
addi x5, x0, 8
addi x2, x0, 5
addi x7, x0, 0
loop_start_60:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x4, x6, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x7, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_60  # Exit loop 1
sw x5, 620(x3)
sw x4, 144(x3)
xor x7, x7, x7
srl x1, x4, x1
and x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x6, x4, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x1, x2, x1
lw x7, 964(x3)
add x2, x4, x2
or x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 208(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x4, x1, x4
lw x2, 320(x3)
sll x6, x2, x6
sll x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x7, x5
# LOOP 61 (depth 1, break at 2, max 10)
addi x1, x0, 10
addi x4, x0, 2
addi x7, x0, 0
loop_start_61:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_61  # Exit loop 1
lw x1, 436(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 62 (depth 1, break at 1, max 2)
addi x5, x0, 2
addi x7, x0, 1
addi x4, x0, 0
loop_start_62:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 212(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_62  # Exit loop 1
and x1, x7, x1
srl x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 556(x3)
lw x5, 196(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 624(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 808(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 952(x3)
lw x2, 324(x3)
sw x2, 488(x3)
lw x1, 964(x3)
srl x6, x1, x6
sub x4, x7, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 88(x3)
lw x7, 40(x3)
or x1, x4, x1
srl x6, x7, x6
# LOOP 63 (depth 1, break at 3, max 10)
addi x7, x0, 10
addi x5, x0, 3
addi x1, x0, 0
loop_start_63:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 604(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x4, x1, x4
or x5, x6, x5
j loop_exit_63  # Exit loop 1
sw x5, 988(x3)
and x1, x6, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x7, x5, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 892(x3)
lw x4, 572(x3)
# LOOP 64 (depth 1, break at 2, max 5)
addi x5, x0, 5
addi x2, x0, 2
addi x1, x0, 0
loop_start_64:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_64  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 748(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x7, x5, x7
and x4, x7, x4
add x1, x4, x1
or x4, x7, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x4, x4, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 424(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x5, x2, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x6, x5, x6
sw x6, 228(x3)
# LOOP 65 (depth 1, break at 1, max 10)
addi x4, x0, 10
addi x2, x0, 1
addi x5, x0, 0
loop_start_65:
j loop_exit_65  # Exit loop 1
sll x2, x4, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 68(x3)
lw x5, 8(x3)
add x4, x2, x4
sw x4, 912(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x7, x2, x7
lw x7, 432(x3)
sw x5, 388(x3)
lw x4, 860(x3)
lw x4, 72(x3)
# LOOP 66 (depth 1, break at 5, max 8)
addi x7, x0, 8
addi x2, x0, 5
addi x6, x0, 0
loop_start_66:
and x2, x1, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 436(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 712(x3)
lw x2, 832(x3)
sw x2, 552(x3)
j loop_exit_66  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x6, x4, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 360(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 67 (depth 1, break at 4, max 7)
addi x4, x0, 7
addi x1, x0, 4
addi x7, x0, 0
loop_start_67:
j loop_exit_67  # Exit loop 1
sub x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x4, x6, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x1, x7, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 984(x3)
lw x2, 360(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 68 (depth 1, break at 5, max 8)
addi x6, x0, 8
addi x1, x0, 5
addi x5, x0, 0
loop_start_68:
sll x2, x7, x2
# LOOP 69 (depth 2, break at 5, max 10)
addi x5, x0, 10
addi x1, x0, 5
addi x6, x0, 0
loop_start_69:
srl x7, x6, x7
sll x1, x7, x1
xor x5, x5, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x4, x1, x4
xor x6, x1, x6
j loop_exit_69  # Exit loop 2
lw x6, 212(x3)
j loop_exit_68  # Exit loop 1
srl x1, x1, x1
# LOOP 70 (depth 1, break at 4, max 10)
addi x4, x0, 10
addi x5, x0, 4
addi x6, x0, 0
loop_start_70:
j loop_exit_70  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 864(x3)
# LOOP 71 (depth 1, break at 5, max 8)
addi x7, x0, 8
addi x2, x0, 5
addi x5, x0, 0
loop_start_71:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 72 (depth 2, break at 1, max 3)
addi x2, x0, 3
addi x7, x0, 1
addi x6, x0, 0
loop_start_72:
add x1, x7, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_72  # Exit loop 2
sw x1, 728(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 416(x3)
sw x4, 280(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x4, x6, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x1, x7, x1
j loop_exit_71  # Exit loop 1
lw x2, 964(x3)
# LOOP 73 (depth 1, break at 3, max 6)
addi x5, x0, 6
addi x1, x0, 3
addi x6, x0, 0
loop_start_73:
j loop_exit_73  # Exit loop 1
xor x2, x5, x2
sw x7, 312(x3)
sw x1, 644(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x4, x7, x4
lw x4, 868(x3)
sw x1, 592(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 644(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 144(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 884(x3)
lw x1, 108(x3)
or x5, x1, x5
# LOOP 74 (depth 1, break at 2, max 5)
addi x7, x0, 5
addi x6, x0, 2
addi x4, x0, 0
loop_start_74:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_74  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 75 (depth 1, break at 5, max 8)
addi x2, x0, 8
addi x6, x0, 5
addi x7, x0, 0
loop_start_75:
add x4, x2, x4
and x1, x5, x1
j loop_exit_75  # Exit loop 1
sub x5, x6, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 540(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 76 (depth 1, break at 2, max 4)
addi x6, x0, 4
addi x4, x0, 2
addi x1, x0, 0
loop_start_76:
j loop_exit_76  # Exit loop 1
and x5, x5, x5
# LOOP 77 (depth 1, break at 2, max 8)
addi x4, x0, 8
addi x7, x0, 2
addi x1, x0, 0
loop_start_77:
# LOOP 78 (depth 2, break at 3, max 6)
addi x6, x0, 6
addi x4, x0, 3
addi x2, x0, 0
loop_start_78:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x7, x4, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 688(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_78  # Exit loop 2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 60(x3)
srl x4, x4, x4
# LOOP 79 (depth 2, break at 3, max 6)
addi x1, x0, 6
addi x6, x0, 3
addi x7, x0, 0
loop_start_79:
and x2, x5, x2
j loop_exit_79  # Exit loop 2
j loop_exit_77  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 460(x3)
lw x7, 224(x3)
sll x1, x6, x1
or x7, x1, x7
and x5, x7, x5
sw x4, 176(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x1, x4, x1
and x2, x2, x2
xor x6, x5, x6
srl x2, x4, x2
lw x1, 936(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 296(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 156(x3)
# LOOP 80 (depth 1, break at 5, max 8)
addi x6, x0, 8
addi x5, x0, 5
addi x1, x0, 0
loop_start_80:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_80  # Exit loop 1
srl x2, x1, x2
sub x4, x2, x4
lw x4, 296(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 324(x3)
xor x2, x7, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x1, x5, x1
sll x4, x6, x4
# LOOP 81 (depth 1, break at 5, max 10)
addi x7, x0, 10
addi x5, x0, 5
addi x6, x0, 0
loop_start_81:
j loop_exit_81  # Exit loop 1
sw x1, 168(x3)
lw x7, 68(x3)
# LOOP 82 (depth 1, break at 5, max 7)
addi x5, x0, 7
addi x4, x0, 5
addi x1, x0, 0
loop_start_82:
or x5, x4, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 480(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x2, x2, x2
and x5, x7, x5
lw x7, 752(x3)
lw x4, 752(x3)
srl x2, x2, x2
# LOOP 83 (depth 2, break at 4, max 5)
addi x5, x0, 5
addi x6, x0, 4
addi x1, x0, 0
loop_start_83:
sw x4, 780(x3)
and x4, x5, x4
j loop_exit_83  # Exit loop 2
j loop_exit_82  # Exit loop 1
sw x5, 40(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 624(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 900(x3)
# LOOP 84 (depth 1, break at 4, max 10)
addi x4, x0, 10
addi x1, x0, 4
addi x2, x0, 0
loop_start_84:
j loop_exit_84  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 512(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 85 (depth 1, break at 1, max 10)
addi x7, x0, 10
addi x6, x0, 1
addi x1, x0, 0
loop_start_85:
j loop_exit_85  # Exit loop 1
lw x1, 944(x3)
lw x1, 944(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 788(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 932(x3)
or x5, x7, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 86 (depth 1, break at 2, max 10)
addi x2, x0, 10
addi x4, x0, 2
addi x7, x0, 0
loop_start_86:
j loop_exit_86  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 656(x3)
and x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 32(x3)
lw x7, 176(x3)
xor x6, x7, x6
srl x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 87 (depth 1, break at 4, max 9)
addi x7, x0, 9
addi x2, x0, 4
addi x1, x0, 0
loop_start_87:
j loop_exit_87  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 944(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 432(x3)
lw x7, 988(x3)
and x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x7, x2, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x4, x6, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x7, x7, x7
lw x2, 112(x3)
xor x1, x7, x1
sub x5, x5, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x1, x2, x1
srl x6, x7, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 88 (depth 1, break at 2, max 3)
addi x5, x0, 3
addi x2, x0, 2
addi x1, x0, 0
loop_start_88:
and x5, x6, x5
j loop_exit_88  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x1, x5, x1
sll x6, x1, x6
and x5, x4, x5
sub x1, x1, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 89 (depth 1, break at 5, max 7)
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_89:
j loop_exit_89  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 184(x3)
# LOOP 90 (depth 1, break at 4, max 5)
addi x4, x0, 5
addi x1, x0, 4
addi x6, x0, 0
loop_start_90:
srl x5, x1, x5
j loop_exit_90  # Exit loop 1
# LOOP 91 (depth 1, break at 2, max 7)
addi x4, x0, 7
addi x7, x0, 2
addi x2, x0, 0
loop_start_91:
sub x2, x2, x2
j loop_exit_91  # Exit loop 1
sw x5, 412(x3)
sw x5, 352(x3)
lw x7, 644(x3)
lw x1, 948(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 612(x3)
sw x4, 660(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 604(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 92 (depth 1, break at 4, max 10)
addi x1, x0, 10
addi x4, x0, 4
addi x7, x0, 0
loop_start_92:
lw x7, 324(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 708(x3)
j loop_exit_92  # Exit loop 1
sub x2, x5, x2
sw x4, 44(x3)
lw x1, 228(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 464(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 940(x3)
xor x2, x7, x2
sw x5, 8(x3)
lw x6, 312(x3)
srl x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 784(x3)
sw x2, 172(x3)
add x4, x2, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 93 (depth 1, break at 5, max 9)
addi x7, x0, 9
addi x6, x0, 5
addi x2, x0, 0
loop_start_93:
xor x7, x1, x7
sw x7, 296(x3)
lw x5, 524(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_93  # Exit loop 1
sub x7, x4, x7
or x6, x5, x6
and x5, x5, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x7, x4, x7
sll x6, x7, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x1, x6, x1
sw x7, 612(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 94 (depth 1, break at 2, max 8)
addi x6, x0, 8
addi x2, x0, 2
addi x5, x0, 0
loop_start_94:
sw x6, 316(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x7, x4, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x1, x5
j loop_exit_94  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 95 (depth 1, break at 2, max 6)
addi x6, x0, 6
addi x7, x0, 2
addi x4, x0, 0
loop_start_95:
j loop_exit_95  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x2, x1, x2
sw x2, 532(x3)
sll x1, x6, x1
# LOOP 96 (depth 1, break at 1, max 10)
addi x7, x0, 10
addi x4, x0, 1
addi x5, x0, 0
loop_start_96:
srl x7, x2, x7
j loop_exit_96  # Exit loop 1
lw x7, 560(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x6, x1, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 97 (depth 1, break at 3, max 5)
addi x4, x0, 5
addi x7, x0, 3
addi x5, x0, 0
loop_start_97:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_97  # Exit loop 1
lw x6, 420(x3)
srl x7, x6, x7
srl x6, x7, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x4, x5, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x6, x1, x6
srl x5, x5, x5
sub x6, x1, x6
or x1, x6, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 584(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x7, x5, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 98 (depth 1, break at 3, max 6)
addi x5, x0, 6
addi x4, x0, 3
addi x6, x0, 0
loop_start_98:
sw x7, 28(x3)
lw x1, 340(x3)
lw x7, 716(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 200(x3)
sw x1, 628(x3)
and x2, x4, x2
or x4, x5, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 568(x3)
j loop_exit_98  # Exit loop 1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 99 (depth 1, break at 5, max 6)
addi x5, x0, 6
addi x7, x0, 5
addi x4, x0, 0
loop_start_99:
sub x5, x6, x5
# LOOP 100 (depth 2, break at 2, max 4)
addi x6, x0, 4
addi x2, x0, 2
addi x7, x0, 0
loop_start_100:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_100  # Exit loop 2
sll x2, x1, x2
xor x5, x2, x5
j loop_exit_99  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x2, x6, x2
or x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 540(x3)
sub x2, x5, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 412(x3)
sub x7, x4, x7
sub x6, x2, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 864(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 368(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 940(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 632(x3)
xor x1, x4, x1
sw x2, 700(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x7, x4, x7
lw x6, 644(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 748(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction

# Program exit
addi a0, zero, 0     # Set exit code to 0
addi a7, zero, 93    # Exit syscall number
ecall
