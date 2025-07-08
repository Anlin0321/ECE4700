lui x3, 2
addi x3, x3, 0
sw x5, 704(x3)
# LOOP 1 (depth 1, break at 5, max 6)
addi x8, x0, 6
addi x9, x0, 5
addi x7, x0, 0
loop_start_1:
# LOOP 2 (depth 2, break at 2, max 3)
addi x1, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_2:
sw x11, 740(x3)
lw x11, 252(x3)
lw x11, 520(x3)
and x10, x9, x10
# LOOP 3 (depth 3, break at 2, max 5)
addi x2, x0, 5
addi x9, x0, 2
addi x7, x0, 0
loop_start_3:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 576(x3)
# LOOP 4 (depth 4, break at 4, max 7)
addi x1, x0, 7
addi x10, x0, 4
addi x9, x0, 0
loop_start_4:
sll x4, x2, x4
j loop_exit_4  # Exit loop 4
lw x11, 240(x3)
lw x8, 28(x3)
lw x7, 280(x3)
sw x6, 404(x3)
srl x1, x11, x1
lw x9, 352(x3)
sw x9, 636(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 608(x3)
xor x10, x6, x10
sw x10, 812(x3)
# LOOP 5 (depth 4, break at 4, max 10)
addi x2, x0, 10
addi x9, x0, 4
addi x1, x0, 0
loop_start_5:
sw x8, 880(x3)
lw x11, 800(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x1, 768(x3)
lw x6, 444(x3)
j loop_exit_5  # Exit loop 4
sw x5, 420(x3)
lw x11, 1000(x3)
lw x11, 704(x3)
j loop_exit_3  # Exit loop 3
sw x6, 496(x3)
j loop_exit_2  # Exit loop 2
sw x5, 332(x3)
add x2, x2, x2
sw x6, 148(x3)
sll x10, x6, x10
sll x9, x10, x9
and x6, x9, x6
xor x7, x6, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 688(x3)
add x7, x1, x7
sw x7, 276(x3)
# LOOP 6 (depth 2, break at 4, max 7)
addi x8, x0, 7
addi x5, x0, 4
addi x10, x0, 0
loop_start_6:
sw x11, 828(x3)
sw x4, 304(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 616(x3)
lw x4, 728(x3)
lw x4, 800(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_6  # Exit loop 2
sub x7, x7, x7
sw x9, 8(x3)
# LOOP 7 (depth 2, break at 4, max 6)
addi x5, x0, 6
addi x2, x0, 4
addi x10, x0, 0
loop_start_7:
lw x11, 24(x3)
j loop_exit_7  # Exit loop 2
lw x9, 440(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 8 (depth 2, break at 1, max 6)
addi x4, x0, 6
addi x2, x0, 1
addi x6, x0, 0
loop_start_8:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x10, x10, x10
sll x6, x10, x6
srl x8, x6, x8
lw x4, 92(x3)
or x1, x4, x1
j loop_exit_8  # Exit loop 2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 9 (depth 2, break at 4, max 10)
addi x8, x0, 10
addi x11, x0, 4
addi x4, x0, 0
loop_start_9:
and x8, x4, x8
lw x11, 652(x3)
sw x2, 104(x3)
sw x2, 896(x3)
lw x2, 384(x3)
sw x2, 516(x3)
sw x4, 520(x3)
j loop_exit_9  # Exit loop 2
sw x9, 700(x3)
# LOOP 10 (depth 2, break at 3, max 5)
addi x11, x0, 5
addi x1, x0, 3
addi x10, x0, 0
loop_start_10:
lw x4, 856(x3)
# LOOP 11 (depth 3, break at 3, max 8)
addi x7, x0, 8
addi x11, x0, 3
addi x1, x0, 0
loop_start_11:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x4, x1, x4
sw x10, 836(x3)
j loop_exit_11  # Exit loop 3
lw x7, 740(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x8, 44(x3)
lw x4, 156(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 12 (depth 3, break at 5, max 7)
addi x8, x0, 7
addi x7, x0, 5
addi x11, x0, 0
loop_start_12:
and x4, x2, x4
sll x2, x5, x2
and x8, x2, x8
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 13 (depth 4, break at 3, max 10)
addi x10, x0, 10
addi x4, x0, 3
addi x6, x0, 0
loop_start_13:
lw x8, 220(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x4, x8, x4
# LOOP 14 (depth 5, break at 4, max 5)
addi x11, x0, 5
addi x5, x0, 4
addi x6, x0, 0
loop_start_14:
srl x6, x6, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_14  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x5, x7, x5
lw x10, 932(x3)
sll x5, x4, x5
lw x7, 580(x3)
lw x8, 368(x3)
j loop_exit_13  # Exit loop 4
sw x8, 468(x3)
# LOOP 15 (depth 4, break at 2, max 7)
addi x2, x0, 7
addi x5, x0, 2
addi x7, x0, 0
loop_start_15:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_15  # Exit loop 4
j loop_exit_12  # Exit loop 3
sw x1, 36(x3)
# LOOP 16 (depth 3, break at 5, max 6)
addi x9, x0, 6
addi x5, x0, 5
addi x10, x0, 0
loop_start_16:
lw x2, 724(x3)
xor x5, x6, x5
lw x5, 432(x3)
lw x11, 600(x3)
sw x6, 496(x3)
j loop_exit_16  # Exit loop 3
sw x8, 76(x3)
# LOOP 17 (depth 3, break at 2, max 7)
addi x6, x0, 7
addi x1, x0, 2
addi x2, x0, 0
loop_start_17:
# LOOP 18 (depth 4, break at 1, max 2)
addi x5, x0, 2
addi x4, x0, 1
addi x10, x0, 0
loop_start_18:
srl x1, x2, x1
srl x11, x1, x11
lw x11, 136(x3)
sw x5, 208(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 620(x3)
lw x8, 364(x3)
lw x7, 124(x3)
# LOOP 19 (depth 5, break at 2, max 10)
addi x2, x0, 10
addi x10, x0, 2
addi x11, x0, 0
loop_start_19:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 36(x3)
sw x7, 416(x3)
sw x4, 676(x3)
add x1, x5, x1
lw x4, 536(x3)
sw x2, 732(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x9, 912(x3)
j loop_exit_19  # Exit loop 5
sub x7, x11, x7
j loop_exit_18  # Exit loop 4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_17  # Exit loop 3
# LOOP 20 (depth 3, break at 5, max 10)
addi x9, x0, 10
addi x8, x0, 5
addi x1, x0, 0
loop_start_20:
sw x8, 960(x3)
sw x6, 676(x3)
j loop_exit_20  # Exit loop 3
sub x8, x7, x8
sw x5, 76(x3)
# LOOP 21 (depth 3, break at 2, max 3)
addi x2, x0, 3
addi x10, x0, 2
addi x1, x0, 0
loop_start_21:
lw x8, 784(x3)
lw x8, 780(x3)
xor x10, x2, x10
sub x2, x10, x2
lw x2, 152(x3)
sw x11, 308(x3)
lw x8, 664(x3)
and x2, x4, x2
srl x1, x2, x1
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x4, x1, x4
srl x7, x4, x7
# LOOP 22 (depth 4, break at 3, max 7)
addi x6, x0, 7
addi x1, x0, 3
addi x2, x0, 0
loop_start_22:
and x7, x6, x7
sll x9, x7, x9
lw x8, 748(x3)
add x2, x9, x2
lw x1, 744(x3)
lw x1, 948(x3)
lw x1, 584(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x9, x4, x9
# LOOP 23 (depth 5, break at 4, max 8)
addi x6, x0, 8
addi x5, x0, 4
addi x4, x0, 0
loop_start_23:
sw x9, 504(x3)
lw x6, 144(x3)
lw x1, 352(x3)
sw x5, 476(x3)
srl x11, x10, x11
lw x11, 900(x3)
xor x7, x1, x7
lw x11, 0(x3)
sw x11, 364(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 24 (depth 6, break at 3, max 10)
addi x7, x0, 10
addi x10, x0, 3
addi x6, x0, 0
loop_start_24:
lw x7, 192(x3)
sw x5, 732(x3)
xor x11, x2, x11
lw x2, 48(x3)
j loop_exit_24  # Exit loop 6
# LOOP 25 (depth 6, break at 1, max 10)
addi x6, x0, 10
addi x8, x0, 1
addi x4, x0, 0
loop_start_25:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x9, x4, x9
sw x8, 28(x3)
and x8, x8, x8
lw x8, 600(x3)
lw x1, 900(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 884(x3)
or x5, x11, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x9, x8, x9
sub x10, x10, x10
lw x9, 760(x3)
sw x8, 632(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x11, 352(x3)
xor x5, x1, x5
j loop_exit_25  # Exit loop 6
j loop_exit_23  # Exit loop 5
# LOOP 26 (depth 5, break at 5, max 9)
addi x7, x0, 9
addi x11, x0, 5
addi x1, x0, 0
loop_start_26:
sw x11, 404(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x2, x11, x2
j loop_exit_26  # Exit loop 5
lw x2, 36(x3)
lw x9, 696(x3)
j loop_exit_22  # Exit loop 4
# LOOP 27 (depth 4, break at 2, max 5)
addi x6, x0, 5
addi x7, x0, 2
addi x2, x0, 0
loop_start_27:
xor x5, x9, x5
sw x5, 20(x3)
# LOOP 28 (depth 5, break at 3, max 9)
addi x2, x0, 9
addi x6, x0, 3
addi x1, x0, 0
loop_start_28:
j loop_exit_28  # Exit loop 5
lw x1, 552(x3)
and x6, x11, x6
sll x10, x5, x10
lw x2, 12(x3)
sw x5, 224(x3)
j loop_exit_27  # Exit loop 4
xor x10, x7, x10
# LOOP 29 (depth 4, break at 4, max 8)
addi x11, x0, 8
addi x4, x0, 4
addi x5, x0, 0
loop_start_29:
sw x2, 824(x3)
and x10, x11, x10
sw x6, 108(x3)
or x5, x11, x5
srl x6, x8, x6
srl x10, x11, x10
# LOOP 30 (depth 5, break at 5, max 6)
addi x11, x0, 6
addi x8, x0, 5
addi x1, x0, 0
loop_start_30:
or x6, x4, x6
j loop_exit_30  # Exit loop 5
sw x6, 852(x3)
sw x7, 248(x3)
sub x9, x9, x9
# LOOP 31 (depth 5, break at 4, max 9)
addi x1, x0, 9
addi x2, x0, 4
addi x10, x0, 0
loop_start_31:
sub x8, x10, x8
sw x8, 944(x3)
sw x5, 240(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x10, 496(x3)
srl x6, x10, x6
and x11, x6, x11
lw x7, 800(x3)
or x11, x4, x11
lw x11, 572(x3)
or x7, x1, x7
sw x7, 276(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x10, x11, x10
and x9, x11, x9
xor x6, x9, x6
lw x7, 240(x3)
lw x7, 996(x3)
sw x9, 788(x3)
xor x2, x1, x2
sw x2, 728(x3)
srl x9, x9, x9
sw x9, 204(x3)
and x11, x4, x11
lw x10, 668(x3)
lw x7, 148(x3)
sw x7, 784(x3)
j loop_exit_31  # Exit loop 5
or x6, x6, x6
j loop_exit_29  # Exit loop 4
# LOOP 32 (depth 4, break at 2, max 6)
addi x2, x0, 6
addi x5, x0, 2
addi x7, x0, 0
loop_start_32:
lw x7, 368(x3)
j loop_exit_32  # Exit loop 4
xor x7, x7, x7
lw x7, 628(x3)
j loop_exit_21  # Exit loop 3
add x9, x2, x9
sw x1, 324(x3)
sub x7, x8, x7
sub x2, x1, x2
# LOOP 33 (depth 3, break at 3, max 6)
addi x11, x0, 6
addi x5, x0, 3
addi x6, x0, 0
loop_start_33:
srl x7, x10, x7
sw x5, 84(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x1, x4, x1
lw x1, 868(x3)
sw x1, 136(x3)
# LOOP 34 (depth 4, break at 2, max 5)
addi x5, x0, 5
addi x6, x0, 2
addi x4, x0, 0
loop_start_34:
and x7, x4, x7
srl x5, x2, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x5, x5, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x2, x7, x2
j loop_exit_34  # Exit loop 4
lw x5, 412(x3)
sw x9, 568(x3)
j loop_exit_33  # Exit loop 3
and x9, x9, x9
add x7, x7, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 184(x3)
sw x7, 840(x3)
sw x11, 904(x3)
sw x11, 572(x3)
sub x2, x8, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_10  # Exit loop 2
xor x9, x7, x9
j loop_exit_1  # Exit loop 1
sll x6, x7, x6
or x6, x6, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 880(x3)
sw x1, 92(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x10, 204(x3)
lw x10, 892(x3)
# LOOP 35 (depth 1, break at 5, max 6)
addi x5, x0, 6
addi x9, x0, 5
addi x1, x0, 0
loop_start_35:
# LOOP 36 (depth 2, break at 4, max 6)
addi x10, x0, 6
addi x11, x0, 4
addi x8, x0, 0
loop_start_36:
# LOOP 37 (depth 3, break at 1, max 9)
addi x5, x0, 9
addi x11, x0, 1
addi x9, x0, 0
loop_start_37:
lw x7, 732(x3)
j loop_exit_37  # Exit loop 3
# LOOP 38 (depth 3, break at 3, max 5)
addi x2, x0, 5
addi x8, x0, 3
addi x11, x0, 0
loop_start_38:
lw x11, 848(x3)
sw x7, 596(x3)
sw x8, 376(x3)
# LOOP 39 (depth 4, break at 5, max 7)
addi x2, x0, 7
addi x6, x0, 5
addi x7, x0, 0
loop_start_39:
# LOOP 40 (depth 5, break at 5, max 6)
addi x10, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_40:
sw x4, 828(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x8, x11, x8
j loop_exit_40  # Exit loop 5
and x6, x2, x6
sw x6, 552(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_39  # Exit loop 4
sll x8, x8, x8
j loop_exit_38  # Exit loop 3
lw x8, 772(x3)
j loop_exit_36  # Exit loop 2
srl x6, x1, x6
# LOOP 41 (depth 2, break at 2, max 5)
addi x1, x0, 5
addi x7, x0, 2
addi x4, x0, 0
loop_start_41:
# LOOP 42 (depth 3, break at 4, max 6)
addi x7, x0, 6
addi x10, x0, 4
addi x6, x0, 0
loop_start_42:
sll x4, x6, x4
sw x9, 652(x3)
and x1, x8, x1
sw x2, 232(x3)
sw x5, 668(x3)
xor x5, x8, x5
# LOOP 43 (depth 4, break at 3, max 7)
addi x7, x0, 7
addi x2, x0, 3
addi x8, x0, 0
loop_start_43:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x7, x5, x7
sw x2, 144(x3)
sw x2, 272(x3)
sw x11, 208(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 44 (depth 5, break at 5, max 7)
addi x8, x0, 7
addi x9, x0, 5
addi x11, x0, 0
loop_start_44:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 616(x3)
sw x8, 776(x3)
lw x2, 772(x3)
lw x2, 852(x3)
add x7, x2, x7
lw x7, 296(x3)
sw x7, 708(x3)
# LOOP 45 (depth 6, break at 2, max 7)
addi x5, x0, 7
addi x1, x0, 2
addi x10, x0, 0
loop_start_45:
j loop_exit_45  # Exit loop 6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 276(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 516(x3)
srl x2, x2, x2
# LOOP 46 (depth 6, break at 1, max 9)
addi x5, x0, 9
addi x6, x0, 1
addi x11, x0, 0
loop_start_46:
xor x6, x11, x6
sw x6, 272(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 984(x3)
sw x4, 220(x3)
or x7, x7, x7
sll x5, x7, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 224(x3)
lw x5, 788(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 768(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x2, x2, x2
lw x6, 204(x3)
sw x1, 360(x3)
sw x11, 140(x3)
lw x5, 564(x3)
sw x10, 64(x3)
sw x6, 272(x3)
sw x9, 80(x3)
sub x4, x7, x4
sw x4, 324(x3)
sw x11, 480(x3)
sw x2, 320(x3)
sw x5, 364(x3)
j loop_exit_46  # Exit loop 6
sw x5, 624(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 992(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 568(x3)
lw x5, 0(x3)
# LOOP 47 (depth 6, break at 3, max 10)
addi x1, x0, 10
addi x11, x0, 3
addi x8, x0, 0
loop_start_47:
lw x8, 792(x3)
sw x5, 800(x3)
lw x10, 392(x3)
j loop_exit_47  # Exit loop 6
lw x10, 296(x3)
add x7, x7, x7
or x1, x2, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 948(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 100(x3)
sw x6, 88(x3)
sw x8, 412(x3)
lw x5, 532(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x8, 388(x3)
or x10, x11, x10
sw x10, 460(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 188(x3)
sw x7, 384(x3)
sub x5, x6, x5
sw x5, 108(x3)
lw x4, 376(x3)
or x6, x4, x6
lw x6, 148(x3)
sw x1, 852(x3)
sll x8, x10, x8
and x10, x1, x10
sub x10, x10, x10
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x10, 96(x3)
lw x7, 320(x3)
# LOOP 48 (depth 6, break at 3, max 10)
addi x9, x0, 10
addi x10, x0, 3
addi x4, x0, 0
loop_start_48:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x1, x8, x1
xor x2, x1, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 688(x3)
and x4, x10, x4
sw x4, 228(x3)
lw x9, 248(x3)
lw x9, 136(x3)
and x2, x1, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x10, x5, x10
sub x6, x6, x6
sw x6, 468(x3)
sll x2, x9, x2
sw x5, 0(x3)
sw x4, 844(x3)
j loop_exit_48  # Exit loop 6
sw x10, 212(x3)
sw x1, 196(x3)
lw x1, 264(x3)
xor x10, x6, x10
add x11, x9, x11
sw x10, 996(x3)
sw x7, 552(x3)
lw x2, 260(x3)
sw x2, 944(x3)
j loop_exit_44  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x9, 256(x3)
lw x9, 588(x3)
lw x8, 300(x3)
j loop_exit_43  # Exit loop 4
sw x1, 564(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x5, x10, x5
sw x11, 444(x3)
# LOOP 49 (depth 4, break at 2, max 5)
addi x9, x0, 5
addi x1, x0, 2
addi x10, x0, 0
loop_start_49:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 50 (depth 5, break at 5, max 9)
addi x6, x0, 9
addi x4, x0, 5
addi x8, x0, 0
loop_start_50:
sw x4, 776(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 51 (depth 6, break at 5, max 7)
addi x5, x0, 7
addi x9, x0, 5
addi x6, x0, 0
loop_start_51:
and x11, x6, x11
srl x4, x11, x4
sw x4, 108(x3)
sw x11, 612(x3)
sub x10, x6, x10
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x9, x6, x9
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x6, x9, x6
lw x10, 212(x3)
sw x5, 896(x3)
sub x9, x4, x9
j loop_exit_51  # Exit loop 6
sw x9, 428(x3)
and x6, x7, x6
j loop_exit_50  # Exit loop 5
sll x2, x2, x2
j loop_exit_49  # Exit loop 4
sw x5, 412(x3)
# LOOP 52 (depth 4, break at 1, max 6)
addi x8, x0, 6
addi x5, x0, 1
addi x9, x0, 0
loop_start_52:
# LOOP 53 (depth 5, break at 2, max 8)
addi x6, x0, 8
addi x5, x0, 2
addi x8, x0, 0
loop_start_53:
lw x2, 464(x3)
srl x6, x7, x6
lw x7, 376(x3)
sw x9, 636(x3)
and x11, x9, x11
j loop_exit_53  # Exit loop 5
lw x8, 340(x3)
lw x8, 988(x3)
sw x8, 8(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x1, x2
sw x6, 492(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x5, x9, x5
lw x5, 416(x3)
lw x6, 676(x3)
j loop_exit_52  # Exit loop 4
lw x11, 748(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 420(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x7, x4, x7
sll x11, x4, x11
sw x9, 420(x3)
lw x2, 408(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x6, x10, x6
# LOOP 54 (depth 4, break at 3, max 6)
addi x1, x0, 6
addi x10, x0, 3
addi x9, x0, 0
loop_start_54:
# LOOP 55 (depth 5, break at 4, max 5)
addi x6, x0, 5
addi x1, x0, 4
addi x4, x0, 0
loop_start_55:
sub x1, x8, x1
sw x11, 660(x3)
srl x10, x9, x10
lw x10, 596(x3)
sll x1, x10, x1
add x6, x1, x6
lw x5, 476(x3)
j loop_exit_55  # Exit loop 5
sw x10, 624(x3)
lw x11, 588(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 516(x3)
xor x2, x6, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x5, x2, x5
sw x5, 740(x3)
# LOOP 56 (depth 5, break at 1, max 3)
addi x9, x0, 3
addi x11, x0, 1
addi x8, x0, 0
loop_start_56:
lw x11, 860(x3)
or x8, x10, x8
sw x4, 956(x3)
sw x10, 4(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 324(x3)
j loop_exit_56  # Exit loop 5
sw x4, 456(x3)
sw x6, 364(x3)
lw x6, 288(x3)
sw x6, 980(x3)
sw x1, 440(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 760(x3)
and x10, x11, x10
lw x5, 868(x3)
sll x7, x1, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 948(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_54  # Exit loop 4
lw x7, 0(x3)
j loop_exit_42  # Exit loop 3
sw x6, 96(x3)
# LOOP 57 (depth 3, break at 3, max 8)
addi x1, x0, 8
addi x2, x0, 3
addi x9, x0, 0
loop_start_57:
j loop_exit_57  # Exit loop 3
sub x7, x7, x7
and x11, x7, x11
or x7, x2, x7
and x11, x6, x11
lw x11, 604(x3)
lw x2, 824(x3)
sw x2, 968(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x11, 588(x3)
# LOOP 58 (depth 3, break at 1, max 6)
addi x6, x0, 6
addi x5, x0, 1
addi x8, x0, 0
loop_start_58:
sw x6, 916(x3)
srl x7, x11, x7
lw x1, 80(x3)
and x7, x4, x7
lw x7, 552(x3)
# LOOP 59 (depth 4, break at 3, max 10)
addi x11, x0, 10
addi x8, x0, 3
addi x2, x0, 0
loop_start_59:
j loop_exit_59  # Exit loop 4
lw x2, 896(x3)
sw x10, 312(x3)
# LOOP 60 (depth 4, break at 1, max 6)
addi x11, x0, 6
addi x5, x0, 1
addi x6, x0, 0
loop_start_60:
sub x11, x9, x11
# LOOP 61 (depth 5, break at 4, max 8)
addi x1, x0, 8
addi x7, x0, 4
addi x8, x0, 0
loop_start_61:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 62 (depth 6, break at 2, max 5)
addi x1, x0, 5
addi x4, x0, 2
addi x7, x0, 0
loop_start_62:
lw x5, 820(x3)
srl x9, x8, x9
sll x2, x2, x2
sw x2, 652(x3)
sub x8, x4, x8
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 660(x3)
j loop_exit_62  # Exit loop 6
sw x2, 428(x3)
sll x5, x9, x5
sub x9, x7, x9
or x4, x10, x4
j loop_exit_61  # Exit loop 5
j loop_exit_60  # Exit loop 4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 588(x3)
# LOOP 63 (depth 4, break at 1, max 8)
addi x5, x0, 8
addi x11, x0, 1
addi x9, x0, 0
loop_start_63:
sub x2, x5, x2
# LOOP 64 (depth 5, break at 4, max 7)
addi x5, x0, 7
addi x9, x0, 4
addi x11, x0, 0
loop_start_64:
j loop_exit_64  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x11, 848(x3)
j loop_exit_63  # Exit loop 4
sub x8, x9, x8
sw x8, 932(x3)
xor x5, x1, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 584(x3)
lw x9, 328(x3)
lw x10, 972(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_58  # Exit loop 3
# LOOP 65 (depth 3, break at 4, max 9)
addi x1, x0, 9
addi x8, x0, 4
addi x7, x0, 0
loop_start_65:
sll x5, x11, x5
sw x8, 96(x3)
sw x8, 600(x3)
sw x6, 244(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_65  # Exit loop 3
lw x9, 544(x3)
lw x1, 60(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_41  # Exit loop 2
# LOOP 66 (depth 2, break at 4, max 9)
addi x10, x0, 9
addi x2, x0, 4
addi x9, x0, 0
loop_start_66:
# LOOP 67 (depth 3, break at 5, max 10)
addi x1, x0, 10
addi x7, x0, 5
addi x2, x0, 0
loop_start_67:
lw x2, 896(x3)
sw x5, 504(x3)
lw x9, 300(x3)
sw x4, 912(x3)
sw x5, 500(x3)
# LOOP 68 (depth 4, break at 4, max 9)
addi x10, x0, 9
addi x5, x0, 4
addi x7, x0, 0
loop_start_68:
lw x7, 100(x3)
sw x7, 804(x3)
lw x8, 464(x3)
add x9, x5, x9
sw x9, 356(x3)
lw x5, 764(x3)
j loop_exit_68  # Exit loop 4
and x8, x5, x8
# LOOP 69 (depth 4, break at 5, max 9)
addi x6, x0, 9
addi x9, x0, 5
addi x5, x0, 0
loop_start_69:
sw x5, 412(x3)
sub x7, x1, x7
lw x8, 968(x3)
sw x11, 908(x3)
lw x1, 168(x3)
lw x9, 640(x3)
sw x9, 140(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_69  # Exit loop 4
sw x8, 988(x3)
lw x2, 328(x3)
# LOOP 70 (depth 4, break at 1, max 7)
addi x9, x0, 7
addi x6, x0, 1
addi x1, x0, 0
loop_start_70:
add x6, x2, x6
sll x8, x6, x8
sw x7, 348(x3)
j loop_exit_70  # Exit loop 4
or x11, x2, x11
add x6, x4, x6
lw x6, 224(x3)
sw x5, 456(x3)
and x9, x5, x9
lw x6, 448(x3)
sw x6, 544(x3)
sw x2, 212(x3)
lw x1, 416(x3)
add x7, x9, x7
lw x7, 148(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 140(x3)
sw x4, 980(x3)
sub x4, x11, x4
srl x7, x7, x7
sw x1, 536(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x8, x2, x8
sw x2, 88(x3)
sll x6, x6, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x9, x4, x9
sw x9, 624(x3)
# LOOP 71 (depth 4, break at 2, max 8)
addi x11, x0, 8
addi x1, x0, 2
addi x10, x0, 0
loop_start_71:
sw x10, 920(x3)
# LOOP 72 (depth 5, break at 5, max 9)
addi x4, x0, 9
addi x11, x0, 5
addi x2, x0, 0
loop_start_72:
j loop_exit_72  # Exit loop 5
sw x2, 464(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_71  # Exit loop 4
xor x7, x4, x7
sw x7, 440(x3)
j loop_exit_67  # Exit loop 3
sw x11, 944(x3)
sw x4, 780(x3)
lw x6, 864(x3)
# LOOP 73 (depth 3, break at 5, max 8)
addi x8, x0, 8
addi x7, x0, 5
addi x10, x0, 0
loop_start_73:
or x8, x11, x8
sw x8, 672(x3)
sw x7, 252(x3)
sll x4, x1, x4
sw x1, 364(x3)
j loop_exit_73  # Exit loop 3
sw x2, 912(x3)
lw x9, 760(x3)
sw x4, 968(x3)
sw x6, 692(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_66  # Exit loop 2
lw x5, 280(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sll x2, x2, x2
# LOOP 74 (depth 2, break at 4, max 7)
addi x5, x0, 7
addi x11, x0, 4
addi x9, x0, 0
loop_start_74:
# LOOP 75 (depth 3, break at 4, max 7)
addi x1, x0, 7
addi x8, x0, 4
addi x7, x0, 0
loop_start_75:
# LOOP 76 (depth 4, break at 5, max 7)
addi x6, x0, 7
addi x4, x0, 5
addi x10, x0, 0
loop_start_76:
srl x10, x10, x10
lw x7, 256(x3)
and x6, x10, x6
and x9, x6, x9
lw x6, 736(x3)
sw x8, 584(x3)
lw x8, 760(x3)
sw x8, 932(x3)
sll x9, x11, x9
lw x9, 736(x3)
sw x7, 792(x3)
lw x10, 684(x3)
add x4, x10, x4
or x8, x9, x8
# LOOP 77 (depth 5, break at 2, max 4)
addi x10, x0, 4
addi x1, x0, 2
addi x9, x0, 0
loop_start_77:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 376(x3)
add x6, x7, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x1, x5, x1
j loop_exit_77  # Exit loop 5
j loop_exit_76  # Exit loop 4
# LOOP 78 (depth 4, break at 2, max 4)
addi x10, x0, 4
addi x8, x0, 2
addi x4, x0, 0
loop_start_78:
lw x1, 284(x3)
sw x6, 472(x3)
j loop_exit_78  # Exit loop 4
sw x4, 352(x3)
sw x11, 328(x3)
srl x8, x10, x8
j loop_exit_75  # Exit loop 3
sw x2, 996(x3)
sll x1, x10, x1
j loop_exit_74  # Exit loop 2
and x1, x1, x1
sub x7, x2, x7
lw x7, 360(x3)
sw x7, 908(x3)
j loop_exit_35  # Exit loop 1
# LOOP 79 (depth 1, break at 3, max 9)
addi x9, x0, 9
addi x6, x0, 3
addi x5, x0, 0
loop_start_79:
# LOOP 80 (depth 2, break at 1, max 4)
addi x11, x0, 4
addi x10, x0, 1
addi x4, x0, 0
loop_start_80:
sw x5, 988(x3)
# LOOP 81 (depth 3, break at 4, max 7)
addi x8, x0, 7
addi x10, x0, 4
addi x2, x0, 0
loop_start_81:
sll x4, x2, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x1, x4, x1
lw x9, 184(x3)
sw x1, 688(x3)
sll x8, x10, x8
# LOOP 82 (depth 4, break at 5, max 7)
addi x4, x0, 7
addi x9, x0, 5
addi x7, x0, 0
loop_start_82:
j loop_exit_82  # Exit loop 4
# LOOP 83 (depth 4, break at 5, max 7)
addi x4, x0, 7
addi x2, x0, 5
addi x10, x0, 0
loop_start_83:
# LOOP 84 (depth 5, break at 1, max 8)
addi x6, x0, 8
addi x4, x0, 1
addi x5, x0, 0
loop_start_84:
srl x2, x8, x2
sw x5, 504(x3)
# LOOP 85 (depth 6, break at 2, max 10)
addi x10, x0, 10
addi x4, x0, 2
addi x6, x0, 0
loop_start_85:
j loop_exit_85  # Exit loop 6
sw x6, 108(x3)
j loop_exit_84  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_83  # Exit loop 4
sw x8, 980(x3)
sw x1, 288(x3)
# LOOP 86 (depth 4, break at 5, max 7)
addi x7, x0, 7
addi x8, x0, 5
addi x10, x0, 0
loop_start_86:
srl x7, x4, x7
# LOOP 87 (depth 5, break at 2, max 8)
addi x9, x0, 8
addi x11, x0, 2
addi x5, x0, 0
loop_start_87:
and x6, x5, x6
sw x5, 676(x3)
lw x2, 188(x3)
and x4, x2, x4
sw x1, 540(x3)
or x7, x11, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x9, x7, x9
lw x7, 40(x3)
sw x10, 268(x3)
lw x2, 372(x3)
sw x7, 84(x3)
sw x11, 336(x3)
sub x9, x1, x9
sw x9, 16(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x10, x7, x10
j loop_exit_87  # Exit loop 5
# LOOP 88 (depth 5, break at 4, max 5)
addi x7, x0, 5
addi x8, x0, 4
addi x9, x0, 0
loop_start_88:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 89 (depth 6, break at 4, max 9)
addi x10, x0, 9
addi x2, x0, 4
addi x7, x0, 0
loop_start_89:
sw x7, 156(x3)
sw x4, 988(x3)
sw x11, 296(x3)
lw x4, 720(x3)
or x7, x11, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 764(x3)
sw x7, 868(x3)
lw x5, 784(x3)
lw x7, 336(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x11, 152(x3)
lw x11, 152(x3)
lw x11, 960(x3)
sw x5, 644(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 320(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x9, x5, x9
sw x9, 660(x3)
sw x8, 52(x3)
sw x10, 228(x3)
lw x1, 56(x3)
add x9, x9, x9
lw x9, 796(x3)
sll x6, x6, x6
or x9, x2, x9
sw x9, 568(x3)
sw x5, 432(x3)
sw x1, 216(x3)
sw x1, 772(x3)
j loop_exit_89  # Exit loop 6
sll x4, x11, x4
sw x4, 988(x3)
sw x7, 284(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_88  # Exit loop 5
and x6, x9, x6
# LOOP 90 (depth 5, break at 2, max 10)
addi x2, x0, 10
addi x4, x0, 2
addi x5, x0, 0
loop_start_90:
sll x11, x5, x11
# LOOP 91 (depth 6, break at 2, max 3)
addi x6, x0, 3
addi x2, x0, 2
addi x8, x0, 0
loop_start_91:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x2, x9, x2
xor x1, x9, x1
sw x8, 832(x3)
sw x7, 368(x3)
sw x10, 356(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_91  # Exit loop 6
sw x8, 700(x3)
sw x9, 320(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x9, 660(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x2, x10, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x9, 388(x3)
lw x11, 248(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 632(x3)
j loop_exit_90  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 220(x3)
sw x2, 404(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 996(x3)
# LOOP 92 (depth 5, break at 2, max 6)
addi x5, x0, 6
addi x1, x0, 2
addi x4, x0, 0
loop_start_92:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x11, x4, x11
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x10, 12(x3)
srl x11, x11, x11
sw x11, 992(x3)
sw x1, 964(x3)
lw x1, 596(x3)
j loop_exit_92  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x8, 368(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x11, 700(x3)
sw x2, 496(x3)
lw x5, 224(x3)
lw x1, 44(x3)
sw x1, 272(x3)
sw x5, 388(x3)
xor x6, x2, x6
sw x4, 780(x3)
# LOOP 93 (depth 5, break at 5, max 9)
addi x5, x0, 9
addi x4, x0, 5
addi x1, x0, 0
loop_start_93:
sw x2, 520(x3)
lw x5, 340(x3)
lw x7, 684(x3)
sw x7, 420(x3)
lw x4, 256(x3)
sw x10, 968(x3)
sw x2, 748(x3)
sw x8, 900(x3)
j loop_exit_93  # Exit loop 5
sw x8, 704(x3)
lw x1, 212(x3)
j loop_exit_86  # Exit loop 4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 48(x3)
add x10, x8, x10
add x7, x10, x7
# LOOP 94 (depth 4, break at 3, max 8)
addi x4, x0, 8
addi x6, x0, 3
addi x1, x0, 0
loop_start_94:
lw x6, 904(x3)
j loop_exit_94  # Exit loop 4
sw x6, 32(x3)
sw x11, 820(x3)
sw x5, 36(x3)
# LOOP 95 (depth 4, break at 5, max 8)
addi x2, x0, 8
addi x10, x0, 5
addi x9, x0, 0
loop_start_95:
j loop_exit_95  # Exit loop 4
lw x9, 72(x3)
xor x4, x9, x4
sw x1, 420(x3)
# LOOP 96 (depth 4, break at 4, max 10)
addi x8, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_96:
lw x6, 780(x3)
sw x8, 208(x3)
lw x11, 676(x3)
j loop_exit_96  # Exit loop 4
or x5, x11, x5
add x11, x5, x11
# LOOP 97 (depth 4, break at 5, max 8)
addi x1, x0, 8
addi x2, x0, 5
addi x10, x0, 0
loop_start_97:
sw x7, 28(x3)
lw x6, 596(x3)
or x2, x1, x2
sw x2, 348(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x9, x4, x9
sw x2, 888(x3)
and x10, x1, x10
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 612(x3)
sw x2, 720(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 98 (depth 5, break at 3, max 8)
addi x6, x0, 8
addi x9, x0, 3
addi x5, x0, 0
loop_start_98:
sw x5, 204(x3)
lw x10, 456(x3)
# LOOP 99 (depth 6, break at 5, max 8)
addi x9, x0, 8
addi x8, x0, 5
addi x2, x0, 0
loop_start_99:
j loop_exit_99  # Exit loop 6
lw x9, 444(x3)
lw x9, 424(x3)
lw x9, 524(x3)
or x1, x1, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_98  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_97  # Exit loop 4
sw x1, 984(x3)
sw x4, 752(x3)
# LOOP 100 (depth 4, break at 1, max 4)
addi x6, x0, 4
addi x2, x0, 1
addi x8, x0, 0
loop_start_100:
# LOOP 101 (depth 5, break at 4, max 9)
addi x1, x0, 9
addi x5, x0, 4
addi x6, x0, 0
loop_start_101:
j loop_exit_101  # Exit loop 5
sub x7, x6, x7
# LOOP 102 (depth 5, break at 1, max 9)
addi x2, x0, 9
addi x5, x0, 1
addi x6, x0, 0
loop_start_102:
lw x9, 792(x3)
j loop_exit_102  # Exit loop 5
sw x9, 300(x3)
and x10, x2, x10
sll x4, x1, x4
sub x11, x4, x11
xor x6, x9, x6
j loop_exit_100  # Exit loop 4
sw x6, 232(x3)
lw x1, 784(x3)
lw x6, 404(x3)
lw x6, 584(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 103 (depth 4, break at 3, max 5)
addi x7, x0, 5
addi x1, x0, 3
addi x2, x0, 0
loop_start_103:
lw x2, 644(x3)
lw x7, 116(x3)
sw x6, 956(x3)
xor x4, x1, x4
lw x2, 168(x3)
sll x8, x2, x8
or x1, x6, x1
sw x2, 876(x3)
srl x2, x4, x2
# LOOP 104 (depth 5, break at 4, max 10)
addi x9, x0, 10
addi x4, x0, 4
addi x5, x0, 0
loop_start_104:
sub x1, x5, x1
j loop_exit_104  # Exit loop 5
add x10, x1, x10
lw x5, 900(x3)
lw x11, 212(x3)
# LOOP 105 (depth 5, break at 2, max 3)
addi x7, x0, 3
addi x4, x0, 2
addi x8, x0, 0
loop_start_105:
j loop_exit_105  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x2, x1, x2
sw x2, 588(x3)
lw x9, 280(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 488(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x1, x9, x1
lw x7, 520(x3)
lw x11, 564(x3)
sw x11, 932(x3)
sub x5, x2, x5
sub x5, x5, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 988(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x6, x7, x6
sw x6, 820(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 106 (depth 5, break at 3, max 5)
addi x7, x0, 5
addi x8, x0, 3
addi x5, x0, 0
loop_start_106:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x10, x8, x10
lw x6, 1000(x3)
sw x9, 580(x3)
sw x9, 72(x3)
sw x10, 772(x3)
sw x4, 952(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x11, 420(x3)
sll x5, x5, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 480(x3)
sw x8, 300(x3)
sll x7, x4, x7
j loop_exit_106  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 892(x3)
lw x11, 692(x3)
sw x2, 492(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 236(x3)
lw x7, 496(x3)
j loop_exit_103  # Exit loop 4
xor x10, x1, x10
lw x9, 304(x3)
# LOOP 107 (depth 4, break at 4, max 6)
addi x8, x0, 6
addi x7, x0, 4
addi x5, x0, 0
loop_start_107:
j loop_exit_107  # Exit loop 4
sw x1, 540(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_81  # Exit loop 3
j loop_exit_80  # Exit loop 2
or x7, x7, x7
sw x7, 44(x3)
and x8, x11, x8
lw x8, 876(x3)
# LOOP 108 (depth 2, break at 3, max 9)
addi x6, x0, 9
addi x9, x0, 3
addi x1, x0, 0
loop_start_108:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 76(x3)
lw x1, 256(x3)
sll x10, x6, x10
add x4, x7, x4
srl x11, x9, x11
# LOOP 109 (depth 3, break at 2, max 3)
addi x10, x0, 3
addi x4, x0, 2
addi x2, x0, 0
loop_start_109:
lw x2, 960(x3)
sw x8, 168(x3)
# LOOP 110 (depth 4, break at 1, max 2)
addi x4, x0, 2
addi x5, x0, 1
addi x6, x0, 0
loop_start_110:
lw x6, 236(x3)
lw x2, 376(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 308(x3)
sw x10, 492(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_110  # Exit loop 4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x7, x10, x7
sw x5, 764(x3)
sw x11, 608(x3)
xor x11, x11, x11
sw x7, 112(x3)
sw x9, 908(x3)
sll x7, x5, x7
j loop_exit_109  # Exit loop 3
add x6, x10, x6
and x2, x2, x2
sw x2, 896(x3)
lw x10, 348(x3)
# LOOP 111 (depth 3, break at 2, max 4)
addi x4, x0, 4
addi x11, x0, 2
addi x9, x0, 0
loop_start_111:
sll x7, x5, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 688(x3)
sll x10, x7, x10
sw x10, 148(x3)
j loop_exit_111  # Exit loop 3
lw x6, 800(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 536(x3)
sw x1, 436(x3)
or x1, x5, x1
sw x7, 824(x3)
lw x4, 484(x3)
srl x6, x4, x6
and x5, x10, x5
sw x10, 440(x3)
or x4, x11, x4
sw x4, 972(x3)
lw x9, 700(x3)
j loop_exit_108  # Exit loop 2
xor x5, x11, x5
# LOOP 112 (depth 2, break at 4, max 7)
addi x2, x0, 7
addi x11, x0, 4
addi x9, x0, 0
loop_start_112:
xor x11, x9, x11
lw x4, 28(x3)
or x1, x8, x1
and x11, x1, x11
# LOOP 113 (depth 3, break at 3, max 4)
addi x8, x0, 4
addi x7, x0, 3
addi x2, x0, 0
loop_start_113:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 8(x3)
j loop_exit_113  # Exit loop 3
j loop_exit_112  # Exit loop 2
sw x11, 220(x3)
# LOOP 114 (depth 2, break at 1, max 8)
addi x7, x0, 8
addi x4, x0, 1
addi x5, x0, 0
loop_start_114:
j loop_exit_114  # Exit loop 2
j loop_exit_79  # Exit loop 1
lw x10, 20(x3)
# LOOP 115 (depth 1, break at 2, max 8)
addi x6, x0, 8
addi x2, x0, 2
addi x5, x0, 0
loop_start_115:
sw x5, 864(x3)
sw x4, 608(x3)
lw x11, 828(x3)
and x10, x8, x10
j loop_exit_115  # Exit loop 1
# LOOP 116 (depth 1, break at 5, max 10)
addi x8, x0, 10
addi x5, x0, 5
addi x7, x0, 0
loop_start_116:
j loop_exit_116  # Exit loop 1
sub x5, x7, x5
srl x2, x5, x2
add x10, x6, x10
# LOOP 117 (depth 1, break at 5, max 7)
addi x6, x0, 7
addi x9, x0, 5
addi x2, x0, 0
loop_start_117:
sw x7, 12(x3)
sw x6, 912(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x1, x7, x1
# LOOP 118 (depth 2, break at 1, max 8)
addi x6, x0, 8
addi x7, x0, 1
addi x11, x0, 0
loop_start_118:
lw x9, 64(x3)
sw x9, 0(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_118  # Exit loop 2
sw x4, 868(x3)
add x6, x11, x6
srl x4, x9, x4
sw x4, 664(x3)
sw x5, 300(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x9, 456(x3)
# LOOP 119 (depth 2, break at 3, max 10)
addi x11, x0, 10
addi x10, x0, 3
addi x5, x0, 0
loop_start_119:
# LOOP 120 (depth 3, break at 2, max 6)
addi x9, x0, 6
addi x4, x0, 2
addi x11, x0, 0
loop_start_120:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 121 (depth 4, break at 4, max 6)
addi x10, x0, 6
addi x9, x0, 4
addi x2, x0, 0
loop_start_121:
lw x9, 248(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x1, x9, x1
sw x5, 112(x3)
add x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 122 (depth 5, break at 5, max 6)
addi x9, x0, 6
addi x1, x0, 5
addi x8, x0, 0
loop_start_122:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 536(x3)
and x1, x11, x1
sub x8, x1, x8
j loop_exit_122  # Exit loop 5
add x4, x8, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x4, 36(x3)
lw x6, 164(x3)
sw x1, 656(x3)
sw x10, 480(x3)
sub x5, x1, x5
sw x5, 52(x3)
and x2, x10, x2
# LOOP 123 (depth 5, break at 4, max 9)
addi x1, x0, 9
addi x7, x0, 4
addi x5, x0, 0
loop_start_123:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 104(x3)
j loop_exit_123  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x11, 204(x3)
j loop_exit_121  # Exit loop 4
# LOOP 124 (depth 4, break at 4, max 9)
addi x8, x0, 9
addi x4, x0, 4
addi x10, x0, 0
loop_start_124:
sw x1, 52(x3)
sw x5, 804(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 644(x3)
xor x11, x7, x11
srl x7, x9, x7
sub x2, x7, x2
sw x2, 544(x3)
sw x4, 336(x3)
sw x6, 512(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x4, x9, x4
sw x9, 712(x3)
sll x5, x7, x5
add x7, x1, x7
sw x8, 464(x3)
sw x10, 424(x3)
sw x5, 976(x3)
sw x9, 412(x3)
xor x9, x1, x9
or x1, x11, x1
sw x1, 552(x3)
sw x9, 352(x3)
sw x8, 332(x3)
lw x11, 28(x3)
add x7, x10, x7
j loop_exit_124  # Exit loop 4
xor x5, x9, x5
sw x5, 988(x3)
and x7, x6, x7
sw x8, 436(x3)
j loop_exit_120  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x5, x8, x5
sw x4, 36(x3)
sw x6, 656(x3)
lw x10, 584(x3)
sw x10, 268(x3)
# LOOP 125 (depth 3, break at 2, max 8)
addi x9, x0, 8
addi x4, x0, 2
addi x1, x0, 0
loop_start_125:
# LOOP 126 (depth 4, break at 3, max 6)
addi x6, x0, 6
addi x4, x0, 3
addi x11, x0, 0
loop_start_126:
srl x5, x4, x5
# LOOP 127 (depth 5, break at 4, max 9)
addi x4, x0, 9
addi x8, x0, 4
addi x10, x0, 0
loop_start_127:
sw x8, 296(x3)
j loop_exit_127  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 476(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 652(x3)
# LOOP 128 (depth 5, break at 4, max 6)
addi x4, x0, 6
addi x8, x0, 4
addi x11, x0, 0
loop_start_128:
j loop_exit_128  # Exit loop 5
j loop_exit_126  # Exit loop 4
sw x11, 800(x3)
j loop_exit_125  # Exit loop 3
# LOOP 129 (depth 3, break at 1, max 3)
addi x5, x0, 3
addi x10, x0, 1
addi x2, x0, 0
loop_start_129:
sw x2, 44(x3)
j loop_exit_129  # Exit loop 3
lw x1, 412(x3)
lw x7, 80(x3)
j loop_exit_119  # Exit loop 2
j loop_exit_117  # Exit loop 1
add x6, x10, x6
add x7, x10, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x2, x11, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 130 (depth 1, break at 3, max 7)
addi x1, x0, 7
addi x11, x0, 3
addi x6, x0, 0
loop_start_130:
j loop_exit_130  # Exit loop 1
# LOOP 131 (depth 1, break at 2, max 9)
addi x1, x0, 9
addi x7, x0, 2
addi x8, x0, 0
loop_start_131:
or x5, x7, x5
# LOOP 132 (depth 2, break at 1, max 8)
addi x9, x0, 8
addi x10, x0, 1
addi x4, x0, 0
loop_start_132:
add x9, x6, x9
add x2, x10, x2
# LOOP 133 (depth 3, break at 5, max 10)
addi x10, x0, 10
addi x4, x0, 5
addi x5, x0, 0
loop_start_133:
# LOOP 134 (depth 4, break at 3, max 7)
addi x10, x0, 7
addi x4, x0, 3
addi x9, x0, 0
loop_start_134:
sw x9, 840(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 56(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x7, x1, x7
xor x4, x7, x4
add x5, x9, x5
sw x1, 880(x3)
sll x6, x11, x6
xor x11, x8, x11
sw x10, 700(x3)
sll x1, x1, x1
sw x1, 856(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x2, x4, x2
sw x11, 288(x3)
sub x1, x7, x1
sw x2, 892(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 135 (depth 5, break at 3, max 4)
addi x10, x0, 4
addi x11, x0, 3
addi x5, x0, 0
loop_start_135:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x10, 992(x3)
sw x2, 632(x3)
lw x1, 16(x3)
lw x1, 292(x3)
sw x4, 300(x3)
and x11, x2, x11
or x9, x11, x9
sw x7, 116(x3)
sw x2, 260(x3)
lw x5, 100(x3)
sw x11, 548(x3)
j loop_exit_135  # Exit loop 5
sw x11, 592(x3)
sw x10, 968(x3)
lw x4, 628(x3)
sw x4, 816(x3)
sw x5, 560(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x2, x8, x2
srl x8, x4, x8
sw x10, 84(x3)
sub x6, x7, x6
add x7, x7, x7
sw x8, 288(x3)
sub x8, x2, x8
sw x8, 536(x3)
and x6, x5, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 420(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 404(x3)
sw x11, 580(x3)
srl x2, x2, x2
sw x8, 364(x3)
j loop_exit_134  # Exit loop 4
lw x4, 232(x3)
lw x4, 212(x3)
lw x4, 872(x3)
add x11, x4, x11
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x7, x10, x7
sw x7, 420(x3)
lw x11, 728(x3)
# LOOP 136 (depth 4, break at 3, max 5)
addi x1, x0, 5
addi x6, x0, 3
addi x2, x0, 0
loop_start_136:
sll x10, x2, x10
lw x10, 676(x3)
srl x10, x10, x10
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 480(x3)
sll x6, x4, x6
sub x2, x9, x2
lw x5, 452(x3)
j loop_exit_136  # Exit loop 4
# LOOP 137 (depth 4, break at 2, max 6)
addi x1, x0, 6
addi x8, x0, 2
addi x4, x0, 0
loop_start_137:
and x10, x4, x10
add x8, x10, x8
sw x11, 528(x3)
j loop_exit_137  # Exit loop 4
# LOOP 138 (depth 4, break at 2, max 6)
addi x7, x0, 6
addi x1, x0, 2
addi x10, x0, 0
loop_start_138:
lw x10, 656(x3)
sub x8, x1, x8
j loop_exit_138  # Exit loop 4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x10, 964(x3)
lw x9, 432(x3)
# LOOP 139 (depth 4, break at 3, max 4)
addi x6, x0, 4
addi x11, x0, 3
addi x8, x0, 0
loop_start_139:
or x7, x4, x7
lw x7, 504(x3)
srl x9, x2, x9
or x10, x8, x10
sw x10, 132(x3)
sw x2, 344(x3)
sw x4, 172(x3)
lw x11, 900(x3)
sw x11, 980(x3)
sw x9, 672(x3)
or x7, x4, x7
sw x6, 152(x3)
lw x9, 8(x3)
sw x5, 352(x3)
srl x11, x1, x11
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 748(x3)
# LOOP 140 (depth 5, break at 2, max 9)
addi x10, x0, 9
addi x2, x0, 2
addi x4, x0, 0
loop_start_140:
sw x8, 400(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 424(x3)
sub x1, x2, x1
sw x1, 284(x3)
lw x7, 104(x3)
sw x7, 748(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 696(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x11, 888(x3)
add x5, x4, x5
sub x9, x5, x9
sll x6, x2, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x1, x6, x1
add x1, x1, x1
sw x1, 128(x3)
and x7, x6, x7
sw x11, 648(x3)
sw x6, 788(x3)
add x8, x2, x8
sw x8, 740(x3)
# LOOP 141 (depth 6, break at 3, max 10)
addi x10, x0, 10
addi x6, x0, 3
addi x1, x0, 0
loop_start_141:
sw x7, 960(x3)
lw x7, 432(x3)
sll x5, x10, x5
lw x5, 176(x3)
sub x8, x5, x8
sw x11, 148(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 496(x3)
lw x10, 524(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_141  # Exit loop 6
lw x11, 72(x3)
xor x6, x11, x6
or x2, x6, x2
lw x9, 636(x3)
or x10, x2, x10
xor x11, x2, x11
sw x9, 496(x3)
j loop_exit_140  # Exit loop 5
j loop_exit_139  # Exit loop 4
xor x10, x1, x10
xor x6, x11, x6
sll x9, x6, x9
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 142 (depth 4, break at 3, max 6)
addi x1, x0, 6
addi x11, x0, 3
addi x8, x0, 0
loop_start_142:
# LOOP 143 (depth 5, break at 5, max 9)
addi x11, x0, 9
addi x6, x0, 5
addi x5, x0, 0
loop_start_143:
lw x2, 840(x3)
sw x2, 384(x3)
sll x6, x10, x6
lw x9, 900(x3)
sw x9, 52(x3)
lw x1, 204(x3)
lw x1, 100(x3)
sw x1, 172(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 596(x3)
# LOOP 144 (depth 6, break at 4, max 5)
addi x6, x0, 5
addi x9, x0, 4
addi x8, x0, 0
loop_start_144:
sw x10, 396(x3)
srl x10, x10, x10
lw x10, 904(x3)
lw x10, 344(x3)
lw x10, 460(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x10, x10, x10
lw x10, 236(x3)
sw x10, 440(x3)
sw x11, 416(x3)
sw x4, 416(x3)
lw x2, 280(x3)
lw x2, 520(x3)
sw x4, 224(x3)
sw x4, 180(x3)
sw x10, 456(x3)
lw x5, 504(x3)
sw x5, 120(x3)
sw x9, 472(x3)
sw x7, 520(x3)
sll x6, x10, x6
add x2, x11, x2
sw x7, 296(x3)
srl x8, x9, x8
lw x8, 900(x3)
sub x2, x9, x2
sw x7, 888(x3)
sub x11, x1, x11
sw x11, 536(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 692(x3)
lw x6, 240(x3)
xor x5, x6, x5
j loop_exit_144  # Exit loop 6
srl x8, x9, x8
lw x10, 204(x3)
lw x1, 504(x3)
# LOOP 145 (depth 6, break at 1, max 7)
addi x4, x0, 7
addi x5, x0, 1
addi x10, x0, 0
loop_start_145:
sub x8, x10, x8
add x5, x8, x5
or x7, x1, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 252(x3)
xor x8, x10, x8
or x5, x6, x5
srl x8, x6, x8
lw x8, 976(x3)
lw x9, 440(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x5, x10, x5
sw x2, 664(x3)
j loop_exit_145  # Exit loop 6
j loop_exit_143  # Exit loop 5
j loop_exit_142  # Exit loop 4
sw x4, 412(x3)
sw x6, 736(x3)
# LOOP 146 (depth 4, break at 4, max 9)
addi x11, x0, 9
addi x7, x0, 4
addi x1, x0, 0
loop_start_146:
j loop_exit_146  # Exit loop 4
sw x1, 976(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 147 (depth 4, break at 3, max 10)
addi x11, x0, 10
addi x7, x0, 3
addi x2, x0, 0
loop_start_147:
sw x6, 960(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x11, 656(x3)
lw x11, 532(x3)
sw x5, 304(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x5, x6, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 148 (depth 5, break at 3, max 9)
addi x7, x0, 9
addi x9, x0, 3
addi x11, x0, 0
loop_start_148:
add x1, x11, x1
sll x5, x10, x5
sw x4, 128(x3)
srl x4, x2, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x2, x7, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 596(x3)
sw x5, 356(x3)
or x4, x5, x4
lw x6, 228(x3)
sw x11, 888(x3)
sub x10, x4, x10
lw x10, 896(x3)
lw x6, 372(x3)
and x2, x6, x2
sw x2, 880(x3)
srl x4, x4, x4
sll x11, x4, x11
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 752(x3)
sw x2, 592(x3)
sw x4, 140(x3)
lw x5, 628(x3)
lw x2, 324(x3)
srl x1, x2, x1
sw x11, 852(x3)
# LOOP 149 (depth 6, break at 5, max 10)
addi x6, x0, 10
addi x11, x0, 5
addi x2, x0, 0
loop_start_149:
or x10, x7, x10
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x11, x10, x11
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x9, x6, x9
j loop_exit_149  # Exit loop 6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 150 (depth 6, break at 1, max 9)
addi x11, x0, 9
addi x2, x0, 1
addi x10, x0, 0
loop_start_150:
sw x4, 424(x3)
sw x8, 436(x3)
sw x4, 244(x3)
sw x8, 972(x3)
or x4, x8, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x9, 1000(x3)
sw x9, 776(x3)
add x2, x10, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 116(x3)
sw x6, 896(x3)
sw x5, 12(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 520(x3)
j loop_exit_150  # Exit loop 6
lw x1, 1000(x3)
# LOOP 151 (depth 6, break at 2, max 5)
addi x9, x0, 5
addi x5, x0, 2
addi x2, x0, 0
loop_start_151:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x9, x9, x9
sll x8, x9, x8
j loop_exit_151  # Exit loop 6
srl x4, x8, x4
sw x8, 840(x3)
lw x9, 204(x3)
sll x6, x1, x6
sw x4, 844(x3)
sw x4, 860(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 948(x3)
sw x4, 112(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 624(x3)
xor x8, x1, x8
lw x5, 404(x3)
sw x2, 848(x3)
sw x9, 736(x3)
sw x10, 916(x3)
sll x6, x1, x6
sw x5, 452(x3)
and x11, x5, x11
lw x6, 288(x3)
and x2, x6, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
srl x10, x2, x10
lw x5, 608(x3)
sll x5, x5, x5
lw x5, 188(x3)
sw x8, 108(x3)
lw x9, 32(x3)
sw x8, 692(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x10, 556(x3)
sw x6, 616(x3)
sw x10, 80(x3)
j loop_exit_148  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 152 (depth 5, break at 1, max 6)
addi x11, x0, 6
addi x10, x0, 1
addi x6, x0, 0
loop_start_152:
lw x7, 228(x3)
sw x11, 940(x3)
j loop_exit_152  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_147  # Exit loop 4
xor x6, x4, x6
j loop_exit_133  # Exit loop 3
xor x4, x6, x4
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 776(x3)
lw x8, 560(x3)
and x1, x11, x1
sll x9, x1, x9
and x8, x6, x8
# LOOP 153 (depth 3, break at 5, max 7)
addi x4, x0, 7
addi x5, x0, 5
addi x2, x0, 0
loop_start_153:
j loop_exit_153  # Exit loop 3
sub x1, x8, x1
lw x1, 864(x3)
lw x1, 552(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 154 (depth 3, break at 5, max 8)
addi x6, x0, 8
addi x9, x0, 5
addi x10, x0, 0
loop_start_154:
lw x6, 236(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 832(x3)
or x9, x9, x9
# LOOP 155 (depth 4, break at 3, max 7)
addi x4, x0, 7
addi x1, x0, 3
addi x6, x0, 0
loop_start_155:
sw x6, 832(x3)
lw x9, 284(x3)
xor x4, x1, x4
j loop_exit_155  # Exit loop 4
sw x9, 632(x3)
# LOOP 156 (depth 4, break at 5, max 9)
addi x5, x0, 9
addi x1, x0, 5
addi x8, x0, 0
loop_start_156:
lw x11, 44(x3)
# LOOP 157 (depth 5, break at 3, max 5)
addi x5, x0, 5
addi x2, x0, 3
addi x10, x0, 0
loop_start_157:
add x9, x9, x9
# LOOP 158 (depth 6, break at 2, max 4)
addi x2, x0, 4
addi x11, x0, 2
addi x10, x0, 0
loop_start_158:
addi x10, x10, 1
beq x10, x11, 8   # Break to skip next instruction
blt x10, x2, loop_start_158
loop_exit_158:
addi x10, x10, 1
beq x10, x2, 8   # Break to skip next instruction
blt x10, x5, loop_start_157
loop_exit_157:
addi x8, x8, 1
beq x8, x1, 8   # Break to skip next instruction
blt x8, x5, loop_start_156
loop_exit_156:
addi x10, x10, 1
beq x10, x9, 8   # Break to skip next instruction
blt x10, x6, loop_start_154
loop_exit_154:
addi x4, x4, 1
beq x4, x10, 8   # Break to skip next instruction
blt x4, x9, loop_start_132
loop_exit_132:
addi x8, x8, 1
beq x8, x7, 8   # Break to skip next instruction
blt x8, x1, loop_start_131
loop_exit_131:

# Program exit
addi a0, zero, 0     # Set exit code to 0
addi a7, zero, 93    # Exit syscall number
ecall
