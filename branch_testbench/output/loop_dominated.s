lui x3, 3
addi x3, x3, 0
# LOOP 1 (depth 1, break at 1, max 2)
addi x6, x0, 2
addi x9, x0, 1
addi x8, x0, 0
loop_start_1:
sw x8, 148(x3)
j loop_exit_1  # Exit loop 1
sw x9, 508(x3)
sw x5, 724(x3)
lw x6, 60(x3)
lw x2, 364(x3)
sw x8, 976(x3)
lw x9, 844(x3)
srl x8, x2, x8
lw x8, 940(x3)
sw x8, 888(x3)
sw x1, 560(x3)
# LOOP 2 (depth 1, break at 1, max 4)
addi x4, x0, 4
addi x7, x0, 1
addi x1, x0, 0
loop_start_2:
sw x1, 272(x3)
xor x2, x2, x2
# LOOP 3 (depth 2, break at 5, max 8)
addi x4, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_3:
sw x6, 496(x3)
lw x9, 780(x3)
sw x9, 588(x3)
lw x7, 768(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x7, 108(x3)
# LOOP 4 (depth 3, break at 3, max 4)
addi x1, x0, 4
addi x6, x0, 3
addi x9, x0, 0
loop_start_4:
srl x9, x9, x9
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 5 (depth 4, break at 4, max 10)
addi x4, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_5:
and x1, x6, x1
j loop_exit_5  # Exit loop 4
sw x9, 520(x3)
j loop_exit_4  # Exit loop 3
sw x7, 628(x3)
lw x2, 924(x3)
# LOOP 6 (depth 3, break at 5, max 10)
addi x9, x0, 10
addi x5, x0, 5
addi x8, x0, 0
loop_start_6:
or x6, x4, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x8, x8, x8
srl x1, x8, x1
sw x1, 388(x3)
or x7, x7, x7
# LOOP 7 (depth 4, break at 4, max 5)
addi x9, x0, 5
addi x5, x0, 4
addi x8, x0, 0
loop_start_7:
xor x8, x8, x8
sw x8, 232(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x1, 928(x3)
lw x1, 308(x3)
sw x1, 864(x3)
sll x6, x7, x6
or x7, x6, x7
sw x6, 736(x3)
sll x4, x8, x4
j loop_exit_7  # Exit loop 4
j loop_exit_6  # Exit loop 3
# LOOP 8 (depth 3, break at 4, max 6)
addi x8, x0, 6
addi x2, x0, 4
addi x7, x0, 0
loop_start_8:
srl x2, x5, x2
lw x7, 532(x3)
j loop_exit_8  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 9 (depth 3, break at 2, max 4)
addi x4, x0, 4
addi x6, x0, 2
addi x5, x0, 0
loop_start_9:
j loop_exit_9  # Exit loop 3
and x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 10 (depth 3, break at 2, max 7)
addi x1, x0, 7
addi x2, x0, 2
addi x5, x0, 0
loop_start_10:
sw x7, 628(x3)
add x8, x2, x8
sw x1, 504(x3)
# LOOP 11 (depth 4, break at 1, max 10)
addi x4, x0, 10
addi x2, x0, 1
addi x6, x0, 0
loop_start_11:
lw x6, 148(x3)
sw x6, 1000(x3)
lw x4, 372(x3)
sw x4, 784(x3)
lw x6, 240(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 232(x3)
sll x6, x4, x6
sw x4, 652(x3)
lw x5, 676(x3)
sw x5, 452(x3)
and x8, x2, x8
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x6, x7, x6
lw x5, 552(x3)
xor x7, x5, x7
sw x8, 92(x3)
or x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x7, 796(x3)
j loop_exit_11  # Exit loop 4
sll x9, x2, x9
lw x7, 968(x3)
sw x7, 136(x3)
j loop_exit_10  # Exit loop 3
and x6, x6, x6
sll x5, x7, x5
j loop_exit_3  # Exit loop 2
sub x4, x5, x4
sw x4, 1000(x3)
sw x1, 404(x3)
# LOOP 12 (depth 2, break at 1, max 10)
addi x2, x0, 10
addi x8, x0, 1
addi x5, x0, 0
loop_start_12:
sw x1, 264(x3)
sw x6, 88(x3)
lw x2, 968(x3)
# LOOP 13 (depth 3, break at 5, max 10)
addi x6, x0, 10
addi x1, x0, 5
addi x8, x0, 0
loop_start_13:
sll x2, x8, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x6, x4, x6
# LOOP 14 (depth 4, break at 5, max 9)
addi x9, x0, 9
addi x4, x0, 5
addi x8, x0, 0
loop_start_14:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x8, 952(x3)
sw x5, 368(x3)
xor x7, x7, x7
lw x7, 340(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 404(x3)
j loop_exit_14  # Exit loop 4
sw x2, 64(x3)
add x1, x8, x1
# LOOP 15 (depth 4, break at 1, max 2)
addi x4, x0, 2
addi x8, x0, 1
addi x6, x0, 0
loop_start_15:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x8, x9, x8
lw x5, 376(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x7, x5, x7
add x6, x7, x6
lw x6, 768(x3)
j loop_exit_15  # Exit loop 4
j loop_exit_13  # Exit loop 3
or x5, x6, x5
# LOOP 16 (depth 3, break at 2, max 10)
addi x1, x0, 10
addi x2, x0, 2
addi x4, x0, 0
loop_start_16:
or x6, x4, x6
j loop_exit_16  # Exit loop 3
lw x5, 124(x3)
lw x6, 572(x3)
# LOOP 17 (depth 3, break at 4, max 7)
addi x4, x0, 7
addi x1, x0, 4
addi x9, x0, 0
loop_start_17:
lw x9, 208(x3)
sw x5, 992(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 396(x3)
j loop_exit_17  # Exit loop 3
# LOOP 18 (depth 3, break at 2, max 6)
addi x2, x0, 6
addi x5, x0, 2
addi x1, x0, 0
loop_start_18:
sw x1, 344(x3)
add x8, x9, x8
lw x2, 764(x3)
lw x2, 84(x3)
lw x2, 52(x3)
lw x5, 572(x3)
lw x1, 652(x3)
sw x5, 560(x3)
xor x9, x7, x9
# LOOP 19 (depth 4, break at 2, max 9)
addi x1, x0, 9
addi x2, x0, 2
addi x5, x0, 0
loop_start_19:
sub x1, x5, x1
j loop_exit_19  # Exit loop 4
sw x4, 872(x3)
sw x4, 564(x3)
sw x5, 232(x3)
lw x2, 172(x3)
add x6, x4, x6
xor x5, x6, x5
sll x1, x7, x1
# LOOP 20 (depth 4, break at 3, max 7)
addi x6, x0, 7
addi x9, x0, 3
addi x4, x0, 0
loop_start_20:
sub x1, x4, x1
sll x8, x6, x8
sw x8, 736(x3)
sw x9, 972(x3)
sub x6, x4, x6
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x1, x4, x1
lw x6, 188(x3)
lw x7, 492(x3)
sw x9, 256(x3)
# LOOP 21 (depth 5, break at 1, max 9)
addi x5, x0, 9
addi x8, x0, 1
addi x4, x0, 0
loop_start_21:
lw x8, 400(x3)
j loop_exit_21  # Exit loop 5
lw x4, 456(x3)
sw x5, 740(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x2, x2, x2
sw x6, 696(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x5, 944(x3)
j loop_exit_20  # Exit loop 4
and x1, x1, x1
sw x4, 884(x3)
# LOOP 22 (depth 4, break at 3, max 10)
addi x5, x0, 10
addi x7, x0, 3
addi x9, x0, 0
loop_start_22:
sw x4, 740(x3)
sll x8, x6, x8
lw x7, 592(x3)
# LOOP 23 (depth 5, break at 3, max 5)
addi x1, x0, 5
addi x9, x0, 3
addi x8, x0, 0
loop_start_23:
lw x1, 60(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
add x6, x6, x6
j loop_exit_23  # Exit loop 5
j loop_exit_22  # Exit loop 4
srl x7, x6, x7
# LOOP 24 (depth 4, break at 2, max 7)
addi x8, x0, 7
addi x6, x0, 2
addi x4, x0, 0
loop_start_24:
sw x2, 348(x3)
srl x8, x5, x8
sub x6, x8, x6
j loop_exit_24  # Exit loop 4
j loop_exit_18  # Exit loop 3
or x8, x9, x8
j loop_exit_12  # Exit loop 2
j loop_exit_2  # Exit loop 1
srl x5, x4, x5
# LOOP 25 (depth 1, break at 1, max 9)
addi x4, x0, 9
addi x7, x0, 1
addi x1, x0, 0
loop_start_25:
j loop_exit_25  # Exit loop 1
and x4, x6, x4
# LOOP 26 (depth 1, break at 3, max 8)
addi x2, x0, 8
addi x8, x0, 3
addi x6, x0, 0
loop_start_26:
j loop_exit_26  # Exit loop 1
sw x6, 248(x3)
sw x9, 820(x3)
sw x4, 544(x3)
lw x8, 32(x3)
sub x4, x7, x4
or x9, x4, x9
# LOOP 27 (depth 1, break at 4, max 5)
addi x7, x0, 5
addi x2, x0, 4
addi x5, x0, 0
loop_start_27:
j loop_exit_27  # Exit loop 1
xor x7, x5, x7
lw x7, 652(x3)
add x5, x7, x5
# LOOP 28 (depth 1, break at 5, max 8)
addi x9, x0, 8
addi x8, x0, 5
addi x6, x0, 0
loop_start_28:
# LOOP 29 (depth 2, break at 4, max 8)
addi x1, x0, 8
addi x2, x0, 4
addi x7, x0, 0
loop_start_29:
j loop_exit_29  # Exit loop 2
sll x5, x7, x5
sub x4, x9, x4
sub x2, x4, x2
sll x5, x6, x5
j loop_exit_28  # Exit loop 1
sw x9, 392(x3)
# LOOP 30 (depth 1, break at 3, max 9)
addi x6, x0, 9
addi x2, x0, 3
addi x1, x0, 0
loop_start_30:
lw x2, 636(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 164(x3)
# LOOP 31 (depth 2, break at 1, max 2)
addi x5, x0, 2
addi x4, x0, 1
addi x8, x0, 0
loop_start_31:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x6, x7, x6
# LOOP 32 (depth 3, break at 3, max 10)
addi x1, x0, 10
addi x8, x0, 3
addi x2, x0, 0
loop_start_32:
# LOOP 33 (depth 4, break at 4, max 5)
addi x6, x0, 5
addi x7, x0, 4
addi x5, x0, 0
loop_start_33:
# LOOP 34 (depth 5, break at 3, max 7)
addi x9, x0, 7
addi x6, x0, 3
addi x1, x0, 0
loop_start_34:
j loop_exit_34  # Exit loop 5
srl x8, x1, x8
lw x7, 788(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x6, x7, x6
lw x7, 408(x3)
lw x1, 608(x3)
sw x1, 584(x3)
lw x6, 780(x3)
# LOOP 35 (depth 5, break at 5, max 6)
addi x9, x0, 6
addi x2, x0, 5
addi x1, x0, 0
loop_start_35:
sub x6, x7, x6
sw x4, 180(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x2, 548(x3)
sw x1, 504(x3)
j loop_exit_35  # Exit loop 5
sub x5, x6, x5
lw x5, 108(x3)
and x6, x7, x6
# LOOP 36 (depth 5, break at 2, max 7)
addi x5, x0, 7
addi x9, x0, 2
addi x2, x0, 0
loop_start_36:
j loop_exit_36  # Exit loop 5
add x6, x2, x6
j loop_exit_33  # Exit loop 4
lw x6, 24(x3)
lw x6, 624(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 37 (depth 4, break at 4, max 10)
addi x4, x0, 10
addi x1, x0, 4
addi x5, x0, 0
loop_start_37:
and x5, x5, x5
and x7, x9, x7
lw x7, 100(x3)
or x4, x7, x4
j loop_exit_37  # Exit loop 4
lw x8, 344(x3)
lw x6, 444(x3)
sw x2, 528(x3)
j loop_exit_32  # Exit loop 3
# LOOP 38 (depth 3, break at 3, max 7)
addi x2, x0, 7
addi x1, x0, 3
addi x4, x0, 0
loop_start_38:
j loop_exit_38  # Exit loop 3
and x2, x4, x2
j loop_exit_31  # Exit loop 2
lw x4, 972(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_30  # Exit loop 1
sll x2, x4, x2
# LOOP 39 (depth 1, break at 5, max 8)
addi x7, x0, 8
addi x1, x0, 5
addi x8, x0, 0
loop_start_39:
add x4, x8, x4
j loop_exit_39  # Exit loop 1
sw x7, 744(x3)
and x2, x9, x2
# LOOP 40 (depth 1, break at 1, max 2)
addi x9, x0, 2
addi x1, x0, 1
addi x8, x0, 0
loop_start_40:
sw x1, 248(x3)
# LOOP 41 (depth 2, break at 2, max 7)
addi x4, x0, 7
addi x1, x0, 2
addi x6, x0, 0
loop_start_41:
lw x6, 304(x3)
xor x2, x1, x2
# LOOP 42 (depth 3, break at 3, max 4)
addi x8, x0, 4
addi x1, x0, 3
addi x7, x0, 0
loop_start_42:
lw x9, 600(x3)
sw x9, 916(x3)
add x6, x2, x6
sw x5, 172(x3)
and x8, x7, x8
j loop_exit_42  # Exit loop 3
lw x8, 792(x3)
sub x6, x5, x6
lw x5, 164(x3)
sw x5, 476(x3)
lw x1, 364(x3)
sw x1, 816(x3)
lw x4, 376(x3)
xor x7, x4, x7
j loop_exit_41  # Exit loop 2
sw x2, 184(x3)
j loop_exit_40  # Exit loop 1
srl x1, x8, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x7, x9, x7
xor x1, x8, x1
# LOOP 43 (depth 1, break at 4, max 6)
addi x9, x0, 6
addi x4, x0, 4
addi x2, x0, 0
loop_start_43:
sw x2, 600(x3)
lw x8, 0(x3)
lw x6, 984(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 252(x3)
lw x6, 704(x3)
lw x6, 424(x3)
j loop_exit_43  # Exit loop 1
lw x6, 852(x3)
# LOOP 44 (depth 1, break at 1, max 5)
addi x2, x0, 5
addi x4, x0, 1
addi x7, x0, 0
loop_start_44:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 45 (depth 2, break at 4, max 5)
addi x1, x0, 5
addi x6, x0, 4
addi x9, x0, 0
loop_start_45:
lw x8, 532(x3)
# LOOP 46 (depth 3, break at 2, max 7)
addi x1, x0, 7
addi x6, x0, 2
addi x4, x0, 0
loop_start_46:
xor x6, x4, x6
lw x6, 940(x3)
add x2, x1, x2
sw x7, 32(x3)
j loop_exit_46  # Exit loop 3
sw x6, 208(x3)
j loop_exit_45  # Exit loop 2
lw x4, 100(x3)
lw x4, 316(x3)
lw x8, 488(x3)
# LOOP 47 (depth 2, break at 5, max 9)
addi x7, x0, 9
addi x2, x0, 5
addi x4, x0, 0
loop_start_47:
sub x2, x4, x2
or x4, x9, x4
j loop_exit_47  # Exit loop 2
lw x4, 388(x3)
j loop_exit_44  # Exit loop 1
lw x4, 268(x3)
sw x1, 744(x3)
# LOOP 48 (depth 1, break at 5, max 9)
addi x1, x0, 9
addi x8, x0, 5
addi x9, x0, 0
loop_start_48:
sw x9, 312(x3)
j loop_exit_48  # Exit loop 1
# LOOP 49 (depth 1, break at 4, max 7)
addi x7, x0, 7
addi x2, x0, 4
addi x1, x0, 0
loop_start_49:
sw x1, 420(x3)
# LOOP 50 (depth 2, break at 1, max 7)
addi x8, x0, 7
addi x2, x0, 1
addi x7, x0, 0
loop_start_50:
# LOOP 51 (depth 3, break at 3, max 4)
addi x1, x0, 4
addi x4, x0, 3
addi x8, x0, 0
loop_start_51:
and x2, x8, x2
srl x2, x2, x2
j loop_exit_51  # Exit loop 3
lw x8, 88(x3)
srl x2, x8, x2
j loop_exit_50  # Exit loop 2
j loop_exit_49  # Exit loop 1
lw x4, 712(x3)
sw x5, 208(x3)
# LOOP 52 (depth 1, break at 3, max 4)
addi x5, x0, 4
addi x9, x0, 3
addi x7, x0, 0
loop_start_52:
# LOOP 53 (depth 2, break at 5, max 9)
addi x9, x0, 9
addi x2, x0, 5
addi x5, x0, 0
loop_start_53:
j loop_exit_53  # Exit loop 2
or x7, x9, x7
sw x1, 428(x3)
srl x4, x6, x4
lw x5, 756(x3)
j loop_exit_52  # Exit loop 1
and x1, x7, x1
sw x9, 348(x3)
lw x9, 296(x3)
sw x7, 268(x3)
xor x1, x8, x1
lw x1, 540(x3)
sll x4, x1, x4
and x1, x7, x1
and x8, x1, x8
xor x4, x6, x4
and x1, x4, x1
add x8, x1, x8
# LOOP 54 (depth 1, break at 1, max 4)
addi x9, x0, 4
addi x6, x0, 1
addi x1, x0, 0
loop_start_54:
lw x1, 556(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x2, 676(x3)
xor x6, x9, x6
or x1, x6, x1
add x9, x6, x9
lw x4, 292(x3)
and x2, x9, x2
sw x2, 820(x3)
or x5, x8, x5
# LOOP 55 (depth 2, break at 2, max 10)
addi x8, x0, 10
addi x4, x0, 2
addi x7, x0, 0
loop_start_55:
lw x7, 276(x3)
j loop_exit_55  # Exit loop 2
j loop_exit_54  # Exit loop 1
add x4, x7, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x8, x8, x8
# LOOP 56 (depth 1, break at 2, max 7)
addi x5, x0, 7
addi x7, x0, 2
addi x6, x0, 0
loop_start_56:
lw x6, 48(x3)
j loop_exit_56  # Exit loop 1
# LOOP 57 (depth 1, break at 4, max 7)
addi x9, x0, 7
addi x7, x0, 4
addi x4, x0, 0
loop_start_57:
# LOOP 58 (depth 2, break at 5, max 10)
addi x2, x0, 10
addi x7, x0, 5
addi x9, x0, 0
loop_start_58:
and x7, x9, x7
srl x4, x7, x4
j loop_exit_58  # Exit loop 2
sw x4, 368(x3)
j loop_exit_57  # Exit loop 1
lw x2, 988(x3)
add x2, x2, x2
# LOOP 59 (depth 1, break at 4, max 6)
addi x8, x0, 6
addi x9, x0, 4
addi x7, x0, 0
loop_start_59:
lw x7, 28(x3)
# LOOP 60 (depth 2, break at 3, max 9)
addi x5, x0, 9
addi x8, x0, 3
addi x6, x0, 0
loop_start_60:
j loop_exit_60  # Exit loop 2
# LOOP 61 (depth 2, break at 3, max 5)
addi x2, x0, 5
addi x4, x0, 3
addi x1, x0, 0
loop_start_61:
lw x8, 800(x3)
j loop_exit_61  # Exit loop 2
lw x8, 448(x3)
# LOOP 62 (depth 2, break at 3, max 5)
addi x4, x0, 5
addi x2, x0, 3
addi x5, x0, 0
loop_start_62:
sll x1, x9, x1
j loop_exit_62  # Exit loop 2
j loop_exit_59  # Exit loop 1
lw x1, 840(x3)
xor x9, x9, x9
# LOOP 63 (depth 1, break at 1, max 2)
addi x6, x0, 2
addi x1, x0, 1
addi x7, x0, 0
loop_start_63:
j loop_exit_63  # Exit loop 1
sub x9, x7, x9
sub x4, x9, x4
srl x1, x4, x1
srl x8, x7, x8
xor x6, x8, x6
lw x5, 4(x3)
# LOOP 64 (depth 1, break at 2, max 9)
addi x4, x0, 9
addi x2, x0, 2
addi x8, x0, 0
loop_start_64:
lw x8, 216(x3)
sw x8, 184(x3)
xor x1, x5, x1
sw x1, 624(x3)
sw x4, 16(x3)
and x4, x6, x4
# LOOP 65 (depth 2, break at 5, max 7)
addi x9, x0, 7
addi x5, x0, 5
addi x8, x0, 0
loop_start_65:
srl x5, x6, x5
lw x6, 852(x3)
j loop_exit_65  # Exit loop 2
# LOOP 66 (depth 2, break at 2, max 3)
addi x5, x0, 3
addi x2, x0, 2
addi x8, x0, 0
loop_start_66:
# LOOP 67 (depth 3, break at 5, max 6)
addi x2, x0, 6
addi x7, x0, 5
addi x4, x0, 0
loop_start_67:
sw x6, 204(x3)
j loop_exit_67  # Exit loop 3
lw x6, 336(x3)
sw x1, 0(x3)
j loop_exit_66  # Exit loop 2
# LOOP 68 (depth 2, break at 5, max 6)
addi x9, x0, 6
addi x8, x0, 5
addi x2, x0, 0
loop_start_68:
# LOOP 69 (depth 3, break at 1, max 10)
addi x6, x0, 10
addi x7, x0, 1
addi x1, x0, 0
loop_start_69:
j loop_exit_69  # Exit loop 3
# LOOP 70 (depth 3, break at 1, max 8)
addi x2, x0, 8
addi x6, x0, 1
addi x5, x0, 0
loop_start_70:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x9, 992(x3)
sw x7, 320(x3)
sw x4, 720(x3)
sw x8, 460(x3)
add x2, x4, x2
sw x2, 560(x3)
or x6, x1, x6
lw x6, 716(x3)
sw x2, 88(x3)
# LOOP 71 (depth 4, break at 3, max 7)
addi x7, x0, 7
addi x9, x0, 3
addi x4, x0, 0
loop_start_71:
lw x5, 392(x3)
j loop_exit_71  # Exit loop 4
sw x2, 560(x3)
xor x4, x2, x4
sw x4, 372(x3)
sw x5, 944(x3)
lw x2, 28(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x2, 208(x3)
sub x4, x2, x4
lw x2, 880(x3)
sw x2, 292(x3)
xor x7, x7, x7
lw x7, 508(x3)
# LOOP 72 (depth 4, break at 2, max 9)
addi x1, x0, 9
addi x4, x0, 2
addi x9, x0, 0
loop_start_72:
srl x1, x4, x1
or x2, x1, x2
lw x4, 76(x3)
lw x4, 724(x3)
lw x4, 404(x3)
and x5, x5, x5
j loop_exit_72  # Exit loop 4
# LOOP 73 (depth 4, break at 4, max 10)
addi x4, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_73:
lw x6, 356(x3)
lw x6, 480(x3)
lw x6, 892(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x6, 332(x3)
sw x8, 272(x3)
j loop_exit_73  # Exit loop 4
j loop_exit_70  # Exit loop 3
j loop_exit_68  # Exit loop 2
j loop_exit_64  # Exit loop 1
# LOOP 74 (depth 1, break at 5, max 9)
addi x1, x0, 9
addi x2, x0, 5
addi x8, x0, 0
loop_start_74:
lw x5, 976(x3)
lw x5, 12(x3)
sw x7, 436(x3)
lw x1, 616(x3)
# LOOP 75 (depth 2, break at 4, max 5)
addi x9, x0, 5
addi x4, x0, 4
addi x7, x0, 0
loop_start_75:
lw x8, 988(x3)
lw x5, 284(x3)
lw x4, 640(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x2, x4, x2
lw x9, 312(x3)
# LOOP 76 (depth 3, break at 3, max 4)
addi x8, x0, 4
addi x1, x0, 3
addi x4, x0, 0
loop_start_76:
xor x6, x7, x6
sw x6, 980(x3)
j loop_exit_76  # Exit loop 3
srl x4, x7, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x6, x6, x6
# LOOP 77 (depth 3, break at 1, max 10)
addi x4, x0, 10
addi x1, x0, 1
addi x8, x0, 0
loop_start_77:
or x5, x8, x5
xor x4, x4, x4
lw x4, 876(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 548(x3)
# LOOP 78 (depth 4, break at 3, max 10)
addi x5, x0, 10
addi x8, x0, 3
addi x2, x0, 0
loop_start_78:
and x9, x2, x9
or x1, x9, x1
or x9, x1, x9
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x9, 680(x3)
sw x9, 172(x3)
srl x4, x4, x4
j loop_exit_78  # Exit loop 4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_77  # Exit loop 3
lw x4, 192(x3)
lw x4, 200(x3)
j loop_exit_75  # Exit loop 2
lw x7, 40(x3)
# LOOP 79 (depth 2, break at 1, max 2)
addi x4, x0, 2
addi x5, x0, 1
addi x6, x0, 0
loop_start_79:
sub x1, x5, x1
j loop_exit_79  # Exit loop 2
# LOOP 80 (depth 2, break at 5, max 7)
addi x9, x0, 7
addi x4, x0, 5
addi x8, x0, 0
loop_start_80:
lw x8, 416(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x4, x7, x4
sw x8, 80(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x7, 16(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 928(x3)
lw x4, 260(x3)
# LOOP 81 (depth 3, break at 1, max 3)
addi x6, x0, 3
addi x8, x0, 1
addi x9, x0, 0
loop_start_81:
lw x9, 700(x3)
and x1, x6, x1
sw x6, 988(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 82 (depth 4, break at 2, max 9)
addi x9, x0, 9
addi x7, x0, 2
addi x8, x0, 0
loop_start_82:
j loop_exit_82  # Exit loop 4
add x9, x8, x9
sll x1, x2, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 524(x3)
sll x5, x4, x5
j loop_exit_81  # Exit loop 3
# LOOP 83 (depth 3, break at 4, max 9)
addi x1, x0, 9
addi x7, x0, 4
addi x8, x0, 0
loop_start_83:
add x6, x1, x6
or x7, x4, x7
# LOOP 84 (depth 4, break at 5, max 9)
addi x2, x0, 9
addi x8, x0, 5
addi x5, x0, 0
loop_start_84:
sw x8, 968(x3)
lw x4, 52(x3)
xor x7, x4, x7
lw x7, 920(x3)
j loop_exit_84  # Exit loop 4
# LOOP 85 (depth 4, break at 5, max 10)
addi x2, x0, 10
addi x1, x0, 5
addi x4, x0, 0
loop_start_85:
j loop_exit_85  # Exit loop 4
srl x6, x9, x6
sub x5, x6, x5
sw x9, 772(x3)
lw x6, 112(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 240(x3)
and x1, x8, x1
sw x1, 836(x3)
# LOOP 86 (depth 4, break at 3, max 6)
addi x5, x0, 6
addi x4, x0, 3
addi x9, x0, 0
loop_start_86:
sub x6, x9, x6
# LOOP 87 (depth 5, break at 4, max 6)
addi x8, x0, 6
addi x5, x0, 4
addi x1, x0, 0
loop_start_87:
lw x1, 424(x3)
and x7, x6, x7
sw x7, 488(x3)
sw x4, 916(x3)
sw x1, 848(x3)
sw x1, 124(x3)
sw x4, 148(x3)
add x8, x1, x8
xor x8, x8, x8
lw x4, 560(x3)
srl x8, x4, x8
sub x6, x8, x6
sw x6, 940(x3)
xor x5, x8, x5
j loop_exit_87  # Exit loop 5
j loop_exit_86  # Exit loop 4
# LOOP 88 (depth 4, break at 1, max 4)
addi x9, x0, 4
addi x2, x0, 1
addi x7, x0, 0
loop_start_88:
sw x9, 328(x3)
# LOOP 89 (depth 5, break at 5, max 8)
addi x1, x0, 8
addi x9, x0, 5
addi x8, x0, 0
loop_start_89:
sub x4, x8, x4
lw x6, 904(x3)
or x5, x4, x5
lw x8, 232(x3)
lw x8, 704(x3)
j loop_exit_89  # Exit loop 5
j loop_exit_88  # Exit loop 4
xor x9, x8, x9
sw x9, 64(x3)
j loop_exit_83  # Exit loop 3
# LOOP 90 (depth 3, break at 4, max 8)
addi x8, x0, 8
addi x4, x0, 4
addi x5, x0, 0
loop_start_90:
and x1, x5, x1
sw x1, 584(x3)
j loop_exit_90  # Exit loop 3
srl x7, x9, x7
j loop_exit_80  # Exit loop 2
# LOOP 91 (depth 2, break at 4, max 9)
addi x2, x0, 9
addi x8, x0, 4
addi x5, x0, 0
loop_start_91:
sw x2, 844(x3)
sll x2, x9, x2
sw x2, 680(x3)
lw x6, 356(x3)
# LOOP 92 (depth 3, break at 2, max 5)
addi x7, x0, 5
addi x5, x0, 2
addi x1, x0, 0
loop_start_92:
# LOOP 93 (depth 4, break at 1, max 8)
addi x6, x0, 8
addi x5, x0, 1
addi x4, x0, 0
loop_start_93:
j loop_exit_93  # Exit loop 4
sw x4, 344(x3)
lw x9, 72(x3)
lw x1, 740(x3)
lw x5, 540(x3)
lw x5, 420(x3)
j loop_exit_92  # Exit loop 3
j loop_exit_91  # Exit loop 2
or x4, x6, x4
sw x4, 600(x3)
# LOOP 94 (depth 2, break at 1, max 2)
addi x1, x0, 2
addi x9, x0, 1
addi x5, x0, 0
loop_start_94:
# LOOP 95 (depth 3, break at 5, max 7)
addi x8, x0, 7
addi x7, x0, 5
addi x2, x0, 0
loop_start_95:
lw x2, 796(x3)
sll x4, x2, x4
sub x8, x4, x8
lw x5, 992(x3)
lw x5, 396(x3)
lw x5, 780(x3)
srl x1, x5, x1
sw x1, 420(x3)
sw x9, 996(x3)
j loop_exit_95  # Exit loop 3
lw x9, 688(x3)
# LOOP 96 (depth 3, break at 2, max 6)
addi x1, x0, 6
addi x7, x0, 2
addi x6, x0, 0
loop_start_96:
sub x7, x7, x7
xor x5, x7, x5
add x1, x1, x1
and x7, x1, x7
sw x2, 172(x3)
sub x5, x1, x5
lw x5, 584(x3)
sw x5, 860(x3)
add x2, x2, x2
sw x8, 536(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 97 (depth 4, break at 4, max 10)
addi x7, x0, 10
addi x9, x0, 4
addi x5, x0, 0
loop_start_97:
j loop_exit_97  # Exit loop 4
lw x5, 324(x3)
lw x5, 244(x3)
sw x8, 184(x3)
srl x8, x6, x8
lw x8, 868(x3)
sw x8, 92(x3)
j loop_exit_96  # Exit loop 3
sw x5, 156(x3)
lw x1, 688(x3)
and x2, x1, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 488(x3)
sw x1, 116(x3)
j loop_exit_94  # Exit loop 2
sub x4, x5, x4
j loop_exit_74  # Exit loop 1
sub x1, x5, x1
lw x1, 860(x3)
lw x1, 340(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 98 (depth 1, break at 2, max 8)
addi x7, x0, 8
addi x8, x0, 2
addi x4, x0, 0
loop_start_98:
# LOOP 99 (depth 2, break at 4, max 7)
addi x1, x0, 7
addi x6, x0, 4
addi x7, x0, 0
loop_start_99:
sw x7, 48(x3)
sw x2, 652(x3)
# LOOP 100 (depth 3, break at 3, max 8)
addi x8, x0, 8
addi x2, x0, 3
addi x6, x0, 0
loop_start_100:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x4, x9, x4
j loop_exit_100  # Exit loop 3
lw x4, 396(x3)
lw x7, 772(x3)
lw x7, 952(x3)
sw x6, 952(x3)
sub x2, x5, x2
lw x9, 176(x3)
lw x5, 776(x3)
j loop_exit_99  # Exit loop 2
sw x9, 408(x3)
j loop_exit_98  # Exit loop 1
# LOOP 101 (depth 1, break at 4, max 6)
addi x7, x0, 6
addi x8, x0, 4
addi x9, x0, 0
loop_start_101:
sw x9, 192(x3)
# LOOP 102 (depth 2, break at 4, max 9)
addi x5, x0, 9
addi x6, x0, 4
addi x7, x0, 0
loop_start_102:
lw x7, 16(x3)
or x1, x4, x1
sw x9, 588(x3)
lw x2, 908(x3)
sll x8, x9, x8
j loop_exit_102  # Exit loop 2
# LOOP 103 (depth 2, break at 3, max 8)
addi x6, x0, 8
addi x4, x0, 3
addi x9, x0, 0
loop_start_103:
lw x9, 932(x3)
lw x6, 584(x3)
sw x6, 288(x3)
sw x5, 480(x3)
sw x8, 160(x3)
and x5, x5, x5
xor x2, x6, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 104 (depth 3, break at 5, max 6)
addi x5, x0, 6
addi x7, x0, 5
addi x4, x0, 0
loop_start_104:
and x8, x4, x8
add x1, x7, x1
# LOOP 105 (depth 4, break at 5, max 7)
addi x5, x0, 7
addi x8, x0, 5
addi x7, x0, 0
loop_start_105:
lw x7, 72(x3)
lw x2, 216(x3)
sw x7, 716(x3)
or x9, x6, x9
lw x4, 348(x3)
lw x9, 696(x3)
lw x9, 944(x3)
sw x6, 200(x3)
sw x1, 308(x3)
srl x2, x7, x2
j loop_exit_105  # Exit loop 4
lw x2, 368(x3)
sub x7, x8, x7
j loop_exit_104  # Exit loop 3
or x8, x6, x8
# LOOP 106 (depth 3, break at 1, max 6)
addi x4, x0, 6
addi x9, x0, 1
addi x1, x0, 0
loop_start_106:
j loop_exit_106  # Exit loop 3
add x9, x1, x9
sw x9, 216(x3)
# LOOP 107 (depth 3, break at 2, max 4)
addi x4, x0, 4
addi x5, x0, 2
addi x8, x0, 0
loop_start_107:
j loop_exit_107  # Exit loop 3
and x5, x8, x5
lw x2, 684(x3)
# LOOP 108 (depth 3, break at 3, max 8)
addi x9, x0, 8
addi x8, x0, 3
addi x4, x0, 0
loop_start_108:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_108  # Exit loop 3
j loop_exit_103  # Exit loop 2
# LOOP 109 (depth 2, break at 3, max 9)
addi x7, x0, 9
addi x1, x0, 3
addi x2, x0, 0
loop_start_109:
srl x8, x2, x8
sw x8, 920(x3)
add x2, x2, x2
j loop_exit_109  # Exit loop 2
sw x5, 864(x3)
and x4, x9, x4
j loop_exit_101  # Exit loop 1
sw x6, 748(x3)
# LOOP 110 (depth 1, break at 3, max 8)
addi x8, x0, 8
addi x7, x0, 3
addi x1, x0, 0
loop_start_110:
sw x1, 572(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 111 (depth 2, break at 2, max 3)
addi x2, x0, 3
addi x8, x0, 2
addi x6, x0, 0
loop_start_111:
# LOOP 112 (depth 3, break at 1, max 7)
addi x9, x0, 7
addi x2, x0, 1
addi x1, x0, 0
loop_start_112:
sub x8, x5, x8
# LOOP 113 (depth 4, break at 1, max 4)
addi x1, x0, 4
addi x5, x0, 1
addi x6, x0, 0
loop_start_113:
srl x9, x6, x9
lw x9, 416(x3)
j loop_exit_113  # Exit loop 4
sll x4, x4, x4
j loop_exit_112  # Exit loop 3
j loop_exit_111  # Exit loop 2
j loop_exit_110  # Exit loop 1
# LOOP 114 (depth 1, break at 2, max 4)
addi x1, x0, 4
addi x8, x0, 2
addi x6, x0, 0
loop_start_114:
# LOOP 115 (depth 2, break at 4, max 5)
addi x1, x0, 5
addi x4, x0, 4
addi x9, x0, 0
loop_start_115:
lw x4, 124(x3)
sw x4, 36(x3)
sub x5, x7, x5
j loop_exit_115  # Exit loop 2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x4, x1, x4
and x9, x9, x9
j loop_exit_114  # Exit loop 1
sw x9, 384(x3)
# LOOP 116 (depth 1, break at 5, max 8)
addi x5, x0, 8
addi x4, x0, 5
addi x6, x0, 0
loop_start_116:
j loop_exit_116  # Exit loop 1
or x7, x7, x7
# LOOP 117 (depth 1, break at 5, max 7)
addi x1, x0, 7
addi x5, x0, 5
addi x8, x0, 0
loop_start_117:
j loop_exit_117  # Exit loop 1
lw x1, 712(x3)
lw x8, 452(x3)
# LOOP 118 (depth 1, break at 3, max 9)
addi x2, x0, 9
addi x6, x0, 3
addi x5, x0, 0
loop_start_118:
srl x4, x7, x4
or x2, x6, x2
or x7, x2, x7
sw x2, 532(x3)
lw x2, 876(x3)
lw x9, 828(x3)
# LOOP 119 (depth 2, break at 5, max 8)
addi x2, x0, 8
addi x4, x0, 5
addi x8, x0, 0
loop_start_119:
lw x8, 740(x3)
# LOOP 120 (depth 3, break at 4, max 6)
addi x9, x0, 6
addi x4, x0, 4
addi x2, x0, 0
loop_start_120:
lw x2, 452(x3)
srl x9, x5, x9
lw x1, 548(x3)
lw x1, 760(x3)
lw x4, 444(x3)
sw x5, 780(x3)
sw x8, 264(x3)
sw x2, 356(x3)
# LOOP 121 (depth 4, break at 4, max 10)
addi x1, x0, 10
addi x6, x0, 4
addi x2, x0, 0
loop_start_121:
sw x2, 100(x3)
# LOOP 122 (depth 5, break at 4, max 5)
addi x8, x0, 5
addi x7, x0, 4
addi x5, x0, 0
loop_start_122:
j loop_exit_122  # Exit loop 5
sw x5, 288(x3)
lw x7, 68(x3)
sw x7, 688(x3)
j loop_exit_121  # Exit loop 4
lw x4, 568(x3)
sw x5, 792(x3)
lw x9, 68(x3)
# LOOP 123 (depth 4, break at 5, max 7)
addi x4, x0, 7
addi x6, x0, 5
addi x1, x0, 0
loop_start_123:
lw x2, 936(x3)
lw x9, 388(x3)
j loop_exit_123  # Exit loop 4
# LOOP 124 (depth 4, break at 5, max 6)
addi x4, x0, 6
addi x6, x0, 5
addi x7, x0, 0
loop_start_124:
add x5, x2, x5
lw x5, 184(x3)
sw x4, 800(x3)
sub x4, x2, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 125 (depth 5, break at 4, max 5)
addi x9, x0, 5
addi x1, x0, 4
addi x2, x0, 0
loop_start_125:
lw x2, 160(x3)
lw x9, 692(x3)
lw x2, 804(x3)
sw x2, 392(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 968(x3)
sw x7, 836(x3)
j loop_exit_125  # Exit loop 5
j loop_exit_124  # Exit loop 4
sw x4, 484(x3)
# LOOP 126 (depth 4, break at 1, max 7)
addi x1, x0, 7
addi x8, x0, 1
addi x4, x0, 0
loop_start_126:
sw x4, 432(x3)
lw x9, 708(x3)
lw x9, 584(x3)
sw x9, 440(x3)
lw x5, 860(x3)
srl x8, x4, x8
add x4, x7, x4
lw x4, 636(x3)
sw x4, 504(x3)
lw x2, 600(x3)
sw x9, 276(x3)
or x1, x9, x1
lw x4, 392(x3)
lw x4, 792(x3)
and x2, x4, x2
j loop_exit_126  # Exit loop 4
# LOOP 127 (depth 4, break at 4, max 7)
addi x8, x0, 7
addi x5, x0, 4
addi x9, x0, 0
loop_start_127:
# LOOP 128 (depth 5, break at 1, max 6)
addi x2, x0, 6
addi x6, x0, 1
addi x7, x0, 0
loop_start_128:
lw x7, 684(x3)
lw x5, 964(x3)
lw x7, 632(x3)
j loop_exit_128  # Exit loop 5
sll x8, x5, x8
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x8, 560(x3)
lw x7, 196(x3)
# LOOP 129 (depth 5, break at 5, max 10)
addi x1, x0, 10
addi x9, x0, 5
addi x4, x0, 0
loop_start_129:
sw x2, 612(x3)
sw x5, 768(x3)
sw x8, 76(x3)
and x7, x7, x7
lw x7, 432(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x5, x7, x5
sw x9, 712(x3)
j loop_exit_129  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_127  # Exit loop 4
sw x6, 32(x3)
j loop_exit_120  # Exit loop 3
sw x9, 856(x3)
or x2, x1, x2
lw x9, 880(x3)
xor x7, x7, x7
j loop_exit_119  # Exit loop 2
xor x6, x7, x6
j loop_exit_118  # Exit loop 1
lw x6, 952(x3)
sw x6, 568(x3)
or x2, x8, x2
lw x8, 128(x3)
# LOOP 130 (depth 1, break at 4, max 7)
addi x2, x0, 7
addi x5, x0, 4
addi x6, x0, 0
loop_start_130:
lw x6, 28(x3)
add x4, x4, x4
# LOOP 131 (depth 2, break at 2, max 4)
addi x2, x0, 4
addi x8, x0, 2
addi x6, x0, 0
loop_start_131:
sw x6, 956(x3)
lw x5, 624(x3)
j loop_exit_131  # Exit loop 2
j loop_exit_130  # Exit loop 1
sw x5, 740(x3)
# LOOP 132 (depth 1, break at 3, max 9)
addi x4, x0, 9
addi x2, x0, 3
addi x7, x0, 0
loop_start_132:
j loop_exit_132  # Exit loop 1
# LOOP 133 (depth 1, break at 4, max 9)
addi x6, x0, 9
addi x2, x0, 4
addi x8, x0, 0
loop_start_133:
# LOOP 134 (depth 2, break at 4, max 9)
addi x9, x0, 9
addi x4, x0, 4
addi x5, x0, 0
loop_start_134:
lw x7, 620(x3)
# LOOP 135 (depth 3, break at 4, max 8)
addi x4, x0, 8
addi x8, x0, 4
addi x5, x0, 0
loop_start_135:
lw x5, 448(x3)
# LOOP 136 (depth 4, break at 4, max 5)
addi x9, x0, 5
addi x8, x0, 4
addi x2, x0, 0
loop_start_136:
j loop_exit_136  # Exit loop 4
lw x2, 464(x3)
lw x5, 688(x3)
j loop_exit_135  # Exit loop 3
# LOOP 137 (depth 3, break at 1, max 3)
addi x9, x0, 3
addi x2, x0, 1
addi x1, x0, 0
loop_start_137:
j loop_exit_137  # Exit loop 3
sw x1, 756(x3)
j loop_exit_134  # Exit loop 2
and x4, x8, x4
j loop_exit_133  # Exit loop 1
and x9, x4, x9
sw x6, 128(x3)
# LOOP 138 (depth 1, break at 3, max 5)
addi x7, x0, 5
addi x5, x0, 3
addi x2, x0, 0
loop_start_138:
# LOOP 139 (depth 2, break at 5, max 8)
addi x9, x0, 8
addi x1, x0, 5
addi x8, x0, 0
loop_start_139:
lw x9, 240(x3)
lw x5, 12(x3)
lw x6, 460(x3)
j loop_exit_139  # Exit loop 2
sw x6, 40(x3)
# LOOP 140 (depth 2, break at 3, max 9)
addi x1, x0, 9
addi x7, x0, 3
addi x5, x0, 0
loop_start_140:
lw x5, 176(x3)
sw x7, 652(x3)
lw x2, 956(x3)
and x7, x6, x7
# LOOP 141 (depth 3, break at 1, max 3)
addi x1, x0, 3
addi x8, x0, 1
addi x9, x0, 0
loop_start_141:
j loop_exit_141  # Exit loop 3
j loop_exit_140  # Exit loop 2
# LOOP 142 (depth 2, break at 2, max 9)
addi x1, x0, 9
addi x6, x0, 2
addi x7, x0, 0
loop_start_142:
sub x1, x2, x1
sw x2, 500(x3)
lw x5, 364(x3)
sw x5, 932(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x9, 736(x3)
lw x1, 236(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_142  # Exit loop 2
# LOOP 143 (depth 2, break at 5, max 9)
addi x7, x0, 9
addi x4, x0, 5
addi x2, x0, 0
loop_start_143:
sw x2, 564(x3)
sw x8, 360(x3)
j loop_exit_143  # Exit loop 2
sw x9, 368(x3)
# LOOP 144 (depth 2, break at 5, max 9)
addi x5, x0, 9
addi x9, x0, 5
addi x1, x0, 0
loop_start_144:
lw x5, 136(x3)
srl x4, x5, x4
# LOOP 145 (depth 3, break at 1, max 9)
addi x5, x0, 9
addi x7, x0, 1
addi x6, x0, 0
loop_start_145:
sw x6, 264(x3)
sw x5, 668(x3)
sw x4, 864(x3)
sub x9, x5, x9
add x1, x9, x1
j loop_exit_145  # Exit loop 3
# LOOP 146 (depth 3, break at 4, max 6)
addi x6, x0, 6
addi x8, x0, 4
addi x2, x0, 0
loop_start_146:
# LOOP 147 (depth 4, break at 2, max 5)
addi x5, x0, 5
addi x9, x0, 2
addi x4, x0, 0
loop_start_147:
lw x4, 704(x3)
j loop_exit_147  # Exit loop 4
j loop_exit_146  # Exit loop 3
# LOOP 148 (depth 3, break at 3, max 4)
addi x9, x0, 4
addi x5, x0, 3
addi x2, x0, 0
loop_start_148:
lw x5, 172(x3)
sw x5, 864(x3)
sll x9, x9, x9
sll x8, x8, x8
# LOOP 149 (depth 4, break at 2, max 8)
addi x6, x0, 8
addi x9, x0, 2
addi x1, x0, 0
loop_start_149:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 824(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_149  # Exit loop 4
sub x6, x7, x6
add x6, x6, x6
lw x4, 584(x3)
and x1, x4, x1
or x7, x1, x7
j loop_exit_148  # Exit loop 3
lw x7, 168(x3)
lw x7, 476(x3)
lw x7, 848(x3)
# LOOP 150 (depth 3, break at 5, max 9)
addi x4, x0, 9
addi x1, x0, 5
addi x6, x0, 0
loop_start_150:
srl x9, x8, x9
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x9, 880(x3)
# LOOP 151 (depth 4, break at 4, max 10)
addi x4, x0, 10
addi x5, x0, 4
addi x2, x0, 0
loop_start_151:
sw x2, 652(x3)
and x9, x6, x9
lw x4, 12(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 456(x3)
add x9, x7, x9
lw x9, 468(x3)
j loop_exit_151  # Exit loop 4
j loop_exit_150  # Exit loop 3
sw x9, 580(x3)
sub x4, x5, x4
and x5, x8, x5
sw x5, 432(x3)
lw x1, 784(x3)
sub x7, x7, x7
j loop_exit_144  # Exit loop 2
sub x6, x5, x6
xor x7, x9, x7
j loop_exit_138  # Exit loop 1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x5, x7, x5
sub x9, x7, x9
lw x8, 96(x3)
sll x7, x8, x7
and x8, x8, x8
lw x8, 464(x3)
# LOOP 152 (depth 1, break at 3, max 6)
addi x9, x0, 6
addi x1, x0, 3
addi x6, x0, 0
loop_start_152:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 960(x3)
sub x5, x5, x5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 512(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_152  # Exit loop 1
# LOOP 153 (depth 1, break at 4, max 10)
addi x4, x0, 10
addi x6, x0, 4
addi x1, x0, 0
loop_start_153:
# LOOP 154 (depth 2, break at 2, max 9)
addi x8, x0, 9
addi x7, x0, 2
addi x4, x0, 0
loop_start_154:
sw x1, 484(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x1, 832(x3)
j loop_exit_154  # Exit loop 2
# LOOP 155 (depth 2, break at 3, max 4)
addi x5, x0, 4
addi x9, x0, 3
addi x7, x0, 0
loop_start_155:
xor x1, x7, x1
j loop_exit_155  # Exit loop 2
# LOOP 156 (depth 2, break at 1, max 9)
addi x4, x0, 9
addi x6, x0, 1
addi x8, x0, 0
loop_start_156:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x4, 812(x3)
j loop_exit_156  # Exit loop 2
# LOOP 157 (depth 2, break at 4, max 6)
addi x6, x0, 6
addi x1, x0, 4
addi x4, x0, 0
loop_start_157:
or x5, x8, x5
j loop_exit_157  # Exit loop 2
j loop_exit_153  # Exit loop 1
sw x5, 396(x3)
lw x9, 680(x3)
# LOOP 158 (depth 1, break at 5, max 10)
addi x7, x0, 10
addi x2, x0, 5
addi x1, x0, 0
loop_start_158:
j loop_exit_158  # Exit loop 1
# LOOP 159 (depth 1, break at 1, max 3)
addi x6, x0, 3
addi x4, x0, 1
addi x5, x0, 0
loop_start_159:
j loop_exit_159  # Exit loop 1
lw x5, 136(x3)
lw x5, 964(x3)
# LOOP 160 (depth 1, break at 1, max 9)
addi x6, x0, 9
addi x8, x0, 1
addi x1, x0, 0
loop_start_160:
sw x1, 952(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 161 (depth 2, break at 2, max 9)
addi x2, x0, 9
addi x7, x0, 2
addi x5, x0, 0
loop_start_161:
and x6, x5, x6
lw x1, 580(x3)
lw x5, 712(x3)
j loop_exit_161  # Exit loop 2
lw x5, 620(x3)
# LOOP 162 (depth 2, break at 5, max 10)
addi x2, x0, 10
addi x4, x0, 5
addi x9, x0, 0
loop_start_162:
j loop_exit_162  # Exit loop 2
# LOOP 163 (depth 2, break at 5, max 8)
addi x5, x0, 8
addi x4, x0, 5
addi x2, x0, 0
loop_start_163:
sw x4, 204(x3)
lw x4, 124(x3)
xor x4, x4, x4
sw x4, 940(x3)
# LOOP 164 (depth 3, break at 1, max 5)
addi x2, x0, 5
addi x7, x0, 1
addi x1, x0, 0
loop_start_164:
# LOOP 165 (depth 4, break at 4, max 8)
addi x6, x0, 8
addi x5, x0, 4
addi x8, x0, 0
loop_start_165:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x6, 892(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x7, x9, x7
sll x1, x8, x1
or x2, x1, x2
# LOOP 166 (depth 5, break at 3, max 4)
addi x5, x0, 4
addi x6, x0, 3
addi x1, x0, 0
loop_start_166:
lw x1, 476(x3)
srl x4, x1, x4
j loop_exit_166  # Exit loop 5
lw x4, 816(x3)
lw x7, 908(x3)
# LOOP 167 (depth 5, break at 1, max 3)
addi x1, x0, 3
addi x8, x0, 1
addi x5, x0, 0
loop_start_167:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x6, x5, x6
sw x1, 292(x3)
j loop_exit_167  # Exit loop 5
j loop_exit_165  # Exit loop 4
sw x4, 884(x3)
# LOOP 168 (depth 4, break at 2, max 6)
addi x8, x0, 6
addi x9, x0, 2
addi x5, x0, 0
loop_start_168:
add x8, x1, x8
sw x4, 832(x3)
sw x9, 172(x3)
j loop_exit_168  # Exit loop 4
lw x7, 400(x3)
lw x7, 948(x3)
sw x9, 928(x3)
sll x8, x8, x8
sw x5, 528(x3)
sw x9, 796(x3)
or x4, x6, x4
j loop_exit_164  # Exit loop 3
add x5, x4, x5
lw x1, 432(x3)
# LOOP 169 (depth 3, break at 5, max 10)
addi x7, x0, 10
addi x2, x0, 5
addi x8, x0, 0
loop_start_169:
lw x8, 780(x3)
lw x2, 308(x3)
and x9, x2, x9
sw x6, 252(x3)
add x6, x4, x6
sw x4, 244(x3)
lw x7, 524(x3)
lw x6, 192(x3)
lw x8, 852(x3)
j loop_exit_169  # Exit loop 3
sll x5, x6, x5
add x2, x5, x2
or x5, x2, x5
lw x5, 276(x3)
j loop_exit_163  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x1, 932(x3)
# LOOP 170 (depth 2, break at 4, max 10)
addi x1, x0, 10
addi x2, x0, 4
addi x7, x0, 0
loop_start_170:
lw x7, 388(x3)
or x5, x8, x5
sw x1, 588(x3)
sll x7, x1, x7
sw x7, 348(x3)
lw x9, 288(x3)
j loop_exit_170  # Exit loop 2
xor x5, x8, x5
j loop_exit_160  # Exit loop 1
lw x1, 416(x3)
lw x6, 72(x3)
# LOOP 171 (depth 1, break at 5, max 9)
addi x4, x0, 9
addi x2, x0, 5
addi x7, x0, 0
loop_start_171:
# LOOP 172 (depth 2, break at 5, max 8)
addi x2, x0, 8
addi x8, x0, 5
addi x1, x0, 0
loop_start_172:
sw x1, 404(x3)
sw x9, 664(x3)
lw x9, 104(x3)
lw x7, 68(x3)
and x2, x5, x2
lw x2, 264(x3)
sw x7, 580(x3)
# LOOP 173 (depth 3, break at 1, max 3)
addi x4, x0, 3
addi x9, x0, 1
addi x8, x0, 0
loop_start_173:
sll x7, x1, x7
sw x4, 112(x3)
j loop_exit_173  # Exit loop 3
sub x6, x2, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sll x7, x6, x7
lw x7, 184(x3)
lw x7, 372(x3)
j loop_exit_172  # Exit loop 2
sw x6, 336(x3)
sw x6, 576(x3)
# LOOP 174 (depth 2, break at 2, max 3)
addi x1, x0, 3
addi x6, x0, 2
addi x5, x0, 0
loop_start_174:
# LOOP 175 (depth 3, break at 1, max 8)
addi x6, x0, 8
addi x8, x0, 1
addi x4, x0, 0
loop_start_175:
sw x4, 240(x3)
sw x5, 172(x3)
sub x2, x5, x2
# LOOP 176 (depth 4, break at 4, max 5)
addi x7, x0, 5
addi x4, x0, 4
addi x5, x0, 0
loop_start_176:
lw x5, 456(x3)
lw x4, 360(x3)
add x2, x1, x2
add x8, x8, x8
j loop_exit_176  # Exit loop 4
sw x5, 88(x3)
j loop_exit_175  # Exit loop 3
lw x2, 588(x3)
sw x7, 180(x3)
lw x4, 592(x3)
sw x4, 616(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x8, 60(x3)
# LOOP 177 (depth 3, break at 5, max 6)
addi x1, x0, 6
addi x5, x0, 5
addi x7, x0, 0
loop_start_177:
j loop_exit_177  # Exit loop 3
xor x9, x6, x9
sw x5, 744(x3)
j loop_exit_174  # Exit loop 2
# LOOP 178 (depth 2, break at 4, max 10)
addi x8, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_178:
lw x1, 340(x3)
lw x1, 380(x3)
add x5, x7, x5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 179 (depth 3, break at 1, max 2)
addi x6, x0, 2
addi x4, x0, 1
addi x9, x0, 0
loop_start_179:
or x5, x6, x5
lw x5, 100(x3)
srl x9, x5, x9
lw x9, 644(x3)
lw x9, 416(x3)
j loop_exit_179  # Exit loop 3
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x6, 456(x3)
xor x4, x8, x4
lw x4, 328(x3)
add x7, x8, x7
sll x6, x5, x6
sub x8, x9, x8
j loop_exit_178  # Exit loop 2
j loop_exit_171  # Exit loop 1
sw x5, 432(x3)
sw x5, 504(x3)
sw x4, 112(x3)
# LOOP 180 (depth 1, break at 2, max 4)
addi x7, x0, 4
addi x6, x0, 2
addi x9, x0, 0
loop_start_180:
# LOOP 181 (depth 2, break at 1, max 9)
addi x7, x0, 9
addi x2, x0, 1
addi x6, x0, 0
loop_start_181:
# LOOP 182 (depth 3, break at 5, max 10)
addi x4, x0, 10
addi x2, x0, 5
addi x8, x0, 0
loop_start_182:
sw x9, 996(x3)
sw x6, 616(x3)
sw x5, 708(x3)
xor x7, x6, x7
# LOOP 183 (depth 4, break at 1, max 10)
addi x9, x0, 10
addi x1, x0, 1
addi x5, x0, 0
loop_start_183:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x5, 760(x3)
lw x5, 320(x3)
sw x7, 76(x3)
add x8, x6, x8
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x8, 264(x3)
lw x8, 192(x3)
sw x7, 548(x3)
sll x6, x1, x6
lw x4, 308(x3)
lw x4, 632(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 736(x3)
lw x4, 340(x3)
lw x9, 836(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_183  # Exit loop 4
lw x7, 400(x3)
sw x7, 336(x3)
j loop_exit_182  # Exit loop 3
sw x5, 752(x3)
sw x6, 712(x3)
# LOOP 184 (depth 3, break at 5, max 9)
addi x5, x0, 9
addi x8, x0, 5
addi x2, x0, 0
loop_start_184:
lw x6, 984(x3)
xor x5, x7, x5
# LOOP 185 (depth 4, break at 1, max 7)
addi x8, x0, 7
addi x7, x0, 1
addi x4, x0, 0
loop_start_185:
j loop_exit_185  # Exit loop 4
j loop_exit_184  # Exit loop 3
# LOOP 186 (depth 3, break at 3, max 5)
addi x8, x0, 5
addi x9, x0, 3
addi x2, x0, 0
loop_start_186:
j loop_exit_186  # Exit loop 3
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x5, 24(x3)
sw x4, 872(x3)
xor x9, x1, x9
sub x5, x1, x5
sw x1, 664(x3)
lw x4, 776(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x5, 304(x3)
lw x9, 476(x3)
lw x9, 288(x3)
or x6, x7, x6
or x4, x9, x4
lw x2, 848(x3)
sw x2, 608(x3)
lw x9, 780(x3)
sw x6, 752(x3)
add x1, x6, x1
sw x2, 688(x3)
add x8, x9, x8
sw x9, 488(x3)
lw x7, 236(x3)
add x6, x8, x6
lw x6, 932(x3)
j loop_exit_181  # Exit loop 2
# LOOP 187 (depth 2, break at 1, max 5)
addi x4, x0, 5
addi x9, x0, 1
addi x2, x0, 0
loop_start_187:
lw x9, 872(x3)
lw x1, 292(x3)
sw x4, 124(x3)
sw x2, 540(x3)
and x2, x5, x2
sw x2, 300(x3)
# LOOP 188 (depth 3, break at 5, max 10)
addi x7, x0, 10
addi x4, x0, 5
addi x1, x0, 0
loop_start_188:
lw x9, 464(x3)
j loop_exit_188  # Exit loop 3
lw x5, 972(x3)
j loop_exit_187  # Exit loop 2
sw x1, 920(x3)
or x2, x1, x2
lw x2, 764(x3)
lw x9, 760(x3)
xor x8, x7, x8
# LOOP 189 (depth 2, break at 3, max 4)
addi x1, x0, 4
addi x2, x0, 3
addi x5, x0, 0
loop_start_189:
sw x5, 880(x3)
sw x7, 156(x3)
# LOOP 190 (depth 3, break at 1, max 7)
addi x8, x0, 7
addi x1, x0, 1
addi x2, x0, 0
loop_start_190:
lw x8, 168(x3)
# LOOP 191 (depth 4, break at 3, max 8)
addi x6, x0, 8
addi x1, x0, 3
addi x7, x0, 0
loop_start_191:
sw x6, 780(x3)
j loop_exit_191  # Exit loop 4
lw x6, 972(x3)
sub x7, x6, x7
lw x7, 184(x3)
lw x6, 684(x3)
sw x9, 692(x3)
sw x9, 388(x3)
lw x1, 576(x3)
and x8, x1, x8
sw x1, 20(x3)
and x5, x9, x5
srl x7, x4, x7
j loop_exit_190  # Exit loop 3
# LOOP 192 (depth 3, break at 1, max 3)
addi x8, x0, 3
addi x9, x0, 1
addi x1, x0, 0
loop_start_192:
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
srl x2, x1, x2
sub x4, x4, x4
sw x6, 184(x3)
lw x2, 76(x3)
lw x7, 740(x3)
j loop_exit_192  # Exit loop 3
srl x2, x5, x2
xor x7, x2, x7
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 193 (depth 3, break at 1, max 9)
addi x8, x0, 9
addi x9, x0, 1
addi x4, x0, 0
loop_start_193:
j loop_exit_193  # Exit loop 3
sw x4, 180(x3)
sw x7, 320(x3)
lw x5, 448(x3)
lw x4, 244(x3)
sw x1, 448(x3)
j loop_exit_189  # Exit loop 2
# LOOP 194 (depth 2, break at 3, max 6)
addi x7, x0, 6
addi x9, x0, 3
addi x6, x0, 0
loop_start_194:
j loop_exit_194  # Exit loop 2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x9, x9, x9
sw x9, 992(x3)
and x2, x4, x2
# LOOP 195 (depth 2, break at 5, max 7)
addi x4, x0, 7
addi x7, x0, 5
addi x9, x0, 0
loop_start_195:
j loop_exit_195  # Exit loop 2
sw x9, 324(x3)
add x7, x7, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
and x4, x9, x4
lw x8, 64(x3)
sll x7, x6, x7
# LOOP 196 (depth 2, break at 1, max 2)
addi x6, x0, 2
addi x4, x0, 1
addi x5, x0, 0
loop_start_196:
j loop_exit_196  # Exit loop 2
j loop_exit_180  # Exit loop 1
lw x7, 708(x3)
# LOOP 197 (depth 1, break at 3, max 9)
addi x9, x0, 9
addi x6, x0, 3
addi x8, x0, 0
loop_start_197:
j loop_exit_197  # Exit loop 1
sw x1, 584(x3)
lw x6, 768(x3)
lw x8, 40(x3)
lw x2, 12(x3)
lw x1, 452(x3)
or x2, x6, x2
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x1, x2, x1
sw x1, 892(x3)
sw x2, 336(x3)
# LOOP 198 (depth 1, break at 1, max 4)
addi x5, x0, 4
addi x6, x0, 1
addi x8, x0, 0
loop_start_198:
# LOOP 199 (depth 2, break at 4, max 6)
addi x6, x0, 6
addi x2, x0, 4
addi x4, x0, 0
loop_start_199:
srl x1, x4, x1
lw x1, 28(x3)
j loop_exit_199  # Exit loop 2
# LOOP 200 (depth 2, break at 5, max 6)
addi x7, x0, 6
addi x9, x0, 5
addi x5, x0, 0
loop_start_200:
# LOOP 201 (depth 3, break at 2, max 3)
addi x1, x0, 3
addi x7, x0, 2
addi x4, x0, 0
loop_start_201:
sw x8, 4(x3)
sw x2, 532(x3)
add x9, x2, x9
sw x9, 532(x3)
sw x6, 340(x3)
# LOOP 202 (depth 4, break at 3, max 5)
addi x1, x0, 5
addi x8, x0, 3
addi x5, x0, 0
loop_start_202:
lw x5, 724(x3)
xor x7, x5, x7
sw x7, 44(x3)
or x4, x1, x4
sw x2, 884(x3)
lw x7, 140(x3)
or x4, x7, x4
lw x4, 716(x3)
sw x4, 260(x3)
lw x7, 436(x3)
lw x2, 596(x3)
srl x9, x2, x9
lw x9, 488(x3)
j loop_exit_202  # Exit loop 4
# LOOP 203 (depth 4, break at 5, max 10)
addi x1, x0, 10
addi x2, x0, 5
addi x7, x0, 0
loop_start_203:
lw x7, 612(x3)
sll x1, x7, x1
sw x8, 488(x3)
j loop_exit_203  # Exit loop 4
j loop_exit_201  # Exit loop 3
# LOOP 204 (depth 3, break at 2, max 6)
addi x7, x0, 6
addi x2, x0, 2
addi x6, x0, 0
loop_start_204:
# LOOP 205 (depth 4, break at 1, max 6)
addi x4, x0, 6
addi x8, x0, 1
addi x7, x0, 0
loop_start_205:
sw x7, 496(x3)
or x9, x2, x9
lw x9, 556(x3)
j loop_exit_205  # Exit loop 4
or x7, x2, x7
sw x9, 940(x3)
srl x8, x6, x8
xor x1, x9, x1
sw x1, 736(x3)
j loop_exit_204  # Exit loop 3
sw x8, 832(x3)
add x5, x9, x5
lw x5, 592(x3)
sw x5, 792(x3)
srl x8, x8, x8
sw x5, 240(x3)
sw x5, 240(x3)
lw x1, 804(x3)
sw x1, 644(x3)
lw x4, 960(x3)
xor x8, x9, x8
# LOOP 206 (depth 3, break at 5, max 10)
addi x1, x0, 10
addi x4, x0, 5
addi x7, x0, 0
loop_start_206:
# LOOP 207 (depth 4, break at 5, max 8)
addi x9, x0, 8
addi x6, x0, 5
addi x1, x0, 0
loop_start_207:
sw x4, 904(x3)
xor x6, x8, x6
add x6, x6, x6
# LOOP 208 (depth 5, break at 4, max 5)
addi x9, x0, 5
addi x2, x0, 4
addi x8, x0, 0
loop_start_208:
sw x9, 64(x3)
lw x2, 4(x3)
lw x9, 780(x3)
sub x7, x4, x7
or x1, x5, x1
j loop_exit_208  # Exit loop 5
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x8, 920(x3)
lw x5, 728(x3)
sw x5, 936(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
and x2, x4, x2
# LOOP 209 (depth 5, break at 5, max 7)
addi x4, x0, 7
addi x5, x0, 5
addi x9, x0, 0
loop_start_209:
sw x2, 916(x3)
sw x6, 168(x3)
lw x6, 68(x3)
and x8, x9, x8
sw x8, 580(x3)
j loop_exit_209  # Exit loop 5
add x2, x2, x2
or x5, x2, x5
xor x2, x5, x2
lw x1, 164(x3)
sw x6, 608(x3)
sw x9, 352(x3)
lw x8, 936(x3)
lw x5, 664(x3)
lw x7, 788(x3)
xor x6, x4, x6
sw x6, 680(x3)
j loop_exit_207  # Exit loop 4
lw x1, 844(x3)
lw x1, 728(x3)
sll x6, x2, x6
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
xor x7, x6, x7
lw x7, 548(x3)
or x2, x9, x2
sw x9, 120(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_206  # Exit loop 3
# LOOP 210 (depth 3, break at 4, max 6)
addi x9, x0, 6
addi x1, x0, 4
addi x8, x0, 0
loop_start_210:
or x7, x8, x7
sll x8, x9, x8
or x9, x8, x9
and x6, x9, x6
j loop_exit_210  # Exit loop 3
and x2, x4, x2
add x1, x2, x1
# LOOP 211 (depth 3, break at 4, max 7)
addi x7, x0, 7
addi x8, x0, 4
addi x5, x0, 0
loop_start_211:
lw x5, 124(x3)
j loop_exit_211  # Exit loop 3
srl x6, x4, x6
# LOOP 212 (depth 3, break at 4, max 7)
addi x2, x0, 7
addi x5, x0, 4
addi x7, x0, 0
loop_start_212:
sub x7, x7, x7
and x6, x7, x6
sw x5, 304(x3)
add x8, x5, x8
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_212  # Exit loop 3
sw x1, 864(x3)
# LOOP 213 (depth 3, break at 5, max 10)
addi x5, x0, 10
addi x7, x0, 5
addi x2, x0, 0
loop_start_213:
lw x7, 232(x3)
sw x7, 720(x3)
# LOOP 214 (depth 4, break at 3, max 6)
addi x4, x0, 6
addi x9, x0, 3
addi x8, x0, 0
loop_start_214:
sw x8, 860(x3)
lw x5, 48(x3)
and x7, x8, x7
sw x7, 948(x3)
lw x6, 460(x3)
sw x6, 232(x3)
sw x5, 740(x3)
or x4, x1, x4
j loop_exit_214  # Exit loop 4
j loop_exit_213  # Exit loop 3
j loop_exit_200  # Exit loop 2
sub x7, x8, x7
# LOOP 215 (depth 2, break at 3, max 5)
addi x4, x0, 5
addi x2, x0, 3
addi x6, x0, 0
loop_start_215:
sw x4, 356(x3)
lw x2, 992(x3)
and x1, x5, x1
lw x2, 696(x3)
sw x8, 964(x3)
# LOOP 216 (depth 3, break at 5, max 10)
addi x7, x0, 10
addi x9, x0, 5
addi x5, x0, 0
loop_start_216:
sw x5, 740(x3)
xor x4, x6, x4
# LOOP 217 (depth 4, break at 5, max 10)
addi x8, x0, 10
addi x9, x0, 5
addi x6, x0, 0
loop_start_217:
lw x6, 292(x3)
sub x9, x6, x9
srl x1, x6, x1
# LOOP 218 (depth 5, break at 2, max 4)
addi x4, x0, 4
addi x5, x0, 2
addi x2, x0, 0
loop_start_218:
j loop_exit_218  # Exit loop 5
lw x5, 164(x3)
sll x7, x6, x7
j loop_exit_217  # Exit loop 4
sw x6, 984(x3)
or x9, x5, x9
sw x9, 700(x3)
sw x6, 860(x3)
# LOOP 219 (depth 4, break at 2, max 6)
addi x1, x0, 6
addi x2, x0, 2
addi x5, x0, 0
loop_start_219:
j loop_exit_219  # Exit loop 4
or x8, x2, x8
sub x2, x8, x2
# LOOP 220 (depth 4, break at 2, max 5)
addi x4, x0, 5
addi x7, x0, 2
addi x5, x0, 0
loop_start_220:
add x8, x5, x8
sw x8, 976(x3)
sub x2, x2, x2
lw x4, 784(x3)
# LOOP 221 (depth 5, break at 2, max 8)
addi x5, x0, 8
addi x1, x0, 2
addi x6, x0, 0
loop_start_221:
sw x6, 64(x3)
lw x1, 860(x3)
sw x7, 580(x3)
lw x4, 440(x3)
and x2, x4, x2
lw x7, 984(x3)
srl x2, x5, x2
sll x8, x6, x8
lw x8, 496(x3)
sll x9, x5, x9
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_221  # Exit loop 5
sw x9, 408(x3)
sw x7, 808(x3)
sw x6, 604(x3)
and x2, x8, x2
j loop_exit_220  # Exit loop 4
# LOOP 222 (depth 4, break at 3, max 9)
addi x8, x0, 9
addi x7, x0, 3
addi x9, x0, 0
loop_start_222:
sw x4, 4(x3)
sw x4, 236(x3)
lw x6, 320(x3)
add x6, x6, x6
sw x4, 116(x3)
sw x2, 312(x3)
lw x7, 792(x3)
lw x7, 1000(x3)
sw x2, 464(x3)
srl x1, x5, x1
lw x2, 476(x3)
j loop_exit_222  # Exit loop 4
j loop_exit_216  # Exit loop 3
lw x2, 124(x3)
# LOOP 223 (depth 3, break at 5, max 8)
addi x1, x0, 8
addi x8, x0, 5
addi x7, x0, 0
loop_start_223:
j loop_exit_223  # Exit loop 3
sub x1, x7, x1
# LOOP 224 (depth 3, break at 1, max 9)
addi x7, x0, 9
addi x9, x0, 1
addi x2, x0, 0
loop_start_224:
lw x2, 264(x3)
sw x2, 84(x3)
lw x4, 476(x3)
sw x4, 944(x3)
srl x2, x6, x2
sw x7, 896(x3)
sw x8, 708(x3)
# LOOP 225 (depth 4, break at 4, max 8)
addi x4, x0, 8
addi x5, x0, 4
addi x6, x0, 0
loop_start_225:
sw x6, 12(x3)
sw x2, 148(x3)
lw x1, 372(x3)
lw x2, 664(x3)
sw x4, 992(x3)
lw x6, 72(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
or x8, x8, x8
sub x7, x8, x7
sw x7, 736(x3)
j loop_exit_225  # Exit loop 4
j loop_exit_224  # Exit loop 3
sw x5, 172(x3)
lw x8, 568(x3)
# LOOP 226 (depth 3, break at 2, max 3)
addi x1, x0, 3
addi x9, x0, 2
addi x4, x0, 0
loop_start_226:
lw x4, 672(x3)
# LOOP 227 (depth 4, break at 5, max 9)
addi x8, x0, 9
addi x5, x0, 5
addi x2, x0, 0
loop_start_227:
sw x7, 100(x3)
j loop_exit_227  # Exit loop 4
lw x8, 748(x3)
lw x5, 796(x3)
lw x5, 640(x3)
sw x5, 940(x3)
sw x2, 336(x3)
sll x6, x8, x6
lw x6, 148(x3)
j loop_exit_226  # Exit loop 3
lw x1, 764(x3)
lw x1, 580(x3)
sw x1, 808(x3)
sw x7, 60(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 228 (depth 3, break at 1, max 7)
addi x2, x0, 7
addi x6, x0, 1
addi x7, x0, 0
loop_start_228:
and x5, x9, x5
sll x1, x6, x1
sw x6, 896(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x9, 696(x3)
sw x6, 876(x3)
lw x5, 432(x3)
lw x1, 8(x3)
j loop_exit_228  # Exit loop 3
lw x9, 212(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_215  # Exit loop 2
srl x9, x9, x9
sw x9, 724(x3)
# LOOP 229 (depth 2, break at 2, max 7)
addi x8, x0, 7
addi x2, x0, 2
addi x4, x0, 0
loop_start_229:
# LOOP 230 (depth 3, break at 4, max 9)
addi x7, x0, 9
addi x9, x0, 4
addi x6, x0, 0
loop_start_230:
sw x9, 56(x3)
lw x5, 348(x3)
j loop_exit_230  # Exit loop 3
lw x2, 240(x3)
j loop_exit_229  # Exit loop 2
# LOOP 231 (depth 2, break at 2, max 4)
addi x8, x0, 4
addi x6, x0, 2
addi x7, x0, 0
loop_start_231:
srl x2, x7, x2
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 232 (depth 3, break at 1, max 9)
addi x8, x0, 9
addi x1, x0, 1
addi x5, x0, 0
loop_start_232:
j loop_exit_232  # Exit loop 3
lw x9, 176(x3)
j loop_exit_231  # Exit loop 2
lw x9, 536(x3)
# LOOP 233 (depth 2, break at 5, max 9)
addi x5, x0, 9
addi x4, x0, 5
addi x6, x0, 0
loop_start_233:
sub x7, x5, x7
sw x7, 152(x3)
xor x2, x8, x2
lw x2, 284(x3)
sw x8, 652(x3)
sw x5, 564(x3)
sw x1, 448(x3)
j loop_exit_233  # Exit loop 2
# LOOP 234 (depth 2, break at 1, max 8)
addi x9, x0, 8
addi x4, x0, 1
addi x1, x0, 0
loop_start_234:
j loop_exit_234  # Exit loop 2
lw x6, 736(x3)
lw x2, 588(x3)
sw x6, 416(x3)
xor x9, x7, x9
# LOOP 235 (depth 2, break at 4, max 6)
addi x8, x0, 6
addi x4, x0, 4
addi x1, x0, 0
loop_start_235:
lw x2, 524(x3)
j loop_exit_235  # Exit loop 2
srl x9, x8, x9
# LOOP 236 (depth 2, break at 2, max 6)
addi x6, x0, 6
addi x8, x0, 2
addi x7, x0, 0
loop_start_236:
sw x7, 988(x3)
# LOOP 237 (depth 3, break at 1, max 7)
addi x8, x0, 7
addi x9, x0, 1
addi x2, x0, 0
loop_start_237:
lw x1, 916(x3)
sll x7, x1, x7
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_237  # Exit loop 3
# LOOP 238 (depth 3, break at 2, max 10)
addi x8, x0, 10
addi x9, x0, 2
addi x5, x0, 0
loop_start_238:
and x6, x9, x6
j loop_exit_238  # Exit loop 3
sub x8, x8, x8
sw x6, 424(x3)
lw x2, 736(x3)
sw x2, 812(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x9, 492(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_236  # Exit loop 2
# LOOP 239 (depth 2, break at 4, max 9)
addi x4, x0, 9
addi x9, x0, 4
addi x5, x0, 0
loop_start_239:
j loop_exit_239  # Exit loop 2
j loop_exit_198  # Exit loop 1
sll x9, x4, x9
and x1, x4, x1
# LOOP 240 (depth 1, break at 1, max 4)
addi x4, x0, 4
addi x2, x0, 1
addi x6, x0, 0
loop_start_240:
sll x7, x5, x7
j loop_exit_240  # Exit loop 1
lw x7, 124(x3)
# LOOP 241 (depth 1, break at 4, max 9)
addi x5, x0, 9
addi x2, x0, 4
addi x8, x0, 0
loop_start_241:
lw x8, 628(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 242 (depth 2, break at 4, max 8)
addi x6, x0, 8
addi x1, x0, 4
addi x4, x0, 0
loop_start_242:
lw x4, 936(x3)
srl x8, x6, x8
# LOOP 243 (depth 3, break at 5, max 8)
addi x2, x0, 8
addi x6, x0, 5
addi x5, x0, 0
loop_start_243:
sw x2, 204(x3)
sw x4, 176(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 392(x3)
sw x1, 396(x3)
lw x1, 660(x3)
lw x4, 444(x3)
j loop_exit_243  # Exit loop 3
# LOOP 244 (depth 3, break at 5, max 7)
addi x8, x0, 7
addi x6, x0, 5
addi x2, x0, 0
loop_start_244:
sw x5, 676(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x6, 36(x3)
sw x5, 792(x3)
j loop_exit_244  # Exit loop 3
sw x8, 332(x3)
lw x8, 68(x3)
j loop_exit_242  # Exit loop 2
sub x5, x8, x5
lw x1, 136(x3)
sw x1, 1000(x3)
xor x6, x4, x6
# LOOP 245 (depth 2, break at 2, max 3)
addi x5, x0, 3
addi x8, x0, 2
addi x9, x0, 0
loop_start_245:
lw x2, 480(x3)
or x5, x4, x5
xor x9, x9, x9
srl x5, x9, x5
# LOOP 246 (depth 3, break at 4, max 7)
addi x4, x0, 7
addi x9, x0, 4
addi x8, x0, 0
loop_start_246:
sw x8, 676(x3)
srl x1, x5, x1
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
# LOOP 247 (depth 4, break at 1, max 7)
addi x2, x0, 7
addi x7, x0, 1
addi x5, x0, 0
loop_start_247:
# LOOP 248 (depth 5, break at 4, max 8)
addi x1, x0, 8
addi x7, x0, 4
addi x9, x0, 0
loop_start_248:
lw x9, 364(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sub x7, x6, x7
lw x6, 344(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x8, 416(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
j loop_exit_248  # Exit loop 5
sw x7, 528(x3)
j loop_exit_247  # Exit loop 4
j loop_exit_246  # Exit loop 3
# LOOP 249 (depth 3, break at 1, max 8)
addi x4, x0, 8
addi x2, x0, 1
addi x1, x0, 0
loop_start_249:
sw x1, 200(x3)
sw x4, 236(x3)
sw x7, 4(x3)
lw x8, 468(x3)
j loop_exit_249  # Exit loop 3
# LOOP 250 (depth 3, break at 5, max 7)
addi x5, x0, 7
addi x2, x0, 5
addi x7, x0, 0
loop_start_250:
j loop_exit_250  # Exit loop 3
srl x8, x7, x8
j loop_exit_245  # Exit loop 2
add x4, x4, x4
add x1, x4, x1
lw x1, 684(x3)
lw x4, 36(x3)
# LOOP 251 (depth 2, break at 1, max 5)
addi x8, x0, 5
addi x7, x0, 1
addi x2, x0, 0
loop_start_251:
lw x2, 696(x3)
lw x7, 740(x3)
lw x7, 692(x3)
lw x7, 964(x3)
xor x6, x1, x6
or x6, x6, x6
# LOOP 252 (depth 3, break at 5, max 6)
addi x5, x0, 6
addi x4, x0, 5
addi x1, x0, 0
loop_start_252:
lw x5, 988(x3)
sll x1, x7, x1
lw x1, 880(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 253 (depth 4, break at 3, max 10)
addi x9, x0, 10
addi x4, x0, 3
addi x7, x0, 0
loop_start_253:
lw x2, 788(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x1, x5, x1
sub x4, x9, x4
srl x2, x2, x2
xor x6, x8, x6
or x7, x8, x7
srl x7, x7, x7
sw x2, 324(x3)
sw x2, 36(x3)
# LOOP 254 (depth 5, break at 5, max 7)
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_254:
or x7, x5, x7
srl x1, x5, x1
sw x5, 76(x3)
j loop_exit_254  # Exit loop 5
sw x7, 608(x3)
j loop_exit_253  # Exit loop 4
sw x2, 64(x3)
lw x8, 148(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x8, 620(x3)
j loop_exit_252  # Exit loop 3
j loop_exit_251  # Exit loop 2
sw x6, 652(x3)
sw x6, 968(x3)
sw x2, 708(x3)
j loop_exit_241  # Exit loop 1
# LOOP 255 (depth 1, break at 2, max 8)
addi x4, x0, 8
addi x6, x0, 2
addi x7, x0, 0
loop_start_255:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
lw x8, 836(x3)
lw x8, 628(x3)
# LOOP 256 (depth 2, break at 4, max 8)
addi x4, x0, 8
addi x2, x0, 4
addi x9, x0, 0
loop_start_256:
# LOOP 257 (depth 3, break at 4, max 6)
addi x2, x0, 6
addi x8, x0, 4
addi x6, x0, 0
loop_start_257:
sw x6, 140(x3)
xor x9, x4, x9
sub x6, x7, x6
sll x1, x6, x1
add x5, x2, x5
sw x5, 248(x3)
sub x6, x1, x6
lw x1, 992(x3)
lw x9, 468(x3)
lw x2, 844(x3)
lw x2, 504(x3)
# LOOP 258 (depth 4, break at 2, max 3)
addi x8, x0, 3
addi x4, x0, 2
addi x6, x0, 0
loop_start_258:
sw x9, 636(x3)
j loop_exit_258  # Exit loop 4
j loop_exit_257  # Exit loop 3
j loop_exit_256  # Exit loop 2
# LOOP 259 (depth 2, break at 4, max 9)
addi x7, x0, 9
addi x5, x0, 4
addi x8, x0, 0
loop_start_259:
lw x6, 1000(x3)
sw x6, 848(x3)
sw x5, 616(x3)
and x2, x2, x2
j loop_exit_259  # Exit loop 2
# LOOP 260 (depth 2, break at 4, max 6)
addi x4, x0, 6
addi x7, x0, 4
addi x8, x0, 0
loop_start_260:
sw x8, 576(x3)
lw x2, 888(x3)
j loop_exit_260  # Exit loop 2
lw x2, 312(x3)
sll x4, x2, x4
j loop_exit_255  # Exit loop 1
sw x5, 176(x3)
sw x7, 948(x3)
sll x2, x7, x2
srl x5, x4, x5
or x2, x5, x2
add x7, x2, x7
sw x5, 136(x3)
lw x4, 596(x3)
sub x7, x8, x7
srl x9, x7, x9
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 261 (depth 1, break at 2, max 10)
addi x4, x0, 10
addi x1, x0, 2
addi x6, x0, 0
loop_start_261:
sll x7, x8, x7
add x1, x7, x1
# LOOP 262 (depth 2, break at 4, max 6)
addi x5, x0, 6
addi x8, x0, 4
addi x7, x0, 0
loop_start_262:
sw x9, 744(x3)
j loop_exit_262  # Exit loop 2
lw x4, 528(x3)
j loop_exit_261  # Exit loop 1
sub x1, x5, x1
xor x4, x1, x4
sub x7, x4, x7
lw x7, 776(x3)
# LOOP 263 (depth 1, break at 2, max 4)
addi x5, x0, 4
addi x8, x0, 2
addi x9, x0, 0
loop_start_263:
lw x5, 164(x3)
j loop_exit_263  # Exit loop 1
sw x6, 392(x3)
and x4, x4, x4
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x4, 816(x3)
lw x2, 356(x3)
lw x2, 924(x3)
# LOOP 264 (depth 1, break at 2, max 4)
addi x7, x0, 4
addi x9, x0, 2
addi x8, x0, 0
loop_start_264:
# LOOP 265 (depth 2, break at 3, max 8)
addi x7, x0, 8
addi x2, x0, 3
addi x6, x0, 0
loop_start_265:
j loop_exit_265  # Exit loop 2
# LOOP 266 (depth 2, break at 4, max 6)
addi x4, x0, 6
addi x8, x0, 4
addi x7, x0, 0
loop_start_266:
srl x5, x7, x5
add x8, x7, x8
lw x6, 212(x3)
lw x1, 788(x3)
or x8, x2, x8
sub x7, x4, x7
sw x7, 152(x3)
# LOOP 267 (depth 3, break at 2, max 10)
addi x9, x0, 10
addi x1, x0, 2
addi x4, x0, 0
loop_start_267:
j loop_exit_267  # Exit loop 3
# LOOP 268 (depth 3, break at 5, max 9)
addi x8, x0, 9
addi x5, x0, 5
addi x1, x0, 0
loop_start_268:
sw x8, 228(x3)
and x6, x2, x6
sw x1, 540(x3)
sll x8, x5, x8
sw x8, 0(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x9, 116(x3)
sw x9, 536(x3)
# LOOP 269 (depth 4, break at 3, max 5)
addi x4, x0, 5
addi x2, x0, 3
addi x8, x0, 0
loop_start_269:
sw x8, 80(x3)
xor x9, x1, x9
sll x6, x9, x6
sw x6, 428(x3)
sw x9, 380(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
# LOOP 270 (depth 5, break at 3, max 8)
addi x8, x0, 8
addi x1, x0, 3
addi x4, x0, 0
loop_start_270:
lw x6, 556(x3)
sw x6, 784(x3)
lw x1, 764(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
or x7, x1, x7
lw x9, 580(x3)
j loop_exit_270  # Exit loop 5
lw x4, 348(x3)
lw x4, 752(x3)
or x6, x7, x6
lw x2, 0(x3)
lw x2, 860(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
sw x2, 292(x3)
# LOOP 271 (depth 5, break at 2, max 6)
addi x8, x0, 6
addi x4, x0, 2
addi x1, x0, 0
loop_start_271:
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
add x4, x1, x4
j loop_exit_271  # Exit loop 5
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
lw x4, 412(x3)
# LOOP 272 (depth 5, break at 2, max 9)
addi x8, x0, 9
addi x1, x0, 2
addi x9, x0, 0
loop_start_272:
lw x9, 76(x3)
sw x9, 776(x3)
lw x2, 172(x3)
bne x0, x0, 8
addi x0, x0, 0  # Executed instruction
xor x5, x2, x5
sub x8, x4, x8
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sub x1, x2, x1
sw x8, 940(x3)
lw x4, 408(x3)
and x5, x2, x5
sll x6, x9, x6
sw x4, 312(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
sw x7, 800(x3)
j loop_exit_272  # Exit loop 5
j loop_exit_269  # Exit loop 4
and x1, x5, x1
# LOOP 273 (depth 4, break at 1, max 5)
addi x2, x0, 5
addi x7, x0, 1
addi x8, x0, 0
loop_start_273:
and x1, x8, x1
lw x4, 104(x3)
# LOOP 274 (depth 5, break at 5, max 6)
addi x5, x0, 6
addi x2, x0, 5
addi x7, x0, 0
loop_start_274:
xor x1, x1, x1
sw x1, 432(x3)
sll x8, x8, x8
sw x7, 428(x3)
beq x0, x0, 8
addi x0, x0, 0  # Skipped instruction
j loop_exit_274  # Exit loop 5
lw x1, 940(x3)
sub x2, x9, x2
or x8, x1, x8
sw x8, 772(x3)
lw x6, 80(x3)
sw x7, 100(x3)
sw x4, 640(x3)
lw x2, 848(x3)
addi x8, x8, 1
beq x8, x7, 8   # Break to skip next instruction
blt x8, x2, loop_start_273
loop_exit_273:
addi x1, x1, 1
beq x1, x5, 8   # Break to skip next instruction
blt x1, x8, loop_start_268
loop_exit_268:
addi x7, x7, 1
beq x7, x8, 8   # Break to skip next instruction
blt x7, x4, loop_start_266
loop_exit_266:
addi x8, x8, 1
beq x8, x9, 8   # Break to skip next instruction
blt x8, x7, loop_start_264
loop_exit_264:

# Program exit
addi a0, zero, 0     # Set exit code to 0
addi a7, zero, 93    # Exit syscall number
ecall
