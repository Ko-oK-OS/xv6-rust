
target/riscv64gc-unknown-none-elf/debug/kernel:	file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
80000000: 17 21 01 00  	auipc	sp, 18
80000004: 13 01 01 09  	addi	sp, sp, 144
80000008: 05 65        	lui	a0, 1
8000000a: f3 25 40 f1  	csrr	a1, mhartid
8000000e: 85 05        	addi	a1, a1, 1
80000010: 33 05 b5 02  	<unknown>
80000014: 2a 91        	add	sp, sp, a0
80000016: 97 60 00 00  	auipc	ra, 6
8000001a: e7 80 60 4e  	jalr	1254(ra)

000000008000001e <junk>:
8000001e: 01 a0        	j	0 <junk>

0000000080000020 <kernelvec>:
80000020: 11 71        	addi	sp, sp, -256
80000022: 06 e0        	sd	ra, 0(sp)
80000024: 0a e4        	sd	sp, 8(sp)
80000026: 0e e8        	sd	gp, 16(sp)
80000028: 12 ec        	sd	tp, 24(sp)
8000002a: 16 f0        	sd	t0, 32(sp)
8000002c: 1a f4        	sd	t1, 40(sp)
8000002e: 1e f8        	sd	t2, 48(sp)
80000030: 22 fc        	sd	s0, 56(sp)
80000032: a6 e0        	sd	s1, 64(sp)
80000034: aa e4        	sd	a0, 72(sp)
80000036: ae e8        	sd	a1, 80(sp)
80000038: b2 ec        	sd	a2, 88(sp)
8000003a: b6 f0        	sd	a3, 96(sp)
8000003c: ba f4        	sd	a4, 104(sp)
8000003e: be f8        	sd	a5, 112(sp)
80000040: c2 fc        	sd	a6, 120(sp)
80000042: 46 e1        	sd	a7, 128(sp)
80000044: 4a e5        	sd	s2, 136(sp)
80000046: 4e e9        	sd	s3, 144(sp)
80000048: 52 ed        	sd	s4, 152(sp)
8000004a: 56 f1        	sd	s5, 160(sp)
8000004c: 5a f5        	sd	s6, 168(sp)
8000004e: 5e f9        	sd	s7, 176(sp)
80000050: 62 fd        	sd	s8, 184(sp)
80000052: e6 e1        	sd	s9, 192(sp)
80000054: ea e5        	sd	s10, 200(sp)
80000056: ee e9        	sd	s11, 208(sp)
80000058: f2 ed        	sd	t3, 216(sp)
8000005a: f6 f1        	sd	t4, 224(sp)
8000005c: fa f5        	sd	t5, 232(sp)
8000005e: fe f9        	sd	t6, 240(sp)
80000060: 97 40 00 00  	auipc	ra, 4
80000064: e7 80 20 39  	jalr	914(ra)
80000068: 82 60        	ld	ra, 0(sp)
8000006a: 22 61        	ld	sp, 8(sp)
8000006c: c2 61        	ld	gp, 16(sp)
8000006e: 82 72        	ld	t0, 32(sp)
80000070: 22 73        	ld	t1, 40(sp)
80000072: c2 73        	ld	t2, 48(sp)
80000074: 62 74        	ld	s0, 56(sp)
80000076: 86 64        	ld	s1, 64(sp)
80000078: 26 65        	ld	a0, 72(sp)
8000007a: c6 65        	ld	a1, 80(sp)
8000007c: 66 66        	ld	a2, 88(sp)
8000007e: 86 76        	ld	a3, 96(sp)
80000080: 26 77        	ld	a4, 104(sp)
80000082: c6 77        	ld	a5, 112(sp)
80000084: 66 78        	ld	a6, 120(sp)
80000086: 8a 68        	ld	a7, 128(sp)
80000088: 2a 69        	ld	s2, 136(sp)
8000008a: ca 69        	ld	s3, 144(sp)
8000008c: 6a 6a        	ld	s4, 152(sp)
8000008e: 8a 7a        	ld	s5, 160(sp)
80000090: 2a 7b        	ld	s6, 168(sp)
80000092: ca 7b        	ld	s7, 176(sp)
80000094: 6a 7c        	ld	s8, 184(sp)
80000096: 8e 6c        	ld	s9, 192(sp)
80000098: 2e 6d        	ld	s10, 200(sp)
8000009a: ce 6d        	ld	s11, 208(sp)
8000009c: 6e 6e        	ld	t3, 216(sp)
8000009e: 8e 7e        	ld	t4, 224(sp)
800000a0: 2e 7f        	ld	t5, 232(sp)
800000a2: ce 7f        	ld	t6, 240(sp)
800000a4: 11 61        	addi	sp, sp, 256
800000a6: 73 00 20 10  	sret	
800000aa: 13 00 00 00  	nop
800000ae: 01 00        	nop

00000000800000b0 <timervec>:
800000b0: 73 15 05 34  	csrrw	a0, mscratch, a0
800000b4: 0c e1        	sd	a1, 0(a0)
800000b6: 10 e5        	sd	a2, 8(a0)
800000b8: 14 e9        	sd	a3, 16(a0)
800000ba: 0c 6d        	ld	a1, 24(a0)
800000bc: 10 71        	ld	a2, 32(a0)
800000be: 94 61        	ld	a3, 0(a1)
800000c0: b2 96        	add	a3, a3, a2
800000c2: 94 e1        	sd	a3, 0(a1)
800000c4: 89 45        	addi	a1, zero, 2
800000c6: 73 90 45 14  	csrw	sip, a1
800000ca: 14 69        	ld	a3, 16(a0)
800000cc: 10 65        	ld	a2, 8(a0)
800000ce: 0c 61        	ld	a1, 0(a0)
800000d0: 73 15 05 34  	csrrw	a0, mscratch, a0
800000d4: 73 00 20 30  	mret	
		...

0000000080001000 <uservec>:
80001000: 73 15 05 14  	csrrw	a0, sscratch, a0
80001004: 23 34 15 02  	sd	ra, 40(a0)
80001008: 23 38 25 02  	sd	sp, 48(a0)
8000100c: 23 3c 35 02  	sd	gp, 56(a0)
80001010: 23 30 45 04  	sd	tp, 64(a0)
80001014: 23 34 55 04  	sd	t0, 72(a0)
80001018: 23 38 65 04  	sd	t1, 80(a0)
8000101c: 23 3c 75 04  	sd	t2, 88(a0)
80001020: 20 f1        	sd	s0, 96(a0)
80001022: 24 f5        	sd	s1, 104(a0)
80001024: 2c fd        	sd	a1, 120(a0)
80001026: 50 e1        	sd	a2, 128(a0)
80001028: 54 e5        	sd	a3, 136(a0)
8000102a: 58 e9        	sd	a4, 144(a0)
8000102c: 5c ed        	sd	a5, 152(a0)
8000102e: 23 30 05 0b  	sd	a6, 160(a0)
80001032: 23 34 15 0b  	sd	a7, 168(a0)
80001036: 23 38 25 0b  	sd	s2, 176(a0)
8000103a: 23 3c 35 0b  	sd	s3, 184(a0)
8000103e: 23 30 45 0d  	sd	s4, 192(a0)
80001042: 23 34 55 0d  	sd	s5, 200(a0)
80001046: 23 38 65 0d  	sd	s6, 208(a0)
8000104a: 23 3c 75 0d  	sd	s7, 216(a0)
8000104e: 23 30 85 0f  	sd	s8, 224(a0)
80001052: 23 34 95 0f  	sd	s9, 232(a0)
80001056: 23 38 a5 0f  	sd	s10, 240(a0)
8000105a: 23 3c b5 0f  	sd	s11, 248(a0)
8000105e: 23 30 c5 11  	sd	t3, 256(a0)
80001062: 23 34 d5 11  	sd	t4, 264(a0)
80001066: 23 38 e5 11  	sd	t5, 272(a0)
8000106a: 23 3c f5 11  	sd	t6, 280(a0)
8000106e: f3 22 00 14  	csrr	t0, sscratch
80001072: 23 38 55 06  	sd	t0, 112(a0)
80001076: 03 31 85 00  	ld	sp, 8(a0)
8000107a: 03 32 05 02  	ld	tp, 32(a0)
8000107e: 83 32 05 01  	ld	t0, 16(a0)
80001082: 03 33 05 00  	ld	t1, 0(a0)
80001086: 73 10 03 18  	csrw	satp, t1
8000108a: 73 00 00 12  	sfence.vma
8000108e: 82 82        	jr	t0

0000000080001090 <userret>:
80001090: 73 90 05 18  	csrw	satp, a1
80001094: 73 00 00 12  	sfence.vma
80001098: 83 32 05 07  	ld	t0, 112(a0)
8000109c: 73 90 02 14  	csrw	sscratch, t0
800010a0: 83 30 85 02  	ld	ra, 40(a0)
800010a4: 03 31 05 03  	ld	sp, 48(a0)
800010a8: 83 31 85 03  	ld	gp, 56(a0)
800010ac: 03 32 05 04  	ld	tp, 64(a0)
800010b0: 83 32 85 04  	ld	t0, 72(a0)
800010b4: 03 33 05 05  	ld	t1, 80(a0)
800010b8: 83 33 85 05  	ld	t2, 88(a0)
800010bc: 20 71        	ld	s0, 96(a0)
800010be: 24 75        	ld	s1, 104(a0)
800010c0: 2c 7d        	ld	a1, 120(a0)
800010c2: 50 61        	ld	a2, 128(a0)
800010c4: 54 65        	ld	a3, 136(a0)
800010c6: 58 69        	ld	a4, 144(a0)
800010c8: 5c 6d        	ld	a5, 152(a0)
800010ca: 03 38 05 0a  	ld	a6, 160(a0)
800010ce: 83 38 85 0a  	ld	a7, 168(a0)
800010d2: 03 39 05 0b  	ld	s2, 176(a0)
800010d6: 83 39 85 0b  	ld	s3, 184(a0)
800010da: 03 3a 05 0c  	ld	s4, 192(a0)
800010de: 83 3a 85 0c  	ld	s5, 200(a0)
800010e2: 03 3b 05 0d  	ld	s6, 208(a0)
800010e6: 83 3b 85 0d  	ld	s7, 216(a0)
800010ea: 03 3c 05 0e  	ld	s8, 224(a0)
800010ee: 83 3c 85 0e  	ld	s9, 232(a0)
800010f2: 03 3d 05 0f  	ld	s10, 240(a0)
800010f6: 83 3d 85 0f  	ld	s11, 248(a0)
800010fa: 03 3e 05 10  	ld	t3, 256(a0)
800010fe: 83 3e 85 10  	ld	t4, 264(a0)
80001102: 03 3f 05 11  	ld	t5, 272(a0)
80001106: 83 3f 85 11  	ld	t6, 280(a0)
8000110a: 73 15 05 14  	csrrw	a0, sscratch, a0
8000110e: 73 00 20 10  	sret	

0000000080001112 <swtch>:
80001112: 23 30 15 00  	sd	ra, 0(a0)
80001116: 23 34 25 00  	sd	sp, 8(a0)
8000111a: 00 e9        	sd	s0, 16(a0)
8000111c: 04 ed        	sd	s1, 24(a0)
8000111e: 23 30 25 03  	sd	s2, 32(a0)
80001122: 23 34 35 03  	sd	s3, 40(a0)
80001126: 23 38 45 03  	sd	s4, 48(a0)
8000112a: 23 3c 55 03  	sd	s5, 56(a0)
8000112e: 23 30 65 05  	sd	s6, 64(a0)
80001132: 23 34 75 05  	sd	s7, 72(a0)
80001136: 23 38 85 05  	sd	s8, 80(a0)
8000113a: 23 3c 95 05  	sd	s9, 88(a0)
8000113e: 23 30 a5 07  	sd	s10, 96(a0)
80001142: 23 34 b5 07  	sd	s11, 104(a0)
80001146: 83 b0 05 00  	ld	ra, 0(a1)
8000114a: 03 b1 85 00  	ld	sp, 8(a1)
8000114e: 80 69        	ld	s0, 16(a1)
80001150: 84 6d        	ld	s1, 24(a1)
80001152: 03 b9 05 02  	ld	s2, 32(a1)
80001156: 83 b9 85 02  	ld	s3, 40(a1)
8000115a: 03 ba 05 03  	ld	s4, 48(a1)
8000115e: 83 ba 85 03  	ld	s5, 56(a1)
80001162: 03 bb 05 04  	ld	s6, 64(a1)
80001166: 83 bb 85 04  	ld	s7, 72(a1)
8000116a: 03 bc 05 05  	ld	s8, 80(a1)
8000116e: 83 bc 85 05  	ld	s9, 88(a1)
80001172: 03 bd 05 06  	ld	s10, 96(a1)
80001176: 83 bd 85 06  	ld	s11, 104(a1)
8000117a: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E:

000000008000117c <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E>:
8000117c: 11 71        	addi	sp, sp, -256
8000117e: 86 fd        	sd	ra, 248(sp)
80001180: aa ed        	sd	a0, 216(sp)
80001182: ae f1        	sd	a1, 224(sp)
80001184: b2 f5        	sd	a2, 232(sp)
80001186: 32 f4        	sd	a2, 40(sp)
80001188: 2e f0        	sd	a1, 32(sp)
8000118a: 97 10 00 00  	auipc	ra, 1
8000118e: e7 80 60 a6  	jalr	-1434(ra)
80001192: aa e4        	sd	a0, 72(sp)
80001194: 09 a0        	j	2 <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E+0x1a>
80001196: a8 00        	addi	a0, sp, 72
80001198: 97 10 00 00  	auipc	ra, 1
8000119c: e7 80 c0 4b  	jalr	1212(ra)
800011a0: 2a ec        	sd	a0, 24(sp)
800011a2: 09 a0        	j	2 <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E+0x28>
800011a4: c1 46        	addi	a3, zero, 16
800011a6: 37 07 00 08  	lui	a4, 32768
800011aa: 62 65        	ld	a0, 24(sp)
800011ac: 82 75        	ld	a1, 32(sp)
800011ae: 22 76        	ld	a2, 40(sp)
800011b0: 97 80 00 00  	auipc	ra, 8
800011b4: e7 80 80 33  	jalr	824(ra)
800011b8: 2a fc        	sd	a0, 56(sp)
800011ba: ae e0        	sd	a1, 64(sp)
800011bc: 09 a0        	j	2 <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E+0x42>
800011be: a8 00        	addi	a0, sp, 72
800011c0: 97 00 00 00  	auipc	ra, 0
800011c4: e7 80 c0 77  	jalr	1916(ra)
800011c8: 09 a0        	j	2 <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E+0x4e>
800011ca: 62 75        	ld	a0, 56(sp)
800011cc: b3 35 a0 00  	snez	a1, a0
800011d0: 01 46        	mv	a2, zero
800011d2: 63 06 c5 02  	beq	a0, a2, 44 <.LBB3_16>
800011d6: 09 a0        	j	2 <_ZN6kernel6memory6kalloc10KernelHeap4init17hbd5dd3fdc2eeef18E+0x5c>
800011d8: 62 75        	ld	a0, 56(sp)
800011da: 86 65        	ld	a1, 64(sp)
800011dc: 2a e1        	sd	a0, 128(sp)
800011de: 2e e5        	sd	a1, 136(sp)
800011e0: 08 01        	addi	a0, sp, 128
800011e2: aa e9        	sd	a0, 208(sp)
800011e4: aa f9        	sd	a0, 240(sp)

00000000800011e6 <.LBB3_15>:
800011e6: 97 05 00 00  	auipc	a1, 0
800011ea: 93 85 85 41  	addi	a1, a1, 1048
800011ee: 97 00 00 00  	auipc	ra, 0
800011f2: e7 80 00 48  	jalr	1152(ra)
800011f6: 2a e8        	sd	a0, 16(sp)
800011f8: 2e e4        	sd	a1, 8(sp)
800011fa: 0d a8        	j	50 <.LBB3_17+0x26>
800011fc: 00 00        	unimp	

00000000800011fe <.LBB3_16>:
800011fe: 97 c5 00 00  	auipc	a1, 12
80001202: 93 85 25 4c  	addi	a1, a1, 1218

0000000080001206 <.LBB3_17>:
80001206: 97 c6 00 00  	auipc	a3, 12
8000120a: 93 86 a6 4c  	addi	a3, a3, 1226
8000120e: 88 08        	addi	a0, sp, 80
80001210: 05 46        	addi	a2, zero, 1
80001212: 01 47        	mv	a4, zero
80001214: 97 00 00 00  	auipc	ra, 0
80001218: e7 80 40 4c  	jalr	1220(ra)
8000121c: 09 a0        	j	2 <.LBB3_17+0x18>
8000121e: 88 08        	addi	a0, sp, 80
80001220: 97 40 00 00  	auipc	ra, 4
80001224: e7 80 20 04  	jalr	66(ra)
80001228: 09 a0        	j	2 <.LBB3_17+0x24>
8000122a: 0d a8        	j	50 <.LBB3_18+0x28>
8000122c: 42 65        	ld	a0, 16(sp)
8000122e: aa e1        	sd	a0, 192(sp)
80001230: a2 65        	ld	a1, 8(sp)
80001232: ae e5        	sd	a1, 200(sp)

0000000080001234 <.LBB3_18>:
80001234: 97 c5 00 00  	auipc	a1, 12
80001238: 93 85 c5 44  	addi	a1, a1, 1100
8000123c: 08 09        	addi	a0, sp, 144
8000123e: 09 46        	addi	a2, zero, 2
80001240: 94 01        	addi	a3, sp, 192
80001242: 05 47        	addi	a4, zero, 1
80001244: 97 00 00 00  	auipc	ra, 0
80001248: e7 80 40 49  	jalr	1172(ra)
8000124c: 09 a0        	j	2 <.LBB3_18+0x1a>
8000124e: 08 09        	addi	a0, sp, 144
80001250: 97 40 00 00  	auipc	ra, 4
80001254: e7 80 20 01  	jalr	18(ra)
80001258: 09 a0        	j	2 <.LBB3_18+0x26>
8000125a: 09 a0        	j	2 <.LBB3_18+0x28>
8000125c: ee 70        	ld	ra, 248(sp)
8000125e: 11 61        	addi	sp, sp, 256
80001260: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc10KernelHeap5kinit17hd1cd8aa76ef05929E:

0000000080001262 <_ZN6kernel6memory6kalloc10KernelHeap5kinit17hd1cd8aa76ef05929E>:
80001262: 29 71        	addi	sp, sp, -320
80001264: 06 fe        	sd	ra, 312(sp)
80001266: 2a f2        	sd	a0, 288(sp)

0000000080001268 <.LBB4_12>:
80001268: 97 c5 00 00  	auipc	a1, 12
8000126c: 93 85 85 47  	addi	a1, a1, 1144

0000000080001270 <.LBB4_13>:
80001270: 97 c6 00 00  	auipc	a3, 12
80001274: 93 86 06 46  	addi	a3, a3, 1120
80001278: 90 08        	addi	a2, sp, 80
8000127a: 05 47        	addi	a4, zero, 1
8000127c: 81 47        	mv	a5, zero
8000127e: aa e4        	sd	a0, 72(sp)
80001280: 32 85        	add	a0, zero, a2
80001282: 3a 86        	add	a2, zero, a4
80001284: 3e 87        	add	a4, zero, a5
80001286: 97 00 00 00  	auipc	ra, 0
8000128a: e7 80 20 45  	jalr	1106(ra)
8000128e: 09 a0        	j	2 <.LBB4_13+0x20>
80001290: 88 08        	addi	a0, sp, 80
80001292: 97 40 00 00  	auipc	ra, 4
80001296: e7 80 00 fd  	jalr	-48(ra)
8000129a: 09 a0        	j	2 <.LBB4_14>

000000008000129c <.LBB4_14>:
8000129c: 17 85 02 00  	auipc	a0, 40
800012a0: 13 05 45 d8  	addi	a0, a0, -636
800012a4: 2a e1        	sd	a0, 128(sp)

00000000800012a6 <.LBB4_15>:
800012a6: 17 c5 00 00  	auipc	a0, 12
800012aa: 13 05 a5 50  	addi	a0, a0, 1290
800012ae: 97 80 00 00  	auipc	ra, 8
800012b2: e7 80 00 11  	jalr	272(ra)
800012b6: aa f5        	sd	a0, 232(sp)
800012b8: 09 a0        	j	2 <.LBB4_15+0x14>
800012ba: 08 01        	addi	a0, sp, 128
800012bc: aa ed        	sd	a0, 216(sp)
800012be: ac 11        	addi	a1, sp, 232
800012c0: ae f1        	sd	a1, 224(sp)
800012c2: 2a f6        	sd	a0, 296(sp)
800012c4: 2e fa        	sd	a1, 304(sp)

00000000800012c6 <.LBB4_16>:
800012c6: 17 c6 00 00  	auipc	a2, 12
800012ca: 13 06 e6 c1  	addi	a2, a2, -994
800012ce: ae e0        	sd	a1, 64(sp)
800012d0: b2 85        	add	a1, zero, a2
800012d2: 97 a0 00 00  	auipc	ra, 10
800012d6: e7 80 a0 eb  	jalr	-326(ra)
800012da: 2a fc        	sd	a0, 56(sp)
800012dc: 2e f8        	sd	a1, 48(sp)
800012de: 09 a0        	j	2 <.LBB4_17>

00000000800012e0 <.LBB4_17>:
800012e0: 97 c5 00 00  	auipc	a1, 12
800012e4: 93 85 45 c0  	addi	a1, a1, -1020
800012e8: 06 65        	ld	a0, 64(sp)
800012ea: 97 a0 00 00  	auipc	ra, 10
800012ee: e7 80 20 ea  	jalr	-350(ra)
800012f2: 2a f4        	sd	a0, 40(sp)
800012f4: 2e f0        	sd	a1, 32(sp)
800012f6: 09 a0        	j	2 <.LBB4_17+0x18>
800012f8: 62 75        	ld	a0, 56(sp)
800012fa: 2a fd        	sd	a0, 184(sp)
800012fc: c2 75        	ld	a1, 48(sp)
800012fe: ae e1        	sd	a1, 192(sp)
80001300: 22 76        	ld	a2, 40(sp)
80001302: b2 e5        	sd	a2, 200(sp)
80001304: 82 76        	ld	a3, 32(sp)
80001306: b6 e9        	sd	a3, 208(sp)

0000000080001308 <.LBB4_18>:
80001308: 97 c5 00 00  	auipc	a1, 12
8000130c: 93 85 05 41  	addi	a1, a1, 1040

0000000080001310 <.LBB4_19>:
80001310: 97 c7 00 00  	auipc	a5, 12
80001314: 93 87 87 4d  	addi	a5, a5, 1240
80001318: 28 01        	addi	a0, sp, 136
8000131a: 0d 46        	addi	a2, zero, 3
8000131c: 34 19        	addi	a3, sp, 184
8000131e: 09 47        	addi	a4, zero, 2
80001320: 3a ec        	sd	a4, 24(sp)
80001322: 62 68        	ld	a6, 24(sp)
80001324: 97 00 00 00  	auipc	ra, 0
80001328: e7 80 e0 38  	jalr	910(ra)
8000132c: 09 a0        	j	2 <.LBB4_19+0x1e>
8000132e: 28 01        	addi	a0, sp, 136
80001330: 97 40 00 00  	auipc	ra, 4
80001334: e7 80 20 f3  	jalr	-206(ra)
80001338: 09 a0        	j	2 <.LBB4_19+0x2a>
8000133a: 8a 65        	ld	a1, 128(sp)

000000008000133c <.LBB4_20>:
8000133c: 17 c5 00 00  	auipc	a0, 12
80001340: 13 05 45 47  	addi	a0, a0, 1140
80001344: 2e e8        	sd	a1, 16(sp)
80001346: 97 80 00 00  	auipc	ra, 8
8000134a: e7 80 80 07  	jalr	120(ra)
8000134e: 2a e4        	sd	a0, 8(sp)
80001350: 09 a0        	j	2 <.LBB4_20+0x16>
80001352: 26 65        	ld	a0, 72(sp)
80001354: c2 65        	ld	a1, 16(sp)
80001356: 22 66        	ld	a2, 8(sp)
80001358: 97 00 00 00  	auipc	ra, 0
8000135c: e7 80 40 e2  	jalr	-476(ra)
80001360: 09 a0        	j	2 <.LBB4_21>

0000000080001362 <.LBB4_21>:
80001362: 97 c5 00 00  	auipc	a1, 12
80001366: 93 85 e5 50  	addi	a1, a1, 1294

000000008000136a <.LBB4_22>:
8000136a: 97 c6 00 00  	auipc	a3, 12
8000136e: 93 86 66 36  	addi	a3, a3, 870
80001372: 88 19        	addi	a0, sp, 240
80001374: 05 46        	addi	a2, zero, 1
80001376: 01 47        	mv	a4, zero
80001378: 97 00 00 00  	auipc	ra, 0
8000137c: e7 80 00 36  	jalr	864(ra)
80001380: 09 a0        	j	2 <.LBB4_22+0x18>
80001382: 88 19        	addi	a0, sp, 240
80001384: 97 40 00 00  	auipc	ra, 4
80001388: e7 80 e0 ed  	jalr	-290(ra)
8000138c: 09 a0        	j	2 <.LBB4_22+0x24>
8000138e: f2 70        	ld	ra, 312(sp)
80001390: 31 61        	addi	sp, sp, 320
80001392: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc3Run3new17h92858075c50f59c4E:

0000000080001394 <_ZN6kernel6memory6kalloc3Run3new17h92858075c50f59c4E>:
80001394: 39 71        	addi	sp, sp, -64
80001396: 06 fc        	sd	ra, 56(sp)
80001398: 2a f4        	sd	a0, 40(sp)
8000139a: aa 85        	add	a1, zero, a0
8000139c: 2a f8        	sd	a0, 48(sp)
8000139e: 01 46        	mv	a2, zero
800013a0: 32 f0        	sd	a2, 32(sp)
800013a2: 2e ec        	sd	a1, 24(sp)
800013a4: b2 85        	add	a1, zero, a2
800013a6: 97 20 00 00  	auipc	ra, 2
800013aa: e7 80 80 21  	jalr	536(ra)
800013ae: 09 a0        	j	2 <_ZN6kernel6memory6kalloc3Run3new17h92858075c50f59c4E+0x1c>
800013b0: 62 65        	ld	a0, 24(sp)
800013b2: 97 20 00 00  	auipc	ra, 2
800013b6: e7 80 40 8d  	jalr	-1836(ra)
800013ba: 2a e8        	sd	a0, 16(sp)
800013bc: 09 a0        	j	2 <.LBB5_4>

00000000800013be <.LBB5_4>:
800013be: 97 c5 00 00  	auipc	a1, 12
800013c2: 93 85 25 4c  	addi	a1, a1, 1218
800013c6: 42 65        	ld	a0, 16(sp)
800013c8: 97 30 00 00  	auipc	ra, 3
800013cc: e7 80 20 d4  	jalr	-702(ra)
800013d0: 2a e4        	sd	a0, 8(sp)
800013d2: 09 a0        	j	2 <.LBB5_4+0x16>
800013d4: 22 65        	ld	a0, 8(sp)
800013d6: e2 70        	ld	ra, 56(sp)
800013d8: 21 61        	addi	sp, sp, 64
800013da: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc3Run8set_next17hd29156b472f90482E:

00000000800013dc <_ZN6kernel6memory6kalloc3Run8set_next17hd29156b472f90482E>:
800013dc: 41 11        	addi	sp, sp, -16
800013de: 2a e0        	sd	a0, 0(sp)
800013e0: 2e e4        	sd	a1, 8(sp)
800013e2: 0c e1        	sd	a1, 0(a0)
800013e4: 41 01        	addi	sp, sp, 16
800013e6: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc3Run8get_next17hee01831662df8d2cE:

00000000800013e8 <_ZN6kernel6memory6kalloc3Run8get_next17hee01831662df8d2cE>:
800013e8: 01 11        	addi	sp, sp, -32
800013ea: 06 ec        	sd	ra, 24(sp)
800013ec: 2a e8        	sd	a0, 16(sp)
800013ee: 97 30 00 00  	auipc	ra, 3
800013f2: e7 80 80 bb  	jalr	-1096(ra)
800013f6: 2a e4        	sd	a0, 8(sp)
800013f8: 09 a0        	j	2 <_ZN6kernel6memory6kalloc3Run8get_next17hee01831662df8d2cE+0x12>
800013fa: 22 65        	ld	a0, 8(sp)
800013fc: e2 60        	ld	ra, 24(sp)
800013fe: 05 61        	addi	sp, sp, 32
80001400: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E:

0000000080001402 <_ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E>:
80001402: 59 71        	addi	sp, sp, -112
80001404: 86 f4        	sd	ra, 104(sp)
80001406: aa ec        	sd	a0, 88(sp)
80001408: 97 70 00 00  	auipc	ra, 7
8000140c: e7 80 a0 9d  	jalr	-1574(ra)
80001410: aa 85        	add	a1, zero, a0
80001412: aa f0        	sd	a0, 96(sp)
80001414: 2e f8        	sd	a1, 48(sp)
80001416: 09 a0        	j	2 <_ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E+0x16>
80001418: 05 65        	lui	a0, 1
8000141a: 7d 35        	addiw	a0, a0, -1
8000141c: c2 75        	ld	a1, 48(sp)
8000141e: 6d 8d        	and	a0, a0, a1
80001420: 01 46        	mv	a2, zero
80001422: 63 02 c5 04  	beq	a0, a2, 68 <.LBB8_23>
80001426: 05 a8        	j	48 <.LBB8_22+0x1e>
80001428: 05 45        	addi	a0, zero, 1
8000142a: 23 0f a1 02  	sb	a0, 62(sp)
8000142e: 39 a8        	j	30 <.LBB8_22+0x14>
80001430: 01 45        	mv	a0, zero
80001432: 23 0f a1 02  	sb	a0, 62(sp)
80001436: 19 a8        	j	22 <.LBB8_22+0x14>

0000000080001438 <.LBB8_22>:
80001438: 17 c5 00 00  	auipc	a0, 12
8000143c: 13 05 85 37  	addi	a0, a0, 888
80001440: 97 80 00 00  	auipc	ra, 8
80001444: e7 80 e0 f7  	jalr	-130(ra)
80001448: 2a f4        	sd	a0, 40(sp)
8000144a: 1d a8        	j	54 <.LBB8_23+0x1a>
8000144c: 03 45 e1 03  	lbu	a0, 62(sp)
80001450: 05 89        	andi	a0, a0, 1
80001452: 05 ed        	bnez	a0, 56 <.LBB8_24>
80001454: 89 a8        	j	82 <.LBB8_25+0x14>
80001456: 05 45        	addi	a0, zero, 1
80001458: a3 0f a1 02  	sb	a0, 63(sp)
8000145c: 29 a8        	j	26 <.LBB8_23+0x10>
8000145e: 01 45        	mv	a0, zero
80001460: a3 0f a1 02  	sb	a0, 63(sp)
80001464: 09 a8        	j	18 <.LBB8_23+0x10>

0000000080001466 <.LBB8_23>:
80001466: 17 85 02 00  	auipc	a0, 40
8000146a: 13 05 a5 bb  	addi	a0, a0, -1094
8000146e: c2 75        	ld	a1, 48(sp)
80001470: e3 e3 a5 fe  	bltu	a1, a0, -26 <.LBB8_22+0x1e>
80001474: ed b7        	j	-22 <.LBB8_22+0x26>
80001476: 03 45 f1 03  	lbu	a0, 63(sp)
8000147a: 05 89        	andi	a0, a0, 1
8000147c: 55 f5        	bnez	a0, -84 <_ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E+0x26>
8000147e: 6d bf        	j	-70 <.LBB8_22>
80001480: 22 75        	ld	a0, 40(sp)
80001482: c2 75        	ld	a1, 48(sp)
80001484: e3 62 b5 fa  	bltu	a0, a1, -92 <_ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E+0x26>
80001488: 65 b7        	j	-88 <_ZN6kernel6memory6kalloc5kfree17h79e885f91d9ace62E+0x2e>

000000008000148a <.LBB8_24>:
8000148a: 17 c5 00 00  	auipc	a0, 12
8000148e: 13 05 a5 42  	addi	a0, a0, 1066

0000000080001492 <.LBB8_25>:
80001492: 17 c6 00 00  	auipc	a2, 12
80001496: 13 06 e6 42  	addi	a2, a2, 1070
8000149a: 95 45        	addi	a1, zero, 5
8000149c: 97 a0 00 00  	auipc	ra, 10
800014a0: e7 80 e0 29  	jalr	670(ra)
800014a4: 00 00        	unimp	
800014a6: 42 75        	ld	a0, 48(sp)
800014a8: 97 00 00 00  	auipc	ra, 0
800014ac: e7 80 c0 ee  	jalr	-276(ra)
800014b0: aa e0        	sd	a0, 64(sp)
800014b2: 09 a0        	j	2 <.LBB8_26>

00000000800014b4 <.LBB8_26>:
800014b4: 17 15 01 00  	auipc	a0, 17
800014b8: 13 05 c5 b4  	addi	a0, a0, -1204
800014bc: 97 10 00 00  	auipc	ra, 1
800014c0: e7 80 40 89  	jalr	-1900(ra)
800014c4: aa e4        	sd	a0, 72(sp)
800014c6: 09 a0        	j	2 <.LBB8_26+0x14>
800014c8: 88 00        	addi	a0, sp, 64
800014ca: 97 20 00 00  	auipc	ra, 2
800014ce: e7 80 40 83  	jalr	-1996(ra)
800014d2: 2a f0        	sd	a0, 32(sp)
800014d4: 09 a0        	j	2 <.LBB8_26+0x22>
800014d6: a8 00        	addi	a0, sp, 72
800014d8: 97 10 00 00  	auipc	ra, 1
800014dc: e7 80 c0 0f  	jalr	252(ra)
800014e0: 2a ec        	sd	a0, 24(sp)
800014e2: 09 a0        	j	2 <.LBB8_26+0x30>
800014e4: 62 65        	ld	a0, 24(sp)
800014e6: 97 00 00 00  	auipc	ra, 0
800014ea: e7 80 20 f0  	jalr	-254(ra)
800014ee: 2a e8        	sd	a0, 16(sp)
800014f0: 09 a0        	j	2 <.LBB8_26+0x3e>
800014f2: 02 75        	ld	a0, 32(sp)
800014f4: c2 65        	ld	a1, 16(sp)
800014f6: 97 00 00 00  	auipc	ra, 0
800014fa: e7 80 60 ee  	jalr	-282(ra)
800014fe: 09 a0        	j	2 <.LBB8_26+0x4c>
80001500: a8 00        	addi	a0, sp, 72
80001502: 97 10 00 00  	auipc	ra, 1
80001506: e7 80 20 0d  	jalr	210(ra)
8000150a: 2a e4        	sd	a0, 8(sp)
8000150c: 09 a0        	j	2 <.LBB8_26+0x5a>
8000150e: 06 65        	ld	a0, 64(sp)
80001510: aa e8        	sd	a0, 80(sp)
80001512: a2 65        	ld	a1, 8(sp)
80001514: 2a e0        	sd	a0, 0(sp)
80001516: 2e 85        	add	a0, zero, a1
80001518: 82 65        	ld	a1, 0(sp)
8000151a: 97 00 00 00  	auipc	ra, 0
8000151e: e7 80 20 ec  	jalr	-318(ra)
80001522: 09 a0        	j	2 <.LBB8_26+0x70>
80001524: 26 65        	ld	a0, 72(sp)
80001526: 97 00 00 00  	auipc	ra, 0
8000152a: e7 80 20 26  	jalr	610(ra)
8000152e: 09 a0        	j	2 <.LBB8_26+0x7c>
80001530: a6 70        	ld	ra, 104(sp)
80001532: 65 61        	addi	sp, sp, 112
80001534: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory6kalloc6kalloc17hbf4c42f3b8c5791bE:

0000000080001536 <_ZN6kernel6memory6kalloc6kalloc17hbf4c42f3b8c5791bE>:
80001536: 59 71        	addi	sp, sp, -112
80001538: 86 f4        	sd	ra, 104(sp)

000000008000153a <.LBB9_18>:
8000153a: 17 15 01 00  	auipc	a0, 17
8000153e: 13 05 65 ac  	addi	a0, a0, -1338
80001542: 97 10 00 00  	auipc	ra, 1
80001546: e7 80 e0 80  	jalr	-2034(ra)
8000154a: aa e0        	sd	a0, 64(sp)
8000154c: 09 a0        	j	2 <.LBB9_18+0x14>
8000154e: 88 00        	addi	a0, sp, 64
80001550: 97 10 00 00  	auipc	ra, 1
80001554: e7 80 40 08  	jalr	132(ra)
80001558: 2a f4        	sd	a0, 40(sp)
8000155a: 09 a0        	j	2 <.LBB9_18+0x22>
8000155c: 22 75        	ld	a0, 40(sp)
8000155e: 97 00 00 00  	auipc	ra, 0
80001562: e7 80 a0 e8  	jalr	-374(ra)
80001566: aa e4        	sd	a0, 72(sp)
80001568: 09 a0        	j	2 <.LBB9_18+0x30>
8000156a: 26 65        	ld	a0, 72(sp)
8000156c: 81 45        	mv	a1, zero
8000156e: 63 14 b5 00  	bne	a0, a1, 8 <.LBB9_18+0x3c>
80001572: 09 a0        	j	2 <.LBB9_18+0x3a>
80001574: 81 a0        	j	64 <.LBB9_18+0x7a>
80001576: 26 65        	ld	a0, 72(sp)
80001578: aa e8        	sd	a0, 80(sp)
8000157a: 88 00        	addi	a0, sp, 64
8000157c: 97 10 00 00  	auipc	ra, 1
80001580: e7 80 80 05  	jalr	88(ra)
80001584: 2a f0        	sd	a0, 32(sp)
80001586: 09 a0        	j	2 <.LBB9_18+0x4e>
80001588: 88 08        	addi	a0, sp, 80
8000158a: 97 10 00 00  	auipc	ra, 1
8000158e: e7 80 40 77  	jalr	1908(ra)
80001592: 2a ec        	sd	a0, 24(sp)
80001594: 09 a0        	j	2 <.LBB9_18+0x5c>
80001596: 62 65        	ld	a0, 24(sp)
80001598: 97 00 00 00  	auipc	ra, 0
8000159c: e7 80 00 e5  	jalr	-432(ra)
800015a0: 2a e8        	sd	a0, 16(sp)
800015a2: 09 a0        	j	2 <.LBB9_18+0x6a>
800015a4: 02 75        	ld	a0, 32(sp)
800015a6: c2 65        	ld	a1, 16(sp)
800015a8: 97 00 00 00  	auipc	ra, 0
800015ac: e7 80 40 e3  	jalr	-460(ra)
800015b0: 09 a0        	j	2 <.LBB9_18+0x78>
800015b2: 09 a0        	j	2 <.LBB9_18+0x7a>
800015b4: 06 65        	ld	a0, 64(sp)
800015b6: 97 00 00 00  	auipc	ra, 0
800015ba: e7 80 20 1d  	jalr	466(ra)
800015be: 09 a0        	j	2 <.LBB9_18+0x86>
800015c0: 26 65        	ld	a0, 72(sp)
800015c2: b3 35 a0 00  	snez	a1, a0
800015c6: 01 46        	mv	a2, zero
800015c8: 63 04 c5 00  	beq	a0, a2, 8 <.LBB9_18+0x96>
800015cc: 09 a0        	j	2 <.LBB9_18+0x94>
800015ce: 29 a0        	j	10 <.LBB9_18+0x9e>
800015d0: 01 45        	mv	a0, zero
800015d2: 2a f8        	sd	a0, 48(sp)
800015d4: 05 a0        	j	32 <.LBB9_18+0xba>
800015d6: 00 00        	unimp	
800015d8: 26 65        	ld	a0, 72(sp)
800015da: aa ec        	sd	a0, 88(sp)
800015dc: 97 10 00 00  	auipc	ra, 1
800015e0: e7 80 20 77  	jalr	1906(ra)
800015e4: 2a e4        	sd	a0, 8(sp)
800015e6: 09 a0        	j	2 <.LBB9_18+0xae>
800015e8: 22 65        	ld	a0, 8(sp)
800015ea: aa f0        	sd	a0, 96(sp)
800015ec: 2a fc        	sd	a0, 56(sp)
800015ee: 85 45        	addi	a1, zero, 1
800015f0: 2e f8        	sd	a1, 48(sp)
800015f2: 09 a0        	j	2 <.LBB9_18+0xba>
800015f4: 42 75        	ld	a0, 48(sp)
800015f6: e2 75        	ld	a1, 56(sp)
800015f8: a6 70        	ld	ra, 104(sp)
800015fa: 65 61        	addi	sp, sp, 112
800015fc: 82 80        	ret

Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdd02fefaecab7d23E:

00000000800015fe <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdd02fefaecab7d23E>:
800015fe: 79 71        	addi	sp, sp, -48
80001600: 06 f4        	sd	ra, 40(sp)
80001602: 2a ec        	sd	a0, 24(sp)
80001604: 2e f0        	sd	a1, 32(sp)
80001606: 10 61        	ld	a2, 0(a0)
80001608: 08 65        	ld	a0, 8(a0)
8000160a: 2a e8        	sd	a0, 16(sp)
8000160c: 32 85        	add	a0, zero, a2
8000160e: 42 66        	ld	a2, 16(sp)
80001610: 2e e4        	sd	a1, 8(sp)
80001612: b2 85        	add	a1, zero, a2
80001614: 22 66        	ld	a2, 8(sp)
80001616: 97 b0 00 00  	auipc	ra, 11
8000161a: e7 80 a0 dd  	jalr	-550(ra)
8000161e: 2a e0        	sd	a0, 0(sp)
80001620: 09 a0        	j	2 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdd02fefaecab7d23E+0x24>
80001622: 02 65        	ld	a0, 0(sp)
80001624: a2 70        	ld	ra, 40(sp)
80001626: 45 61        	addi	sp, sp, 48
80001628: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h028fec8cbeed8e29E:

000000008000162a <_ZN4core3fmt10ArgumentV13new17h028fec8cbeed8e29E>:
8000162a: 5d 71        	addi	sp, sp, -80
8000162c: 2a f8        	sd	a0, 48(sp)
8000162e: 2e fc        	sd	a1, 56(sp)
80001630: ae e0        	sd	a1, 64(sp)
80001632: 2a ec        	sd	a0, 24(sp)
80001634: 2e e8        	sd	a1, 16(sp)
80001636: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h028fec8cbeed8e29E+0xe>
80001638: 62 65        	ld	a0, 24(sp)
8000163a: aa e4        	sd	a0, 72(sp)
8000163c: 2a e4        	sd	a0, 8(sp)
8000163e: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h028fec8cbeed8e29E+0x16>
80001640: 22 65        	ld	a0, 8(sp)
80001642: 2a f0        	sd	a0, 32(sp)
80001644: c2 65        	ld	a1, 16(sp)
80001646: 2e f4        	sd	a1, 40(sp)
80001648: 61 61        	addi	sp, sp, 80
8000164a: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h798d8378b2e8309cE:

000000008000164c <_ZN4core3fmt10ArgumentV13new17h798d8378b2e8309cE>:
8000164c: 5d 71        	addi	sp, sp, -80
8000164e: 2a f8        	sd	a0, 48(sp)
80001650: 2e fc        	sd	a1, 56(sp)
80001652: ae e0        	sd	a1, 64(sp)
80001654: 2a ec        	sd	a0, 24(sp)
80001656: 2e e8        	sd	a1, 16(sp)
80001658: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h798d8378b2e8309cE+0xe>
8000165a: 62 65        	ld	a0, 24(sp)
8000165c: aa e4        	sd	a0, 72(sp)
8000165e: 2a e4        	sd	a0, 8(sp)
80001660: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h798d8378b2e8309cE+0x16>
80001662: 22 65        	ld	a0, 8(sp)
80001664: 2a f0        	sd	a0, 32(sp)
80001666: c2 65        	ld	a1, 16(sp)
80001668: 2e f4        	sd	a1, 40(sp)
8000166a: 61 61        	addi	sp, sp, 80
8000166c: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h950b57b5dbcb3f36E:

000000008000166e <_ZN4core3fmt10ArgumentV13new17h950b57b5dbcb3f36E>:
8000166e: 5d 71        	addi	sp, sp, -80
80001670: 2a f8        	sd	a0, 48(sp)
80001672: 2e fc        	sd	a1, 56(sp)
80001674: ae e0        	sd	a1, 64(sp)
80001676: 2a ec        	sd	a0, 24(sp)
80001678: 2e e8        	sd	a1, 16(sp)
8000167a: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h950b57b5dbcb3f36E+0xe>
8000167c: 62 65        	ld	a0, 24(sp)
8000167e: aa e4        	sd	a0, 72(sp)
80001680: 2a e4        	sd	a0, 8(sp)
80001682: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h950b57b5dbcb3f36E+0x16>
80001684: 22 65        	ld	a0, 8(sp)
80001686: 2a f0        	sd	a0, 32(sp)
80001688: c2 65        	ld	a1, 16(sp)
8000168a: 2e f4        	sd	a1, 40(sp)
8000168c: 61 61        	addi	sp, sp, 80
8000168e: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17hdcfe91f3492252c7E:

0000000080001690 <_ZN4core3fmt10ArgumentV13new17hdcfe91f3492252c7E>:
80001690: 5d 71        	addi	sp, sp, -80
80001692: 2a f8        	sd	a0, 48(sp)
80001694: 2e fc        	sd	a1, 56(sp)
80001696: ae e0        	sd	a1, 64(sp)
80001698: 2a ec        	sd	a0, 24(sp)
8000169a: 2e e8        	sd	a1, 16(sp)
8000169c: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17hdcfe91f3492252c7E+0xe>
8000169e: 62 65        	ld	a0, 24(sp)
800016a0: aa e4        	sd	a0, 72(sp)
800016a2: 2a e4        	sd	a0, 8(sp)
800016a4: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17hdcfe91f3492252c7E+0x16>
800016a6: 22 65        	ld	a0, 8(sp)
800016a8: 2a f0        	sd	a0, 32(sp)
800016aa: c2 65        	ld	a1, 16(sp)
800016ac: 2e f4        	sd	a1, 40(sp)
800016ae: 61 61        	addi	sp, sp, 80
800016b0: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Arguments16new_v1_formatted17h3c43cf4b9b696b9aE:

00000000800016b2 <_ZN4core3fmt9Arguments16new_v1_formatted17h3c43cf4b9b696b9aE>:
800016b2: 39 71        	addi	sp, sp, -64
800016b4: 2e e8        	sd	a1, 16(sp)
800016b6: 32 ec        	sd	a2, 24(sp)
800016b8: 36 f0        	sd	a3, 32(sp)
800016ba: 3a f4        	sd	a4, 40(sp)
800016bc: 3e f8        	sd	a5, 48(sp)
800016be: 42 fc        	sd	a6, 56(sp)
800016c0: 3e e0        	sd	a5, 0(sp)
800016c2: 42 e4        	sd	a6, 8(sp)
800016c4: 0c e1        	sd	a1, 0(a0)
800016c6: 10 e5        	sd	a2, 8(a0)
800016c8: 82 65        	ld	a1, 0(sp)
800016ca: 22 66        	ld	a2, 8(sp)
800016cc: 0c e9        	sd	a1, 16(a0)
800016ce: 10 ed        	sd	a2, 24(a0)
800016d0: 14 f1        	sd	a3, 32(a0)
800016d2: 18 f5        	sd	a4, 40(a0)
800016d4: 21 61        	addi	sp, sp, 64
800016d6: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Arguments6new_v117h59e6f89d19ff17adE:

00000000800016d8 <_ZN4core3fmt9Arguments6new_v117h59e6f89d19ff17adE>:
800016d8: 79 71        	addi	sp, sp, -48
800016da: 2e e8        	sd	a1, 16(sp)
800016dc: 32 ec        	sd	a2, 24(sp)
800016de: 36 f0        	sd	a3, 32(sp)
800016e0: 3a f4        	sd	a4, 40(sp)
800016e2: 81 47        	mv	a5, zero
800016e4: 3e e0        	sd	a5, 0(sp)
800016e6: 0c e1        	sd	a1, 0(a0)
800016e8: 10 e5        	sd	a2, 8(a0)
800016ea: 82 65        	ld	a1, 0(sp)
800016ec: 22 66        	ld	a2, 8(sp)
800016ee: 0c e9        	sd	a1, 16(a0)
800016f0: 10 ed        	sd	a2, 24(a0)
800016f2: 14 f1        	sd	a3, 32(a0)
800016f4: 18 f5        	sd	a4, 40(a0)
800016f6: 45 61        	addi	sp, sp, 48
800016f8: 82 80        	ret

Disassembly of section .text._ZN4core3mem11size_of_val17he7892ec482e0f57aE:

00000000800016fa <_ZN4core3mem11size_of_val17he7892ec482e0f57aE>:
800016fa: 01 11        	addi	sp, sp, -32
800016fc: 2a e8        	sd	a0, 16(sp)
800016fe: 13 05 40 03  	addi	a0, zero, 52
80001702: 2a ec        	sd	a0, 24(sp)
80001704: 2a e4        	sd	a0, 8(sp)
80001706: 09 a0        	j	2 <_ZN4core3mem11size_of_val17he7892ec482e0f57aE+0xe>
80001708: 22 65        	ld	a0, 8(sp)
8000170a: 05 61        	addi	sp, sp, 32
8000170c: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h0366222b0e298602E:

000000008000170e <_ZN4core3mem4drop17h0366222b0e298602E>:
8000170e: 41 11        	addi	sp, sp, -16
80001710: 2a e4        	sd	a0, 8(sp)
80001712: 09 a0        	j	2 <_ZN4core3mem4drop17h0366222b0e298602E+0x6>
80001714: 41 01        	addi	sp, sp, 16
80001716: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h20dc40edb3cd71f4E:

0000000080001718 <_ZN4core3mem4drop17h20dc40edb3cd71f4E>:
80001718: 41 11        	addi	sp, sp, -16
8000171a: 06 e4        	sd	ra, 8(sp)
8000171c: 2a e0        	sd	a0, 0(sp)
8000171e: 0a 85        	add	a0, zero, sp
80001720: 97 00 00 00  	auipc	ra, 0
80001724: e7 80 80 17  	jalr	376(ra)
80001728: 09 a0        	j	2 <_ZN4core3mem4drop17h20dc40edb3cd71f4E+0x12>
8000172a: a2 60        	ld	ra, 8(sp)
8000172c: 41 01        	addi	sp, sp, 16
8000172e: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h61a14440f4e3c082E:

0000000080001730 <_ZN4core3mem4drop17h61a14440f4e3c082E>:
80001730: 41 11        	addi	sp, sp, -16
80001732: 06 e4        	sd	ra, 8(sp)
80001734: 2a e0        	sd	a0, 0(sp)
80001736: 0a 85        	add	a0, zero, sp
80001738: 97 00 00 00  	auipc	ra, 0
8000173c: e7 80 e0 1e  	jalr	494(ra)
80001740: 09 a0        	j	2 <_ZN4core3mem4drop17h61a14440f4e3c082E+0x12>
80001742: a2 60        	ld	ra, 8(sp)
80001744: 41 01        	addi	sp, sp, 16
80001746: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h690a2080f3cba6bdE:

0000000080001748 <_ZN4core3mem4drop17h690a2080f3cba6bdE>:
80001748: 41 11        	addi	sp, sp, -16
8000174a: 06 e4        	sd	ra, 8(sp)
8000174c: 2a e0        	sd	a0, 0(sp)
8000174e: 0a 85        	add	a0, zero, sp
80001750: 97 00 00 00  	auipc	ra, 0
80001754: e7 80 80 21  	jalr	536(ra)
80001758: 09 a0        	j	2 <_ZN4core3mem4drop17h690a2080f3cba6bdE+0x12>
8000175a: a2 60        	ld	ra, 8(sp)
8000175c: 41 01        	addi	sp, sp, 16
8000175e: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h79e437f2e2b6625fE:

0000000080001760 <_ZN4core3mem4drop17h79e437f2e2b6625fE>:
80001760: 01 11        	addi	sp, sp, -32
80001762: 06 ec        	sd	ra, 24(sp)
80001764: 2a e4        	sd	a0, 8(sp)
80001766: 2e e8        	sd	a1, 16(sp)
80001768: 28 00        	addi	a0, sp, 8
8000176a: 97 00 00 00  	auipc	ra, 0
8000176e: e7 80 80 1e  	jalr	488(ra)
80001772: 09 a0        	j	2 <_ZN4core3mem4drop17h79e437f2e2b6625fE+0x14>
80001774: e2 60        	ld	ra, 24(sp)
80001776: 05 61        	addi	sp, sp, 32
80001778: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17h989ec9aa9411d0faE:

000000008000177a <_ZN4core3mem4drop17h989ec9aa9411d0faE>:
8000177a: 41 11        	addi	sp, sp, -16
8000177c: aa 85        	add	a1, zero, a0
8000177e: a3 07 a1 00  	sb	a0, 15(sp)
80001782: 09 a0        	j	2 <_ZN4core3mem4drop17h989ec9aa9411d0faE+0xa>
80001784: 41 01        	addi	sp, sp, 16
80001786: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17hdaa5cfe81551984dE:

0000000080001788 <_ZN4core3mem4drop17hdaa5cfe81551984dE>:
80001788: 41 11        	addi	sp, sp, -16
8000178a: 06 e4        	sd	ra, 8(sp)
8000178c: 2a e0        	sd	a0, 0(sp)
8000178e: 0a 85        	add	a0, zero, sp
80001790: 97 00 00 00  	auipc	ra, 0
80001794: e7 80 e0 1e  	jalr	494(ra)
80001798: 09 a0        	j	2 <_ZN4core3mem4drop17hdaa5cfe81551984dE+0x12>
8000179a: a2 60        	ld	ra, 8(sp)
8000179c: 41 01        	addi	sp, sp, 16
8000179e: 82 80        	ret

Disassembly of section .text._ZN4core3mem4drop17hf57d2bb3a41c9d59E:

00000000800017a0 <_ZN4core3mem4drop17hf57d2bb3a41c9d59E>:
800017a0: 41 11        	addi	sp, sp, -16
800017a2: 06 e4        	sd	ra, 8(sp)
800017a4: 2a e0        	sd	a0, 0(sp)
800017a6: 0a 85        	add	a0, zero, sp
800017a8: 97 00 00 00  	auipc	ra, 0
800017ac: e7 80 80 16  	jalr	360(ra)
800017b0: 09 a0        	j	2 <_ZN4core3mem4drop17hf57d2bb3a41c9d59E+0x12>
800017b2: a2 60        	ld	ra, 8(sp)
800017b4: 41 01        	addi	sp, sp, 16
800017b6: 82 80        	ret

Disassembly of section .text._ZN4core3mem4swap17h6132e5e47c676c38E:

00000000800017b8 <_ZN4core3mem4swap17h6132e5e47c676c38E>:
800017b8: 01 11        	addi	sp, sp, -32
800017ba: 06 ec        	sd	ra, 24(sp)
800017bc: 2a e4        	sd	a0, 8(sp)
800017be: 2e e8        	sd	a1, 16(sp)
800017c0: 97 20 00 00  	auipc	ra, 2
800017c4: e7 80 60 cb  	jalr	-842(ra)
800017c8: 09 a0        	j	2 <_ZN4core3mem4swap17h6132e5e47c676c38E+0x12>
800017ca: e2 60        	ld	ra, 24(sp)
800017cc: 05 61        	addi	sp, sp, 32
800017ce: 82 80        	ret

Disassembly of section .text._ZN4core3mem4swap17h6bbc2c5fb1c9a9eeE:

00000000800017d0 <_ZN4core3mem4swap17h6bbc2c5fb1c9a9eeE>:
800017d0: 01 11        	addi	sp, sp, -32
800017d2: 06 ec        	sd	ra, 24(sp)
800017d4: 2a e4        	sd	a0, 8(sp)
800017d6: 2e e8        	sd	a1, 16(sp)
800017d8: 97 20 00 00  	auipc	ra, 2
800017dc: e7 80 20 be  	jalr	-1054(ra)
800017e0: 09 a0        	j	2 <_ZN4core3mem4swap17h6bbc2c5fb1c9a9eeE+0x12>
800017e2: e2 60        	ld	ra, 24(sp)
800017e4: 05 61        	addi	sp, sp, 32
800017e6: 82 80        	ret

Disassembly of section .text._ZN4core3mem4swap17hb762e40f733f9d18E:

00000000800017e8 <_ZN4core3mem4swap17hb762e40f733f9d18E>:
800017e8: 01 11        	addi	sp, sp, -32
800017ea: 06 ec        	sd	ra, 24(sp)
800017ec: 2a e4        	sd	a0, 8(sp)
800017ee: 2e e8        	sd	a1, 16(sp)
800017f0: 97 20 00 00  	auipc	ra, 2
800017f4: e7 80 80 c2  	jalr	-984(ra)
800017f8: 09 a0        	j	2 <_ZN4core3mem4swap17hb762e40f733f9d18E+0x12>
800017fa: e2 60        	ld	ra, 24(sp)
800017fc: 05 61        	addi	sp, sp, 32
800017fe: 82 80        	ret

Disassembly of section .text._ZN4core3mem4take17hd24415d8ff047f40E:

0000000080001800 <_ZN4core3mem4take17hd24415d8ff047f40E>:
80001800: 79 71        	addi	sp, sp, -48
80001802: 06 f4        	sd	ra, 40(sp)
80001804: 2a f0        	sd	a0, 32(sp)
80001806: 2a ec        	sd	a0, 24(sp)
80001808: 97 30 00 00  	auipc	ra, 3
8000180c: e7 80 20 a8  	jalr	-1406(ra)
80001810: 2a e8        	sd	a0, 16(sp)
80001812: 09 a0        	j	2 <_ZN4core3mem4take17hd24415d8ff047f40E+0x14>
80001814: 62 65        	ld	a0, 24(sp)
80001816: c2 65        	ld	a1, 16(sp)
80001818: 97 00 00 00  	auipc	ra, 0
8000181c: e7 80 e0 03  	jalr	62(ra)
80001820: 2a e4        	sd	a0, 8(sp)
80001822: 09 a0        	j	2 <_ZN4core3mem4take17hd24415d8ff047f40E+0x24>
80001824: 22 65        	ld	a0, 8(sp)
80001826: a2 70        	ld	ra, 40(sp)
80001828: 45 61        	addi	sp, sp, 48
8000182a: 82 80        	ret

Disassembly of section .text._ZN4core3mem6forget17hff3aa64ed1a3efd5E:

000000008000182c <_ZN4core3mem6forget17hff3aa64ed1a3efd5E>:
8000182c: 01 11        	addi	sp, sp, -32
8000182e: 2a e4        	sd	a0, 8(sp)
80001830: 2a ec        	sd	a0, 24(sp)
80001832: 2a e8        	sd	a0, 16(sp)
80001834: 09 a0        	j	2 <_ZN4core3mem6forget17hff3aa64ed1a3efd5E+0xa>
80001836: 05 61        	addi	sp, sp, 32
80001838: 82 80        	ret

Disassembly of section .text._ZN4core3mem7replace17h3cec2d181e5de1efE:

000000008000183a <_ZN4core3mem7replace17h3cec2d181e5de1efE>:
8000183a: 01 11        	addi	sp, sp, -32
8000183c: 06 ec        	sd	ra, 24(sp)
8000183e: 2e e4        	sd	a1, 8(sp)
80001840: 2a e8        	sd	a0, 16(sp)
80001842: 2c 00        	addi	a1, sp, 8
80001844: 97 00 00 00  	auipc	ra, 0
80001848: e7 80 c0 f8  	jalr	-116(ra)
8000184c: 09 a0        	j	2 <_ZN4core3mem7replace17h3cec2d181e5de1efE+0x14>
8000184e: 22 65        	ld	a0, 8(sp)
80001850: e2 60        	ld	ra, 24(sp)
80001852: 05 61        	addi	sp, sp, 32
80001854: 82 80        	ret

Disassembly of section .text._ZN4core3mem7replace17h61a00456681ef994E:

0000000080001856 <_ZN4core3mem7replace17h61a00456681ef994E>:
80001856: 01 11        	addi	sp, sp, -32
80001858: 06 ec        	sd	ra, 24(sp)
8000185a: 2e e4        	sd	a1, 8(sp)
8000185c: 2a e8        	sd	a0, 16(sp)
8000185e: 2c 00        	addi	a1, sp, 8
80001860: 97 00 00 00  	auipc	ra, 0
80001864: e7 80 80 f8  	jalr	-120(ra)
80001868: 09 a0        	j	2 <_ZN4core3mem7replace17h61a00456681ef994E+0x14>
8000186a: 22 65        	ld	a0, 8(sp)
8000186c: e2 60        	ld	ra, 24(sp)
8000186e: 05 61        	addi	sp, sp, 32
80001870: 82 80        	ret

Disassembly of section .text._ZN4core3mem7replace17hdcdc41cc265c3138E:

0000000080001872 <_ZN4core3mem7replace17hdcdc41cc265c3138E>:
80001872: 01 11        	addi	sp, sp, -32
80001874: 06 ec        	sd	ra, 24(sp)
80001876: 2e 86        	add	a2, zero, a1
80001878: a3 07 b1 00  	sb	a1, 15(sp)
8000187c: 2a e8        	sd	a0, 16(sp)
8000187e: 93 05 f1 00  	addi	a1, sp, 15
80001882: 32 e0        	sd	a2, 0(sp)
80001884: 97 00 00 00  	auipc	ra, 0
80001888: e7 80 40 f3  	jalr	-204(ra)
8000188c: 09 a0        	j	2 <_ZN4core3mem7replace17hdcdc41cc265c3138E+0x1c>
8000188e: 03 45 f1 00  	lbu	a0, 15(sp)
80001892: e2 60        	ld	ra, 24(sp)
80001894: 05 61        	addi	sp, sp, 32
80001896: 82 80        	ret

Disassembly of section .text._ZN4core3ptr100drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..process..process..ProcData$GT$$GT$17h0a613fd0bb100391E:

0000000080001898 <_ZN4core3ptr100drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..process..process..ProcData$GT$$GT$17h0a613fd0bb100391E>:
80001898: 01 11        	addi	sp, sp, -32
8000189a: 06 ec        	sd	ra, 24(sp)
8000189c: 2a e8        	sd	a0, 16(sp)
8000189e: 97 00 00 00  	auipc	ra, 0
800018a2: e7 80 e0 10  	jalr	270(ra)
800018a6: 09 a0        	j	2 <_ZN4core3ptr100drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..process..process..ProcData$GT$$GT$17h0a613fd0bb100391E+0x10>
800018a8: e2 60        	ld	ra, 24(sp)
800018aa: 05 61        	addi	sp, sp, 32
800018ac: 82 80        	ret

Disassembly of section .text._ZN4core3ptr112drop_in_place$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$17hbc937ab100a8c10aE:

00000000800018ae <_ZN4core3ptr112drop_in_place$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$17hbc937ab100a8c10aE>:
800018ae: 01 11        	addi	sp, sp, -32
800018b0: 06 ec        	sd	ra, 24(sp)
800018b2: 2a e8        	sd	a0, 16(sp)
800018b4: 97 00 00 00  	auipc	ra, 0
800018b8: e7 80 80 18  	jalr	392(ra)
800018bc: 09 a0        	j	2 <_ZN4core3ptr112drop_in_place$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$17hbc937ab100a8c10aE+0x10>
800018be: e2 60        	ld	ra, 24(sp)
800018c0: 05 61        	addi	sp, sp, 32
800018c2: 82 80        	ret

Disassembly of section .text._ZN4core3ptr140drop_in_place$LT$core..option..Option$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$$GT$17h62ea9032c4b59085E:

00000000800018c4 <_ZN4core3ptr140drop_in_place$LT$core..option..Option$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$$GT$17h62ea9032c4b59085E>:
800018c4: 01 11        	addi	sp, sp, -32
800018c6: 06 ec        	sd	ra, 24(sp)
800018c8: 2a e8        	sd	a0, 16(sp)
800018ca: 0c 61        	ld	a1, 0(a0)
800018cc: 01 46        	mv	a2, zero
800018ce: 2a e0        	sd	a0, 0(sp)
800018d0: 63 96 c5 00  	bne	a1, a2, 12 <_ZN4core3ptr140drop_in_place$LT$core..option..Option$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$$GT$17h62ea9032c4b59085E+0x18>
800018d4: 09 a0        	j	2 <_ZN4core3ptr140drop_in_place$LT$core..option..Option$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$$GT$17h62ea9032c4b59085E+0x12>
800018d6: e2 60        	ld	ra, 24(sp)
800018d8: 05 61        	addi	sp, sp, 32
800018da: 82 80        	ret
800018dc: 02 65        	ld	a0, 0(sp)
800018de: 97 00 00 00  	auipc	ra, 0
800018e2: e7 80 00 fd  	jalr	-48(ra)
800018e6: c5 bf        	j	-16 <_ZN4core3ptr140drop_in_place$LT$core..option..Option$LT$kernel..memory..container..boxed..Box$LT$kernel..memory..mapping..page_table..PageTable$GT$$GT$$GT$17h62ea9032c4b59085E+0x12>

Disassembly of section .text._ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17he36cbcc08974e17aE:

00000000800018e8 <_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17he36cbcc08974e17aE>:
800018e8: 41 11        	addi	sp, sp, -16
800018ea: 2a e4        	sd	a0, 8(sp)
800018ec: 41 01        	addi	sp, sp, 16
800018ee: 82 80        	ret

Disassembly of section .text._ZN4core3ptr54drop_in_place$LT$core..num..error..TryFromIntError$GT$17hc9e8bbecaa1d116aE:

00000000800018f0 <_ZN4core3ptr54drop_in_place$LT$core..num..error..TryFromIntError$GT$17hc9e8bbecaa1d116aE>:
800018f0: 41 11        	addi	sp, sp, -16
800018f2: 2a e4        	sd	a0, 8(sp)
800018f4: 41 01        	addi	sp, sp, 16
800018f6: 82 80        	ret

Disassembly of section .text._ZN4core3ptr60drop_in_place$LT$$RF$kernel..register..scause..Exception$GT$17h809405a29181d4d4E:

00000000800018f8 <_ZN4core3ptr60drop_in_place$LT$$RF$kernel..register..scause..Exception$GT$17h809405a29181d4d4E>:
800018f8: 41 11        	addi	sp, sp, -16
800018fa: 2a e4        	sd	a0, 8(sp)
800018fc: 41 01        	addi	sp, sp, 16
800018fe: 82 80        	ret

Disassembly of section .text._ZN4core3ptr60drop_in_place$LT$$RF$kernel..register..scause..Interrupt$GT$17h77f0570867ad7d42E:

0000000080001900 <_ZN4core3ptr60drop_in_place$LT$$RF$kernel..register..scause..Interrupt$GT$17h77f0570867ad7d42E>:
80001900: 41 11        	addi	sp, sp, -16
80001902: 2a e4        	sd	a0, 8(sp)
80001904: 41 01        	addi	sp, sp, 16
80001906: 82 80        	ret

Disassembly of section .text._ZN4core3ptr60drop_in_place$LT$$RF$mut$u20$kernel..console..uart..Uart$GT$17h7d8fe00f6a910d65E:

0000000080001908 <_ZN4core3ptr60drop_in_place$LT$$RF$mut$u20$kernel..console..uart..Uart$GT$17h7d8fe00f6a910d65E>:
80001908: 41 11        	addi	sp, sp, -16
8000190a: 2a e4        	sd	a0, 8(sp)
8000190c: 41 01        	addi	sp, sp, 16
8000190e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr71drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$usize$GT$$GT$17h413e5279eb1ead44E:

0000000080001910 <_ZN4core3ptr71drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$usize$GT$$GT$17h413e5279eb1ead44E>:
80001910: 01 11        	addi	sp, sp, -32
80001912: 06 ec        	sd	ra, 24(sp)
80001914: 2a e8        	sd	a0, 16(sp)
80001916: 97 00 00 00  	auipc	ra, 0
8000191a: e7 80 60 0c  	jalr	198(ra)
8000191e: 09 a0        	j	2 <_ZN4core3ptr71drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$usize$GT$$GT$17h413e5279eb1ead44E+0x10>
80001920: e2 60        	ld	ra, 24(sp)
80001922: 05 61        	addi	sp, sp, 32
80001924: 82 80        	ret

Disassembly of section .text._ZN4core3ptr74drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$$LP$$RP$$GT$$GT$17h1800332f62e0aeacE:

0000000080001926 <_ZN4core3ptr74drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$$LP$$RP$$GT$$GT$17h1800332f62e0aeacE>:
80001926: 01 11        	addi	sp, sp, -32
80001928: 06 ec        	sd	ra, 24(sp)
8000192a: 2a e8        	sd	a0, 16(sp)
8000192c: 97 00 00 00  	auipc	ra, 0
80001930: e7 80 80 0c  	jalr	200(ra)
80001934: 09 a0        	j	2 <_ZN4core3ptr74drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$$LP$$RP$$GT$$GT$17h1800332f62e0aeacE+0x10>
80001936: e2 60        	ld	ra, 24(sp)
80001938: 05 61        	addi	sp, sp, 32
8000193a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr88drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$allocator..BuddySystem$GT$$GT$17hf73425a051b6e02dE:

000000008000193c <_ZN4core3ptr88drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$allocator..BuddySystem$GT$$GT$17hf73425a051b6e02dE>:
8000193c: 01 11        	addi	sp, sp, -32
8000193e: 06 ec        	sd	ra, 24(sp)
80001940: 2a e8        	sd	a0, 16(sp)
80001942: 97 00 00 00  	auipc	ra, 0
80001946: e7 80 20 08  	jalr	130(ra)
8000194a: 09 a0        	j	2 <_ZN4core3ptr88drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$allocator..BuddySystem$GT$$GT$17hf73425a051b6e02dE+0x10>
8000194c: e2 60        	ld	ra, 24(sp)
8000194e: 05 61        	addi	sp, sp, 32
80001950: 82 80        	ret

Disassembly of section .text._ZN4core3ptr91drop_in_place$LT$kernel..lock..sleeplock..SleepLockGuard$LT$kernel..fs..bio..Bcache$GT$$GT$17h4ac5995b16377496E:

0000000080001952 <_ZN4core3ptr91drop_in_place$LT$kernel..lock..sleeplock..SleepLockGuard$LT$kernel..fs..bio..Bcache$GT$$GT$17h4ac5995b16377496E>:
80001952: 01 11        	addi	sp, sp, -32
80001954: 06 ec        	sd	ra, 24(sp)
80001956: 2a e8        	sd	a0, 16(sp)
80001958: 97 00 00 00  	auipc	ra, 0
8000195c: e7 80 c0 0c  	jalr	204(ra)
80001960: 09 a0        	j	2 <_ZN4core3ptr91drop_in_place$LT$kernel..lock..sleeplock..SleepLockGuard$LT$kernel..fs..bio..Bcache$GT$$GT$17h4ac5995b16377496E+0x10>
80001962: e2 60        	ld	ra, 24(sp)
80001964: 05 61        	addi	sp, sp, 32
80001966: 82 80        	ret

Disassembly of section .text._ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..console..uart..Uart$GT$$GT$17hdf68bd009ac7b422E:

0000000080001968 <_ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..console..uart..Uart$GT$$GT$17hdf68bd009ac7b422E>:
80001968: 01 11        	addi	sp, sp, -32
8000196a: 06 ec        	sd	ra, 24(sp)
8000196c: 2a e8        	sd	a0, 16(sp)
8000196e: 97 00 00 00  	auipc	ra, 0
80001972: e7 80 e0 09  	jalr	158(ra)
80001976: 09 a0        	j	2 <_ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..console..uart..Uart$GT$$GT$17hdf68bd009ac7b422E+0x10>
80001978: e2 60        	ld	ra, 24(sp)
8000197a: 05 61        	addi	sp, sp, 32
8000197c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..memory..kalloc..Run$GT$$GT$17h992fa7f8c9dbe5bdE:

000000008000197e <_ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..memory..kalloc..Run$GT$$GT$17h992fa7f8c9dbe5bdE>:
8000197e: 01 11        	addi	sp, sp, -32
80001980: 06 ec        	sd	ra, 24(sp)
80001982: 2a e8        	sd	a0, 16(sp)
80001984: 97 00 00 00  	auipc	ra, 0
80001988: e7 80 00 01  	jalr	16(ra)
8000198c: 09 a0        	j	2 <_ZN4core3ptr93drop_in_place$LT$kernel..lock..spinlock..SpinlockGuard$LT$kernel..memory..kalloc..Run$GT$$GT$17h992fa7f8c9dbe5bdE+0x10>
8000198e: e2 60        	ld	ra, 24(sp)
80001990: 05 61        	addi	sp, sp, 32
80001992: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2b38c2a85e04233aE:

0000000080001994 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2b38c2a85e04233aE>:
80001994: 41 11        	addi	sp, sp, -16
80001996: 06 e4        	sd	ra, 8(sp)
80001998: 2a e0        	sd	a0, 0(sp)
8000199a: 08 61        	ld	a0, 0(a0)
8000199c: 97 00 00 00  	auipc	ra, 0
800019a0: e7 80 a0 74  	jalr	1866(ra)
800019a4: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h2b38c2a85e04233aE+0x12>
800019a6: a2 60        	ld	ra, 8(sp)
800019a8: 41 01        	addi	sp, sp, 16
800019aa: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h54410b3b21b8f609E:

00000000800019ac <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h54410b3b21b8f609E>:
800019ac: 41 11        	addi	sp, sp, -16
800019ae: 06 e4        	sd	ra, 8(sp)
800019b0: 2a e0        	sd	a0, 0(sp)
800019b2: 08 61        	ld	a0, 0(a0)
800019b4: 97 00 00 00  	auipc	ra, 0
800019b8: e7 80 40 7b  	jalr	1972(ra)
800019bc: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h54410b3b21b8f609E+0x12>
800019be: a2 60        	ld	ra, 8(sp)
800019c0: 41 01        	addi	sp, sp, 16
800019c2: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8cc7da99a9ce5709E:

00000000800019c4 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8cc7da99a9ce5709E>:
800019c4: 41 11        	addi	sp, sp, -16
800019c6: 06 e4        	sd	ra, 8(sp)
800019c8: 2a e0        	sd	a0, 0(sp)
800019ca: 08 61        	ld	a0, 0(a0)
800019cc: 97 10 00 00  	auipc	ra, 1
800019d0: e7 80 e0 81  	jalr	-2018(ra)
800019d4: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8cc7da99a9ce5709E+0x12>
800019d6: a2 60        	ld	ra, 8(sp)
800019d8: 41 01        	addi	sp, sp, 16
800019da: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17ha26716c26e1dd79cE:

00000000800019dc <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17ha26716c26e1dd79cE>:
800019dc: 41 11        	addi	sp, sp, -16
800019de: 06 e4        	sd	ra, 8(sp)
800019e0: 2a e0        	sd	a0, 0(sp)
800019e2: 08 61        	ld	a0, 0(a0)
800019e4: 97 00 00 00  	auipc	ra, 0
800019e8: e7 80 e0 5f  	jalr	1534(ra)
800019ec: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17ha26716c26e1dd79cE+0x12>
800019ee: a2 60        	ld	ra, 8(sp)
800019f0: 41 01        	addi	sp, sp, 16
800019f2: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hb13a6595a3db93faE:

00000000800019f4 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hb13a6595a3db93faE>:
800019f4: 41 11        	addi	sp, sp, -16
800019f6: 06 e4        	sd	ra, 8(sp)
800019f8: 2a e0        	sd	a0, 0(sp)
800019fa: 08 61        	ld	a0, 0(a0)
800019fc: 97 00 00 00  	auipc	ra, 0
80001a00: e7 80 80 66  	jalr	1640(ra)
80001a04: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hb13a6595a3db93faE+0x12>
80001a06: a2 60        	ld	ra, 8(sp)
80001a08: 41 01        	addi	sp, sp, 16
80001a0a: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hcc3de3289c01f8a7E:

0000000080001a0c <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hcc3de3289c01f8a7E>:
80001a0c: 41 11        	addi	sp, sp, -16
80001a0e: 06 e4        	sd	ra, 8(sp)
80001a10: 2a e0        	sd	a0, 0(sp)
80001a12: 08 61        	ld	a0, 0(a0)
80001a14: 97 00 00 00  	auipc	ra, 0
80001a18: e7 80 c0 54  	jalr	1356(ra)
80001a1c: 09 a0        	j	2 <_ZN88_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hcc3de3289c01f8a7E+0x12>
80001a1e: a2 60        	ld	ra, 8(sp)
80001a20: 41 01        	addi	sp, sp, 16
80001a22: 82 80        	ret

Disassembly of section .text._ZN90_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h77163c4524ddef20E:

0000000080001a24 <_ZN90_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h77163c4524ddef20E>:
80001a24: 41 11        	addi	sp, sp, -16
80001a26: 06 e4        	sd	ra, 8(sp)
80001a28: 2a e0        	sd	a0, 0(sp)
80001a2a: 08 61        	ld	a0, 0(a0)
80001a2c: 97 50 00 00  	auipc	ra, 5
80001a30: e7 80 40 51  	jalr	1300(ra)
80001a34: 09 a0        	j	2 <_ZN90_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h77163c4524ddef20E+0x12>
80001a36: a2 60        	ld	ra, 8(sp)
80001a38: 41 01        	addi	sp, sp, 16
80001a3a: 82 80        	ret

Disassembly of section .text._ZN88_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4f49c0d9bd4e9a18E:

0000000080001a3c <_ZN88_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4f49c0d9bd4e9a18E>:
80001a3c: 5d 71        	addi	sp, sp, -80
80001a3e: 86 e4        	sd	ra, 72(sp)
80001a40: aa e0        	sd	a0, 64(sp)
80001a42: 08 61        	ld	a0, 0(a0)
80001a44: 97 00 00 00  	auipc	ra, 0
80001a48: e7 80 c0 0c  	jalr	204(ra)
80001a4c: 2a e4        	sd	a0, 8(sp)
80001a4e: 09 a0        	j	2 <_ZN88_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4f49c0d9bd4e9a18E+0x14>
80001a50: 22 65        	ld	a0, 8(sp)
80001a52: 97 20 00 00  	auipc	ra, 2
80001a56: e7 80 20 0f  	jalr	242(ra)
80001a5a: 2a e0        	sd	a0, 0(sp)
80001a5c: 09 a0        	j	2 <_ZN88_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4f49c0d9bd4e9a18E+0x22>
80001a5e: 02 65        	ld	a0, 0(sp)
80001a60: 97 00 00 00  	auipc	ra, 0
80001a64: e7 80 20 9a  	jalr	-1630(ra)
80001a68: 09 a0        	j	2 <.LBB30_6>

0000000080001a6a <.LBB30_6>:
80001a6a: 97 c5 00 00  	auipc	a1, 12
80001a6e: 93 85 e5 e8  	addi	a1, a1, -370

0000000080001a72 <.LBB30_7>:
80001a72: 97 c6 00 00  	auipc	a3, 12
80001a76: 93 86 66 e9  	addi	a3, a3, -362
80001a7a: 08 08        	addi	a0, sp, 16
80001a7c: 05 46        	addi	a2, zero, 1
80001a7e: 01 47        	mv	a4, zero
80001a80: 97 00 00 00  	auipc	ra, 0
80001a84: e7 80 80 c5  	jalr	-936(ra)
80001a88: 09 a0        	j	2 <.LBB30_7+0x18>
80001a8a: 08 08        	addi	a0, sp, 16
80001a8c: 97 30 00 00  	auipc	ra, 3
80001a90: e7 80 60 7d  	jalr	2006(ra)
80001a94: 09 a0        	j	2 <.LBB30_7+0x24>
80001a96: a6 60        	ld	ra, 72(sp)
80001a98: 61 61        	addi	sp, sp, 80
80001a9a: 82 80        	ret

Disassembly of section .text._ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2le17h16623e81ff09c4eaE:

0000000080001a9c <_ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2le17h16623e81ff09c4eaE>:
80001a9c: 41 11        	addi	sp, sp, -16
80001a9e: 2a e0        	sd	a0, 0(sp)
80001aa0: 2e e4        	sd	a1, 8(sp)
80001aa2: 08 61        	ld	a0, 0(a0)
80001aa4: 8c 61        	ld	a1, 0(a1)
80001aa6: 33 b5 a5 00  	sltu	a0, a1, a0
80001aaa: 13 45 15 00  	xori	a0, a0, 1
80001aae: 41 01        	addi	sp, sp, 16
80001ab0: 82 80        	ret

Disassembly of section .text._ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2lt17h9348f2db8724543bE:

0000000080001ab2 <_ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2lt17h9348f2db8724543bE>:
80001ab2: 41 11        	addi	sp, sp, -16
80001ab4: 2a e0        	sd	a0, 0(sp)
80001ab6: 2e e4        	sd	a1, 8(sp)
80001ab8: 08 61        	ld	a0, 0(a0)
80001aba: 8c 61        	ld	a1, 0(a1)
80001abc: 33 35 b5 00  	sltu	a0, a0, a1
80001ac0: 41 01        	addi	sp, sp, 16
80001ac2: 82 80        	ret

Disassembly of section .text._ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E:

0000000080001ac4 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E>:
80001ac4: 39 71        	addi	sp, sp, -64
80001ac6: 06 fc        	sd	ra, 56(sp)
80001ac8: 2a f8        	sd	a0, 48(sp)
80001aca: 2a e8        	sd	a0, 16(sp)
80001acc: 97 00 00 00  	auipc	ra, 0
80001ad0: e7 80 c0 04  	jalr	76(ra)
80001ad4: 2a e4        	sd	a0, 8(sp)
80001ad6: 09 a0        	j	2 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E+0x14>
80001ad8: 22 65        	ld	a0, 8(sp)
80001ada: 11 e5        	bnez	a0, 12 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E+0x22>
80001adc: 09 a0        	j	2 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E+0x1a>
80001ade: 42 65        	ld	a0, 16(sp)
80001ae0: 2a f0        	sd	a0, 32(sp)
80001ae2: 2a ec        	sd	a0, 24(sp)
80001ae4: 21 a0        	j	8 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E+0x28>
80001ae6: 01 45        	mv	a0, zero
80001ae8: 2a ec        	sd	a0, 24(sp)
80001aea: 09 a0        	j	2 <_ZN4core3ptr6unique15Unique$LT$T$GT$3new17h94d9d771d8265027E+0x28>
80001aec: 62 65        	ld	a0, 24(sp)
80001aee: e2 70        	ld	ra, 56(sp)
80001af0: 21 61        	addi	sp, sp, 64
80001af2: 82 80        	ret

Disassembly of section .text._ZN4core3ptr6unique15Unique$LT$T$GT$6as_mut17hc1576fe046267d83E:

0000000080001af4 <_ZN4core3ptr6unique15Unique$LT$T$GT$6as_mut17hc1576fe046267d83E>:
80001af4: 01 11        	addi	sp, sp, -32
80001af6: 06 ec        	sd	ra, 24(sp)
80001af8: 2a e8        	sd	a0, 16(sp)
80001afa: 08 61        	ld	a0, 0(a0)
80001afc: 97 00 00 00  	auipc	ra, 0
80001b00: e7 80 40 01  	jalr	20(ra)
80001b04: 2a e4        	sd	a0, 8(sp)
80001b06: 09 a0        	j	2 <_ZN4core3ptr6unique15Unique$LT$T$GT$6as_mut17hc1576fe046267d83E+0x14>
80001b08: 22 65        	ld	a0, 8(sp)
80001b0a: e2 60        	ld	ra, 24(sp)
80001b0c: 05 61        	addi	sp, sp, 32
80001b0e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17ha247a73b926db60eE:

0000000080001b10 <_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17ha247a73b926db60eE>:
80001b10: 41 11        	addi	sp, sp, -16
80001b12: 2a e4        	sd	a0, 8(sp)
80001b14: 41 01        	addi	sp, sp, 16
80001b16: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hba09f72b19078c73E:

0000000080001b18 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hba09f72b19078c73E>:
80001b18: 79 71        	addi	sp, sp, -48
80001b1a: 06 f4        	sd	ra, 40(sp)
80001b1c: 2a f0        	sd	a0, 32(sp)
80001b1e: 2a ec        	sd	a0, 24(sp)
80001b20: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hba09f72b19078c73E+0xa>
80001b22: 01 45        	mv	a0, zero
80001b24: e2 65        	ld	a1, 24(sp)
80001b26: 2a e8        	sd	a0, 16(sp)
80001b28: 2e 85        	add	a0, zero, a1
80001b2a: c2 65        	ld	a1, 16(sp)
80001b2c: 97 90 00 00  	auipc	ra, 9
80001b30: e7 80 20 3d  	jalr	978(ra)
80001b34: 2a e4        	sd	a0, 8(sp)
80001b36: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hba09f72b19078c73E+0x20>
80001b38: 22 65        	ld	a0, 8(sp)
80001b3a: a2 70        	ld	ra, 40(sp)
80001b3c: 45 61        	addi	sp, sp, 48
80001b3e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h326067385a91a5bfE:

0000000080001b40 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h326067385a91a5bfE>:
80001b40: 5d 71        	addi	sp, sp, -80
80001b42: 86 e4        	sd	ra, 72(sp)
80001b44: 2a f8        	sd	a0, 48(sp)
80001b46: 97 10 00 00  	auipc	ra, 1
80001b4a: e7 80 a0 ee  	jalr	-278(ra)
80001b4e: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h326067385a91a5bfE+0x10>
80001b50: 42 75        	ld	a0, 48(sp)
80001b52: 97 10 00 00  	auipc	ra, 1
80001b56: e7 80 40 9a  	jalr	-1628(ra)
80001b5a: 2a f4        	sd	a0, 40(sp)
80001b5c: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h326067385a91a5bfE+0x1e>
80001b5e: 01 45        	mv	a0, zero
80001b60: a2 75        	ld	a1, 40(sp)
80001b62: 63 81 a5 02  	beq	a1, a0, 34 <.LBB0_14+0x14>
80001b66: 09 a0        	j	2 <.LBB0_13>

0000000080001b68 <.LBB0_13>:
80001b68: 17 c5 00 00  	auipc	a0, 12
80001b6c: 13 05 05 da  	addi	a0, a0, -608

0000000080001b70 <.LBB0_14>:
80001b70: 17 c6 00 00  	auipc	a2, 12
80001b74: 13 06 86 db  	addi	a2, a2, -584
80001b78: 9d 45        	addi	a1, zero, 7
80001b7a: 97 a0 00 00  	auipc	ra, 10
80001b7e: e7 80 00 bc  	jalr	-1088(ra)
80001b82: 00 00        	unimp	
80001b84: 09 a0        	j	2 <.LBB0_14+0x16>
80001b86: 42 75        	ld	a0, 48(sp)
80001b88: 61 05        	addi	a0, a0, 24
80001b8a: 89 45        	addi	a1, zero, 2
80001b8c: 23 03 b1 04  	sb	a1, 70(sp)
80001b90: 05 46        	addi	a2, zero, 1
80001b92: 2e f0        	sd	a1, 32(sp)
80001b94: b2 85        	add	a1, zero, a2
80001b96: 02 76        	ld	a2, 32(sp)
80001b98: 97 70 00 00  	auipc	ra, 7
80001b9c: e7 80 60 3e  	jalr	998(ra)
80001ba0: 2a ec        	sd	a0, 24(sp)
80001ba2: 09 a0        	j	2 <.LBB0_14+0x34>
80001ba4: 62 65        	ld	a0, 24(sp)
80001ba6: 11 e9        	bnez	a0, 20 <.LBB0_14+0x4a>
80001ba8: 09 a0        	j	2 <.LBB0_14+0x3a>
80001baa: 11 45        	addi	a0, zero, 4
80001bac: a3 03 a1 04  	sb	a0, 71(sp)
80001bb0: 97 70 00 00  	auipc	ra, 7
80001bb4: e7 80 a0 44  	jalr	1098(ra)
80001bb8: 39 a0        	j	14 <.LBB0_14+0x56>
80001bba: 97 60 00 00  	auipc	ra, 6
80001bbe: e7 80 00 76  	jalr	1888(ra)
80001bc2: 09 a0        	j	2 <.LBB0_14+0x54>
80001bc4: c9 b7        	j	-62 <.LBB0_14+0x16>
80001bc6: 42 75        	ld	a0, 48(sp)
80001bc8: 41 05        	addi	a0, a0, 16
80001bca: 2a e8        	sd	a0, 16(sp)
80001bcc: 97 10 00 00  	auipc	ra, 1
80001bd0: e7 80 60 be  	jalr	-1050(ra)
80001bd4: 2a e4        	sd	a0, 8(sp)
80001bd6: 09 a0        	j	2 <.LBB0_14+0x68>
80001bd8: 42 65        	ld	a0, 16(sp)
80001bda: a2 65        	ld	a1, 8(sp)
80001bdc: 97 10 00 00  	auipc	ra, 1
80001be0: e7 80 40 b0  	jalr	-1276(ra)
80001be4: 09 a0        	j	2 <.LBB0_14+0x76>
80001be6: 42 75        	ld	a0, 48(sp)
80001be8: 2a fc        	sd	a0, 56(sp)
80001bea: a6 60        	ld	ra, 72(sp)
80001bec: 61 61        	addi	sp, sp, 80
80001bee: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3ba9e0314dae96bdE:

0000000080001bf0 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3ba9e0314dae96bdE>:
80001bf0: 5d 71        	addi	sp, sp, -80
80001bf2: 86 e4        	sd	ra, 72(sp)
80001bf4: 2a f8        	sd	a0, 48(sp)
80001bf6: 97 10 00 00  	auipc	ra, 1
80001bfa: e7 80 a0 e3  	jalr	-454(ra)
80001bfe: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3ba9e0314dae96bdE+0x10>
80001c00: 42 75        	ld	a0, 48(sp)
80001c02: 97 10 00 00  	auipc	ra, 1
80001c06: e7 80 20 87  	jalr	-1934(ra)
80001c0a: 2a f4        	sd	a0, 40(sp)
80001c0c: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3ba9e0314dae96bdE+0x1e>
80001c0e: 01 45        	mv	a0, zero
80001c10: a2 75        	ld	a1, 40(sp)
80001c12: 63 81 a5 02  	beq	a1, a0, 34 <.LBB1_14+0x14>
80001c16: 09 a0        	j	2 <.LBB1_13>

0000000080001c18 <.LBB1_13>:
80001c18: 17 c5 00 00  	auipc	a0, 12
80001c1c: 13 05 05 cf  	addi	a0, a0, -784

0000000080001c20 <.LBB1_14>:
80001c20: 17 c6 00 00  	auipc	a2, 12
80001c24: 13 06 86 d0  	addi	a2, a2, -760
80001c28: 9d 45        	addi	a1, zero, 7
80001c2a: 97 a0 00 00  	auipc	ra, 10
80001c2e: e7 80 00 b1  	jalr	-1264(ra)
80001c32: 00 00        	unimp	
80001c34: 09 a0        	j	2 <.LBB1_14+0x16>
80001c36: 42 75        	ld	a0, 48(sp)
80001c38: 61 05        	addi	a0, a0, 24
80001c3a: 89 45        	addi	a1, zero, 2
80001c3c: 23 03 b1 04  	sb	a1, 70(sp)
80001c40: 05 46        	addi	a2, zero, 1
80001c42: 2e f0        	sd	a1, 32(sp)
80001c44: b2 85        	add	a1, zero, a2
80001c46: 02 76        	ld	a2, 32(sp)
80001c48: 97 70 00 00  	auipc	ra, 7
80001c4c: e7 80 60 33  	jalr	822(ra)
80001c50: 2a ec        	sd	a0, 24(sp)
80001c52: 09 a0        	j	2 <.LBB1_14+0x34>
80001c54: 62 65        	ld	a0, 24(sp)
80001c56: 11 e9        	bnez	a0, 20 <.LBB1_14+0x4a>
80001c58: 09 a0        	j	2 <.LBB1_14+0x3a>
80001c5a: 11 45        	addi	a0, zero, 4
80001c5c: a3 03 a1 04  	sb	a0, 71(sp)
80001c60: 97 70 00 00  	auipc	ra, 7
80001c64: e7 80 a0 39  	jalr	922(ra)
80001c68: 39 a0        	j	14 <.LBB1_14+0x56>
80001c6a: 97 60 00 00  	auipc	ra, 6
80001c6e: e7 80 00 6b  	jalr	1712(ra)
80001c72: 09 a0        	j	2 <.LBB1_14+0x54>
80001c74: c9 b7        	j	-62 <.LBB1_14+0x16>
80001c76: 42 75        	ld	a0, 48(sp)
80001c78: 41 05        	addi	a0, a0, 16
80001c7a: 2a e8        	sd	a0, 16(sp)
80001c7c: 97 10 00 00  	auipc	ra, 1
80001c80: e7 80 60 b3  	jalr	-1226(ra)
80001c84: 2a e4        	sd	a0, 8(sp)
80001c86: 09 a0        	j	2 <.LBB1_14+0x68>
80001c88: 42 65        	ld	a0, 16(sp)
80001c8a: a2 65        	ld	a1, 8(sp)
80001c8c: 97 10 00 00  	auipc	ra, 1
80001c90: e7 80 40 a5  	jalr	-1452(ra)
80001c94: 09 a0        	j	2 <.LBB1_14+0x76>
80001c96: 42 75        	ld	a0, 48(sp)
80001c98: 2a fc        	sd	a0, 56(sp)
80001c9a: a6 60        	ld	ra, 72(sp)
80001c9c: 61 61        	addi	sp, sp, 80
80001c9e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3d4889ec894aea94E:

0000000080001ca0 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3d4889ec894aea94E>:
80001ca0: 5d 71        	addi	sp, sp, -80
80001ca2: 86 e4        	sd	ra, 72(sp)
80001ca4: 2a f8        	sd	a0, 48(sp)
80001ca6: 97 10 00 00  	auipc	ra, 1
80001caa: e7 80 a0 d8  	jalr	-630(ra)
80001cae: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3d4889ec894aea94E+0x10>
80001cb0: 42 75        	ld	a0, 48(sp)
80001cb2: 97 00 00 00  	auipc	ra, 0
80001cb6: e7 80 00 74  	jalr	1856(ra)
80001cba: 2a f4        	sd	a0, 40(sp)
80001cbc: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h3d4889ec894aea94E+0x1e>
80001cbe: 01 45        	mv	a0, zero
80001cc0: a2 75        	ld	a1, 40(sp)
80001cc2: 63 81 a5 02  	beq	a1, a0, 34 <.LBB2_14+0x14>
80001cc6: 09 a0        	j	2 <.LBB2_13>

0000000080001cc8 <.LBB2_13>:
80001cc8: 17 c5 00 00  	auipc	a0, 12
80001ccc: 13 05 05 c4  	addi	a0, a0, -960

0000000080001cd0 <.LBB2_14>:
80001cd0: 17 c6 00 00  	auipc	a2, 12
80001cd4: 13 06 86 c5  	addi	a2, a2, -936
80001cd8: 9d 45        	addi	a1, zero, 7
80001cda: 97 a0 00 00  	auipc	ra, 10
80001cde: e7 80 00 a6  	jalr	-1440(ra)
80001ce2: 00 00        	unimp	
80001ce4: 09 a0        	j	2 <.LBB2_14+0x16>
80001ce6: 42 75        	ld	a0, 48(sp)
80001ce8: 61 05        	addi	a0, a0, 24
80001cea: 89 45        	addi	a1, zero, 2
80001cec: 23 03 b1 04  	sb	a1, 70(sp)
80001cf0: 05 46        	addi	a2, zero, 1
80001cf2: 2e f0        	sd	a1, 32(sp)
80001cf4: b2 85        	add	a1, zero, a2
80001cf6: 02 76        	ld	a2, 32(sp)
80001cf8: 97 70 00 00  	auipc	ra, 7
80001cfc: e7 80 60 28  	jalr	646(ra)
80001d00: 2a ec        	sd	a0, 24(sp)
80001d02: 09 a0        	j	2 <.LBB2_14+0x34>
80001d04: 62 65        	ld	a0, 24(sp)
80001d06: 11 e9        	bnez	a0, 20 <.LBB2_14+0x4a>
80001d08: 09 a0        	j	2 <.LBB2_14+0x3a>
80001d0a: 11 45        	addi	a0, zero, 4
80001d0c: a3 03 a1 04  	sb	a0, 71(sp)
80001d10: 97 70 00 00  	auipc	ra, 7
80001d14: e7 80 a0 2e  	jalr	746(ra)
80001d18: 39 a0        	j	14 <.LBB2_14+0x56>
80001d1a: 97 60 00 00  	auipc	ra, 6
80001d1e: e7 80 00 60  	jalr	1536(ra)
80001d22: 09 a0        	j	2 <.LBB2_14+0x54>
80001d24: c9 b7        	j	-62 <.LBB2_14+0x16>
80001d26: 42 75        	ld	a0, 48(sp)
80001d28: 41 05        	addi	a0, a0, 16
80001d2a: 2a e8        	sd	a0, 16(sp)
80001d2c: 97 10 00 00  	auipc	ra, 1
80001d30: e7 80 60 a8  	jalr	-1402(ra)
80001d34: 2a e4        	sd	a0, 8(sp)
80001d36: 09 a0        	j	2 <.LBB2_14+0x68>
80001d38: 42 65        	ld	a0, 16(sp)
80001d3a: a2 65        	ld	a1, 8(sp)
80001d3c: 97 10 00 00  	auipc	ra, 1
80001d40: e7 80 40 9a  	jalr	-1628(ra)
80001d44: 09 a0        	j	2 <.LBB2_14+0x76>
80001d46: 42 75        	ld	a0, 48(sp)
80001d48: 2a fc        	sd	a0, 56(sp)
80001d4a: a6 60        	ld	ra, 72(sp)
80001d4c: 61 61        	addi	sp, sp, 80
80001d4e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4080624a58677d3dE:

0000000080001d50 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4080624a58677d3dE>:
80001d50: 5d 71        	addi	sp, sp, -80
80001d52: 86 e4        	sd	ra, 72(sp)
80001d54: 2a f8        	sd	a0, 48(sp)
80001d56: 97 10 00 00  	auipc	ra, 1
80001d5a: e7 80 a0 cd  	jalr	-806(ra)
80001d5e: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4080624a58677d3dE+0x10>
80001d60: 42 75        	ld	a0, 48(sp)
80001d62: 97 00 00 00  	auipc	ra, 0
80001d66: e7 80 a0 50  	jalr	1290(ra)
80001d6a: 2a f4        	sd	a0, 40(sp)
80001d6c: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4080624a58677d3dE+0x1e>
80001d6e: 01 45        	mv	a0, zero
80001d70: a2 75        	ld	a1, 40(sp)
80001d72: 63 81 a5 02  	beq	a1, a0, 34 <.LBB3_14+0x14>
80001d76: 09 a0        	j	2 <.LBB3_13>

0000000080001d78 <.LBB3_13>:
80001d78: 17 c5 00 00  	auipc	a0, 12
80001d7c: 13 05 05 b9  	addi	a0, a0, -1136

0000000080001d80 <.LBB3_14>:
80001d80: 17 c6 00 00  	auipc	a2, 12
80001d84: 13 06 86 ba  	addi	a2, a2, -1112
80001d88: 9d 45        	addi	a1, zero, 7
80001d8a: 97 a0 00 00  	auipc	ra, 10
80001d8e: e7 80 00 9b  	jalr	-1616(ra)
80001d92: 00 00        	unimp	
80001d94: 09 a0        	j	2 <.LBB3_14+0x16>
80001d96: 42 75        	ld	a0, 48(sp)
80001d98: 61 05        	addi	a0, a0, 24
80001d9a: 89 45        	addi	a1, zero, 2
80001d9c: 23 03 b1 04  	sb	a1, 70(sp)
80001da0: 05 46        	addi	a2, zero, 1
80001da2: 2e f0        	sd	a1, 32(sp)
80001da4: b2 85        	add	a1, zero, a2
80001da6: 02 76        	ld	a2, 32(sp)
80001da8: 97 70 00 00  	auipc	ra, 7
80001dac: e7 80 60 1d  	jalr	470(ra)
80001db0: 2a ec        	sd	a0, 24(sp)
80001db2: 09 a0        	j	2 <.LBB3_14+0x34>
80001db4: 62 65        	ld	a0, 24(sp)
80001db6: 11 e9        	bnez	a0, 20 <.LBB3_14+0x4a>
80001db8: 09 a0        	j	2 <.LBB3_14+0x3a>
80001dba: 11 45        	addi	a0, zero, 4
80001dbc: a3 03 a1 04  	sb	a0, 71(sp)
80001dc0: 97 70 00 00  	auipc	ra, 7
80001dc4: e7 80 a0 23  	jalr	570(ra)
80001dc8: 39 a0        	j	14 <.LBB3_14+0x56>
80001dca: 97 60 00 00  	auipc	ra, 6
80001dce: e7 80 00 55  	jalr	1360(ra)
80001dd2: 09 a0        	j	2 <.LBB3_14+0x54>
80001dd4: c9 b7        	j	-62 <.LBB3_14+0x16>
80001dd6: 42 75        	ld	a0, 48(sp)
80001dd8: 41 05        	addi	a0, a0, 16
80001dda: 2a e8        	sd	a0, 16(sp)
80001ddc: 97 10 00 00  	auipc	ra, 1
80001de0: e7 80 60 9d  	jalr	-1578(ra)
80001de4: 2a e4        	sd	a0, 8(sp)
80001de6: 09 a0        	j	2 <.LBB3_14+0x68>
80001de8: 42 65        	ld	a0, 16(sp)
80001dea: a2 65        	ld	a1, 8(sp)
80001dec: 97 10 00 00  	auipc	ra, 1
80001df0: e7 80 40 8f  	jalr	-1804(ra)
80001df4: 09 a0        	j	2 <.LBB3_14+0x76>
80001df6: 42 75        	ld	a0, 48(sp)
80001df8: 2a fc        	sd	a0, 56(sp)
80001dfa: a6 60        	ld	ra, 72(sp)
80001dfc: 61 61        	addi	sp, sp, 80
80001dfe: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4921bcbf253da8cdE:

0000000080001e00 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4921bcbf253da8cdE>:
80001e00: 5d 71        	addi	sp, sp, -80
80001e02: 86 e4        	sd	ra, 72(sp)
80001e04: 2a f8        	sd	a0, 48(sp)
80001e06: 97 10 00 00  	auipc	ra, 1
80001e0a: e7 80 a0 c2  	jalr	-982(ra)
80001e0e: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4921bcbf253da8cdE+0x10>
80001e10: 42 75        	ld	a0, 48(sp)
80001e12: 97 00 00 00  	auipc	ra, 0
80001e16: e7 80 e0 55  	jalr	1374(ra)
80001e1a: 2a f4        	sd	a0, 40(sp)
80001e1c: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h4921bcbf253da8cdE+0x1e>
80001e1e: 01 45        	mv	a0, zero
80001e20: a2 75        	ld	a1, 40(sp)
80001e22: 63 81 a5 02  	beq	a1, a0, 34 <.LBB4_14+0x14>
80001e26: 09 a0        	j	2 <.LBB4_13>

0000000080001e28 <.LBB4_13>:
80001e28: 17 c5 00 00  	auipc	a0, 12
80001e2c: 13 05 05 ae  	addi	a0, a0, -1312

0000000080001e30 <.LBB4_14>:
80001e30: 17 c6 00 00  	auipc	a2, 12
80001e34: 13 06 86 af  	addi	a2, a2, -1288
80001e38: 9d 45        	addi	a1, zero, 7
80001e3a: 97 a0 00 00  	auipc	ra, 10
80001e3e: e7 80 00 90  	jalr	-1792(ra)
80001e42: 00 00        	unimp	
80001e44: 09 a0        	j	2 <.LBB4_14+0x16>
80001e46: 42 75        	ld	a0, 48(sp)
80001e48: 61 05        	addi	a0, a0, 24
80001e4a: 89 45        	addi	a1, zero, 2
80001e4c: 23 03 b1 04  	sb	a1, 70(sp)
80001e50: 05 46        	addi	a2, zero, 1
80001e52: 2e f0        	sd	a1, 32(sp)
80001e54: b2 85        	add	a1, zero, a2
80001e56: 02 76        	ld	a2, 32(sp)
80001e58: 97 70 00 00  	auipc	ra, 7
80001e5c: e7 80 60 12  	jalr	294(ra)
80001e60: 2a ec        	sd	a0, 24(sp)
80001e62: 09 a0        	j	2 <.LBB4_14+0x34>
80001e64: 62 65        	ld	a0, 24(sp)
80001e66: 11 e9        	bnez	a0, 20 <.LBB4_14+0x4a>
80001e68: 09 a0        	j	2 <.LBB4_14+0x3a>
80001e6a: 11 45        	addi	a0, zero, 4
80001e6c: a3 03 a1 04  	sb	a0, 71(sp)
80001e70: 97 70 00 00  	auipc	ra, 7
80001e74: e7 80 a0 18  	jalr	394(ra)
80001e78: 39 a0        	j	14 <.LBB4_14+0x56>
80001e7a: 97 60 00 00  	auipc	ra, 6
80001e7e: e7 80 00 4a  	jalr	1184(ra)
80001e82: 09 a0        	j	2 <.LBB4_14+0x54>
80001e84: c9 b7        	j	-62 <.LBB4_14+0x16>
80001e86: 42 75        	ld	a0, 48(sp)
80001e88: 41 05        	addi	a0, a0, 16
80001e8a: 2a e8        	sd	a0, 16(sp)
80001e8c: 97 10 00 00  	auipc	ra, 1
80001e90: e7 80 60 92  	jalr	-1754(ra)
80001e94: 2a e4        	sd	a0, 8(sp)
80001e96: 09 a0        	j	2 <.LBB4_14+0x68>
80001e98: 42 65        	ld	a0, 16(sp)
80001e9a: a2 65        	ld	a1, 8(sp)
80001e9c: 97 10 00 00  	auipc	ra, 1
80001ea0: e7 80 40 84  	jalr	-1980(ra)
80001ea4: 09 a0        	j	2 <.LBB4_14+0x76>
80001ea6: 42 75        	ld	a0, 48(sp)
80001ea8: 2a fc        	sd	a0, 56(sp)
80001eaa: a6 60        	ld	ra, 72(sp)
80001eac: 61 61        	addi	sp, sp, 80
80001eae: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h565fc3145fcbcc55E:

0000000080001eb0 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h565fc3145fcbcc55E>:
80001eb0: 5d 71        	addi	sp, sp, -80
80001eb2: 86 e4        	sd	ra, 72(sp)
80001eb4: 2a f8        	sd	a0, 48(sp)
80001eb6: 97 10 00 00  	auipc	ra, 1
80001eba: e7 80 a0 b7  	jalr	-1158(ra)
80001ebe: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h565fc3145fcbcc55E+0x10>
80001ec0: 42 75        	ld	a0, 48(sp)
80001ec2: 97 00 00 00  	auipc	ra, 0
80001ec6: e7 80 c0 42  	jalr	1068(ra)
80001eca: 2a f4        	sd	a0, 40(sp)
80001ecc: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7acquire17h565fc3145fcbcc55E+0x1e>
80001ece: 01 45        	mv	a0, zero
80001ed0: a2 75        	ld	a1, 40(sp)
80001ed2: 63 81 a5 02  	beq	a1, a0, 34 <.LBB5_14+0x14>
80001ed6: 09 a0        	j	2 <.LBB5_13>

0000000080001ed8 <.LBB5_13>:
80001ed8: 17 c5 00 00  	auipc	a0, 12
80001edc: 13 05 05 a3  	addi	a0, a0, -1488

0000000080001ee0 <.LBB5_14>:
80001ee0: 17 c6 00 00  	auipc	a2, 12
80001ee4: 13 06 86 a4  	addi	a2, a2, -1464
80001ee8: 9d 45        	addi	a1, zero, 7
80001eea: 97 a0 00 00  	auipc	ra, 10
80001eee: e7 80 00 85  	jalr	-1968(ra)
80001ef2: 00 00        	unimp	
80001ef4: 09 a0        	j	2 <.LBB5_14+0x16>
80001ef6: 42 75        	ld	a0, 48(sp)
80001ef8: 61 05        	addi	a0, a0, 24
80001efa: 89 45        	addi	a1, zero, 2
80001efc: 23 03 b1 04  	sb	a1, 70(sp)
80001f00: 05 46        	addi	a2, zero, 1
80001f02: 2e f0        	sd	a1, 32(sp)
80001f04: b2 85        	add	a1, zero, a2
80001f06: 02 76        	ld	a2, 32(sp)
80001f08: 97 70 00 00  	auipc	ra, 7
80001f0c: e7 80 60 07  	jalr	118(ra)
80001f10: 2a ec        	sd	a0, 24(sp)
80001f12: 09 a0        	j	2 <.LBB5_14+0x34>
80001f14: 62 65        	ld	a0, 24(sp)
80001f16: 11 e9        	bnez	a0, 20 <.LBB5_14+0x4a>
80001f18: 09 a0        	j	2 <.LBB5_14+0x3a>
80001f1a: 11 45        	addi	a0, zero, 4
80001f1c: a3 03 a1 04  	sb	a0, 71(sp)
80001f20: 97 70 00 00  	auipc	ra, 7
80001f24: e7 80 a0 0d  	jalr	218(ra)
80001f28: 39 a0        	j	14 <.LBB5_14+0x56>
80001f2a: 97 60 00 00  	auipc	ra, 6
80001f2e: e7 80 00 3f  	jalr	1008(ra)
80001f32: 09 a0        	j	2 <.LBB5_14+0x54>
80001f34: c9 b7        	j	-62 <.LBB5_14+0x16>
80001f36: 42 75        	ld	a0, 48(sp)
80001f38: 41 05        	addi	a0, a0, 16
80001f3a: 2a e8        	sd	a0, 16(sp)
80001f3c: 97 10 00 00  	auipc	ra, 1
80001f40: e7 80 60 87  	jalr	-1930(ra)
80001f44: 2a e4        	sd	a0, 8(sp)
80001f46: 09 a0        	j	2 <.LBB5_14+0x68>
80001f48: 42 65        	ld	a0, 16(sp)
80001f4a: a2 65        	ld	a1, 8(sp)
80001f4c: 97 00 00 00  	auipc	ra, 0
80001f50: e7 80 40 79  	jalr	1940(ra)
80001f54: 09 a0        	j	2 <.LBB5_14+0x76>
80001f56: 42 75        	ld	a0, 48(sp)
80001f58: 2a fc        	sd	a0, 56(sp)
80001f5a: a6 60        	ld	ra, 72(sp)
80001f5c: 61 61        	addi	sp, sp, 80
80001f5e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h1c5db438d70c27d1E:

0000000080001f60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h1c5db438d70c27d1E>:
80001f60: 79 71        	addi	sp, sp, -48
80001f62: 06 f4        	sd	ra, 40(sp)
80001f64: 2a f0        	sd	a0, 32(sp)
80001f66: 2a e8        	sd	a0, 16(sp)
80001f68: 97 00 00 00  	auipc	ra, 0
80001f6c: e7 80 a0 48  	jalr	1162(ra)
80001f70: 2a e4        	sd	a0, 8(sp)
80001f72: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h1c5db438d70c27d1E+0x14>
80001f74: 22 65        	ld	a0, 8(sp)
80001f76: 05 e1        	bnez	a0, 32 <.LBB6_9+0x14>
80001f78: 09 a0        	j	2 <.LBB6_8>

0000000080001f7a <.LBB6_8>:
80001f7a: 17 c5 00 00  	auipc	a0, 12
80001f7e: 13 05 65 9c  	addi	a0, a0, -1594

0000000080001f82 <.LBB6_9>:
80001f82: 17 c6 00 00  	auipc	a2, 12
80001f86: 13 06 66 9c  	addi	a2, a2, -1594
80001f8a: 9d 45        	addi	a1, zero, 7
80001f8c: 97 90 00 00  	auipc	ra, 9
80001f90: e7 80 e0 7a  	jalr	1966(ra)
80001f94: 00 00        	unimp	
80001f96: 42 65        	ld	a0, 16(sp)
80001f98: 41 05        	addi	a0, a0, 16
80001f9a: fd 55        	addi	a1, zero, -1
80001f9c: 97 00 00 00  	auipc	ra, 0
80001fa0: e7 80 40 74  	jalr	1860(ra)
80001fa4: 09 a0        	j	2 <.LBB6_9+0x24>
80001fa6: 11 45        	addi	a0, zero, 4
80001fa8: 23 0f a1 00  	sb	a0, 30(sp)
80001fac: 97 70 00 00  	auipc	ra, 7
80001fb0: e7 80 e0 04  	jalr	78(ra)
80001fb4: 09 a0        	j	2 <.LBB6_9+0x34>
80001fb6: 42 65        	ld	a0, 16(sp)
80001fb8: 61 05        	addi	a0, a0, 24
80001fba: 85 45        	addi	a1, zero, 1
80001fbc: a3 0f b1 00  	sb	a1, 31(sp)
80001fc0: 01 46        	mv	a2, zero
80001fc2: 2e e0        	sd	a1, 0(sp)
80001fc4: b2 85        	add	a1, zero, a2
80001fc6: 02 66        	ld	a2, 0(sp)
80001fc8: 97 70 00 00  	auipc	ra, 7
80001fcc: e7 80 a0 ff  	jalr	-6(ra)
80001fd0: 09 a0        	j	2 <.LBB6_9+0x50>
80001fd2: 97 10 00 00  	auipc	ra, 1
80001fd6: e7 80 20 ae  	jalr	-1310(ra)
80001fda: 09 a0        	j	2 <.LBB6_9+0x5a>
80001fdc: a2 70        	ld	ra, 40(sp)
80001fde: 45 61        	addi	sp, sp, 48
80001fe0: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h2a03ed4d85023567E:

0000000080001fe2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h2a03ed4d85023567E>:
80001fe2: 79 71        	addi	sp, sp, -48
80001fe4: 06 f4        	sd	ra, 40(sp)
80001fe6: 2a f0        	sd	a0, 32(sp)
80001fe8: 2a e8        	sd	a0, 16(sp)
80001fea: 97 00 00 00  	auipc	ra, 0
80001fee: e7 80 60 38  	jalr	902(ra)
80001ff2: 2a e4        	sd	a0, 8(sp)
80001ff4: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h2a03ed4d85023567E+0x14>
80001ff6: 22 65        	ld	a0, 8(sp)
80001ff8: 05 e1        	bnez	a0, 32 <.LBB7_9+0x14>
80001ffa: 09 a0        	j	2 <.LBB7_8>

0000000080001ffc <.LBB7_8>:
80001ffc: 17 c5 00 00  	auipc	a0, 12
80002000: 13 05 45 94  	addi	a0, a0, -1724

0000000080002004 <.LBB7_9>:
80002004: 17 c6 00 00  	auipc	a2, 12
80002008: 13 06 46 94  	addi	a2, a2, -1724
8000200c: 9d 45        	addi	a1, zero, 7
8000200e: 97 90 00 00  	auipc	ra, 9
80002012: e7 80 c0 72  	jalr	1836(ra)
80002016: 00 00        	unimp	
80002018: 42 65        	ld	a0, 16(sp)
8000201a: 41 05        	addi	a0, a0, 16
8000201c: fd 55        	addi	a1, zero, -1
8000201e: 97 00 00 00  	auipc	ra, 0
80002022: e7 80 20 6c  	jalr	1730(ra)
80002026: 09 a0        	j	2 <.LBB7_9+0x24>
80002028: 11 45        	addi	a0, zero, 4
8000202a: 23 0f a1 00  	sb	a0, 30(sp)
8000202e: 97 70 00 00  	auipc	ra, 7
80002032: e7 80 c0 fc  	jalr	-52(ra)
80002036: 09 a0        	j	2 <.LBB7_9+0x34>
80002038: 42 65        	ld	a0, 16(sp)
8000203a: 61 05        	addi	a0, a0, 24
8000203c: 85 45        	addi	a1, zero, 1
8000203e: a3 0f b1 00  	sb	a1, 31(sp)
80002042: 01 46        	mv	a2, zero
80002044: 2e e0        	sd	a1, 0(sp)
80002046: b2 85        	add	a1, zero, a2
80002048: 02 66        	ld	a2, 0(sp)
8000204a: 97 70 00 00  	auipc	ra, 7
8000204e: e7 80 80 f7  	jalr	-136(ra)
80002052: 09 a0        	j	2 <.LBB7_9+0x50>
80002054: 97 10 00 00  	auipc	ra, 1
80002058: e7 80 00 a6  	jalr	-1440(ra)
8000205c: 09 a0        	j	2 <.LBB7_9+0x5a>
8000205e: a2 70        	ld	ra, 40(sp)
80002060: 45 61        	addi	sp, sp, 48
80002062: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h75a814c2db51ab48E:

0000000080002064 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h75a814c2db51ab48E>:
80002064: 79 71        	addi	sp, sp, -48
80002066: 06 f4        	sd	ra, 40(sp)
80002068: 2a f0        	sd	a0, 32(sp)
8000206a: 2a e8        	sd	a0, 16(sp)
8000206c: 97 00 00 00  	auipc	ra, 0
80002070: e7 80 20 28  	jalr	642(ra)
80002074: 2a e4        	sd	a0, 8(sp)
80002076: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h75a814c2db51ab48E+0x14>
80002078: 22 65        	ld	a0, 8(sp)
8000207a: 05 e1        	bnez	a0, 32 <.LBB8_9+0x14>
8000207c: 09 a0        	j	2 <.LBB8_8>

000000008000207e <.LBB8_8>:
8000207e: 17 c5 00 00  	auipc	a0, 12
80002082: 13 05 25 8c  	addi	a0, a0, -1854

0000000080002086 <.LBB8_9>:
80002086: 17 c6 00 00  	auipc	a2, 12
8000208a: 13 06 26 8c  	addi	a2, a2, -1854
8000208e: 9d 45        	addi	a1, zero, 7
80002090: 97 90 00 00  	auipc	ra, 9
80002094: e7 80 a0 6a  	jalr	1706(ra)
80002098: 00 00        	unimp	
8000209a: 42 65        	ld	a0, 16(sp)
8000209c: 41 05        	addi	a0, a0, 16
8000209e: fd 55        	addi	a1, zero, -1
800020a0: 97 00 00 00  	auipc	ra, 0
800020a4: e7 80 00 64  	jalr	1600(ra)
800020a8: 09 a0        	j	2 <.LBB8_9+0x24>
800020aa: 11 45        	addi	a0, zero, 4
800020ac: 23 0f a1 00  	sb	a0, 30(sp)
800020b0: 97 70 00 00  	auipc	ra, 7
800020b4: e7 80 a0 f4  	jalr	-182(ra)
800020b8: 09 a0        	j	2 <.LBB8_9+0x34>
800020ba: 42 65        	ld	a0, 16(sp)
800020bc: 61 05        	addi	a0, a0, 24
800020be: 85 45        	addi	a1, zero, 1
800020c0: a3 0f b1 00  	sb	a1, 31(sp)
800020c4: 01 46        	mv	a2, zero
800020c6: 2e e0        	sd	a1, 0(sp)
800020c8: b2 85        	add	a1, zero, a2
800020ca: 02 66        	ld	a2, 0(sp)
800020cc: 97 70 00 00  	auipc	ra, 7
800020d0: e7 80 60 ef  	jalr	-266(ra)
800020d4: 09 a0        	j	2 <.LBB8_9+0x50>
800020d6: 97 10 00 00  	auipc	ra, 1
800020da: e7 80 e0 9d  	jalr	-1570(ra)
800020de: 09 a0        	j	2 <.LBB8_9+0x5a>
800020e0: a2 70        	ld	ra, 40(sp)
800020e2: 45 61        	addi	sp, sp, 48
800020e4: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h87bb05fc10237e1aE:

00000000800020e6 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h87bb05fc10237e1aE>:
800020e6: 79 71        	addi	sp, sp, -48
800020e8: 06 f4        	sd	ra, 40(sp)
800020ea: 2a f0        	sd	a0, 32(sp)
800020ec: 2a e8        	sd	a0, 16(sp)
800020ee: 97 00 00 00  	auipc	ra, 0
800020f2: e7 80 e0 17  	jalr	382(ra)
800020f6: 2a e4        	sd	a0, 8(sp)
800020f8: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17h87bb05fc10237e1aE+0x14>
800020fa: 22 65        	ld	a0, 8(sp)
800020fc: 05 e1        	bnez	a0, 32 <.LBB9_9+0x14>
800020fe: 09 a0        	j	2 <.LBB9_8>

0000000080002100 <.LBB9_8>:
80002100: 17 c5 00 00  	auipc	a0, 12
80002104: 13 05 05 84  	addi	a0, a0, -1984

0000000080002108 <.LBB9_9>:
80002108: 17 c6 00 00  	auipc	a2, 12
8000210c: 13 06 06 84  	addi	a2, a2, -1984
80002110: 9d 45        	addi	a1, zero, 7
80002112: 97 90 00 00  	auipc	ra, 9
80002116: e7 80 80 62  	jalr	1576(ra)
8000211a: 00 00        	unimp	
8000211c: 42 65        	ld	a0, 16(sp)
8000211e: 41 05        	addi	a0, a0, 16
80002120: fd 55        	addi	a1, zero, -1
80002122: 97 00 00 00  	auipc	ra, 0
80002126: e7 80 e0 5b  	jalr	1470(ra)
8000212a: 09 a0        	j	2 <.LBB9_9+0x24>
8000212c: 11 45        	addi	a0, zero, 4
8000212e: 23 0f a1 00  	sb	a0, 30(sp)
80002132: 97 70 00 00  	auipc	ra, 7
80002136: e7 80 80 ec  	jalr	-312(ra)
8000213a: 09 a0        	j	2 <.LBB9_9+0x34>
8000213c: 42 65        	ld	a0, 16(sp)
8000213e: 61 05        	addi	a0, a0, 24
80002140: 85 45        	addi	a1, zero, 1
80002142: a3 0f b1 00  	sb	a1, 31(sp)
80002146: 01 46        	mv	a2, zero
80002148: 2e e0        	sd	a1, 0(sp)
8000214a: b2 85        	add	a1, zero, a2
8000214c: 02 66        	ld	a2, 0(sp)
8000214e: 97 70 00 00  	auipc	ra, 7
80002152: e7 80 40 e7  	jalr	-396(ra)
80002156: 09 a0        	j	2 <.LBB9_9+0x50>
80002158: 97 10 00 00  	auipc	ra, 1
8000215c: e7 80 c0 95  	jalr	-1700(ra)
80002160: 09 a0        	j	2 <.LBB9_9+0x5a>
80002162: a2 70        	ld	ra, 40(sp)
80002164: 45 61        	addi	sp, sp, 48
80002166: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd84a812d9c429534E:

0000000080002168 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd84a812d9c429534E>:
80002168: 79 71        	addi	sp, sp, -48
8000216a: 06 f4        	sd	ra, 40(sp)
8000216c: 2a f0        	sd	a0, 32(sp)
8000216e: 2a e8        	sd	a0, 16(sp)
80002170: 97 00 00 00  	auipc	ra, 0
80002174: e7 80 60 38  	jalr	902(ra)
80002178: 2a e4        	sd	a0, 8(sp)
8000217a: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd84a812d9c429534E+0x14>
8000217c: 22 65        	ld	a0, 8(sp)
8000217e: 05 e1        	bnez	a0, 32 <.LBB10_9+0x14>
80002180: 09 a0        	j	2 <.LBB10_8>

0000000080002182 <.LBB10_8>:
80002182: 17 b5 00 00  	auipc	a0, 11
80002186: 13 05 e5 7b  	addi	a0, a0, 1982

000000008000218a <.LBB10_9>:
8000218a: 17 b6 00 00  	auipc	a2, 11
8000218e: 13 06 e6 7b  	addi	a2, a2, 1982
80002192: 9d 45        	addi	a1, zero, 7
80002194: 97 90 00 00  	auipc	ra, 9
80002198: e7 80 60 5a  	jalr	1446(ra)
8000219c: 00 00        	unimp	
8000219e: 42 65        	ld	a0, 16(sp)
800021a0: 41 05        	addi	a0, a0, 16
800021a2: fd 55        	addi	a1, zero, -1
800021a4: 97 00 00 00  	auipc	ra, 0
800021a8: e7 80 c0 53  	jalr	1340(ra)
800021ac: 09 a0        	j	2 <.LBB10_9+0x24>
800021ae: 11 45        	addi	a0, zero, 4
800021b0: 23 0f a1 00  	sb	a0, 30(sp)
800021b4: 97 70 00 00  	auipc	ra, 7
800021b8: e7 80 60 e4  	jalr	-442(ra)
800021bc: 09 a0        	j	2 <.LBB10_9+0x34>
800021be: 42 65        	ld	a0, 16(sp)
800021c0: 61 05        	addi	a0, a0, 24
800021c2: 85 45        	addi	a1, zero, 1
800021c4: a3 0f b1 00  	sb	a1, 31(sp)
800021c8: 01 46        	mv	a2, zero
800021ca: 2e e0        	sd	a1, 0(sp)
800021cc: b2 85        	add	a1, zero, a2
800021ce: 02 66        	ld	a2, 0(sp)
800021d0: 97 70 00 00  	auipc	ra, 7
800021d4: e7 80 20 df  	jalr	-526(ra)
800021d8: 09 a0        	j	2 <.LBB10_9+0x50>
800021da: 97 10 00 00  	auipc	ra, 1
800021de: e7 80 a0 8d  	jalr	-1830(ra)
800021e2: 09 a0        	j	2 <.LBB10_9+0x5a>
800021e4: a2 70        	ld	ra, 40(sp)
800021e6: 45 61        	addi	sp, sp, 48
800021e8: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd8dcf0ffadecbf85E:

00000000800021ea <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd8dcf0ffadecbf85E>:
800021ea: 79 71        	addi	sp, sp, -48
800021ec: 06 f4        	sd	ra, 40(sp)
800021ee: 2a f0        	sd	a0, 32(sp)
800021f0: 2a e8        	sd	a0, 16(sp)
800021f2: 97 00 00 00  	auipc	ra, 0
800021f6: e7 80 20 28  	jalr	642(ra)
800021fa: 2a e4        	sd	a0, 8(sp)
800021fc: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7release17hd8dcf0ffadecbf85E+0x14>
800021fe: 22 65        	ld	a0, 8(sp)
80002200: 05 e1        	bnez	a0, 32 <.LBB11_9+0x14>
80002202: 09 a0        	j	2 <.LBB11_8>

0000000080002204 <.LBB11_8>:
80002204: 17 b5 00 00  	auipc	a0, 11
80002208: 13 05 c5 73  	addi	a0, a0, 1852

000000008000220c <.LBB11_9>:
8000220c: 17 b6 00 00  	auipc	a2, 11
80002210: 13 06 c6 73  	addi	a2, a2, 1852
80002214: 9d 45        	addi	a1, zero, 7
80002216: 97 90 00 00  	auipc	ra, 9
8000221a: e7 80 40 52  	jalr	1316(ra)
8000221e: 00 00        	unimp	
80002220: 42 65        	ld	a0, 16(sp)
80002222: 41 05        	addi	a0, a0, 16
80002224: fd 55        	addi	a1, zero, -1
80002226: 97 00 00 00  	auipc	ra, 0
8000222a: e7 80 a0 4b  	jalr	1210(ra)
8000222e: 09 a0        	j	2 <.LBB11_9+0x24>
80002230: 11 45        	addi	a0, zero, 4
80002232: 23 0f a1 00  	sb	a0, 30(sp)
80002236: 97 70 00 00  	auipc	ra, 7
8000223a: e7 80 40 dc  	jalr	-572(ra)
8000223e: 09 a0        	j	2 <.LBB11_9+0x34>
80002240: 42 65        	ld	a0, 16(sp)
80002242: 61 05        	addi	a0, a0, 24
80002244: 85 45        	addi	a1, zero, 1
80002246: a3 0f b1 00  	sb	a1, 31(sp)
8000224a: 01 46        	mv	a2, zero
8000224c: 2e e0        	sd	a1, 0(sp)
8000224e: b2 85        	add	a1, zero, a2
80002250: 02 66        	ld	a2, 0(sp)
80002252: 97 70 00 00  	auipc	ra, 7
80002256: e7 80 00 d7  	jalr	-656(ra)
8000225a: 09 a0        	j	2 <.LBB11_9+0x50>
8000225c: 97 10 00 00  	auipc	ra, 1
80002260: e7 80 80 85  	jalr	-1960(ra)
80002264: 09 a0        	j	2 <.LBB11_9+0x5a>
80002266: a2 70        	ld	ra, 40(sp)
80002268: 45 61        	addi	sp, sp, 48
8000226a: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE:

000000008000226c <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE>:
8000226c: 39 71        	addi	sp, sp, -64
8000226e: 06 fc        	sd	ra, 56(sp)
80002270: 2a f8        	sd	a0, 48(sp)
80002272: 93 05 85 01  	addi	a1, a0, 24
80002276: 01 46        	mv	a2, zero
80002278: a3 07 c1 02  	sb	a2, 47(sp)
8000227c: 2a f0        	sd	a0, 32(sp)
8000227e: 2e 85        	add	a0, zero, a1
80002280: b2 85        	add	a1, zero, a2
80002282: 97 70 00 00  	auipc	ra, 7
80002286: e7 80 20 cc  	jalr	-830(ra)
8000228a: 2a ec        	sd	a0, 24(sp)
8000228c: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x4c>
8000228e: 05 45        	addi	a0, zero, 1
80002290: 23 07 a1 02  	sb	a0, 46(sp)
80002294: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x42>
80002296: 01 45        	mv	a0, zero
80002298: 23 07 a1 02  	sb	a0, 46(sp)
8000229c: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x42>
8000229e: 02 75        	ld	a0, 32(sp)
800022a0: 41 05        	addi	a0, a0, 16
800022a2: 97 00 00 00  	auipc	ra, 0
800022a6: e7 80 20 3d  	jalr	978(ra)
800022aa: 2a e8        	sd	a0, 16(sp)
800022ac: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x52>
800022ae: 03 45 e1 02  	lbu	a0, 46(sp)
800022b2: 05 89        	andi	a0, a0, 1
800022b4: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x68>
800022b6: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x70>
800022b8: 62 65        	ld	a0, 24(sp)
800022ba: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x32>
800022bc: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x2a>
800022be: 97 00 00 00  	auipc	ra, 0
800022c2: e7 80 40 4f  	jalr	1268(ra)
800022c6: 2a e4        	sd	a0, 8(sp)
800022c8: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x5e>
800022ca: 42 65        	ld	a0, 16(sp)
800022cc: a2 65        	ld	a1, 8(sp)
800022ce: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x22>
800022d2: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x2a>
800022d4: 05 45        	addi	a0, zero, 1
800022d6: a3 06 a1 02  	sb	a0, 45(sp)
800022da: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x78>
800022dc: 01 45        	mv	a0, zero
800022de: a3 06 a1 02  	sb	a0, 45(sp)
800022e2: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h08e3b4a517acc88aE+0x78>
800022e4: 03 45 d1 02  	lbu	a0, 45(sp)
800022e8: e2 70        	ld	ra, 56(sp)
800022ea: 21 61        	addi	sp, sp, 64
800022ec: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE:

00000000800022ee <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE>:
800022ee: 39 71        	addi	sp, sp, -64
800022f0: 06 fc        	sd	ra, 56(sp)
800022f2: 2a f8        	sd	a0, 48(sp)
800022f4: 93 05 85 01  	addi	a1, a0, 24
800022f8: 01 46        	mv	a2, zero
800022fa: a3 07 c1 02  	sb	a2, 47(sp)
800022fe: 2a f0        	sd	a0, 32(sp)
80002300: 2e 85        	add	a0, zero, a1
80002302: b2 85        	add	a1, zero, a2
80002304: 97 70 00 00  	auipc	ra, 7
80002308: e7 80 00 c4  	jalr	-960(ra)
8000230c: 2a ec        	sd	a0, 24(sp)
8000230e: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x4c>
80002310: 05 45        	addi	a0, zero, 1
80002312: 23 07 a1 02  	sb	a0, 46(sp)
80002316: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x42>
80002318: 01 45        	mv	a0, zero
8000231a: 23 07 a1 02  	sb	a0, 46(sp)
8000231e: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x42>
80002320: 02 75        	ld	a0, 32(sp)
80002322: 41 05        	addi	a0, a0, 16
80002324: 97 00 00 00  	auipc	ra, 0
80002328: e7 80 00 35  	jalr	848(ra)
8000232c: 2a e8        	sd	a0, 16(sp)
8000232e: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x52>
80002330: 03 45 e1 02  	lbu	a0, 46(sp)
80002334: 05 89        	andi	a0, a0, 1
80002336: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x68>
80002338: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x70>
8000233a: 62 65        	ld	a0, 24(sp)
8000233c: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x32>
8000233e: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x2a>
80002340: 97 00 00 00  	auipc	ra, 0
80002344: e7 80 20 47  	jalr	1138(ra)
80002348: 2a e4        	sd	a0, 8(sp)
8000234a: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x5e>
8000234c: 42 65        	ld	a0, 16(sp)
8000234e: a2 65        	ld	a1, 8(sp)
80002350: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x22>
80002354: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x2a>
80002356: 05 45        	addi	a0, zero, 1
80002358: a3 06 a1 02  	sb	a0, 45(sp)
8000235c: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x78>
8000235e: 01 45        	mv	a0, zero
80002360: a3 06 a1 02  	sb	a0, 45(sp)
80002364: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h14ed923124cdd0afE+0x78>
80002366: 03 45 d1 02  	lbu	a0, 45(sp)
8000236a: e2 70        	ld	ra, 56(sp)
8000236c: 21 61        	addi	sp, sp, 64
8000236e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E:

0000000080002370 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E>:
80002370: 39 71        	addi	sp, sp, -64
80002372: 06 fc        	sd	ra, 56(sp)
80002374: 2a f8        	sd	a0, 48(sp)
80002376: 93 05 85 01  	addi	a1, a0, 24
8000237a: 01 46        	mv	a2, zero
8000237c: a3 07 c1 02  	sb	a2, 47(sp)
80002380: 2a f0        	sd	a0, 32(sp)
80002382: 2e 85        	add	a0, zero, a1
80002384: b2 85        	add	a1, zero, a2
80002386: 97 70 00 00  	auipc	ra, 7
8000238a: e7 80 e0 bb  	jalr	-1090(ra)
8000238e: 2a ec        	sd	a0, 24(sp)
80002390: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x4c>
80002392: 05 45        	addi	a0, zero, 1
80002394: 23 07 a1 02  	sb	a0, 46(sp)
80002398: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x42>
8000239a: 01 45        	mv	a0, zero
8000239c: 23 07 a1 02  	sb	a0, 46(sp)
800023a0: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x42>
800023a2: 02 75        	ld	a0, 32(sp)
800023a4: 41 05        	addi	a0, a0, 16
800023a6: 97 00 00 00  	auipc	ra, 0
800023aa: e7 80 e0 2c  	jalr	718(ra)
800023ae: 2a e8        	sd	a0, 16(sp)
800023b0: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x52>
800023b2: 03 45 e1 02  	lbu	a0, 46(sp)
800023b6: 05 89        	andi	a0, a0, 1
800023b8: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x68>
800023ba: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x70>
800023bc: 62 65        	ld	a0, 24(sp)
800023be: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x32>
800023c0: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x2a>
800023c2: 97 00 00 00  	auipc	ra, 0
800023c6: e7 80 00 3f  	jalr	1008(ra)
800023ca: 2a e4        	sd	a0, 8(sp)
800023cc: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x5e>
800023ce: 42 65        	ld	a0, 16(sp)
800023d0: a2 65        	ld	a1, 8(sp)
800023d2: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x22>
800023d6: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x2a>
800023d8: 05 45        	addi	a0, zero, 1
800023da: a3 06 a1 02  	sb	a0, 45(sp)
800023de: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x78>
800023e0: 01 45        	mv	a0, zero
800023e2: a3 06 a1 02  	sb	a0, 45(sp)
800023e6: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h7f382eecc29b3732E+0x78>
800023e8: 03 45 d1 02  	lbu	a0, 45(sp)
800023ec: e2 70        	ld	ra, 56(sp)
800023ee: 21 61        	addi	sp, sp, 64
800023f0: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE:

00000000800023f2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE>:
800023f2: 39 71        	addi	sp, sp, -64
800023f4: 06 fc        	sd	ra, 56(sp)
800023f6: 2a f8        	sd	a0, 48(sp)
800023f8: 93 05 85 01  	addi	a1, a0, 24
800023fc: 01 46        	mv	a2, zero
800023fe: a3 07 c1 02  	sb	a2, 47(sp)
80002402: 2a f0        	sd	a0, 32(sp)
80002404: 2e 85        	add	a0, zero, a1
80002406: b2 85        	add	a1, zero, a2
80002408: 97 70 00 00  	auipc	ra, 7
8000240c: e7 80 c0 b3  	jalr	-1220(ra)
80002410: 2a ec        	sd	a0, 24(sp)
80002412: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x4c>
80002414: 05 45        	addi	a0, zero, 1
80002416: 23 07 a1 02  	sb	a0, 46(sp)
8000241a: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x42>
8000241c: 01 45        	mv	a0, zero
8000241e: 23 07 a1 02  	sb	a0, 46(sp)
80002422: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x42>
80002424: 02 75        	ld	a0, 32(sp)
80002426: 41 05        	addi	a0, a0, 16
80002428: 97 00 00 00  	auipc	ra, 0
8000242c: e7 80 c0 24  	jalr	588(ra)
80002430: 2a e8        	sd	a0, 16(sp)
80002432: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x52>
80002434: 03 45 e1 02  	lbu	a0, 46(sp)
80002438: 05 89        	andi	a0, a0, 1
8000243a: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x68>
8000243c: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x70>
8000243e: 62 65        	ld	a0, 24(sp)
80002440: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x32>
80002442: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x2a>
80002444: 97 00 00 00  	auipc	ra, 0
80002448: e7 80 e0 36  	jalr	878(ra)
8000244c: 2a e4        	sd	a0, 8(sp)
8000244e: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x5e>
80002450: 42 65        	ld	a0, 16(sp)
80002452: a2 65        	ld	a1, 8(sp)
80002454: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x22>
80002458: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x2a>
8000245a: 05 45        	addi	a0, zero, 1
8000245c: a3 06 a1 02  	sb	a0, 45(sp)
80002460: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x78>
80002462: 01 45        	mv	a0, zero
80002464: a3 06 a1 02  	sb	a0, 45(sp)
80002468: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17h8f0e036f349ea13aE+0x78>
8000246a: 03 45 d1 02  	lbu	a0, 45(sp)
8000246e: e2 70        	ld	ra, 56(sp)
80002470: 21 61        	addi	sp, sp, 64
80002472: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E:

0000000080002474 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E>:
80002474: 39 71        	addi	sp, sp, -64
80002476: 06 fc        	sd	ra, 56(sp)
80002478: 2a f8        	sd	a0, 48(sp)
8000247a: 93 05 85 01  	addi	a1, a0, 24
8000247e: 01 46        	mv	a2, zero
80002480: a3 07 c1 02  	sb	a2, 47(sp)
80002484: 2a f0        	sd	a0, 32(sp)
80002486: 2e 85        	add	a0, zero, a1
80002488: b2 85        	add	a1, zero, a2
8000248a: 97 70 00 00  	auipc	ra, 7
8000248e: e7 80 a0 ab  	jalr	-1350(ra)
80002492: 2a ec        	sd	a0, 24(sp)
80002494: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x4c>
80002496: 05 45        	addi	a0, zero, 1
80002498: 23 07 a1 02  	sb	a0, 46(sp)
8000249c: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x42>
8000249e: 01 45        	mv	a0, zero
800024a0: 23 07 a1 02  	sb	a0, 46(sp)
800024a4: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x42>
800024a6: 02 75        	ld	a0, 32(sp)
800024a8: 41 05        	addi	a0, a0, 16
800024aa: 97 00 00 00  	auipc	ra, 0
800024ae: e7 80 a0 1c  	jalr	458(ra)
800024b2: 2a e8        	sd	a0, 16(sp)
800024b4: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x52>
800024b6: 03 45 e1 02  	lbu	a0, 46(sp)
800024ba: 05 89        	andi	a0, a0, 1
800024bc: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x68>
800024be: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x70>
800024c0: 62 65        	ld	a0, 24(sp)
800024c2: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x32>
800024c4: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x2a>
800024c6: 97 00 00 00  	auipc	ra, 0
800024ca: e7 80 c0 2e  	jalr	748(ra)
800024ce: 2a e4        	sd	a0, 8(sp)
800024d0: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x5e>
800024d2: 42 65        	ld	a0, 16(sp)
800024d4: a2 65        	ld	a1, 8(sp)
800024d6: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x22>
800024da: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x2a>
800024dc: 05 45        	addi	a0, zero, 1
800024de: a3 06 a1 02  	sb	a0, 45(sp)
800024e2: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x78>
800024e4: 01 45        	mv	a0, zero
800024e6: a3 06 a1 02  	sb	a0, 45(sp)
800024ea: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17hca7c981e92bdfa54E+0x78>
800024ec: 03 45 d1 02  	lbu	a0, 45(sp)
800024f0: e2 70        	ld	ra, 56(sp)
800024f2: 21 61        	addi	sp, sp, 64
800024f4: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE:

00000000800024f6 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE>:
800024f6: 39 71        	addi	sp, sp, -64
800024f8: 06 fc        	sd	ra, 56(sp)
800024fa: 2a f8        	sd	a0, 48(sp)
800024fc: 93 05 85 01  	addi	a1, a0, 24
80002500: 01 46        	mv	a2, zero
80002502: a3 07 c1 02  	sb	a2, 47(sp)
80002506: 2a f0        	sd	a0, 32(sp)
80002508: 2e 85        	add	a0, zero, a1
8000250a: b2 85        	add	a1, zero, a2
8000250c: 97 70 00 00  	auipc	ra, 7
80002510: e7 80 80 a3  	jalr	-1480(ra)
80002514: 2a ec        	sd	a0, 24(sp)
80002516: 35 a0        	j	44 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x4c>
80002518: 05 45        	addi	a0, zero, 1
8000251a: 23 07 a1 02  	sb	a0, 46(sp)
8000251e: 29 a8        	j	26 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x42>
80002520: 01 45        	mv	a0, zero
80002522: 23 07 a1 02  	sb	a0, 46(sp)
80002526: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x42>
80002528: 02 75        	ld	a0, 32(sp)
8000252a: 41 05        	addi	a0, a0, 16
8000252c: 97 00 00 00  	auipc	ra, 0
80002530: e7 80 80 14  	jalr	328(ra)
80002534: 2a e8        	sd	a0, 16(sp)
80002536: 09 a8        	j	18 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x52>
80002538: 03 45 e1 02  	lbu	a0, 46(sp)
8000253c: 05 89        	andi	a0, a0, 1
8000253e: 05 e1        	bnez	a0, 32 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x68>
80002540: 1d a0        	j	38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x70>
80002542: 62 65        	ld	a0, 24(sp)
80002544: 75 f1        	bnez	a0, -28 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x32>
80002546: e9 bf        	j	-38 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x2a>
80002548: 97 00 00 00  	auipc	ra, 0
8000254c: e7 80 a0 26  	jalr	618(ra)
80002550: 2a e4        	sd	a0, 8(sp)
80002552: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x5e>
80002554: 42 65        	ld	a0, 16(sp)
80002556: a2 65        	ld	a1, 8(sp)
80002558: e3 00 b5 fc  	beq	a0, a1, -64 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x22>
8000255c: d1 b7        	j	-60 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x2a>
8000255e: 05 45        	addi	a0, zero, 1
80002560: a3 06 a1 02  	sb	a0, 45(sp)
80002564: 29 a0        	j	10 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x78>
80002566: 01 45        	mv	a0, zero
80002568: a3 06 a1 02  	sb	a0, 45(sp)
8000256c: 09 a0        	j	2 <_ZN6kernel4lock8spinlock17Spinlock$LT$T$GT$7holding17he0b7ba87af6b207aE+0x78>
8000256e: 03 45 d1 02  	lbu	a0, 45(sp)
80002572: e2 70        	ld	ra, 56(sp)
80002574: 21 61        	addi	sp, sp, 64
80002576: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock8spinlock22SpinlockGuard$LT$T$GT$7holding17hf2abf25ec93b0ec9E:

0000000080002578 <_ZN6kernel4lock8spinlock22SpinlockGuard$LT$T$GT$7holding17hf2abf25ec93b0ec9E>:
80002578: 01 11        	addi	sp, sp, -32
8000257a: 06 ec        	sd	ra, 24(sp)
8000257c: 2a e8        	sd	a0, 16(sp)
8000257e: 08 61        	ld	a0, 0(a0)
80002580: 97 00 00 00  	auipc	ra, 0
80002584: e7 80 60 f7  	jalr	-138(ra)
80002588: 2a e4        	sd	a0, 8(sp)
8000258a: 09 a0        	j	2 <_ZN6kernel4lock8spinlock22SpinlockGuard$LT$T$GT$7holding17hf2abf25ec93b0ec9E+0x14>
8000258c: 22 65        	ld	a0, 8(sp)
8000258e: e2 60        	ld	ra, 24(sp)
80002590: 05 61        	addi	sp, sp, 32
80002592: 82 80        	ret

Disassembly of section .text._ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h70156d593a711dfdE:

0000000080002594 <_ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h70156d593a711dfdE>:
80002594: 01 11        	addi	sp, sp, -32
80002596: 06 ec        	sd	ra, 24(sp)
80002598: 2a e8        	sd	a0, 16(sp)
8000259a: 08 61        	ld	a0, 0(a0)
8000259c: 13 05 05 02  	addi	a0, a0, 32
800025a0: 97 90 00 00  	auipc	ra, 9
800025a4: e7 80 a0 f8  	jalr	-118(ra)
800025a8: 2a e4        	sd	a0, 8(sp)
800025aa: 09 a0        	j	2 <_ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h70156d593a711dfdE+0x18>
800025ac: 22 65        	ld	a0, 8(sp)
800025ae: e2 60        	ld	ra, 24(sp)
800025b0: 05 61        	addi	sp, sp, 32
800025b2: 82 80        	ret

Disassembly of section .text._ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc21c79973476a140E:

00000000800025b4 <_ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc21c79973476a140E>:
800025b4: 01 11        	addi	sp, sp, -32
800025b6: 06 ec        	sd	ra, 24(sp)
800025b8: 2a e8        	sd	a0, 16(sp)
800025ba: 08 61        	ld	a0, 0(a0)
800025bc: 13 05 05 02  	addi	a0, a0, 32
800025c0: 97 00 00 00  	auipc	ra, 0
800025c4: e7 80 20 1b  	jalr	434(ra)
800025c8: 2a e4        	sd	a0, 8(sp)
800025ca: 09 a0        	j	2 <_ZN90_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc21c79973476a140E+0x18>
800025cc: 22 65        	ld	a0, 8(sp)
800025ce: e2 60        	ld	ra, 24(sp)
800025d0: 05 61        	addi	sp, sp, 32
800025d2: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h3363570feab30f66E:

00000000800025d4 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h3363570feab30f66E>:
800025d4: 01 11        	addi	sp, sp, -32
800025d6: 06 ec        	sd	ra, 24(sp)
800025d8: 2a e8        	sd	a0, 16(sp)
800025da: 08 61        	ld	a0, 0(a0)
800025dc: 13 05 05 02  	addi	a0, a0, 32
800025e0: 97 00 00 00  	auipc	ra, 0
800025e4: e7 80 a0 1a  	jalr	426(ra)
800025e8: 2a e4        	sd	a0, 8(sp)
800025ea: 09 a0        	j	2 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h3363570feab30f66E+0x18>
800025ec: 22 65        	ld	a0, 8(sp)
800025ee: e2 60        	ld	ra, 24(sp)
800025f0: 05 61        	addi	sp, sp, 32
800025f2: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h79e676cd655de589E:

00000000800025f4 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h79e676cd655de589E>:
800025f4: 01 11        	addi	sp, sp, -32
800025f6: 06 ec        	sd	ra, 24(sp)
800025f8: 2a e8        	sd	a0, 16(sp)
800025fa: 08 61        	ld	a0, 0(a0)
800025fc: 13 05 05 02  	addi	a0, a0, 32
80002600: 97 90 00 00  	auipc	ra, 9
80002604: e7 80 a0 f2  	jalr	-214(ra)
80002608: 2a e4        	sd	a0, 8(sp)
8000260a: 09 a0        	j	2 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h79e676cd655de589E+0x18>
8000260c: 22 65        	ld	a0, 8(sp)
8000260e: e2 60        	ld	ra, 24(sp)
80002610: 05 61        	addi	sp, sp, 32
80002612: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h8be809117bed8583E:

0000000080002614 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h8be809117bed8583E>:
80002614: 01 11        	addi	sp, sp, -32
80002616: 06 ec        	sd	ra, 24(sp)
80002618: 2a e8        	sd	a0, 16(sp)
8000261a: 08 61        	ld	a0, 0(a0)
8000261c: 13 05 05 02  	addi	a0, a0, 32
80002620: 97 00 00 00  	auipc	ra, 0
80002624: e7 80 20 15  	jalr	338(ra)
80002628: 2a e4        	sd	a0, 8(sp)
8000262a: 09 a0        	j	2 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h8be809117bed8583E+0x18>
8000262c: 22 65        	ld	a0, 8(sp)
8000262e: e2 60        	ld	ra, 24(sp)
80002630: 05 61        	addi	sp, sp, 32
80002632: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17ha069b782a14ed5a6E:

0000000080002634 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17ha069b782a14ed5a6E>:
80002634: 01 11        	addi	sp, sp, -32
80002636: 06 ec        	sd	ra, 24(sp)
80002638: 2a e8        	sd	a0, 16(sp)
8000263a: 08 61        	ld	a0, 0(a0)
8000263c: 13 05 05 02  	addi	a0, a0, 32
80002640: 97 00 00 00  	auipc	ra, 0
80002644: e7 80 20 14  	jalr	322(ra)
80002648: 2a e4        	sd	a0, 8(sp)
8000264a: 09 a0        	j	2 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17ha069b782a14ed5a6E+0x18>
8000264c: 22 65        	ld	a0, 8(sp)
8000264e: e2 60        	ld	ra, 24(sp)
80002650: 05 61        	addi	sp, sp, 32
80002652: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17hce96157f4f17e518E:

0000000080002654 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17hce96157f4f17e518E>:
80002654: 01 11        	addi	sp, sp, -32
80002656: 06 ec        	sd	ra, 24(sp)
80002658: 2a e8        	sd	a0, 16(sp)
8000265a: 08 61        	ld	a0, 0(a0)
8000265c: 13 05 05 02  	addi	a0, a0, 32
80002660: 97 00 00 00  	auipc	ra, 0
80002664: e7 80 a0 11  	jalr	282(ra)
80002668: 2a e4        	sd	a0, 8(sp)
8000266a: 09 a0        	j	2 <_ZN93_$LT$kernel..lock..spinlock..SpinlockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17hce96157f4f17e518E+0x18>
8000266c: 22 65        	ld	a0, 8(sp)
8000266e: e2 60        	ld	ra, 24(sp)
80002670: 05 61        	addi	sp, sp, 32
80002672: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$3get17h46ca5d0ecb8a1c32E:

0000000080002674 <_ZN4core4cell13Cell$LT$T$GT$3get17h46ca5d0ecb8a1c32E>:
80002674: 01 11        	addi	sp, sp, -32
80002676: 06 ec        	sd	ra, 24(sp)
80002678: 2a e8        	sd	a0, 16(sp)
8000267a: 97 00 00 00  	auipc	ra, 0
8000267e: e7 80 80 11  	jalr	280(ra)
80002682: 2a e4        	sd	a0, 8(sp)
80002684: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3get17h46ca5d0ecb8a1c32E+0x12>
80002686: 22 65        	ld	a0, 8(sp)
80002688: 08 61        	ld	a0, 0(a0)
8000268a: e2 60        	ld	ra, 24(sp)
8000268c: 05 61        	addi	sp, sp, 32
8000268e: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$3get17h632b974e811b21edE:

0000000080002690 <_ZN4core4cell13Cell$LT$T$GT$3get17h632b974e811b21edE>:
80002690: 01 11        	addi	sp, sp, -32
80002692: 06 ec        	sd	ra, 24(sp)
80002694: 2a e8        	sd	a0, 16(sp)
80002696: 97 00 00 00  	auipc	ra, 0
8000269a: e7 80 40 0d  	jalr	212(ra)
8000269e: 2a e4        	sd	a0, 8(sp)
800026a0: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3get17h632b974e811b21edE+0x12>
800026a2: 22 65        	ld	a0, 8(sp)
800026a4: 03 45 05 00  	lbu	a0, 0(a0)
800026a8: e2 60        	ld	ra, 24(sp)
800026aa: 05 61        	addi	sp, sp, 32
800026ac: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$3set17h35b0a5fc63d1ee05E:

00000000800026ae <_ZN4core4cell13Cell$LT$T$GT$3set17h35b0a5fc63d1ee05E>:
800026ae: 79 71        	addi	sp, sp, -48
800026b0: 06 f4        	sd	ra, 40(sp)
800026b2: 2e 86        	add	a2, zero, a1
800026b4: 2a ec        	sd	a0, 24(sp)
800026b6: 23 03 b1 02  	sb	a1, 38(sp)
800026ba: 32 e8        	sd	a2, 16(sp)
800026bc: 97 00 00 00  	auipc	ra, 0
800026c0: e7 80 c0 07  	jalr	124(ra)
800026c4: aa 85        	add	a1, zero, a0
800026c6: a3 03 a1 02  	sb	a0, 39(sp)
800026ca: 2e e4        	sd	a1, 8(sp)
800026cc: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3set17h35b0a5fc63d1ee05E+0x20>
800026ce: 22 65        	ld	a0, 8(sp)
800026d0: 97 f0 ff ff  	auipc	ra, 1048575
800026d4: e7 80 a0 0a  	jalr	170(ra)
800026d8: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3set17h35b0a5fc63d1ee05E+0x2c>
800026da: a2 70        	ld	ra, 40(sp)
800026dc: 45 61        	addi	sp, sp, 48
800026de: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$3set17hcf324f21bf472f2fE:

00000000800026e0 <_ZN4core4cell13Cell$LT$T$GT$3set17hcf324f21bf472f2fE>:
800026e0: 79 71        	addi	sp, sp, -48
800026e2: 06 f4        	sd	ra, 40(sp)
800026e4: 2a e8        	sd	a0, 16(sp)
800026e6: 2e ec        	sd	a1, 24(sp)
800026e8: 97 00 00 00  	auipc	ra, 0
800026ec: e7 80 20 02  	jalr	34(ra)
800026f0: aa 85        	add	a1, zero, a0
800026f2: 2a f0        	sd	a0, 32(sp)
800026f4: 2e e4        	sd	a1, 8(sp)
800026f6: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3set17hcf324f21bf472f2fE+0x18>
800026f8: 22 65        	ld	a0, 8(sp)
800026fa: 97 f0 ff ff  	auipc	ra, 1048575
800026fe: e7 80 40 01  	jalr	20(ra)
80002702: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$3set17hcf324f21bf472f2fE+0x24>
80002704: a2 70        	ld	ra, 40(sp)
80002706: 45 61        	addi	sp, sp, 48
80002708: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$7replace17h81393aad1649a492E:

000000008000270a <_ZN4core4cell13Cell$LT$T$GT$7replace17h81393aad1649a492E>:
8000270a: 79 71        	addi	sp, sp, -48
8000270c: 06 f4        	sd	ra, 40(sp)
8000270e: 2a ec        	sd	a0, 24(sp)
80002710: 2e f0        	sd	a1, 32(sp)
80002712: 2e e8        	sd	a1, 16(sp)
80002714: 97 00 00 00  	auipc	ra, 0
80002718: e7 80 e0 07  	jalr	126(ra)
8000271c: 2a e4        	sd	a0, 8(sp)
8000271e: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$7replace17h81393aad1649a492E+0x16>
80002720: 22 65        	ld	a0, 8(sp)
80002722: c2 65        	ld	a1, 16(sp)
80002724: 97 f0 ff ff  	auipc	ra, 1048575
80002728: e7 80 60 11  	jalr	278(ra)
8000272c: 2a e0        	sd	a0, 0(sp)
8000272e: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$7replace17h81393aad1649a492E+0x26>
80002730: 02 65        	ld	a0, 0(sp)
80002732: a2 70        	ld	ra, 40(sp)
80002734: 45 61        	addi	sp, sp, 48
80002736: 82 80        	ret

Disassembly of section .text._ZN4core4cell13Cell$LT$T$GT$7replace17hf368cc60be9ccb9aE:

0000000080002738 <_ZN4core4cell13Cell$LT$T$GT$7replace17hf368cc60be9ccb9aE>:
80002738: 79 71        	addi	sp, sp, -48
8000273a: 06 f4        	sd	ra, 40(sp)
8000273c: 2e 86        	add	a2, zero, a1
8000273e: 2a ec        	sd	a0, 24(sp)
80002740: a3 03 b1 02  	sb	a1, 39(sp)
80002744: 32 e8        	sd	a2, 16(sp)
80002746: 97 00 00 00  	auipc	ra, 0
8000274a: e7 80 40 02  	jalr	36(ra)
8000274e: 2a e4        	sd	a0, 8(sp)
80002750: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$7replace17hf368cc60be9ccb9aE+0x1a>
80002752: 22 65        	ld	a0, 8(sp)
80002754: c2 65        	ld	a1, 16(sp)
80002756: 97 f0 ff ff  	auipc	ra, 1048575
8000275a: e7 80 c0 11  	jalr	284(ra)
8000275e: 2a e0        	sd	a0, 0(sp)
80002760: 09 a0        	j	2 <_ZN4core4cell13Cell$LT$T$GT$7replace17hf368cc60be9ccb9aE+0x2a>
80002762: 02 65        	ld	a0, 0(sp)
80002764: a2 70        	ld	ra, 40(sp)
80002766: 45 61        	addi	sp, sp, 48
80002768: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h5528df6b6938ccf8E:

000000008000276a <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h5528df6b6938ccf8E>:
8000276a: 41 11        	addi	sp, sp, -16
8000276c: 2a e4        	sd	a0, 8(sp)
8000276e: 41 01        	addi	sp, sp, 16
80002770: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h732fc424f19d9727E:

0000000080002772 <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h732fc424f19d9727E>:
80002772: 41 11        	addi	sp, sp, -16
80002774: 2a e4        	sd	a0, 8(sp)
80002776: 41 01        	addi	sp, sp, 16
80002778: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h74ef35078d7f0532E:

000000008000277a <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h74ef35078d7f0532E>:
8000277a: 41 11        	addi	sp, sp, -16
8000277c: 2a e4        	sd	a0, 8(sp)
8000277e: 41 01        	addi	sp, sp, 16
80002780: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h7fdeefa80de52215E:

0000000080002782 <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h7fdeefa80de52215E>:
80002782: 41 11        	addi	sp, sp, -16
80002784: 2a e4        	sd	a0, 8(sp)
80002786: 41 01        	addi	sp, sp, 16
80002788: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h9abe014859740e96E:

000000008000278a <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h9abe014859740e96E>:
8000278a: 41 11        	addi	sp, sp, -16
8000278c: 2a e4        	sd	a0, 8(sp)
8000278e: 41 01        	addi	sp, sp, 16
80002790: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17hb0db873f250b9ac1E:

0000000080002792 <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17hb0db873f250b9ac1E>:
80002792: 41 11        	addi	sp, sp, -16
80002794: 2a e4        	sd	a0, 8(sp)
80002796: 41 01        	addi	sp, sp, 16
80002798: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17hc1d83b6a04aff71dE:

000000008000279a <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17hc1d83b6a04aff71dE>:
8000279a: 41 11        	addi	sp, sp, -16
8000279c: 2a e4        	sd	a0, 8(sp)
8000279e: 41 01        	addi	sp, sp, 16
800027a0: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17hfcc9a5baf2547ab0E:

00000000800027a2 <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17hfcc9a5baf2547ab0E>:
800027a2: 41 11        	addi	sp, sp, -16
800027a4: 2a e4        	sd	a0, 8(sp)
800027a6: 41 01        	addi	sp, sp, 16
800027a8: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$7get_mut17hd02b87147e080625E:

00000000800027aa <_ZN4core4cell19UnsafeCell$LT$T$GT$7get_mut17hd02b87147e080625E>:
800027aa: 41 11        	addi	sp, sp, -16
800027ac: 2a e4        	sd	a0, 8(sp)
800027ae: 41 01        	addi	sp, sp, 16
800027b0: 82 80        	ret

Disassembly of section .text._ZN6kernel7process3cpu5cpuid17hc324ef3cf6c298e0E:

00000000800027b2 <_ZN6kernel7process3cpu5cpuid17hc324ef3cf6c298e0E>:
800027b2: 01 11        	addi	sp, sp, -32
800027b4: 06 ec        	sd	ra, 24(sp)
800027b6: 97 20 00 00  	auipc	ra, 2
800027ba: e7 80 a0 ba  	jalr	-1110(ra)
800027be: aa 85        	add	a1, zero, a0
800027c0: 2a e8        	sd	a0, 16(sp)
800027c2: 2e e4        	sd	a1, 8(sp)
800027c4: 09 a0        	j	2 <_ZN6kernel7process3cpu5cpuid17hc324ef3cf6c298e0E+0x14>
800027c6: 22 65        	ld	a0, 8(sp)
800027c8: e2 60        	ld	ra, 24(sp)
800027ca: 05 61        	addi	sp, sp, 32
800027cc: 82 80        	ret

Disassembly of section .text._ZN6kernel7process3cpu10CPUManager5mycpu17hdfcccc913bb3c4a1E:

00000000800027ce <_ZN6kernel7process3cpu10CPUManager5mycpu17hdfcccc913bb3c4a1E>:
800027ce: 79 71        	addi	sp, sp, -48
800027d0: 06 f4        	sd	ra, 40(sp)
800027d2: 2a ec        	sd	a0, 24(sp)
800027d4: 2a e8        	sd	a0, 16(sp)
800027d6: 97 00 00 00  	auipc	ra, 0
800027da: e7 80 c0 fd  	jalr	-36(ra)
800027de: aa 85        	add	a1, zero, a0
800027e0: 2a f0        	sd	a0, 32(sp)
800027e2: 2e e4        	sd	a1, 8(sp)
800027e4: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager5mycpu17hdfcccc913bb3c4a1E+0x18>
800027e6: 1d 45        	addi	a0, zero, 7
800027e8: a2 65        	ld	a1, 8(sp)
800027ea: 63 6d b5 00  	bltu	a0, a1, 26 <.LBB1_4>
800027ee: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager5mycpu17hdfcccc913bb3c4a1E+0x22>
800027f0: 13 05 80 08  	addi	a0, zero, 136
800027f4: a2 65        	ld	a1, 8(sp)
800027f6: 33 85 a5 02  	<unknown>
800027fa: 42 66        	ld	a2, 16(sp)
800027fc: 32 95        	add	a0, a0, a2
800027fe: a2 70        	ld	ra, 40(sp)
80002800: 45 61        	addi	sp, sp, 48
80002802: 82 80        	ret

0000000080002804 <.LBB1_4>:
80002804: 17 b6 00 00  	auipc	a2, 11
80002808: 13 06 46 17  	addi	a2, a2, 372
8000280c: a1 45        	addi	a1, zero, 8
8000280e: 22 65        	ld	a0, 8(sp)
80002810: 97 90 00 00  	auipc	ra, 9
80002814: e7 80 60 f5  	jalr	-170(ra)
80002818: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process3cpu10CPUManager6myproc17h7f043a6faad5feaaE:

000000008000281a <_ZN6kernel7process3cpu10CPUManager6myproc17h7f043a6faad5feaaE>:
8000281a: 39 71        	addi	sp, sp, -64
8000281c: 06 fc        	sd	ra, 56(sp)
8000281e: 2a ec        	sd	a0, 24(sp)
80002820: 97 00 00 00  	auipc	ra, 0
80002824: e7 80 00 21  	jalr	528(ra)
80002828: 09 a0        	j	2 <.LBB2_9>

000000008000282a <.LBB2_9>:
8000282a: 17 45 02 00  	auipc	a0, 36
8000282e: 13 05 65 7d  	addi	a0, a0, 2006
80002832: 97 00 00 00  	auipc	ra, 0
80002836: e7 80 c0 f9  	jalr	-100(ra)
8000283a: aa 85        	add	a1, zero, a0
8000283c: 2a f0        	sd	a0, 32(sp)
8000283e: 2e e4        	sd	a1, 8(sp)
80002840: 09 a0        	j	2 <.LBB2_9+0x18>
80002842: 22 65        	ld	a0, 8(sp)
80002844: 0c 61        	ld	a1, 0(a0)
80002846: 01 46        	mv	a2, zero
80002848: 63 98 c5 00  	bne	a1, a2, 16 <.LBB2_9+0x2e>
8000284c: 09 a0        	j	2 <.LBB2_9+0x24>
8000284e: 97 00 00 00  	auipc	ra, 0
80002852: e7 80 60 26  	jalr	614(ra)
80002856: 2d a0        	j	42 <.LBB2_9+0x56>
80002858: 22 65        	ld	a0, 8(sp)
8000285a: 0c 61        	ld	a1, 0(a0)
8000285c: 2e f4        	sd	a1, 40(sp)
8000285e: 2e 85        	add	a0, zero, a1
80002860: 97 00 00 00  	auipc	ra, 0
80002864: e7 80 60 4d  	jalr	1238(ra)
80002868: 2a e0        	sd	a0, 0(sp)
8000286a: 09 a0        	j	2 <.LBB2_9+0x42>
8000286c: 02 65        	ld	a0, 0(sp)
8000286e: 2a f8        	sd	a0, 48(sp)
80002870: 97 00 00 00  	auipc	ra, 0
80002874: e7 80 40 24  	jalr	580(ra)
80002878: 09 a0        	j	2 <.LBB2_9+0x50>
8000287a: 02 65        	ld	a0, 0(sp)
8000287c: 2a e8        	sd	a0, 16(sp)
8000287e: 21 a0        	j	8 <.LBB2_9+0x5c>
80002880: 01 45        	mv	a0, zero
80002882: 2a e8        	sd	a0, 16(sp)
80002884: 09 a0        	j	2 <.LBB2_9+0x5c>
80002886: 42 65        	ld	a0, 16(sp)
80002888: e2 70        	ld	ra, 56(sp)
8000288a: 21 61        	addi	sp, sp, 64
8000288c: 82 80        	ret

Disassembly of section .text._ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E:

000000008000288e <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E>:
8000288e: 5d 71        	addi	sp, sp, -80
80002890: 86 e4        	sd	ra, 72(sp)
80002892: 2a fc        	sd	a0, 56(sp)
80002894: 97 00 00 00  	auipc	ra, 0
80002898: e7 80 60 f8  	jalr	-122(ra)
8000289c: 2a f4        	sd	a0, 40(sp)
8000289e: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E+0x12>
800028a0: 22 75        	ld	a0, 40(sp)
800028a2: 81 45        	mv	a1, zero
800028a4: 63 14 b5 00  	bne	a0, a1, 8 <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E+0x1e>
800028a8: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E+0x1c>
800028aa: 85 a8        	j	112 <.LBB3_14+0x48>
800028ac: 22 75        	ld	a0, 40(sp)
800028ae: aa e0        	sd	a0, 64(sp)
800028b0: 2a ec        	sd	a0, 24(sp)
800028b2: 97 f0 ff ff  	auipc	ra, 1048575
800028b6: e7 80 e0 28  	jalr	654(ra)
800028ba: 2a f8        	sd	a0, 48(sp)
800028bc: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E+0x30>
800028be: 08 18        	addi	a0, sp, 48
800028c0: 97 00 00 00  	auipc	ra, 0
800028c4: e7 80 40 cf  	jalr	-780(ra)
800028c8: 2a e8        	sd	a0, 16(sp)
800028ca: 09 a0        	j	2 <_ZN6kernel7process3cpu10CPUManager10yield_proc17h2d6f59a8e06b6e55E+0x3e>
800028cc: 42 65        	ld	a0, 16(sp)
800028ce: 13 05 05 02  	addi	a0, a0, 32

00000000800028d2 <.LBB3_14>:
800028d2: 97 b5 00 00  	auipc	a1, 11
800028d6: 93 85 e5 0b  	addi	a1, a1, 190
800028da: 97 60 00 00  	auipc	ra, 6
800028de: e7 80 20 9f  	jalr	-1550(ra)
800028e2: 2a e4        	sd	a0, 8(sp)
800028e4: 09 a0        	j	2 <.LBB3_14+0x14>
800028e6: 01 45        	mv	a0, zero
800028e8: a2 65        	ld	a1, 8(sp)
800028ea: 63 89 a5 00  	beq	a1, a0, 18 <.LBB3_14+0x2a>
800028ee: 09 a0        	j	2 <.LBB3_14+0x1e>
800028f0: 42 75        	ld	a0, 48(sp)
800028f2: 97 f0 ff ff  	auipc	ra, 1048575
800028f6: e7 80 60 e2  	jalr	-474(ra)
800028fa: 39 a0        	j	14 <.LBB3_14+0x36>
800028fc: 42 75        	ld	a0, 48(sp)
800028fe: 97 f0 ff ff  	auipc	ra, 1048575
80002902: e7 80 a0 e1  	jalr	-486(ra)
80002906: 01 a8        	j	16 <.LBB3_14+0x44>
80002908: 62 65        	ld	a0, 24(sp)
8000290a: 97 60 00 00  	auipc	ra, 6
8000290e: e7 80 60 92  	jalr	-1754(ra)
80002912: 09 a0        	j	2 <.LBB3_14+0x42>
80002914: 11 a0        	j	4 <.LBB3_14+0x46>
80002916: 09 a0        	j	2 <.LBB3_14+0x46>
80002918: 09 a0        	j	2 <.LBB3_14+0x48>
8000291a: a6 60        	ld	ra, 72(sp)
8000291c: 61 61        	addi	sp, sp, 80
8000291e: 82 80        	ret

Disassembly of section .text._ZN6kernel7process3cpu3CPU5sched17h2e7b799e9390ebaaE:

0000000080002920 <_ZN6kernel7process3cpu3CPU5sched17h2e7b799e9390ebaaE>:
80002920: 1d 71        	addi	sp, sp, -96
80002922: 86 ec        	sd	ra, 88(sp)
80002924: 2e fc        	sd	a1, 56(sp)
80002926: aa e0        	sd	a0, 64(sp)
80002928: b2 e4        	sd	a2, 72(sp)
8000292a: 2c 18        	addi	a1, sp, 56
8000292c: 2a f8        	sd	a0, 48(sp)
8000292e: 2e 85        	add	a0, zero, a1
80002930: 32 f4        	sd	a2, 40(sp)
80002932: 97 00 00 00  	auipc	ra, 0
80002936: e7 80 60 c4  	jalr	-954(ra)
8000293a: 2a f0        	sd	a0, 32(sp)
8000293c: 09 a0        	j	2 <_ZN6kernel7process3cpu3CPU5sched17h2e7b799e9390ebaaE+0x1e>
8000293e: 02 75        	ld	a0, 32(sp)
80002940: 05 e1        	bnez	a0, 32 <.LBB4_15+0x14>
80002942: 09 a0        	j	2 <.LBB4_14>

0000000080002944 <.LBB4_14>:
80002944: 17 b5 00 00  	auipc	a0, 11
80002948: 13 05 d5 04  	addi	a0, a0, 77

000000008000294c <.LBB4_15>:
8000294c: 17 b6 00 00  	auipc	a2, 11
80002950: 13 06 46 06  	addi	a2, a2, 100
80002954: f9 45        	addi	a1, zero, 30
80002956: 97 90 00 00  	auipc	ra, 9
8000295a: e7 80 40 de  	jalr	-540(ra)
8000295e: 00 00        	unimp	
80002960: 42 75        	ld	a0, 48(sp)
80002962: 2c 7d        	ld	a1, 120(a0)
80002964: 05 46        	addi	a2, zero, 1
80002966: 63 81 c5 02  	beq	a1, a2, 34 <.LBB4_17+0x14>
8000296a: 09 a0        	j	2 <.LBB4_16>

000000008000296c <.LBB4_16>:
8000296c: 17 b5 00 00  	auipc	a0, 11
80002970: 13 05 c5 05  	addi	a0, a0, 92

0000000080002974 <.LBB4_17>:
80002974: 17 b6 00 00  	auipc	a2, 11
80002978: 13 06 46 07  	addi	a2, a2, 116
8000297c: f9 45        	addi	a1, zero, 30
8000297e: 97 90 00 00  	auipc	ra, 9
80002982: e7 80 c0 db  	jalr	-580(ra)
80002986: 00 00        	unimp	
80002988: 28 18        	addi	a0, sp, 56
8000298a: 97 00 00 00  	auipc	ra, 0
8000298e: e7 80 a0 c2  	jalr	-982(ra)
80002992: 2a ec        	sd	a0, 24(sp)
80002994: 09 a0        	j	2 <.LBB4_17+0x22>
80002996: 62 65        	ld	a0, 24(sp)
80002998: 13 05 05 02  	addi	a0, a0, 32

000000008000299c <.LBB4_18>:
8000299c: 97 b5 00 00  	auipc	a1, 11
800029a0: 93 85 45 ff  	addi	a1, a1, -12
800029a4: 97 60 00 00  	auipc	ra, 6
800029a8: e7 80 80 92  	jalr	-1752(ra)
800029ac: 2a e8        	sd	a0, 16(sp)
800029ae: 09 a0        	j	2 <.LBB4_18+0x14>
800029b0: 01 45        	mv	a0, zero
800029b2: c2 65        	ld	a1, 16(sp)
800029b4: 63 81 a5 02  	beq	a1, a0, 34 <.LBB4_20+0x14>
800029b8: 09 a0        	j	2 <.LBB4_19>

00000000800029ba <.LBB4_19>:
800029ba: 17 b5 00 00  	auipc	a0, 11
800029be: 13 05 65 04  	addi	a0, a0, 70

00000000800029c2 <.LBB4_20>:
800029c2: 17 b6 00 00  	auipc	a2, 11
800029c6: 13 06 66 05  	addi	a2, a2, 86
800029ca: d9 45        	addi	a1, zero, 22
800029cc: 97 90 00 00  	auipc	ra, 9
800029d0: e7 80 e0 d6  	jalr	-658(ra)
800029d4: 00 00        	unimp	
800029d6: 97 60 00 00  	auipc	ra, 6
800029da: e7 80 80 9a  	jalr	-1624(ra)
800029de: 2a e4        	sd	a0, 8(sp)
800029e0: 09 a0        	j	2 <.LBB4_20+0x20>
800029e2: 01 45        	mv	a0, zero
800029e4: a2 65        	ld	a1, 8(sp)
800029e6: 63 81 a5 02  	beq	a1, a0, 34 <.LBB4_22+0x14>
800029ea: 09 a0        	j	2 <.LBB4_21>

00000000800029ec <.LBB4_21>:
800029ec: 17 b5 00 00  	auipc	a0, 11
800029f0: 13 05 45 04  	addi	a0, a0, 68

00000000800029f4 <.LBB4_22>:
800029f4: 17 b6 00 00  	auipc	a2, 11
800029f8: 13 06 46 05  	addi	a2, a2, 84
800029fc: d1 45        	addi	a1, zero, 20
800029fe: 97 90 00 00  	auipc	ra, 9
80002a02: e7 80 c0 d3  	jalr	-708(ra)
80002a06: 00 00        	unimp	
80002a08: 42 75        	ld	a0, 48(sp)
80002a0a: 4c 61        	ld	a1, 128(a0)
80002a0c: ae e8        	sd	a1, 80(sp)
80002a0e: 13 06 85 00  	addi	a2, a0, 8
80002a12: 22 75        	ld	a0, 40(sp)
80002a14: 2e e0        	sd	a1, 0(sp)
80002a16: b2 85        	add	a1, zero, a2
80002a18: 97 e0 ff ff  	auipc	ra, 1048574
80002a1c: e7 80 a0 6f  	jalr	1786(ra)
80002a20: 09 a0        	j	2 <.LBB4_22+0x2e>
80002a22: 02 65        	ld	a0, 0(sp)
80002a24: c2 75        	ld	a1, 48(sp)
80002a26: c8 e1        	sd	a0, 128(a1)
80002a28: 62 75        	ld	a0, 56(sp)
80002a2a: e6 60        	ld	ra, 88(sp)
80002a2c: 25 61        	addi	sp, sp, 96
80002a2e: 82 80        	ret

Disassembly of section .text._ZN6kernel7process3cpu8push_off17ha5da86eb317b4c8aE:

0000000080002a30 <_ZN6kernel7process3cpu8push_off17ha5da86eb317b4c8aE>:
80002a30: 79 71        	addi	sp, sp, -48
80002a32: 06 f4        	sd	ra, 40(sp)
80002a34: 97 60 00 00  	auipc	ra, 6
80002a38: e7 80 a0 94  	jalr	-1718(ra)
80002a3c: 2a e8        	sd	a0, 16(sp)
80002a3e: 09 a0        	j	2 <_ZN6kernel7process3cpu8push_off17ha5da86eb317b4c8aE+0x10>
80002a40: 42 65        	ld	a0, 16(sp)
80002a42: a3 0f a1 00  	sb	a0, 31(sp)
80002a46: 97 60 00 00  	auipc	ra, 6
80002a4a: e7 80 40 91  	jalr	-1772(ra)
80002a4e: 09 a0        	j	2 <.LBB5_9>

0000000080002a50 <.LBB5_9>:
80002a50: 17 45 02 00  	auipc	a0, 36
80002a54: 13 05 05 5b  	addi	a0, a0, 1456
80002a58: 97 00 00 00  	auipc	ra, 0
80002a5c: e7 80 60 d7  	jalr	-650(ra)
80002a60: 2a e4        	sd	a0, 8(sp)
80002a62: 09 a0        	j	2 <.LBB5_9+0x14>
80002a64: 22 65        	ld	a0, 8(sp)
80002a66: 2a f0        	sd	a0, 32(sp)
80002a68: 2c 7d        	ld	a1, 120(a0)
80002a6a: 01 46        	mv	a2, zero
80002a6c: 63 97 c5 00  	bne	a1, a2, 14 <.LBB5_9+0x2a>
80002a70: 09 a0        	j	2 <.LBB5_9+0x22>
80002a72: 42 65        	ld	a0, 16(sp)
80002a74: a2 65        	ld	a1, 8(sp)
80002a76: c8 e1        	sd	a0, 128(a1)
80002a78: 11 a0        	j	4 <.LBB5_9+0x2c>
80002a7a: 09 a0        	j	2 <.LBB5_9+0x2c>
80002a7c: 22 65        	ld	a0, 8(sp)
80002a7e: 2c 7d        	ld	a1, 120(a0)
80002a80: 13 86 15 00  	addi	a2, a1, 1
80002a84: 32 e0        	sd	a2, 0(sp)
80002a86: 63 69 b6 00  	bltu	a2, a1, 18 <.LBB5_10>
80002a8a: 09 a0        	j	2 <.LBB5_9+0x3c>
80002a8c: 02 65        	ld	a0, 0(sp)
80002a8e: a2 65        	ld	a1, 8(sp)
80002a90: a8 fd        	sd	a0, 120(a1)
80002a92: a2 70        	ld	ra, 40(sp)
80002a94: 45 61        	addi	sp, sp, 48
80002a96: 82 80        	ret

0000000080002a98 <.LBB5_10>:
80002a98: 17 b5 00 00  	auipc	a0, 11
80002a9c: 13 05 85 fe  	addi	a0, a0, -24

0000000080002aa0 <.LBB5_11>:
80002aa0: 17 b6 00 00  	auipc	a2, 11
80002aa4: 13 06 06 fc  	addi	a2, a2, -64
80002aa8: f1 45        	addi	a1, zero, 28
80002aaa: 97 90 00 00  	auipc	ra, 9
80002aae: e7 80 00 c9  	jalr	-880(ra)
80002ab2: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process3cpu7pop_off17he6261d52dad11cadE:

0000000080002ab4 <_ZN6kernel7process3cpu7pop_off17he6261d52dad11cadE>:
80002ab4: 5d 71        	addi	sp, sp, -80
80002ab6: 86 e4        	sd	ra, 72(sp)
80002ab8: 97 60 00 00  	auipc	ra, 6
80002abc: e7 80 60 8c  	jalr	-1850(ra)
80002ac0: 2a ec        	sd	a0, 24(sp)
80002ac2: 09 a0        	j	2 <_ZN6kernel7process3cpu7pop_off17he6261d52dad11cadE+0x10>
80002ac4: 01 45        	mv	a0, zero
80002ac6: e2 65        	ld	a1, 24(sp)
80002ac8: 63 81 a5 02  	beq	a1, a0, 34 <.LBB6_21>
80002acc: 09 a0        	j	2 <.LBB6_19>

0000000080002ace <.LBB6_19>:
80002ace: 17 b5 00 00  	auipc	a0, 11
80002ad2: 13 05 e5 fc  	addi	a0, a0, -50

0000000080002ad6 <.LBB6_20>:
80002ad6: 17 b6 00 00  	auipc	a2, 11
80002ada: 13 06 26 fe  	addi	a2, a2, -30
80002ade: e1 45        	addi	a1, zero, 24
80002ae0: 97 90 00 00  	auipc	ra, 9
80002ae4: e7 80 a0 c5  	jalr	-934(ra)
80002ae8: 00 00        	unimp	

0000000080002aea <.LBB6_21>:
80002aea: 17 45 02 00  	auipc	a0, 36
80002aee: 13 05 65 51  	addi	a0, a0, 1302
80002af2: 97 00 00 00  	auipc	ra, 0
80002af6: e7 80 c0 cd  	jalr	-804(ra)
80002afa: 2a e8        	sd	a0, 16(sp)
80002afc: 09 a0        	j	2 <.LBB6_21+0x14>
80002afe: 42 65        	ld	a0, 16(sp)
80002b00: aa e0        	sd	a0, 64(sp)
80002b02: 28 7d        	ld	a0, 120(a0)
80002b04: 85 45        	addi	a1, zero, 1
80002b06: 97 00 00 00  	auipc	ra, 0
80002b0a: e7 80 c0 0b  	jalr	188(ra)
80002b0e: 2a f4        	sd	a0, 40(sp)
80002b10: 2e f8        	sd	a1, 48(sp)
80002b12: 09 a0        	j	2 <.LBB6_21+0x2a>
80002b14: 28 10        	addi	a0, sp, 40
80002b16: 97 10 00 00  	auipc	ra, 1
80002b1a: e7 80 80 6d  	jalr	1752(ra)
80002b1e: 2a e4        	sd	a0, 8(sp)
80002b20: 09 a0        	j	2 <.LBB6_21+0x38>
80002b22: 01 45        	mv	a0, zero
80002b24: a2 65        	ld	a1, 8(sp)
80002b26: 63 81 a5 02  	beq	a1, a0, 34 <.LBB6_23+0x14>
80002b2a: 09 a0        	j	2 <.LBB6_22>

0000000080002b2c <.LBB6_22>:
80002b2c: 17 b5 00 00  	auipc	a0, 11
80002b30: 13 05 45 fa  	addi	a0, a0, -92

0000000080002b34 <.LBB6_23>:
80002b34: 17 b6 00 00  	auipc	a2, 11
80002b38: 13 06 c6 fb  	addi	a2, a2, -68
80002b3c: e9 45        	addi	a1, zero, 26
80002b3e: 97 90 00 00  	auipc	ra, 9
80002b42: e7 80 c0 bf  	jalr	-1028(ra)
80002b46: 00 00        	unimp	
80002b48: 42 65        	ld	a0, 16(sp)
80002b4a: 2c 7d        	ld	a1, 120(a0)
80002b4c: 13 86 f5 ff  	addi	a2, a1, -1
80002b50: 32 e0        	sd	a2, 0(sp)
80002b52: 63 e9 c5 04  	bltu	a1, a2, 82 <.LBB6_24>
80002b56: 09 a0        	j	2 <.LBB6_23+0x24>
80002b58: 02 65        	ld	a0, 0(sp)
80002b5a: c2 65        	ld	a1, 16(sp)
80002b5c: a8 fd        	sd	a0, 120(a1)
80002b5e: 01 46        	mv	a2, zero
80002b60: 63 0b c5 00  	beq	a0, a2, 22 <.LBB6_23+0x42>
80002b64: 29 a0        	j	10 <.LBB6_23+0x3a>
80002b66: 05 45        	addi	a0, zero, 1
80002b68: a3 0f a1 02  	sb	a0, 63(sp)
80002b6c: 19 a8        	j	22 <.LBB6_23+0x4e>
80002b6e: 01 45        	mv	a0, zero
80002b70: a3 0f a1 02  	sb	a0, 63(sp)
80002b74: 39 a0        	j	14 <.LBB6_23+0x4e>
80002b76: 42 65        	ld	a0, 16(sp)
80002b78: 4c 61        	ld	a1, 128(a0)
80002b7a: 01 46        	mv	a2, zero
80002b7c: e3 89 c5 fe  	beq	a1, a2, -14 <.LBB6_23+0x3a>
80002b80: dd b7        	j	-26 <.LBB6_23+0x32>
80002b82: 03 45 f1 03  	lbu	a0, 63(sp)
80002b86: 05 89        	andi	a0, a0, 1
80002b88: 81 45        	mv	a1, zero
80002b8a: 63 08 b5 00  	beq	a0, a1, 16 <.LBB6_23+0x66>
80002b8e: 09 a0        	j	2 <.LBB6_23+0x5c>
80002b90: 97 50 00 00  	auipc	ra, 5
80002b94: e7 80 40 7a  	jalr	1956(ra)
80002b98: 11 a0        	j	4 <.LBB6_23+0x68>
80002b9a: 11 a0        	j	4 <.LBB6_23+0x6a>
80002b9c: 09 a0        	j	2 <.LBB6_23+0x6a>
80002b9e: a6 60        	ld	ra, 72(sp)
80002ba0: 61 61        	addi	sp, sp, 80
80002ba2: 82 80        	ret

0000000080002ba4 <.LBB6_24>:
80002ba4: 17 b5 00 00  	auipc	a0, 11
80002ba8: 13 05 c5 f7  	addi	a0, a0, -132

0000000080002bac <.LBB6_25>:
80002bac: 17 b6 00 00  	auipc	a2, 11
80002bb0: 13 06 c6 f5  	addi	a2, a2, -164
80002bb4: 93 05 10 02  	addi	a1, zero, 33
80002bb8: 97 90 00 00  	auipc	ra, 9
80002bbc: e7 80 20 b8  	jalr	-1150(ra)
80002bc0: 00 00        	unimp	

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E:

0000000080002bc2 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E>:
80002bc2: 5d 71        	addi	sp, sp, -80
80002bc4: 86 e4        	sd	ra, 72(sp)
80002bc6: 2a f4        	sd	a0, 40(sp)
80002bc8: 2e f8        	sd	a1, 48(sp)
80002bca: 97 00 00 00  	auipc	ra, 0
80002bce: e7 80 c0 05  	jalr	92(ra)
80002bd2: 2a e8        	sd	a0, 16(sp)
80002bd4: 2e e4        	sd	a1, 8(sp)
80002bd6: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x16>
80002bd8: 42 65        	ld	a0, 16(sp)
80002bda: 2a fc        	sd	a0, 56(sp)
80002bdc: a2 65        	ld	a1, 8(sp)
80002bde: 13 f6 15 00  	andi	a2, a1, 1
80002be2: 23 03 c1 04  	sb	a2, 70(sp)
80002be6: a3 03 c1 04  	sb	a2, 71(sp)
80002bea: 32 e0        	sd	a2, 0(sp)
80002bec: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x2c>
80002bee: 01 45        	mv	a0, zero
80002bf0: 82 65        	ld	a1, 0(sp)
80002bf2: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x3c>
80002bf6: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x36>
80002bf8: 01 45        	mv	a0, zero
80002bfa: 2a ec        	sd	a0, 24(sp)
80002bfc: 31 a0        	j	12 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x46>
80002bfe: 42 65        	ld	a0, 16(sp)
80002c00: 2a f0        	sd	a0, 32(sp)
80002c02: 85 45        	addi	a1, zero, 1
80002c04: 2e ec        	sd	a1, 24(sp)
80002c06: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$11checked_sub17hc4ad6ce6d9338a90E+0x46>
80002c08: 62 65        	ld	a0, 24(sp)
80002c0a: 82 75        	ld	a1, 32(sp)
80002c0c: a6 60        	ld	ra, 72(sp)
80002c0e: 61 61        	addi	sp, sp, 80
80002c10: 82 80        	ret

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_sub17he8d10b2bbdfedc01E:

0000000080002c12 <_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_sub17he8d10b2bbdfedc01E>:
80002c12: 01 11        	addi	sp, sp, -32
80002c14: 2a e4        	sd	a0, 8(sp)
80002c16: 2e e8        	sd	a1, 16(sp)
80002c18: 0d 8d        	sub	a0, a0, a1
80002c1a: 2a ec        	sd	a0, 24(sp)
80002c1c: 2a e0        	sd	a0, 0(sp)
80002c1e: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_sub17he8d10b2bbdfedc01E+0xe>
80002c20: 02 65        	ld	a0, 0(sp)
80002c22: 05 61        	addi	sp, sp, 32
80002c24: 82 80        	ret

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_sub17h5142e4da2de20e29E:

0000000080002c26 <_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_sub17h5142e4da2de20e29E>:
80002c26: 5d 71        	addi	sp, sp, -80
80002c28: 2a f0        	sd	a0, 32(sp)
80002c2a: 2e f4        	sd	a1, 40(sp)
80002c2c: b3 05 b5 40  	sub	a1, a0, a1
80002c30: 33 35 b5 00  	sltu	a0, a0, a1
80002c34: 2e f8        	sd	a1, 48(sp)
80002c36: 23 0c a1 02  	sb	a0, 56(sp)
80002c3a: 2e e4        	sd	a1, 8(sp)
80002c3c: 2a e0        	sd	a0, 0(sp)
80002c3e: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_sub17h5142e4da2de20e29E+0x1a>
80002c40: 22 65        	ld	a0, 8(sp)
80002c42: aa e0        	sd	a0, 64(sp)
80002c44: 82 65        	ld	a1, 0(sp)
80002c46: a3 07 b1 04  	sb	a1, 79(sp)
80002c4a: 2a e8        	sd	a0, 16(sp)
80002c4c: 23 0c b1 00  	sb	a1, 24(sp)
80002c50: 61 61        	addi	sp, sp, 80
80002c52: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h71d37b3aa84abda8E:

0000000080002c54 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h71d37b3aa84abda8E>:
80002c54: 41 11        	addi	sp, sp, -16
80002c56: 2a e4        	sd	a0, 8(sp)
80002c58: 2a e0        	sd	a0, 0(sp)
80002c5a: 41 01        	addi	sp, sp, 16
80002c5c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hab2bc6d23160cf95E:

0000000080002c5e <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hab2bc6d23160cf95E>:
80002c5e: 41 11        	addi	sp, sp, -16
80002c60: 2a e4        	sd	a0, 8(sp)
80002c62: 2a e0        	sd	a0, 0(sp)
80002c64: 41 01        	addi	sp, sp, 16
80002c66: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hb1589b0afda2de31E:

0000000080002c68 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hb1589b0afda2de31E>:
80002c68: 41 11        	addi	sp, sp, -16
80002c6a: 2a e4        	sd	a0, 8(sp)
80002c6c: 2a e0        	sd	a0, 0(sp)
80002c6e: 41 01        	addi	sp, sp, 16
80002c70: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hdb5f33a927a3afa6E:

0000000080002c72 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hdb5f33a927a3afa6E>:
80002c72: 41 11        	addi	sp, sp, -16
80002c74: 2a e4        	sd	a0, 8(sp)
80002c76: 2a e0        	sd	a0, 0(sp)
80002c78: 41 01        	addi	sp, sp, 16
80002c7a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hde058ac22f666e81E:

0000000080002c7c <_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hde058ac22f666e81E>:
80002c7c: 41 11        	addi	sp, sp, -16
80002c7e: 2a e4        	sd	a0, 8(sp)
80002c80: 2a e0        	sd	a0, 0(sp)
80002c82: 41 01        	addi	sp, sp, 16
80002c84: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E:

0000000080002c86 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E>:
80002c86: 79 71        	addi	sp, sp, -48
80002c88: 06 f4        	sd	ra, 40(sp)
80002c8a: 2a f0        	sd	a0, 32(sp)
80002c8c: 2a e8        	sd	a0, 16(sp)
80002c8e: 97 10 00 00  	auipc	ra, 1
80002c92: e7 80 a0 6a  	jalr	1706(ra)
80002c96: 2a e4        	sd	a0, 8(sp)
80002c98: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x14>
80002c9a: 22 65        	ld	a0, 8(sp)
80002c9c: 09 e9        	bnez	a0, 18 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x28>
80002c9e: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x1a>
80002ca0: 42 65        	ld	a0, 16(sp)
80002ca2: 97 00 00 00  	auipc	ra, 0
80002ca6: e7 80 00 fd  	jalr	-48(ra)
80002caa: 2a e0        	sd	a0, 0(sp)
80002cac: 21 a0        	j	8 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x2e>
80002cae: 01 45        	mv	a0, zero
80002cb0: 2a ec        	sd	a0, 24(sp)
80002cb2: 21 a0        	j	8 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x34>
80002cb4: 02 65        	ld	a0, 0(sp)
80002cb6: 2a ec        	sd	a0, 24(sp)
80002cb8: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17h836ff14a78f955d2E+0x34>
80002cba: 62 65        	ld	a0, 24(sp)
80002cbc: a2 70        	ld	ra, 40(sp)
80002cbe: 45 61        	addi	sp, sp, 48
80002cc0: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E:

0000000080002cc2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E>:
80002cc2: 79 71        	addi	sp, sp, -48
80002cc4: 06 f4        	sd	ra, 40(sp)
80002cc6: 2a f0        	sd	a0, 32(sp)
80002cc8: 2a e8        	sd	a0, 16(sp)
80002cca: 97 10 00 00  	auipc	ra, 1
80002cce: e7 80 60 64  	jalr	1606(ra)
80002cd2: 2a e4        	sd	a0, 8(sp)
80002cd4: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x14>
80002cd6: 22 65        	ld	a0, 8(sp)
80002cd8: 09 e9        	bnez	a0, 18 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x28>
80002cda: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x1a>
80002cdc: 42 65        	ld	a0, 16(sp)
80002cde: 97 00 00 00  	auipc	ra, 0
80002ce2: e7 80 e0 f9  	jalr	-98(ra)
80002ce6: 2a e0        	sd	a0, 0(sp)
80002ce8: 21 a0        	j	8 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x2e>
80002cea: 01 45        	mv	a0, zero
80002cec: 2a ec        	sd	a0, 24(sp)
80002cee: 21 a0        	j	8 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x34>
80002cf0: 02 65        	ld	a0, 0(sp)
80002cf2: 2a ec        	sd	a0, 24(sp)
80002cf4: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$3new17hc5e1326ab0d65276E+0x34>
80002cf6: 62 65        	ld	a0, 24(sp)
80002cf8: a2 70        	ld	ra, 40(sp)
80002cfa: 45 61        	addi	sp, sp, 48
80002cfc: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hdaa32cfa62147346E:

0000000080002cfe <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hdaa32cfa62147346E>:
80002cfe: 01 11        	addi	sp, sp, -32
80002d00: 06 ec        	sd	ra, 24(sp)
80002d02: 2a e8        	sd	a0, 16(sp)
80002d04: 08 61        	ld	a0, 0(a0)
80002d06: 97 00 00 00  	auipc	ra, 0
80002d0a: e7 80 80 04  	jalr	72(ra)
80002d0e: 2a e4        	sd	a0, 8(sp)
80002d10: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hdaa32cfa62147346E+0x14>
80002d12: 22 65        	ld	a0, 8(sp)
80002d14: e2 60        	ld	ra, 24(sp)
80002d16: 05 61        	addi	sp, sp, 32
80002d18: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hf1f316b4dc56b5a5E:

0000000080002d1a <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hf1f316b4dc56b5a5E>:
80002d1a: 01 11        	addi	sp, sp, -32
80002d1c: 06 ec        	sd	ra, 24(sp)
80002d1e: 2a e8        	sd	a0, 16(sp)
80002d20: 08 61        	ld	a0, 0(a0)
80002d22: 97 00 00 00  	auipc	ra, 0
80002d26: e7 80 40 03  	jalr	52(ra)
80002d2a: 2a e4        	sd	a0, 8(sp)
80002d2c: 09 a0        	j	2 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_mut17hf1f316b4dc56b5a5E+0x14>
80002d2e: 22 65        	ld	a0, 8(sp)
80002d30: e2 60        	ld	ra, 24(sp)
80002d32: 05 61        	addi	sp, sp, 32
80002d34: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h12c5224cec587bdcE:

0000000080002d36 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h12c5224cec587bdcE>:
80002d36: 41 11        	addi	sp, sp, -16
80002d38: 2a e4        	sd	a0, 8(sp)
80002d3a: 41 01        	addi	sp, sp, 16
80002d3c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h3a1e6c6a549253adE:

0000000080002d3e <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h3a1e6c6a549253adE>:
80002d3e: 41 11        	addi	sp, sp, -16
80002d40: 2a e4        	sd	a0, 8(sp)
80002d42: 41 01        	addi	sp, sp, 16
80002d44: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h99f7a75b50a5bd6cE:

0000000080002d46 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h99f7a75b50a5bd6cE>:
80002d46: 41 11        	addi	sp, sp, -16
80002d48: 2a e4        	sd	a0, 8(sp)
80002d4a: 41 01        	addi	sp, sp, 16
80002d4c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h9c3c2703e927bae1E:

0000000080002d4e <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h9c3c2703e927bae1E>:
80002d4e: 41 11        	addi	sp, sp, -16
80002d50: 2a e4        	sd	a0, 8(sp)
80002d52: 41 01        	addi	sp, sp, 16
80002d54: 82 80        	ret

Disassembly of section .text._ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17haaae6f9e9361eb70E:

0000000080002d56 <_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17haaae6f9e9361eb70E>:
80002d56: 41 11        	addi	sp, sp, -16
80002d58: 2a e4        	sd	a0, 8(sp)
80002d5a: 41 01        	addi	sp, sp, 16
80002d5c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h82a281e96cb8b2a3E:

0000000080002d5e <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h82a281e96cb8b2a3E>:
80002d5e: 01 11        	addi	sp, sp, -32
80002d60: 06 ec        	sd	ra, 24(sp)
80002d62: 2a e4        	sd	a0, 8(sp)
80002d64: 2e e8        	sd	a1, 16(sp)
80002d66: 97 00 00 00  	auipc	ra, 0
80002d6a: e7 80 40 01  	jalr	20(ra)
80002d6e: 2a e0        	sd	a0, 0(sp)
80002d70: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h82a281e96cb8b2a3E+0x14>
80002d72: 02 65        	ld	a0, 0(sp)
80002d74: e2 60        	ld	ra, 24(sp)
80002d76: 05 61        	addi	sp, sp, 32
80002d78: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hfc707943b8e1db5aE:

0000000080002d7a <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hfc707943b8e1db5aE>:
80002d7a: 01 11        	addi	sp, sp, -32
80002d7c: 2a e4        	sd	a0, 8(sp)
80002d7e: 2e e8        	sd	a1, 16(sp)
80002d80: 13 06 00 0f  	addi	a2, zero, 240
80002d84: b3 85 c5 02  	<unknown>
80002d88: 2e 95        	add	a0, a0, a1
80002d8a: 2a ec        	sd	a0, 24(sp)
80002d8c: 2a e0        	sd	a0, 0(sp)
80002d8e: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hfc707943b8e1db5aE+0x16>
80002d90: 02 65        	ld	a0, 0(sp)
80002d92: 05 61        	addi	sp, sp, 32
80002d94: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h3122922bfc8cf193E:

0000000080002d96 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h3122922bfc8cf193E>:
80002d96: 79 71        	addi	sp, sp, -48
80002d98: 06 f4        	sd	ra, 40(sp)
80002d9a: 2a f0        	sd	a0, 32(sp)
80002d9c: 2a ec        	sd	a0, 24(sp)
80002d9e: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h3122922bfc8cf193E+0xa>
80002da0: 01 45        	mv	a0, zero
80002da2: e2 65        	ld	a1, 24(sp)
80002da4: 2a e8        	sd	a0, 16(sp)
80002da6: 2e 85        	add	a0, zero, a1
80002da8: c2 65        	ld	a1, 16(sp)
80002daa: 97 80 00 00  	auipc	ra, 8
80002dae: e7 80 40 15  	jalr	340(ra)
80002db2: 2a e4        	sd	a0, 8(sp)
80002db4: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h3122922bfc8cf193E+0x20>
80002db6: 22 65        	ld	a0, 8(sp)
80002db8: a2 70        	ld	ra, 40(sp)
80002dba: 45 61        	addi	sp, sp, 48
80002dbc: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h20e396d5628db86aE:

0000000080002dbe <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h20e396d5628db86aE>:
80002dbe: 41 11        	addi	sp, sp, -16
80002dc0: 2a e0        	sd	a0, 0(sp)
80002dc2: 2e e4        	sd	a1, 8(sp)
80002dc4: 41 01        	addi	sp, sp, 16
80002dc6: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h5789c6937f183a9fE:

0000000080002dc8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h5789c6937f183a9fE>:
80002dc8: 01 11        	addi	sp, sp, -32
80002dca: 2a e8        	sd	a0, 16(sp)
80002dcc: 2e ec        	sd	a1, 24(sp)
80002dce: 2a e0        	sd	a0, 0(sp)
80002dd0: 2e e4        	sd	a1, 8(sp)
80002dd2: 2e 85        	add	a0, zero, a1
80002dd4: 05 61        	addi	sp, sp, 32
80002dd6: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h9d2ceaa42364f62aE:

0000000080002dd8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h9d2ceaa42364f62aE>:
80002dd8: 79 71        	addi	sp, sp, -48
80002dda: 06 f4        	sd	ra, 40(sp)
80002ddc: 2a ec        	sd	a0, 24(sp)
80002dde: 2e f0        	sd	a1, 32(sp)
80002de0: 97 00 00 00  	auipc	ra, 0
80002de4: e7 80 e0 16  	jalr	366(ra)
80002de8: 2a e8        	sd	a0, 16(sp)
80002dea: 2e e4        	sd	a1, 8(sp)
80002dec: 09 a0        	j	2 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h9d2ceaa42364f62aE+0x16>
80002dee: 42 65        	ld	a0, 16(sp)
80002df0: a2 65        	ld	a1, 8(sp)
80002df2: a2 70        	ld	ra, 40(sp)
80002df4: 45 61        	addi	sp, sp, 48
80002df6: 82 80        	ret

Disassembly of section .text._ZN4core4iter6traits8iterator8Iterator9enumerate17h0b64891f32b39e01E:

0000000080002df8 <_ZN4core4iter6traits8iterator8Iterator9enumerate17h0b64891f32b39e01E>:
80002df8: 01 11        	addi	sp, sp, -32
80002dfa: 06 ec        	sd	ra, 24(sp)
80002dfc: 2e e4        	sd	a1, 8(sp)
80002dfe: 32 e8        	sd	a2, 16(sp)
80002e00: 97 10 00 00  	auipc	ra, 1
80002e04: e7 80 60 12  	jalr	294(ra)
80002e08: 09 a0        	j	2 <_ZN4core4iter6traits8iterator8Iterator9enumerate17h0b64891f32b39e01E+0x12>
80002e0a: e2 60        	ld	ra, 24(sp)
80002e0c: 05 61        	addi	sp, sp, 32
80002e0e: 82 80        	ret

Disassembly of section .text._ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE:

0000000080002e10 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE>:
80002e10: 19 71        	addi	sp, sp, -128
80002e12: 86 fc        	sd	ra, 120(sp)
80002e14: aa f0        	sd	a0, 96(sp)
80002e16: ae f4        	sd	a1, 104(sp)
80002e18: aa e0        	sd	a0, 64(sp)
80002e1a: 2e fc        	sd	a1, 56(sp)
80002e1c: 97 10 00 00  	auipc	ra, 1
80002e20: e7 80 80 04  	jalr	72(ra)
80002e24: aa 85        	add	a1, zero, a0
80002e26: aa f8        	sd	a0, 112(sp)
80002e28: 2e f8        	sd	a1, 48(sp)
80002e2a: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x1c>
80002e2c: 42 75        	ld	a0, 48(sp)
80002e2e: 97 80 00 00  	auipc	ra, 8
80002e32: e7 80 e0 56  	jalr	1390(ra)
80002e36: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x28>
80002e38: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x2a>
80002e3a: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x2c>
80002e3c: 05 45        	addi	a0, zero, 1
80002e3e: 11 e9        	bnez	a0, 20 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x42>
80002e40: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x32>
80002e42: 06 65        	ld	a0, 64(sp)
80002e44: e2 75        	ld	a1, 56(sp)
80002e46: 97 10 00 00  	auipc	ra, 1
80002e4a: e7 80 40 fe  	jalr	-28(ra)
80002e4e: 2a f4        	sd	a0, 40(sp)
80002e50: 09 a8        	j	18 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x52>
80002e52: 06 65        	ld	a0, 64(sp)
80002e54: e2 75        	ld	a1, 56(sp)
80002e56: 97 10 00 00  	auipc	ra, 1
80002e5a: e7 80 40 fd  	jalr	-44(ra)
80002e5e: 2a f0        	sd	a0, 32(sp)
80002e60: 21 a8        	j	24 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x68>
80002e62: 42 75        	ld	a0, 48(sp)
80002e64: a2 75        	ld	a1, 40(sp)
80002e66: 97 10 00 00  	auipc	ra, 1
80002e6a: e7 80 80 00  	jalr	8(ra)
80002e6e: 2a ec        	sd	a0, 24(sp)
80002e70: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x62>
80002e72: 62 65        	ld	a0, 24(sp)
80002e74: aa ec        	sd	a0, 88(sp)
80002e76: 11 a8        	j	20 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x7a>
80002e78: 42 75        	ld	a0, 48(sp)
80002e7a: 82 75        	ld	a1, 32(sp)
80002e7c: 97 80 00 00  	auipc	ra, 8
80002e80: e7 80 e0 4b  	jalr	1214(ra)
80002e84: aa ec        	sd	a0, 88(sp)
80002e86: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x78>
80002e88: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x7a>
80002e8a: 42 75        	ld	a0, 48(sp)
80002e8c: 97 00 00 00  	auipc	ra, 0
80002e90: e7 80 80 dc  	jalr	-568(ra)
80002e94: 2a e8        	sd	a0, 16(sp)
80002e96: 09 a0        	j	2 <_ZN4core5slice4iter13Iter$LT$T$GT$3new17hccf641f0291698beE+0x88>
80002e98: 66 65        	ld	a0, 88(sp)
80002e9a: c2 65        	ld	a1, 16(sp)
80002e9c: ae e4        	sd	a1, 72(sp)
80002e9e: aa e8        	sd	a0, 80(sp)
80002ea0: 2a e4        	sd	a0, 8(sp)
80002ea2: 2e 85        	add	a0, zero, a1
80002ea4: a2 65        	ld	a1, 8(sp)
80002ea6: e6 70        	ld	ra, 120(sp)
80002ea8: 09 61        	addi	sp, sp, 128
80002eaa: 82 80        	ret

Disassembly of section .text._ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E:

0000000080002eac <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E>:
80002eac: 19 71        	addi	sp, sp, -128
80002eae: 86 fc        	sd	ra, 120(sp)
80002eb0: aa f0        	sd	a0, 96(sp)
80002eb2: ae f4        	sd	a1, 104(sp)
80002eb4: aa e0        	sd	a0, 64(sp)
80002eb6: 2e fc        	sd	a1, 56(sp)
80002eb8: 97 10 00 00  	auipc	ra, 1
80002ebc: e7 80 20 91  	jalr	-1774(ra)
80002ec0: aa 85        	add	a1, zero, a0
80002ec2: aa f8        	sd	a0, 112(sp)
80002ec4: 2e f8        	sd	a1, 48(sp)
80002ec6: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x1c>
80002ec8: 42 75        	ld	a0, 48(sp)
80002eca: 97 10 00 00  	auipc	ra, 1
80002ece: e7 80 80 8d  	jalr	-1832(ra)
80002ed2: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x28>
80002ed4: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x2a>
80002ed6: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x2c>
80002ed8: 05 45        	addi	a0, zero, 1
80002eda: 09 ed        	bnez	a0, 26 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x48>
80002edc: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x32>
80002ede: 42 75        	ld	a0, 48(sp)
80002ee0: 86 65        	ld	a1, 64(sp)
80002ee2: 2a f4        	sd	a0, 40(sp)
80002ee4: 2e 85        	add	a0, zero, a1
80002ee6: e2 75        	ld	a1, 56(sp)
80002ee8: 97 10 00 00  	auipc	ra, 1
80002eec: e7 80 c0 8e  	jalr	-1812(ra)
80002ef0: 2a f0        	sd	a0, 32(sp)
80002ef2: 09 a8        	j	18 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x58>
80002ef4: 06 65        	ld	a0, 64(sp)
80002ef6: e2 75        	ld	a1, 56(sp)
80002ef8: 97 10 00 00  	auipc	ra, 1
80002efc: e7 80 c0 8d  	jalr	-1828(ra)
80002f00: 2a ec        	sd	a0, 24(sp)
80002f02: 21 a8        	j	24 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x6e>
80002f04: 22 75        	ld	a0, 40(sp)
80002f06: 82 75        	ld	a1, 32(sp)
80002f08: 97 00 00 00  	auipc	ra, 0
80002f0c: e7 80 80 32  	jalr	808(ra)
80002f10: 2a e8        	sd	a0, 16(sp)
80002f12: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x68>
80002f14: 42 65        	ld	a0, 16(sp)
80002f16: aa ec        	sd	a0, 88(sp)
80002f18: 11 a8        	j	20 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x80>
80002f1a: 42 75        	ld	a0, 48(sp)
80002f1c: e2 65        	ld	a1, 24(sp)
80002f1e: 97 10 00 00  	auipc	ra, 1
80002f22: e7 80 20 85  	jalr	-1966(ra)
80002f26: aa ec        	sd	a0, 88(sp)
80002f28: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x7e>
80002f2a: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x80>
80002f2c: 42 75        	ld	a0, 48(sp)
80002f2e: 97 00 00 00  	auipc	ra, 0
80002f32: e7 80 a0 d3  	jalr	-710(ra)
80002f36: 2a e4        	sd	a0, 8(sp)
80002f38: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h06b455180a980d85E+0x8e>
80002f3a: 66 65        	ld	a0, 88(sp)
80002f3c: a2 65        	ld	a1, 8(sp)
80002f3e: ae e4        	sd	a1, 72(sp)
80002f40: aa e8        	sd	a0, 80(sp)
80002f42: 2a e0        	sd	a0, 0(sp)
80002f44: 2e 85        	add	a0, zero, a1
80002f46: 82 65        	ld	a1, 0(sp)
80002f48: e6 70        	ld	ra, 120(sp)
80002f4a: 09 61        	addi	sp, sp, 128
80002f4c: 82 80        	ret

Disassembly of section .text._ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE:

0000000080002f4e <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE>:
80002f4e: 19 71        	addi	sp, sp, -128
80002f50: 86 fc        	sd	ra, 120(sp)
80002f52: aa f0        	sd	a0, 96(sp)
80002f54: ae f4        	sd	a1, 104(sp)
80002f56: aa e0        	sd	a0, 64(sp)
80002f58: 2e fc        	sd	a1, 56(sp)
80002f5a: 97 00 00 00  	auipc	ra, 0
80002f5e: e7 80 40 e6  	jalr	-412(ra)
80002f62: aa 85        	add	a1, zero, a0
80002f64: aa f8        	sd	a0, 112(sp)
80002f66: 2e f8        	sd	a1, 48(sp)
80002f68: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x1c>
80002f6a: 42 75        	ld	a0, 48(sp)
80002f6c: 97 00 00 00  	auipc	ra, 0
80002f70: e7 80 a0 e2  	jalr	-470(ra)
80002f74: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x28>
80002f76: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x2a>
80002f78: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x2c>
80002f7a: 05 45        	addi	a0, zero, 1
80002f7c: 09 ed        	bnez	a0, 26 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x48>
80002f7e: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x32>
80002f80: 42 75        	ld	a0, 48(sp)
80002f82: 86 65        	ld	a1, 64(sp)
80002f84: 2a f4        	sd	a0, 40(sp)
80002f86: 2e 85        	add	a0, zero, a1
80002f88: e2 75        	ld	a1, 56(sp)
80002f8a: 97 00 00 00  	auipc	ra, 0
80002f8e: e7 80 e0 e3  	jalr	-450(ra)
80002f92: 2a f0        	sd	a0, 32(sp)
80002f94: 09 a8        	j	18 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x58>
80002f96: 06 65        	ld	a0, 64(sp)
80002f98: e2 75        	ld	a1, 56(sp)
80002f9a: 97 00 00 00  	auipc	ra, 0
80002f9e: e7 80 e0 e2  	jalr	-466(ra)
80002fa2: 2a ec        	sd	a0, 24(sp)
80002fa4: 21 a8        	j	24 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x6e>
80002fa6: 22 75        	ld	a0, 40(sp)
80002fa8: 82 75        	ld	a1, 32(sp)
80002faa: 97 00 00 00  	auipc	ra, 0
80002fae: e7 80 60 28  	jalr	646(ra)
80002fb2: 2a e8        	sd	a0, 16(sp)
80002fb4: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x68>
80002fb6: 42 65        	ld	a0, 16(sp)
80002fb8: aa ec        	sd	a0, 88(sp)
80002fba: 11 a8        	j	20 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x80>
80002fbc: 42 75        	ld	a0, 48(sp)
80002fbe: e2 65        	ld	a1, 24(sp)
80002fc0: 97 00 00 00  	auipc	ra, 0
80002fc4: e7 80 e0 d9  	jalr	-610(ra)
80002fc8: aa ec        	sd	a0, 88(sp)
80002fca: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x7e>
80002fcc: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x80>
80002fce: 42 75        	ld	a0, 48(sp)
80002fd0: 97 00 00 00  	auipc	ra, 0
80002fd4: e7 80 e0 c8  	jalr	-882(ra)
80002fd8: 2a e4        	sd	a0, 8(sp)
80002fda: 09 a0        	j	2 <_ZN4core5slice4iter16IterMut$LT$T$GT$3new17h80fd466f0e7bd03aE+0x8e>
80002fdc: 66 65        	ld	a0, 88(sp)
80002fde: a2 65        	ld	a1, 8(sp)
80002fe0: ae e4        	sd	a1, 72(sp)
80002fe2: aa e8        	sd	a0, 80(sp)
80002fe4: 2a e0        	sd	a0, 0(sp)
80002fe6: 2e 85        	add	a0, zero, a1
80002fe8: 82 65        	ld	a1, 0(sp)
80002fea: e6 70        	ld	ra, 120(sp)
80002fec: 09 61        	addi	sp, sp, 128
80002fee: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h249185c7a321c11fE:

0000000080002ff0 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h249185c7a321c11fE>:
80002ff0: 41 11        	addi	sp, sp, -16
80002ff2: 2a e0        	sd	a0, 0(sp)
80002ff4: 2e e4        	sd	a1, 8(sp)
80002ff6: 41 01        	addi	sp, sp, 16
80002ff8: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h624806def87bd99dE:

0000000080002ffa <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h624806def87bd99dE>:
80002ffa: 41 11        	addi	sp, sp, -16
80002ffc: 2a e0        	sd	a0, 0(sp)
80002ffe: 2e e4        	sd	a1, 8(sp)
80003000: 41 01        	addi	sp, sp, 16
80003002: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h8366855cb54f0430E:

0000000080003004 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h8366855cb54f0430E>:
80003004: 41 11        	addi	sp, sp, -16
80003006: 2a e0        	sd	a0, 0(sp)
80003008: 2e e4        	sd	a1, 8(sp)
8000300a: 41 01        	addi	sp, sp, 16
8000300c: 82 80        	ret

Disassembly of section .text._ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E:

000000008000300e <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E>:
8000300e: 59 71        	addi	sp, sp, -112
80003010: 86 f4        	sd	ra, 104(sp)
80003012: aa e0        	sd	a0, 64(sp)
80003014: 0c 61        	ld	a1, 0(a0)
80003016: 2a f8        	sd	a0, 48(sp)
80003018: 2e 85        	add	a0, zero, a1
8000301a: 97 00 00 00  	auipc	ra, 0
8000301e: e7 80 40 d2  	jalr	-732(ra)
80003022: 2a f4        	sd	a0, 40(sp)
80003024: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x18>
80003026: 22 75        	ld	a0, 40(sp)
80003028: 97 80 00 00  	auipc	ra, 8
8000302c: e7 80 c0 f6  	jalr	-148(ra)
80003030: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x24>
80003032: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x26>
80003034: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x28>
80003036: 01 45        	mv	a0, zero
80003038: 09 e9        	bnez	a0, 18 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x3c>
8000303a: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x2e>
8000303c: 42 75        	ld	a0, 48(sp)
8000303e: 08 65        	ld	a0, 8(a0)
80003040: 97 80 00 00  	auipc	ra, 8
80003044: e7 80 c0 35  	jalr	860(ra)
80003048: 11 a0        	j	4 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x3e>
8000304a: 19 a0        	j	6 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x42>
8000304c: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x40>
8000304e: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x42>
80003050: 42 75        	ld	a0, 48(sp)
80003052: 08 61        	ld	a0, 0(a0)
80003054: 97 00 00 00  	auipc	ra, 0
80003058: e7 80 a0 ce  	jalr	-790(ra)
8000305c: 2a f0        	sd	a0, 32(sp)
8000305e: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x52>
80003060: 42 75        	ld	a0, 48(sp)
80003062: 0c 65        	ld	a1, 8(a0)
80003064: 02 76        	ld	a2, 32(sp)
80003066: 63 16 b6 00  	bne	a2, a1, 12 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x64>
8000306a: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0x5e>
8000306c: 01 45        	mv	a0, zero
8000306e: 2a fc        	sd	a0, 56(sp)
80003070: b1 a0        	j	76 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0xae>
80003072: 42 75        	ld	a0, 48(sp)
80003074: aa e8        	sd	a0, 80(sp)
80003076: 85 45        	addi	a1, zero, 1
80003078: ae ec        	sd	a1, 88(sp)
8000307a: 08 61        	ld	a0, 0(a0)
8000307c: 2e ec        	sd	a1, 24(sp)
8000307e: 97 00 00 00  	auipc	ra, 0
80003082: e7 80 00 cc  	jalr	-832(ra)
80003086: aa f0        	sd	a0, 96(sp)
80003088: c2 75        	ld	a1, 48(sp)
8000308a: 90 61        	ld	a2, 0(a1)
8000308c: 2a e8        	sd	a0, 16(sp)
8000308e: 32 85        	add	a0, zero, a2
80003090: 97 00 00 00  	auipc	ra, 0
80003094: e7 80 e0 ca  	jalr	-850(ra)
80003098: e2 65        	ld	a1, 24(sp)
8000309a: 97 80 00 00  	auipc	ra, 8
8000309e: e7 80 60 ee  	jalr	-282(ra)
800030a2: 97 00 00 00  	auipc	ra, 0
800030a6: e7 80 20 bb  	jalr	-1102(ra)
800030aa: c2 75        	ld	a1, 48(sp)
800030ac: 88 e1        	sd	a0, 0(a1)
800030ae: 42 65        	ld	a0, 16(sp)
800030b0: aa e4        	sd	a0, 72(sp)
800030b2: 2a e4        	sd	a0, 8(sp)
800030b4: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0xa8>
800030b6: 22 65        	ld	a0, 8(sp)
800030b8: 2a fc        	sd	a0, 56(sp)
800030ba: 09 a0        	j	2 <_ZN91_$LT$core..slice..iter..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h39877c31047e7a64E+0xae>
800030bc: 62 75        	ld	a0, 56(sp)
800030be: a6 70        	ld	ra, 104(sp)
800030c0: 65 61        	addi	sp, sp, 112
800030c2: 82 80        	ret

Disassembly of section .text._ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E:

00000000800030c4 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E>:
800030c4: 59 71        	addi	sp, sp, -112
800030c6: 86 f4        	sd	ra, 104(sp)
800030c8: aa e0        	sd	a0, 64(sp)
800030ca: 0c 61        	ld	a1, 0(a0)
800030cc: 2a f8        	sd	a0, 48(sp)
800030ce: 2e 85        	add	a0, zero, a1
800030d0: 97 00 00 00  	auipc	ra, 0
800030d4: e7 80 60 c7  	jalr	-906(ra)
800030d8: 2a f4        	sd	a0, 40(sp)
800030da: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x18>
800030dc: 22 75        	ld	a0, 40(sp)
800030de: 97 00 00 00  	auipc	ra, 0
800030e2: e7 80 40 6c  	jalr	1732(ra)
800030e6: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x24>
800030e8: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x26>
800030ea: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x28>
800030ec: 01 45        	mv	a0, zero
800030ee: 09 e9        	bnez	a0, 18 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x3c>
800030f0: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x2e>
800030f2: 42 75        	ld	a0, 48(sp)
800030f4: 08 65        	ld	a0, 8(a0)
800030f6: 97 00 00 00  	auipc	ra, 0
800030fa: e7 80 c0 6a  	jalr	1708(ra)
800030fe: 11 a0        	j	4 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x3e>
80003100: 19 a0        	j	6 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x42>
80003102: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x40>
80003104: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x42>
80003106: 42 75        	ld	a0, 48(sp)
80003108: 08 61        	ld	a0, 0(a0)
8000310a: 97 00 00 00  	auipc	ra, 0
8000310e: e7 80 c0 c3  	jalr	-964(ra)
80003112: 2a f0        	sd	a0, 32(sp)
80003114: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x52>
80003116: 42 75        	ld	a0, 48(sp)
80003118: 0c 65        	ld	a1, 8(a0)
8000311a: 02 76        	ld	a2, 32(sp)
8000311c: 63 16 b6 00  	bne	a2, a1, 12 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x64>
80003120: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0x5e>
80003122: 01 45        	mv	a0, zero
80003124: 2a fc        	sd	a0, 56(sp)
80003126: b1 a0        	j	76 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0xae>
80003128: 42 75        	ld	a0, 48(sp)
8000312a: aa e8        	sd	a0, 80(sp)
8000312c: 85 45        	addi	a1, zero, 1
8000312e: ae ec        	sd	a1, 88(sp)
80003130: 08 61        	ld	a0, 0(a0)
80003132: 2e ec        	sd	a1, 24(sp)
80003134: 97 00 00 00  	auipc	ra, 0
80003138: e7 80 20 c1  	jalr	-1006(ra)
8000313c: aa f0        	sd	a0, 96(sp)
8000313e: c2 75        	ld	a1, 48(sp)
80003140: 90 61        	ld	a2, 0(a1)
80003142: 2a e8        	sd	a0, 16(sp)
80003144: 32 85        	add	a0, zero, a2
80003146: 97 00 00 00  	auipc	ra, 0
8000314a: e7 80 00 c0  	jalr	-1024(ra)
8000314e: e2 65        	ld	a1, 24(sp)
80003150: 97 00 00 00  	auipc	ra, 0
80003154: e7 80 c0 63  	jalr	1596(ra)
80003158: 97 00 00 00  	auipc	ra, 0
8000315c: e7 80 00 b1  	jalr	-1264(ra)
80003160: c2 75        	ld	a1, 48(sp)
80003162: 88 e1        	sd	a0, 0(a1)
80003164: 42 65        	ld	a0, 16(sp)
80003166: aa e4        	sd	a0, 72(sp)
80003168: 2a e4        	sd	a0, 8(sp)
8000316a: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0xa8>
8000316c: 22 65        	ld	a0, 8(sp)
8000316e: 2a fc        	sd	a0, 56(sp)
80003170: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6e479d1425d9af78E+0xae>
80003172: 62 75        	ld	a0, 56(sp)
80003174: a6 70        	ld	ra, 104(sp)
80003176: 65 61        	addi	sp, sp, 112
80003178: 82 80        	ret

Disassembly of section .text._ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E:

000000008000317a <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E>:
8000317a: 59 71        	addi	sp, sp, -112
8000317c: 86 f4        	sd	ra, 104(sp)
8000317e: aa e0        	sd	a0, 64(sp)
80003180: 0c 61        	ld	a1, 0(a0)
80003182: 2a f8        	sd	a0, 48(sp)
80003184: 2e 85        	add	a0, zero, a1
80003186: 97 00 00 00  	auipc	ra, 0
8000318a: e7 80 00 bb  	jalr	-1104(ra)
8000318e: 2a f4        	sd	a0, 40(sp)
80003190: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x18>
80003192: 22 75        	ld	a0, 40(sp)
80003194: 97 00 00 00  	auipc	ra, 0
80003198: e7 80 20 c0  	jalr	-1022(ra)
8000319c: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x24>
8000319e: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x26>
800031a0: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x28>
800031a2: 01 45        	mv	a0, zero
800031a4: 09 e9        	bnez	a0, 18 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x3c>
800031a6: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x2e>
800031a8: 42 75        	ld	a0, 48(sp)
800031aa: 08 65        	ld	a0, 8(a0)
800031ac: 97 00 00 00  	auipc	ra, 0
800031b0: e7 80 a0 be  	jalr	-1046(ra)
800031b4: 11 a0        	j	4 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x3e>
800031b6: 19 a0        	j	6 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x42>
800031b8: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x40>
800031ba: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x42>
800031bc: 42 75        	ld	a0, 48(sp)
800031be: 08 61        	ld	a0, 0(a0)
800031c0: 97 00 00 00  	auipc	ra, 0
800031c4: e7 80 60 b7  	jalr	-1162(ra)
800031c8: 2a f0        	sd	a0, 32(sp)
800031ca: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x52>
800031cc: 42 75        	ld	a0, 48(sp)
800031ce: 0c 65        	ld	a1, 8(a0)
800031d0: 02 76        	ld	a2, 32(sp)
800031d2: 63 16 b6 00  	bne	a2, a1, 12 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x64>
800031d6: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0x5e>
800031d8: 01 45        	mv	a0, zero
800031da: 2a fc        	sd	a0, 56(sp)
800031dc: b1 a0        	j	76 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0xae>
800031de: 42 75        	ld	a0, 48(sp)
800031e0: aa e8        	sd	a0, 80(sp)
800031e2: 85 45        	addi	a1, zero, 1
800031e4: ae ec        	sd	a1, 88(sp)
800031e6: 08 61        	ld	a0, 0(a0)
800031e8: 2e ec        	sd	a1, 24(sp)
800031ea: 97 00 00 00  	auipc	ra, 0
800031ee: e7 80 c0 b4  	jalr	-1204(ra)
800031f2: aa f0        	sd	a0, 96(sp)
800031f4: c2 75        	ld	a1, 48(sp)
800031f6: 90 61        	ld	a2, 0(a1)
800031f8: 2a e8        	sd	a0, 16(sp)
800031fa: 32 85        	add	a0, zero, a2
800031fc: 97 00 00 00  	auipc	ra, 0
80003200: e7 80 a0 b3  	jalr	-1222(ra)
80003204: e2 65        	ld	a1, 24(sp)
80003206: 97 00 00 00  	auipc	ra, 0
8000320a: e7 80 40 b7  	jalr	-1164(ra)
8000320e: 97 00 00 00  	auipc	ra, 0
80003212: e7 80 00 a5  	jalr	-1456(ra)
80003216: c2 75        	ld	a1, 48(sp)
80003218: 88 e1        	sd	a0, 0(a1)
8000321a: 42 65        	ld	a0, 16(sp)
8000321c: aa e4        	sd	a0, 72(sp)
8000321e: 2a e4        	sd	a0, 8(sp)
80003220: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0xa8>
80003222: 22 65        	ld	a0, 8(sp)
80003224: 2a fc        	sd	a0, 56(sp)
80003226: 09 a0        	j	2 <_ZN94_$LT$core..slice..iter..IterMut$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h9e8b48f3dc7e31b7E+0xae>
80003228: 62 75        	ld	a0, 56(sp)
8000322a: a6 70        	ld	ra, 104(sp)
8000322c: 65 61        	addi	sp, sp, 112
8000322e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$12wrapping_add17h8c9c545175fc895aE:

0000000080003230 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$12wrapping_add17h8c9c545175fc895aE>:
80003230: 01 11        	addi	sp, sp, -32
80003232: 06 ec        	sd	ra, 24(sp)
80003234: 2a e4        	sd	a0, 8(sp)
80003236: 2e e8        	sd	a1, 16(sp)
80003238: 97 00 00 00  	auipc	ra, 0
8000323c: e7 80 c0 04  	jalr	76(ra)
80003240: 2a e0        	sd	a0, 0(sp)
80003242: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$12wrapping_add17h8c9c545175fc895aE+0x14>
80003244: 02 65        	ld	a0, 0(sp)
80003246: e2 60        	ld	ra, 24(sp)
80003248: 05 61        	addi	sp, sp, 32
8000324a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13read_volatile17ha1af821d84a013d2E:

000000008000324c <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13read_volatile17ha1af821d84a013d2E>:
8000324c: 01 11        	addi	sp, sp, -32
8000324e: 06 ec        	sd	ra, 24(sp)
80003250: 2a e8        	sd	a0, 16(sp)
80003252: 97 00 00 00  	auipc	ra, 0
80003256: e7 80 a0 06  	jalr	106(ra)
8000325a: 2a e4        	sd	a0, 8(sp)
8000325c: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13read_volatile17ha1af821d84a013d2E+0x12>
8000325e: 22 65        	ld	a0, 8(sp)
80003260: e2 60        	ld	ra, 24(sp)
80003262: 05 61        	addi	sp, sp, 32
80003264: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$14write_volatile17h2857d63b561c0a63E:

0000000080003266 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$14write_volatile17h2857d63b561c0a63E>:
80003266: 01 11        	addi	sp, sp, -32
80003268: 06 ec        	sd	ra, 24(sp)
8000326a: 2e 86        	add	a2, zero, a1
8000326c: 2a e4        	sd	a0, 8(sp)
8000326e: a3 0b b1 00  	sb	a1, 23(sp)
80003272: 32 e0        	sd	a2, 0(sp)
80003274: 97 00 00 00  	auipc	ra, 0
80003278: e7 80 a0 08  	jalr	138(ra)
8000327c: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$14write_volatile17h2857d63b561c0a63E+0x18>
8000327e: e2 60        	ld	ra, 24(sp)
80003280: 05 61        	addi	sp, sp, 32
80003282: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$15wrapping_offset17h2ea134a8c1912777E:

0000000080003284 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$15wrapping_offset17h2ea134a8c1912777E>:
80003284: 01 11        	addi	sp, sp, -32
80003286: 2a e4        	sd	a0, 8(sp)
80003288: 2e e8        	sd	a1, 16(sp)
8000328a: 2e 95        	add	a0, a0, a1
8000328c: 2a ec        	sd	a0, 24(sp)
8000328e: 2a e0        	sd	a0, 0(sp)
80003290: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$15wrapping_offset17h2ea134a8c1912777E+0xe>
80003292: 02 65        	ld	a0, 0(sp)
80003294: 05 61        	addi	sp, sp, 32
80003296: 82 80        	ret

Disassembly of section .text._ZN4core3ptr13read_volatile17h2c63fac7dcac1c26E:

0000000080003298 <_ZN4core3ptr13read_volatile17h2c63fac7dcac1c26E>:
80003298: 01 11        	addi	sp, sp, -32
8000329a: 2a e8        	sd	a0, 16(sp)
8000329c: 08 61        	ld	a0, 0(a0)
8000329e: 2a ec        	sd	a0, 24(sp)
800032a0: 2a e4        	sd	a0, 8(sp)
800032a2: 09 a0        	j	2 <_ZN4core3ptr13read_volatile17h2c63fac7dcac1c26E+0xc>
800032a4: 22 65        	ld	a0, 8(sp)
800032a6: 05 61        	addi	sp, sp, 32
800032a8: 82 80        	ret

Disassembly of section .text._ZN4core3ptr13read_volatile17h827c9f2f858a74a9E:

00000000800032aa <_ZN4core3ptr13read_volatile17h827c9f2f858a74a9E>:
800032aa: 01 11        	addi	sp, sp, -32
800032ac: 2a e8        	sd	a0, 16(sp)
800032ae: 08 61        	ld	a0, 0(a0)
800032b0: 2a ec        	sd	a0, 24(sp)
800032b2: 2a e4        	sd	a0, 8(sp)
800032b4: 09 a0        	j	2 <_ZN4core3ptr13read_volatile17h827c9f2f858a74a9E+0xc>
800032b6: 22 65        	ld	a0, 8(sp)
800032b8: 05 61        	addi	sp, sp, 32
800032ba: 82 80        	ret

Disassembly of section .text._ZN4core3ptr13read_volatile17hae9cffb261c15462E:

00000000800032bc <_ZN4core3ptr13read_volatile17hae9cffb261c15462E>:
800032bc: 01 11        	addi	sp, sp, -32
800032be: 2a e8        	sd	a0, 16(sp)
800032c0: 03 45 05 00  	lbu	a0, 0(a0)
800032c4: a3 0f a1 00  	sb	a0, 31(sp)
800032c8: 2a e4        	sd	a0, 8(sp)
800032ca: 09 a0        	j	2 <_ZN4core3ptr13read_volatile17hae9cffb261c15462E+0x10>
800032cc: 22 65        	ld	a0, 8(sp)
800032ce: 05 61        	addi	sp, sp, 32
800032d0: 82 80        	ret

Disassembly of section .text._ZN4core3ptr14write_volatile17h1dca1ba154cde5ffE:

00000000800032d2 <_ZN4core3ptr14write_volatile17h1dca1ba154cde5ffE>:
800032d2: 41 11        	addi	sp, sp, -16
800032d4: 2a e0        	sd	a0, 0(sp)
800032d6: 2e e4        	sd	a1, 8(sp)
800032d8: 0c e1        	sd	a1, 0(a0)
800032da: 09 a0        	j	2 <_ZN4core3ptr14write_volatile17h1dca1ba154cde5ffE+0xa>
800032dc: 41 01        	addi	sp, sp, 16
800032de: 82 80        	ret

Disassembly of section .text._ZN4core3ptr14write_volatile17h67b54cd0ec7c856eE:

00000000800032e0 <_ZN4core3ptr14write_volatile17h67b54cd0ec7c856eE>:
800032e0: 41 11        	addi	sp, sp, -16
800032e2: 2e 86        	add	a2, zero, a1
800032e4: 2a e0        	sd	a0, 0(sp)
800032e6: 2e c6        	sw	a1, 12(sp)
800032e8: 0c c1        	sw	a1, 0(a0)
800032ea: 09 a0        	j	2 <_ZN4core3ptr14write_volatile17h67b54cd0ec7c856eE+0xc>
800032ec: 41 01        	addi	sp, sp, 16
800032ee: 82 80        	ret

Disassembly of section .text._ZN4core3ptr14write_volatile17h94a331257a473671E:

00000000800032f0 <_ZN4core3ptr14write_volatile17h94a331257a473671E>:
800032f0: 41 11        	addi	sp, sp, -16
800032f2: 2a e0        	sd	a0, 0(sp)
800032f4: 2e e4        	sd	a1, 8(sp)
800032f6: 0c e1        	sd	a1, 0(a0)
800032f8: 09 a0        	j	2 <_ZN4core3ptr14write_volatile17h94a331257a473671E+0xa>
800032fa: 41 01        	addi	sp, sp, 16
800032fc: 82 80        	ret

Disassembly of section .text._ZN4core3ptr14write_volatile17he3a004e4d0543e0dE:

00000000800032fe <_ZN4core3ptr14write_volatile17he3a004e4d0543e0dE>:
800032fe: 41 11        	addi	sp, sp, -16
80003300: 2e 86        	add	a2, zero, a1
80003302: 2a e0        	sd	a0, 0(sp)
80003304: a3 07 b1 00  	sb	a1, 15(sp)
80003308: 23 00 b5 00  	sb	a1, 0(a0)
8000330c: 09 a0        	j	2 <_ZN4core3ptr14write_volatile17he3a004e4d0543e0dE+0x10>
8000330e: 41 01        	addi	sp, sp, 16
80003310: 82 80        	ret

Disassembly of section .text._ZN4core3ptr19swap_nonoverlapping17h5661149eab3fe8ceE:

0000000080003312 <_ZN4core3ptr19swap_nonoverlapping17h5661149eab3fe8ceE>:
80003312: 1d 71        	addi	sp, sp, -96
80003314: 86 ec        	sd	ra, 88(sp)
80003316: 2a f4        	sd	a0, 40(sp)
80003318: 2e f8        	sd	a1, 48(sp)
8000331a: 32 fc        	sd	a2, 56(sp)
8000331c: aa 86        	add	a3, zero, a0
8000331e: aa e0        	sd	a0, 64(sp)
80003320: 2e 85        	add	a0, zero, a1
80003322: ae e4        	sd	a1, 72(sp)
80003324: 32 f0        	sd	a2, 32(sp)
80003326: 36 ec        	sd	a3, 24(sp)
80003328: 2a e8        	sd	a0, 16(sp)
8000332a: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17h5661149eab3fe8ceE+0x1a>
8000332c: 02 75        	ld	a0, 32(sp)
8000332e: 93 15 35 00  	slli	a1, a0, 3
80003332: ae e8        	sd	a1, 80(sp)
80003334: 62 65        	ld	a0, 24(sp)
80003336: 42 66        	ld	a2, 16(sp)
80003338: 2e e4        	sd	a1, 8(sp)
8000333a: b2 85        	add	a1, zero, a2
8000333c: 22 66        	ld	a2, 8(sp)
8000333e: 97 00 00 00  	auipc	ra, 0
80003342: e7 80 40 2f  	jalr	756(ra)
80003346: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17h5661149eab3fe8ceE+0x36>
80003348: e6 60        	ld	ra, 88(sp)
8000334a: 25 61        	addi	sp, sp, 96
8000334c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr19swap_nonoverlapping17h891b371c2614d697E:

000000008000334e <_ZN4core3ptr19swap_nonoverlapping17h891b371c2614d697E>:
8000334e: 5d 71        	addi	sp, sp, -80
80003350: 86 e4        	sd	ra, 72(sp)
80003352: 2a ec        	sd	a0, 24(sp)
80003354: 2e f0        	sd	a1, 32(sp)
80003356: 32 f4        	sd	a2, 40(sp)
80003358: 2a f8        	sd	a0, 48(sp)
8000335a: 2e fc        	sd	a1, 56(sp)
8000335c: 32 e8        	sd	a2, 16(sp)
8000335e: 2e e4        	sd	a1, 8(sp)
80003360: 2a e0        	sd	a0, 0(sp)
80003362: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17h891b371c2614d697E+0x16>
80003364: 42 65        	ld	a0, 16(sp)
80003366: aa e0        	sd	a0, 64(sp)
80003368: 02 65        	ld	a0, 0(sp)
8000336a: a2 65        	ld	a1, 8(sp)
8000336c: 42 66        	ld	a2, 16(sp)
8000336e: 97 00 00 00  	auipc	ra, 0
80003372: e7 80 40 2c  	jalr	708(ra)
80003376: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17h891b371c2614d697E+0x2a>
80003378: a6 60        	ld	ra, 72(sp)
8000337a: 61 61        	addi	sp, sp, 80
8000337c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr19swap_nonoverlapping17hd742b687ac3bcdaaE:

000000008000337e <_ZN4core3ptr19swap_nonoverlapping17hd742b687ac3bcdaaE>:
8000337e: 1d 71        	addi	sp, sp, -96
80003380: 86 ec        	sd	ra, 88(sp)
80003382: 2a f4        	sd	a0, 40(sp)
80003384: 2e f8        	sd	a1, 48(sp)
80003386: 32 fc        	sd	a2, 56(sp)
80003388: aa 86        	add	a3, zero, a0
8000338a: aa e0        	sd	a0, 64(sp)
8000338c: 2e 85        	add	a0, zero, a1
8000338e: ae e4        	sd	a1, 72(sp)
80003390: 32 f0        	sd	a2, 32(sp)
80003392: 36 ec        	sd	a3, 24(sp)
80003394: 2a e8        	sd	a0, 16(sp)
80003396: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17hd742b687ac3bcdaaE+0x1a>
80003398: 02 75        	ld	a0, 32(sp)
8000339a: 93 15 35 00  	slli	a1, a0, 3
8000339e: ae e8        	sd	a1, 80(sp)
800033a0: 62 65        	ld	a0, 24(sp)
800033a2: 42 66        	ld	a2, 16(sp)
800033a4: 2e e4        	sd	a1, 8(sp)
800033a6: b2 85        	add	a1, zero, a2
800033a8: 22 66        	ld	a2, 8(sp)
800033aa: 97 00 00 00  	auipc	ra, 0
800033ae: e7 80 80 28  	jalr	648(ra)
800033b2: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17hd742b687ac3bcdaaE+0x36>
800033b4: e6 60        	ld	ra, 88(sp)
800033b6: 25 61        	addi	sp, sp, 96
800033b8: 82 80        	ret

Disassembly of section .text._ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E:

00000000800033ba <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E>:
800033ba: 39 71        	addi	sp, sp, -64
800033bc: 06 fc        	sd	ra, 56(sp)
800033be: 2a f0        	sd	a0, 32(sp)
800033c0: 2e f4        	sd	a1, 40(sp)
800033c2: 2e e8        	sd	a1, 16(sp)
800033c4: 2a e4        	sd	a0, 8(sp)
800033c6: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0xe>
800033c8: 01 45        	mv	a0, zero
800033ca: 19 e9        	bnez	a0, 22 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x26>
800033cc: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x14>
800033ce: 22 65        	ld	a0, 8(sp)
800033d0: 97 00 00 00  	auipc	ra, 0
800033d4: e7 80 60 10  	jalr	262(ra)
800033d8: aa 85        	add	a1, zero, a0
800033da: 2a f8        	sd	a0, 48(sp)
800033dc: 2e e0        	sd	a1, 0(sp)
800033de: 09 a8        	j	18 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x36>
800033e0: 05 46        	addi	a2, zero, 1
800033e2: 22 65        	ld	a0, 8(sp)
800033e4: c2 65        	ld	a1, 16(sp)
800033e6: 97 00 00 00  	auipc	ra, 0
800033ea: e7 80 80 f9  	jalr	-104(ra)
800033ee: 0d a0        	j	34 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x56>
800033f0: 05 46        	addi	a2, zero, 1
800033f2: 42 65        	ld	a0, 16(sp)
800033f4: a2 65        	ld	a1, 8(sp)
800033f6: 97 00 00 00  	auipc	ra, 0
800033fa: e7 80 a0 1f  	jalr	506(ra)
800033fe: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x46>
80003400: 42 65        	ld	a0, 16(sp)
80003402: 82 65        	ld	a1, 0(sp)
80003404: 97 00 00 00  	auipc	ra, 0
80003408: e7 80 a0 18  	jalr	394(ra)
8000340c: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x54>
8000340e: 11 a0        	j	4 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x58>
80003410: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h83672a3e1fcf75b8E+0x58>
80003412: e2 70        	ld	ra, 56(sp)
80003414: 21 61        	addi	sp, sp, 64
80003416: 82 80        	ret

Disassembly of section .text._ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E:

0000000080003418 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E>:
80003418: 39 71        	addi	sp, sp, -64
8000341a: 06 fc        	sd	ra, 56(sp)
8000341c: 2a f0        	sd	a0, 32(sp)
8000341e: 2e f4        	sd	a1, 40(sp)
80003420: 2e e8        	sd	a1, 16(sp)
80003422: 2a e4        	sd	a0, 8(sp)
80003424: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0xe>
80003426: 01 45        	mv	a0, zero
80003428: 19 e9        	bnez	a0, 22 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x26>
8000342a: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x14>
8000342c: 22 65        	ld	a0, 8(sp)
8000342e: 97 00 00 00  	auipc	ra, 0
80003432: e7 80 80 12  	jalr	296(ra)
80003436: aa 85        	add	a1, zero, a0
80003438: 2a f8        	sd	a0, 48(sp)
8000343a: 2e e0        	sd	a1, 0(sp)
8000343c: 09 a8        	j	18 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x36>
8000343e: 05 46        	addi	a2, zero, 1
80003440: 22 65        	ld	a0, 8(sp)
80003442: c2 65        	ld	a1, 16(sp)
80003444: 97 00 00 00  	auipc	ra, 0
80003448: e7 80 e0 ec  	jalr	-306(ra)
8000344c: 0d a0        	j	34 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x56>
8000344e: 05 46        	addi	a2, zero, 1
80003450: 42 65        	ld	a0, 16(sp)
80003452: a2 65        	ld	a1, 8(sp)
80003454: 97 00 00 00  	auipc	ra, 0
80003458: e7 80 a0 17  	jalr	378(ra)
8000345c: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x46>
8000345e: 42 65        	ld	a0, 16(sp)
80003460: 82 65        	ld	a1, 0(sp)
80003462: 97 00 00 00  	auipc	ra, 0
80003466: e7 80 a0 13  	jalr	314(ra)
8000346a: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x54>
8000346c: 11 a0        	j	4 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x58>
8000346e: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hbc8517baa2a27200E+0x58>
80003470: e2 70        	ld	ra, 56(sp)
80003472: 21 61        	addi	sp, sp, 64
80003474: 82 80        	ret

Disassembly of section .text._ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E:

0000000080003476 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E>:
80003476: 39 71        	addi	sp, sp, -64
80003478: 06 fc        	sd	ra, 56(sp)
8000347a: 2a f0        	sd	a0, 32(sp)
8000347c: 2e f4        	sd	a1, 40(sp)
8000347e: 2e e8        	sd	a1, 16(sp)
80003480: 2a e4        	sd	a0, 8(sp)
80003482: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0xe>
80003484: 01 45        	mv	a0, zero
80003486: 01 ed        	bnez	a0, 24 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x28>
80003488: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x14>
8000348a: 22 65        	ld	a0, 8(sp)
8000348c: 97 00 00 00  	auipc	ra, 0
80003490: e7 80 00 08  	jalr	128(ra)
80003494: aa 85        	add	a1, zero, a0
80003496: a3 0b a1 02  	sb	a0, 55(sp)
8000349a: 2e e0        	sd	a1, 0(sp)
8000349c: 09 a8        	j	18 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x38>
8000349e: 05 46        	addi	a2, zero, 1
800034a0: 22 65        	ld	a0, 8(sp)
800034a2: c2 65        	ld	a1, 16(sp)
800034a4: 97 00 00 00  	auipc	ra, 0
800034a8: e7 80 a0 ea  	jalr	-342(ra)
800034ac: 0d a0        	j	34 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x58>
800034ae: 05 46        	addi	a2, zero, 1
800034b0: 42 65        	ld	a0, 16(sp)
800034b2: a2 65        	ld	a1, 8(sp)
800034b4: 97 00 00 00  	auipc	ra, 0
800034b8: e7 80 e0 15  	jalr	350(ra)
800034bc: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x48>
800034be: 42 65        	ld	a0, 16(sp)
800034c0: 82 65        	ld	a1, 0(sp)
800034c2: 97 00 00 00  	auipc	ra, 0
800034c6: e7 80 80 0e  	jalr	232(ra)
800034ca: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x56>
800034cc: 11 a0        	j	4 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x5a>
800034ce: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17hc89c8c3ed83b2543E+0x5a>
800034d0: e2 70        	ld	ra, 56(sp)
800034d2: 21 61        	addi	sp, sp, 64
800034d4: 82 80        	ret

Disassembly of section .text._ZN4core3ptr4read17h14bab0acaf156d61E:

00000000800034d6 <_ZN4core3ptr4read17h14bab0acaf156d61E>:
800034d6: 5d 71        	addi	sp, sp, -80
800034d8: 86 e4        	sd	ra, 72(sp)
800034da: 2a f0        	sd	a0, 32(sp)
800034dc: a2 75        	ld	a1, 40(sp)
800034de: 2e ec        	sd	a1, 24(sp)
800034e0: 2a e8        	sd	a0, 16(sp)
800034e2: 09 a0        	j	2 <_ZN4core3ptr4read17h14bab0acaf156d61E+0xe>
800034e4: 28 08        	addi	a0, sp, 24
800034e6: aa e0        	sd	a0, 64(sp)
800034e8: 09 a0        	j	2 <_ZN4core3ptr4read17h14bab0acaf156d61E+0x14>
800034ea: 2c 08        	addi	a1, sp, 24
800034ec: 05 46        	addi	a2, zero, 1
800034ee: 42 65        	ld	a0, 16(sp)
800034f0: 97 00 00 00  	auipc	ra, 0
800034f4: e7 80 00 10  	jalr	256(ra)
800034f8: 09 a0        	j	2 <_ZN4core3ptr4read17h14bab0acaf156d61E+0x24>
800034fa: 62 65        	ld	a0, 24(sp)
800034fc: 2a f8        	sd	a0, 48(sp)
800034fe: 2a fc        	sd	a0, 56(sp)
80003500: 2a e4        	sd	a0, 8(sp)
80003502: 09 a0        	j	2 <_ZN4core3ptr4read17h14bab0acaf156d61E+0x2e>
80003504: 22 65        	ld	a0, 8(sp)
80003506: a6 60        	ld	ra, 72(sp)
80003508: 61 61        	addi	sp, sp, 80
8000350a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr4read17h170ee5dcc8d08e87E:

000000008000350c <_ZN4core3ptr4read17h170ee5dcc8d08e87E>:
8000350c: 39 71        	addi	sp, sp, -64
8000350e: 06 fc        	sd	ra, 56(sp)
80003510: 2a f0        	sd	a0, 32(sp)
80003512: 83 05 d1 02  	lb	a1, 45(sp)
80003516: a3 0f b1 00  	sb	a1, 31(sp)
8000351a: 2a e8        	sd	a0, 16(sp)
8000351c: 09 a0        	j	2 <_ZN4core3ptr4read17h170ee5dcc8d08e87E+0x12>
8000351e: 13 05 f1 01  	addi	a0, sp, 31
80003522: 2a f8        	sd	a0, 48(sp)
80003524: 09 a0        	j	2 <_ZN4core3ptr4read17h170ee5dcc8d08e87E+0x1a>
80003526: 93 05 f1 01  	addi	a1, sp, 31
8000352a: 05 46        	addi	a2, zero, 1
8000352c: 42 65        	ld	a0, 16(sp)
8000352e: 97 00 00 00  	auipc	ra, 0
80003532: e7 80 40 0e  	jalr	228(ra)
80003536: 09 a0        	j	2 <_ZN4core3ptr4read17h170ee5dcc8d08e87E+0x2c>
80003538: 03 45 f1 01  	lbu	a0, 31(sp)
8000353c: 23 07 a1 02  	sb	a0, 46(sp)
80003540: 93 75 15 00  	andi	a1, a0, 1
80003544: a3 07 b1 02  	sb	a1, 47(sp)
80003548: 2a e4        	sd	a0, 8(sp)
8000354a: 09 a0        	j	2 <_ZN4core3ptr4read17h170ee5dcc8d08e87E+0x40>
8000354c: 22 65        	ld	a0, 8(sp)
8000354e: 05 89        	andi	a0, a0, 1
80003550: e2 70        	ld	ra, 56(sp)
80003552: 21 61        	addi	sp, sp, 64
80003554: 82 80        	ret

Disassembly of section .text._ZN4core3ptr4read17h90dd08e6bddce606E:

0000000080003556 <_ZN4core3ptr4read17h90dd08e6bddce606E>:
80003556: 5d 71        	addi	sp, sp, -80
80003558: 86 e4        	sd	ra, 72(sp)
8000355a: 2a f0        	sd	a0, 32(sp)
8000355c: a2 75        	ld	a1, 40(sp)
8000355e: 2e ec        	sd	a1, 24(sp)
80003560: 2a e8        	sd	a0, 16(sp)
80003562: 09 a0        	j	2 <_ZN4core3ptr4read17h90dd08e6bddce606E+0xe>
80003564: 28 08        	addi	a0, sp, 24
80003566: aa e0        	sd	a0, 64(sp)
80003568: 2a e4        	sd	a0, 8(sp)
8000356a: 09 a0        	j	2 <_ZN4core3ptr4read17h90dd08e6bddce606E+0x16>
8000356c: 05 46        	addi	a2, zero, 1
8000356e: 42 65        	ld	a0, 16(sp)
80003570: a2 65        	ld	a1, 8(sp)
80003572: 97 00 00 00  	auipc	ra, 0
80003576: e7 80 c0 05  	jalr	92(ra)
8000357a: 09 a0        	j	2 <_ZN4core3ptr4read17h90dd08e6bddce606E+0x26>
8000357c: 62 65        	ld	a0, 24(sp)
8000357e: 2a f8        	sd	a0, 48(sp)
80003580: 2a fc        	sd	a0, 56(sp)
80003582: 2a e0        	sd	a0, 0(sp)
80003584: 09 a0        	j	2 <_ZN4core3ptr4read17h90dd08e6bddce606E+0x30>
80003586: 02 65        	ld	a0, 0(sp)
80003588: a6 60        	ld	ra, 72(sp)
8000358a: 61 61        	addi	sp, sp, 80
8000358c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17h0c3a3aaa96104b1cE:

000000008000358e <_ZN4core3ptr5write17h0c3a3aaa96104b1cE>:
8000358e: 41 11        	addi	sp, sp, -16
80003590: 2e e0        	sd	a1, 0(sp)
80003592: 2a e4        	sd	a0, 8(sp)
80003594: 0c e1        	sd	a1, 0(a0)
80003596: 09 a0        	j	2 <_ZN4core3ptr5write17h0c3a3aaa96104b1cE+0xa>
80003598: 41 01        	addi	sp, sp, 16
8000359a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17h90decb7fa81a2c31E:

000000008000359c <_ZN4core3ptr5write17h90decb7fa81a2c31E>:
8000359c: 41 11        	addi	sp, sp, -16
8000359e: 2e e0        	sd	a1, 0(sp)
800035a0: 2a e4        	sd	a0, 8(sp)
800035a2: 0c e1        	sd	a1, 0(a0)
800035a4: 09 a0        	j	2 <_ZN4core3ptr5write17h90decb7fa81a2c31E+0xa>
800035a6: 41 01        	addi	sp, sp, 16
800035a8: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17h984695284f32f599E:

00000000800035aa <_ZN4core3ptr5write17h984695284f32f599E>:
800035aa: 41 11        	addi	sp, sp, -16
800035ac: 2e 86        	add	a2, zero, a1
800035ae: a3 03 b1 00  	sb	a1, 7(sp)
800035b2: 2a e4        	sd	a0, 8(sp)
800035b4: 23 00 b5 00  	sb	a1, 0(a0)
800035b8: 09 a0        	j	2 <_ZN4core3ptr5write17h984695284f32f599E+0x10>
800035ba: 41 01        	addi	sp, sp, 16
800035bc: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17hdcdfcaf4192232a4E:

00000000800035be <_ZN4core3ptr5write17hdcdfcaf4192232a4E>:
800035be: 01 11        	addi	sp, sp, -32
800035c0: 2e e8        	sd	a1, 16(sp)
800035c2: 2e e4        	sd	a1, 8(sp)
800035c4: 2a ec        	sd	a0, 24(sp)
800035c6: 0c e1        	sd	a1, 0(a0)
800035c8: 09 a0        	j	2 <_ZN4core3ptr5write17hdcdfcaf4192232a4E+0xc>
800035ca: 05 61        	addi	sp, sp, 32
800035cc: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics19copy_nonoverlapping17h2a6f99db607bba7fE:

00000000800035ce <_ZN4core10intrinsics19copy_nonoverlapping17h2a6f99db607bba7fE>:
800035ce: 79 71        	addi	sp, sp, -48
800035d0: 06 f4        	sd	ra, 40(sp)
800035d2: 2a e8        	sd	a0, 16(sp)
800035d4: 2e ec        	sd	a1, 24(sp)
800035d6: 32 f0        	sd	a2, 32(sp)
800035d8: 0e 06        	slli	a2, a2, 3
800035da: 2a e4        	sd	a0, 8(sp)
800035dc: 2e 85        	add	a0, zero, a1
800035de: a2 65        	ld	a1, 8(sp)
800035e0: 97 a0 00 00  	auipc	ra, 10
800035e4: e7 80 c0 03  	jalr	60(ra)
800035e8: 09 a0        	j	2 <_ZN4core10intrinsics19copy_nonoverlapping17h2a6f99db607bba7fE+0x1c>
800035ea: a2 70        	ld	ra, 40(sp)
800035ec: 45 61        	addi	sp, sp, 48
800035ee: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics19copy_nonoverlapping17h9e9437416c5b7055E:

00000000800035f0 <_ZN4core10intrinsics19copy_nonoverlapping17h9e9437416c5b7055E>:
800035f0: 79 71        	addi	sp, sp, -48
800035f2: 06 f4        	sd	ra, 40(sp)
800035f4: 2a e8        	sd	a0, 16(sp)
800035f6: 2e ec        	sd	a1, 24(sp)
800035f8: 32 f0        	sd	a2, 32(sp)
800035fa: 0e 06        	slli	a2, a2, 3
800035fc: 2a e4        	sd	a0, 8(sp)
800035fe: 2e 85        	add	a0, zero, a1
80003600: a2 65        	ld	a1, 8(sp)
80003602: 97 a0 00 00  	auipc	ra, 10
80003606: e7 80 a0 01  	jalr	26(ra)
8000360a: 09 a0        	j	2 <_ZN4core10intrinsics19copy_nonoverlapping17h9e9437416c5b7055E+0x1c>
8000360c: a2 70        	ld	ra, 40(sp)
8000360e: 45 61        	addi	sp, sp, 48
80003610: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics19copy_nonoverlapping17he60a6b3f294859b3E:

0000000080003612 <_ZN4core10intrinsics19copy_nonoverlapping17he60a6b3f294859b3E>:
80003612: 79 71        	addi	sp, sp, -48
80003614: 06 f4        	sd	ra, 40(sp)
80003616: 2a e8        	sd	a0, 16(sp)
80003618: 2e ec        	sd	a1, 24(sp)
8000361a: 32 f0        	sd	a2, 32(sp)
8000361c: 2a e4        	sd	a0, 8(sp)
8000361e: 2e 85        	add	a0, zero, a1
80003620: a2 65        	ld	a1, 8(sp)
80003622: 97 a0 00 00  	auipc	ra, 10
80003626: e7 80 a0 ff  	jalr	-6(ra)
8000362a: 09 a0        	j	2 <_ZN4core10intrinsics19copy_nonoverlapping17he60a6b3f294859b3E+0x1a>
8000362c: a2 70        	ld	ra, 40(sp)
8000362e: 45 61        	addi	sp, sp, 48
80003630: 82 80        	ret

Disassembly of section .text._ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E:

0000000080003632 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E>:
80003632: 0d 71        	addi	sp, sp, -352
80003634: 86 ee        	sd	ra, 344(sp)
80003636: a2 ea        	sd	s0, 336(sp)
80003638: 80 12        	addi	s0, sp, 352
8000363a: 13 71 01 fe  	andi	sp, sp, -32
8000363e: aa f5        	sd	a0, 232(sp)
80003640: ae f9        	sd	a1, 240(sp)
80003642: b2 fd        	sd	a2, 248(sp)
80003644: 93 06 00 02  	addi	a3, zero, 32
80003648: 36 e2        	sd	a3, 256(sp)
8000364a: 32 e5        	sd	a2, 136(sp)
8000364c: 2e e1        	sd	a1, 128(sp)
8000364e: aa fc        	sd	a0, 120(sp)
80003650: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x20>
80003652: 01 45        	mv	a0, zero
80003654: 2a ed        	sd	a0, 152(sp)
80003656: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x26>
80003658: 6a 65        	ld	a0, 152(sp)
8000365a: 13 05 05 02  	addi	a0, a0, 32
8000365e: aa 65        	ld	a1, 136(sp)
80003660: 63 f8 a5 00  	bgeu	a1, a0, 16 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x3e>
80003664: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x34>
80003666: 6a 65        	ld	a0, 152(sp)
80003668: aa 65        	ld	a1, 136(sp)
8000366a: 63 6f b5 06  	bltu	a0, a1, 126 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xb6>
8000366e: b5 a8        	j	124 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xb8>
80003670: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x40>
80003672: 08 11        	addi	a0, sp, 160
80003674: aa e6        	sd	a0, 328(sp)
80003676: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x46>
80003678: 08 11        	addi	a0, sp, 160
8000367a: 2a e6        	sd	a0, 264(sp)
8000367c: ea 65        	ld	a1, 152(sp)
8000367e: 66 76        	ld	a2, 120(sp)
80003680: aa f8        	sd	a0, 112(sp)
80003682: 32 85        	add	a0, zero, a2
80003684: 97 80 00 00  	auipc	ra, 8
80003688: e7 80 40 89  	jalr	-1900(ra)
8000368c: aa 85        	add	a1, zero, a0
8000368e: 2a ea        	sd	a0, 272(sp)
80003690: ae f4        	sd	a1, 104(sp)
80003692: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x62>
80003694: ea 65        	ld	a1, 152(sp)
80003696: 0a 65        	ld	a0, 128(sp)
80003698: 97 80 00 00  	auipc	ra, 8
8000369c: e7 80 00 88  	jalr	-1920(ra)
800036a0: aa 85        	add	a1, zero, a0
800036a2: 2a ee        	sd	a0, 280(sp)
800036a4: ae f0        	sd	a1, 96(sp)
800036a6: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x76>
800036a8: 13 06 00 02  	addi	a2, zero, 32
800036ac: 26 75        	ld	a0, 104(sp)
800036ae: c6 75        	ld	a1, 112(sp)
800036b0: 97 80 00 00  	auipc	ra, 8
800036b4: e7 80 a0 e5  	jalr	-422(ra)
800036b8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x88>
800036ba: 13 06 00 02  	addi	a2, zero, 32
800036be: 06 75        	ld	a0, 96(sp)
800036c0: a6 75        	ld	a1, 104(sp)
800036c2: 97 80 00 00  	auipc	ra, 8
800036c6: e7 80 80 e4  	jalr	-440(ra)
800036ca: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x9a>
800036cc: 13 06 00 02  	addi	a2, zero, 32
800036d0: 46 75        	ld	a0, 112(sp)
800036d2: 86 75        	ld	a1, 96(sp)
800036d4: 97 80 00 00  	auipc	ra, 8
800036d8: e7 80 60 e3  	jalr	-458(ra)
800036dc: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xac>
800036de: 6a 65        	ld	a0, 152(sp)
800036e0: 13 05 05 02  	addi	a0, a0, 32
800036e4: 2a ed        	sd	a0, 152(sp)
800036e6: 8d bf        	j	-142 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x26>
800036e8: 11 a0        	j	4 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xba>
800036ea: ad a8        	j	122 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x132>
800036ec: 6a 65        	ld	a0, 152(sp)
800036ee: aa 65        	ld	a1, 136(sp)
800036f0: 33 85 a5 40  	sub	a0, a1, a0
800036f4: 2a f2        	sd	a0, 288(sp)
800036f6: b0 01        	addi	a2, sp, 200
800036f8: b2 e2        	sd	a2, 320(sp)
800036fa: aa ec        	sd	a0, 88(sp)
800036fc: b2 e8        	sd	a2, 80(sp)
800036fe: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xce>
80003700: 46 65        	ld	a0, 80(sp)
80003702: c6 65        	ld	a1, 80(sp)
80003704: 2e f6        	sd	a1, 296(sp)
80003706: ea 65        	ld	a1, 152(sp)
80003708: 66 76        	ld	a2, 120(sp)
8000370a: aa e4        	sd	a0, 72(sp)
8000370c: 32 85        	add	a0, zero, a2
8000370e: 97 80 00 00  	auipc	ra, 8
80003712: e7 80 a0 80  	jalr	-2038(ra)
80003716: aa 85        	add	a1, zero, a0
80003718: 2a fa        	sd	a0, 304(sp)
8000371a: ae e0        	sd	a1, 64(sp)
8000371c: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0xec>
8000371e: ea 65        	ld	a1, 152(sp)
80003720: 0a 65        	ld	a0, 128(sp)
80003722: 97 70 00 00  	auipc	ra, 7
80003726: e7 80 60 7f  	jalr	2038(ra)
8000372a: aa 85        	add	a1, zero, a0
8000372c: 2a fe        	sd	a0, 312(sp)
8000372e: 2e fc        	sd	a1, 56(sp)
80003730: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x100>
80003732: 06 65        	ld	a0, 64(sp)
80003734: a6 65        	ld	a1, 72(sp)
80003736: 66 66        	ld	a2, 88(sp)
80003738: 97 80 00 00  	auipc	ra, 8
8000373c: e7 80 20 dd  	jalr	-558(ra)
80003740: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x110>
80003742: 62 75        	ld	a0, 56(sp)
80003744: 86 65        	ld	a1, 64(sp)
80003746: 66 66        	ld	a2, 88(sp)
80003748: 97 80 00 00  	auipc	ra, 8
8000374c: e7 80 20 dc  	jalr	-574(ra)
80003750: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x120>
80003752: 26 65        	ld	a0, 72(sp)
80003754: e2 75        	ld	a1, 56(sp)
80003756: 66 66        	ld	a2, 88(sp)
80003758: 97 80 00 00  	auipc	ra, 8
8000375c: e7 80 20 db  	jalr	-590(ra)
80003760: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x130>
80003762: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h1776158ee1ba4c44E+0x132>
80003764: 13 01 04 ea  	addi	sp, s0, -352
80003768: 56 64        	ld	s0, 336(sp)
8000376a: f6 60        	ld	ra, 344(sp)
8000376c: 35 61        	addi	sp, sp, 352
8000376e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h9010da0137b8a0acE:

0000000080003770 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h9010da0137b8a0acE>:
80003770: 01 11        	addi	sp, sp, -32
80003772: 06 ec        	sd	ra, 24(sp)
80003774: 2a e4        	sd	a0, 8(sp)
80003776: 2e e8        	sd	a1, 16(sp)
80003778: 97 00 00 00  	auipc	ra, 0
8000377c: e7 80 40 01  	jalr	20(ra)
80003780: 2a e0        	sd	a0, 0(sp)
80003782: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h9010da0137b8a0acE+0x14>
80003784: 02 65        	ld	a0, 0(sp)
80003786: e2 60        	ld	ra, 24(sp)
80003788: 05 61        	addi	sp, sp, 32
8000378a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h31a6e48f4721c2d0E:

000000008000378c <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h31a6e48f4721c2d0E>:
8000378c: 01 11        	addi	sp, sp, -32
8000378e: 2a e4        	sd	a0, 8(sp)
80003790: 2e e8        	sd	a1, 16(sp)
80003792: 8e 05        	slli	a1, a1, 3
80003794: 2e 95        	add	a0, a0, a1
80003796: 2a ec        	sd	a0, 24(sp)
80003798: 2a e0        	sd	a0, 0(sp)
8000379a: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h31a6e48f4721c2d0E+0x10>
8000379c: 02 65        	ld	a0, 0(sp)
8000379e: 05 61        	addi	sp, sp, 32
800037a0: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hfc6bed6cd069ee32E:

00000000800037a2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hfc6bed6cd069ee32E>:
800037a2: 79 71        	addi	sp, sp, -48
800037a4: 06 f4        	sd	ra, 40(sp)
800037a6: 2a f0        	sd	a0, 32(sp)
800037a8: 2a ec        	sd	a0, 24(sp)
800037aa: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hfc6bed6cd069ee32E+0xa>
800037ac: 01 45        	mv	a0, zero
800037ae: e2 65        	ld	a1, 24(sp)
800037b0: 2a e8        	sd	a0, 16(sp)
800037b2: 2e 85        	add	a0, zero, a1
800037b4: c2 65        	ld	a1, 16(sp)
800037b6: 97 70 00 00  	auipc	ra, 7
800037ba: e7 80 80 74  	jalr	1864(ra)
800037be: 2a e4        	sd	a0, 8(sp)
800037c0: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hfc6bed6cd069ee32E+0x20>
800037c2: 22 65        	ld	a0, 8(sp)
800037c4: a2 70        	ld	ra, 40(sp)
800037c6: 45 61        	addi	sp, sp, 48
800037c8: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h7830fbcda5622b17E:

00000000800037ca <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h7830fbcda5622b17E>:
800037ca: 41 11        	addi	sp, sp, -16
800037cc: 2a e0        	sd	a0, 0(sp)
800037ce: 2e e4        	sd	a1, 8(sp)
800037d0: 41 01        	addi	sp, sp, 16
800037d2: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h3db6ca8326c2f5d3E:

00000000800037d4 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h3db6ca8326c2f5d3E>:
800037d4: 01 11        	addi	sp, sp, -32
800037d6: 2a e8        	sd	a0, 16(sp)
800037d8: 2e ec        	sd	a1, 24(sp)
800037da: 2a e0        	sd	a0, 0(sp)
800037dc: 2e e4        	sd	a1, 8(sp)
800037de: 2e 85        	add	a0, zero, a1
800037e0: 05 61        	addi	sp, sp, 32
800037e2: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17h474417ed58d915dcE:

00000000800037e4 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17h474417ed58d915dcE>:
800037e4: 41 11        	addi	sp, sp, -16
800037e6: 2a e0        	sd	a0, 0(sp)
800037e8: 2e e4        	sd	a1, 8(sp)
800037ea: 41 01        	addi	sp, sp, 16
800037ec: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h1ad822e0f6a3b5fbE:

00000000800037ee <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h1ad822e0f6a3b5fbE>:
800037ee: 79 71        	addi	sp, sp, -48
800037f0: 06 f4        	sd	ra, 40(sp)
800037f2: 2a ec        	sd	a0, 24(sp)
800037f4: 2e f0        	sd	a1, 32(sp)
800037f6: 97 f0 ff ff  	auipc	ra, 1048575
800037fa: e7 80 60 6b  	jalr	1718(ra)
800037fe: 2a e8        	sd	a0, 16(sp)
80003800: 2e e4        	sd	a1, 8(sp)
80003802: 09 a0        	j	2 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$8iter_mut17h1ad822e0f6a3b5fbE+0x16>
80003804: 42 65        	ld	a0, 16(sp)
80003806: a2 65        	ld	a1, 8(sp)
80003808: a2 70        	ld	ra, 40(sp)
8000380a: 45 61        	addi	sp, sp, 48
8000380c: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry3new17h99997866d767c0a8E:

000000008000380e <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry3new17h99997866d767c0a8E>:
8000380e: 41 11        	addi	sp, sp, -16
80003810: 2a e4        	sd	a0, 8(sp)
80003812: 2a e0        	sd	a0, 0(sp)
80003814: 41 01        	addi	sp, sp, 16
80003816: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8as_usize17h8f8cd30f218f7274E:

0000000080003818 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8as_usize17h8f8cd30f218f7274E>:
80003818: 41 11        	addi	sp, sp, -16
8000381a: 2a e4        	sd	a0, 8(sp)
8000381c: 08 61        	ld	a0, 0(a0)
8000381e: 41 01        	addi	sp, sp, 16
80003820: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8is_valid17hcb7b484d15a61bd9E:

0000000080003822 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8is_valid17hcb7b484d15a61bd9E>:
80003822: 01 11        	addi	sp, sp, -32
80003824: 06 ec        	sd	ra, 24(sp)
80003826: 2a e8        	sd	a0, 16(sp)
80003828: 08 61        	ld	a0, 0(a0)

000000008000382a <.LBB3_2>:
8000382a: 97 a5 00 00  	auipc	a1, 10
8000382e: 93 85 e5 f8  	addi	a1, a1, -114
80003832: 2a e4        	sd	a0, 8(sp)
80003834: 2e 85        	add	a0, zero, a1
80003836: 97 00 00 00  	auipc	ra, 0
8000383a: e7 80 c0 16  	jalr	364(ra)
8000383e: 2a e0        	sd	a0, 0(sp)
80003840: 09 a0        	j	2 <.LBB3_2+0x18>
80003842: 22 65        	ld	a0, 8(sp)
80003844: 82 65        	ld	a1, 0(sp)
80003846: 33 76 b5 00  	and	a2, a0, a1
8000384a: 33 35 c0 00  	snez	a0, a2
8000384e: e2 60        	ld	ra, 24(sp)
80003850: 05 61        	addi	sp, sp, 32
80003852: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry7is_read17hc45c6206b7cf73efE:

0000000080003854 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry7is_read17hc45c6206b7cf73efE>:
80003854: 01 11        	addi	sp, sp, -32
80003856: 06 ec        	sd	ra, 24(sp)
80003858: 2a e8        	sd	a0, 16(sp)
8000385a: 08 61        	ld	a0, 0(a0)

000000008000385c <.LBB4_2>:
8000385c: 97 a5 00 00  	auipc	a1, 10
80003860: 93 85 c5 f1  	addi	a1, a1, -228
80003864: 2a e4        	sd	a0, 8(sp)
80003866: 2e 85        	add	a0, zero, a1
80003868: 97 00 00 00  	auipc	ra, 0
8000386c: e7 80 a0 13  	jalr	314(ra)
80003870: 2a e0        	sd	a0, 0(sp)
80003872: 09 a0        	j	2 <.LBB4_2+0x18>
80003874: 22 65        	ld	a0, 8(sp)
80003876: 82 65        	ld	a1, 0(sp)
80003878: 33 76 b5 00  	and	a2, a0, a1
8000387c: 33 35 c0 00  	snez	a0, a2
80003880: e2 60        	ld	ra, 24(sp)
80003882: 05 61        	addi	sp, sp, 32
80003884: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8is_write17hedc7dfba2c6a4e1bE:

0000000080003886 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8is_write17hedc7dfba2c6a4e1bE>:
80003886: 01 11        	addi	sp, sp, -32
80003888: 06 ec        	sd	ra, 24(sp)
8000388a: 2a e8        	sd	a0, 16(sp)
8000388c: 08 61        	ld	a0, 0(a0)

000000008000388e <.LBB5_2>:
8000388e: 97 a5 00 00  	auipc	a1, 10
80003892: 93 85 a5 eb  	addi	a1, a1, -326
80003896: 2a e4        	sd	a0, 8(sp)
80003898: 2e 85        	add	a0, zero, a1
8000389a: 97 00 00 00  	auipc	ra, 0
8000389e: e7 80 80 10  	jalr	264(ra)
800038a2: 2a e0        	sd	a0, 0(sp)
800038a4: 09 a0        	j	2 <.LBB5_2+0x18>
800038a6: 22 65        	ld	a0, 8(sp)
800038a8: 82 65        	ld	a1, 0(sp)
800038aa: 33 76 b5 00  	and	a2, a0, a1
800038ae: 33 35 c0 00  	snez	a0, a2
800038b2: e2 60        	ld	ra, 24(sp)
800038b4: 05 61        	addi	sp, sp, 32
800038b6: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10is_execute17h9dd1cd436703e639E:

00000000800038b8 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10is_execute17h9dd1cd436703e639E>:
800038b8: 01 11        	addi	sp, sp, -32
800038ba: 06 ec        	sd	ra, 24(sp)
800038bc: 2a e8        	sd	a0, 16(sp)
800038be: 08 61        	ld	a0, 0(a0)

00000000800038c0 <.LBB6_2>:
800038c0: 97 a5 00 00  	auipc	a1, 10
800038c4: 93 85 85 ec  	addi	a1, a1, -312
800038c8: 2a e4        	sd	a0, 8(sp)
800038ca: 2e 85        	add	a0, zero, a1
800038cc: 97 00 00 00  	auipc	ra, 0
800038d0: e7 80 60 0d  	jalr	214(ra)
800038d4: 2a e0        	sd	a0, 0(sp)
800038d6: 09 a0        	j	2 <.LBB6_2+0x18>
800038d8: 22 65        	ld	a0, 8(sp)
800038da: 82 65        	ld	a1, 0(sp)
800038dc: 33 76 b5 00  	and	a2, a0, a1
800038e0: 33 35 c0 00  	snez	a0, a2
800038e4: e2 60        	ld	ra, 24(sp)
800038e6: 05 61        	addi	sp, sp, 32
800038e8: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry12as_pagetable17h6813d0ed04f8c670E:

00000000800038ea <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry12as_pagetable17h6813d0ed04f8c670E>:
800038ea: 01 11        	addi	sp, sp, -32
800038ec: 2a e8        	sd	a0, 16(sp)
800038ee: 08 61        	ld	a0, 0(a0)
800038f0: 29 81        	srli	a0, a0, 10
800038f2: 2a e4        	sd	a0, 8(sp)
800038f4: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry12as_pagetable17h6813d0ed04f8c670E+0xc>
800038f6: 22 65        	ld	a0, 8(sp)
800038f8: 93 15 c5 00  	slli	a1, a0, 12
800038fc: 2e e0        	sd	a1, 0(sp)
800038fe: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry12as_pagetable17h6813d0ed04f8c670E+0x16>
80003900: 02 65        	ld	a0, 0(sp)
80003902: 2a ec        	sd	a0, 24(sp)
80003904: 05 61        	addi	sp, sp, 32
80003906: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8as_flags17h918ad316e91b7830E:

0000000080003908 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8as_flags17h918ad316e91b7830E>:
80003908: 01 11        	addi	sp, sp, -32
8000390a: 06 ec        	sd	ra, 24(sp)
8000390c: 2a e8        	sd	a0, 16(sp)
8000390e: 97 00 00 00  	auipc	ra, 0
80003912: e7 80 a0 f0  	jalr	-246(ra)
80003916: 2a e4        	sd	a0, 8(sp)
80003918: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry8as_flags17h918ad316e91b7830E+0x12>
8000391a: 22 65        	ld	a0, 8(sp)
8000391c: 13 75 f5 3f  	andi	a0, a0, 1023
80003920: e2 60        	ld	ra, 24(sp)
80003922: 05 61        	addi	sp, sp, 32
80003924: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_zero17h1270dd66dbcf0ccbE:

0000000080003926 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_zero17h1270dd66dbcf0ccbE>:
80003926: 41 11        	addi	sp, sp, -16
80003928: 2a e4        	sd	a0, 8(sp)
8000392a: 81 45        	mv	a1, zero
8000392c: 0c e1        	sd	a1, 0(a0)
8000392e: 41 01        	addi	sp, sp, 16
80003930: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E:

0000000080003932 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E>:
80003932: 1d 71        	addi	sp, sp, -96
80003934: 86 ec        	sd	ra, 88(sp)
80003936: 2e fc        	sd	a1, 56(sp)
80003938: aa e4        	sd	a0, 72(sp)
8000393a: b2 e8        	sd	a2, 80(sp)
8000393c: 2c 18        	addi	a1, sp, 56
8000393e: 2a f8        	sd	a0, 48(sp)
80003940: 2e 85        	add	a0, zero, a1
80003942: 32 f4        	sd	a2, 40(sp)
80003944: 97 00 00 00  	auipc	ra, 0
80003948: e7 80 80 10  	jalr	264(ra)
8000394c: 2a f0        	sd	a0, 32(sp)
8000394e: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E+0x1e>
80003950: 02 75        	ld	a0, 32(sp)
80003952: 93 55 c5 00  	srli	a1, a0, 12
80003956: 2e ec        	sd	a1, 24(sp)
80003958: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E+0x28>
8000395a: 62 65        	ld	a0, 24(sp)
8000395c: 93 15 a5 00  	slli	a1, a0, 10
80003960: 2e e8        	sd	a1, 16(sp)
80003962: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E+0x32>
80003964: 85 45        	addi	a1, zero, 1
80003966: 22 75        	ld	a0, 40(sp)
80003968: 97 00 00 00  	auipc	ra, 0
8000396c: e7 80 c0 02  	jalr	44(ra)
80003970: aa e0        	sd	a0, 64(sp)
80003972: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E+0x42>
80003974: 88 00        	addi	a0, sp, 64
80003976: 97 00 00 00  	auipc	ra, 0
8000397a: e7 80 c0 02  	jalr	44(ra)
8000397e: 2a e4        	sd	a0, 8(sp)
80003980: 09 a0        	j	2 <_ZN6kernel6memory7mapping16page_table_entry14PageTableEntry10write_perm17h430624c31c5c7395E+0x50>
80003982: 42 65        	ld	a0, 16(sp)
80003984: a2 65        	ld	a1, 8(sp)
80003986: 33 66 b5 00  	or	a2, a0, a1
8000398a: c2 76        	ld	a3, 48(sp)
8000398c: 90 e2        	sd	a2, 0(a3)
8000398e: e6 60        	ld	ra, 88(sp)
80003990: 25 61        	addi	sp, sp, 96
80003992: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..memory..mapping..page_table_entry..PteFlags$u20$as$u20$core..ops..bit..BitOr$GT$5bitor17hcec3094fb7de8463E:

0000000080003994 <_ZN93_$LT$kernel..memory..mapping..page_table_entry..PteFlags$u20$as$u20$core..ops..bit..BitOr$GT$5bitor17hcec3094fb7de8463E>:
80003994: 01 11        	addi	sp, sp, -32
80003996: 2a e8        	sd	a0, 16(sp)
80003998: 2e ec        	sd	a1, 24(sp)
8000399a: 4d 8d        	or	a0, a0, a1
8000399c: 2a e4        	sd	a0, 8(sp)
8000399e: 05 61        	addi	sp, sp, 32
800039a0: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping16page_table_entry8PteFlags4bits17h71940e5eefdd585fE:

00000000800039a2 <_ZN6kernel6memory7mapping16page_table_entry8PteFlags4bits17h71940e5eefdd585fE>:
800039a2: 41 11        	addi	sp, sp, -16
800039a4: 2a e4        	sd	a0, 8(sp)
800039a6: 08 61        	ld	a0, 0(a0)
800039a8: 41 01        	addi	sp, sp, 16
800039aa: 82 80        	ret

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h1d053e02ce4d8b26E:

00000000800039ac <_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h1d053e02ce4d8b26E>:
800039ac: 01 11        	addi	sp, sp, -32
800039ae: 2a 86        	add	a2, zero, a0
800039b0: a3 07 a1 00  	sb	a0, 15(sp)
800039b4: aa 86        	add	a3, zero, a0
800039b6: 01 47        	mv	a4, zero
800039b8: 2e e0        	sd	a1, 0(sp)
800039ba: 63 05 e5 02  	beq	a0, a4, 42 <.LBB0_6+0x1c>
800039be: 09 a0        	j	2 <.LBB0_5>

00000000800039c0 <.LBB0_5>:
800039c0: 17 a5 00 00  	auipc	a0, 10
800039c4: 13 05 15 18  	addi	a0, a0, 385

00000000800039c8 <.LBB0_6>:
800039c8: 97 a6 00 00  	auipc	a3, 10
800039cc: 93 86 86 1a  	addi	a3, a3, 424
800039d0: 93 05 b0 02  	addi	a1, zero, 43
800039d4: 10 08        	addi	a2, sp, 16
800039d6: 02 67        	ld	a4, 0(sp)
800039d8: 97 80 00 00  	auipc	ra, 8
800039dc: e7 80 a0 c1  	jalr	-998(ra)
800039e0: 00 00        	unimp	
800039e2: 00 00        	unimp	
800039e4: 05 61        	addi	sp, sp, 32
800039e6: 82 80        	ret

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hf8d391eac9ef2832E:

00000000800039e8 <_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hf8d391eac9ef2832E>:
800039e8: 01 11        	addi	sp, sp, -32
800039ea: ae 86        	add	a3, zero, a1
800039ec: 2a 87        	add	a4, zero, a0
800039ee: 23 08 a1 00  	sb	a0, 16(sp)
800039f2: a3 08 b1 00  	sb	a1, 17(sp)
800039f6: aa 85        	add	a1, zero, a0
800039f8: 81 47        	mv	a5, zero
800039fa: 32 e4        	sd	a2, 8(sp)
800039fc: 63 05 f5 02  	beq	a0, a5, 42 <.LBB1_6+0x1c>
80003a00: 09 a0        	j	2 <.LBB1_5>

0000000080003a02 <.LBB1_5>:
80003a02: 17 a5 00 00  	auipc	a0, 10
80003a06: 13 05 f5 13  	addi	a0, a0, 319

0000000080003a0a <.LBB1_6>:
80003a0a: 97 a6 00 00  	auipc	a3, 10
80003a0e: 93 86 66 18  	addi	a3, a3, 390
80003a12: 93 05 b0 02  	addi	a1, zero, 43
80003a16: 30 08        	addi	a2, sp, 24
80003a18: 22 67        	ld	a4, 8(sp)
80003a1a: 97 80 00 00  	auipc	ra, 8
80003a1e: e7 80 80 bd  	jalr	-1064(ra)
80003a22: 00 00        	unimp	
80003a24: 00 00        	unimp	
80003a26: 03 05 11 01  	lb	a0, 17(sp)
80003a2a: a3 0f a1 00  	sb	a0, 31(sp)
80003a2e: 05 61        	addi	sp, sp, 32
80003a30: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address103_$LT$impl$u20$core..convert..From$LT$kernel..memory..address..PhysicalAddress$GT$$u20$for$u20$usize$GT$4from17he690e7d4b6fa3303E:

0000000080003a32 <_ZN6kernel6memory7address103_$LT$impl$u20$core..convert..From$LT$kernel..memory..address..PhysicalAddress$GT$$u20$for$u20$usize$GT$4from17he690e7d4b6fa3303E>:
80003a32: 41 11        	addi	sp, sp, -16
80003a34: 2a e4        	sd	a0, 8(sp)
80003a36: 41 01        	addi	sp, sp, 16
80003a38: 82 80        	ret

Disassembly of section .text._ZN89_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17hb9302186591dbfa0E:

0000000080003a3a <_ZN89_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17hb9302186591dbfa0E>:
80003a3a: 41 11        	addi	sp, sp, -16
80003a3c: 2a e4        	sd	a0, 8(sp)
80003a3e: 08 61        	ld	a0, 0(a0)
80003a40: 41 01        	addi	sp, sp, 16
80003a42: 82 80        	ret

Disassembly of section .text._ZN89_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$kernel..memory..address..Addr$GT$8data_mut17heb549a31ee94c520E:

0000000080003a44 <_ZN89_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$kernel..memory..address..Addr$GT$8data_mut17heb549a31ee94c520E>:
80003a44: 41 11        	addi	sp, sp, -16
80003a46: 2a e4        	sd	a0, 8(sp)
80003a48: 41 01        	addi	sp, sp, 16
80003a4a: 82 80        	ret

Disassembly of section .text._ZN90_$LT$kernel..memory..address..PhysicalAddress$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17h25ec93a61689fc9aE:

0000000080003a4c <_ZN90_$LT$kernel..memory..address..PhysicalAddress$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17h25ec93a61689fc9aE>:
80003a4c: 41 11        	addi	sp, sp, -16
80003a4e: 2a e4        	sd	a0, 8(sp)
80003a50: 08 61        	ld	a0, 0(a0)
80003a52: 41 01        	addi	sp, sp, 16
80003a54: 82 80        	ret

Disassembly of section .text._ZN90_$LT$kernel..memory..address..PhysicalAddress$u20$as$u20$kernel..memory..address..Addr$GT$8data_mut17h77bca2c736bdbd0fE:

0000000080003a56 <_ZN90_$LT$kernel..memory..address..PhysicalAddress$u20$as$u20$kernel..memory..address..Addr$GT$8data_mut17h77bca2c736bdbd0fE>:
80003a56: 41 11        	addi	sp, sp, -16
80003a58: 2a e4        	sd	a0, 8(sp)
80003a5a: 41 01        	addi	sp, sp, 16
80003a5c: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address14VirtualAddress3new17h8a2e565cd05dbfcaE:

0000000080003a5e <_ZN6kernel6memory7address14VirtualAddress3new17h8a2e565cd05dbfcaE>:
80003a5e: 41 11        	addi	sp, sp, -16
80003a60: 2a e4        	sd	a0, 8(sp)
80003a62: 2a e0        	sd	a0, 0(sp)
80003a64: 41 01        	addi	sp, sp, 16
80003a66: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address14VirtualAddress8add_addr17hc90523961afea0eaE:

0000000080003a68 <_ZN6kernel6memory7address14VirtualAddress8add_addr17hc90523961afea0eaE>:
80003a68: 01 11        	addi	sp, sp, -32
80003a6a: 2a e8        	sd	a0, 16(sp)
80003a6c: 2e ec        	sd	a1, 24(sp)
80003a6e: 08 61        	ld	a0, 0(a0)
80003a70: aa 95        	add	a1, a1, a0
80003a72: 2e e0        	sd	a1, 0(sp)
80003a74: 63 e7 a5 00  	bltu	a1, a0, 14 <.LBB9_3>
80003a78: 09 a0        	j	2 <_ZN6kernel6memory7address14VirtualAddress8add_addr17hc90523961afea0eaE+0x12>
80003a7a: 02 65        	ld	a0, 0(sp)
80003a7c: 2a e4        	sd	a0, 8(sp)
80003a7e: 05 61        	addi	sp, sp, 32
80003a80: 82 80        	ret

0000000080003a82 <.LBB9_3>:
80003a82: 17 a5 00 00  	auipc	a0, 10
80003a86: 13 05 e5 15  	addi	a0, a0, 350

0000000080003a8a <.LBB9_4>:
80003a8a: 17 a6 00 00  	auipc	a2, 10
80003a8e: 13 06 e6 13  	addi	a2, a2, 318
80003a92: f1 45        	addi	a1, zero, 28
80003a94: 97 80 00 00  	auipc	ra, 8
80003a98: e7 80 60 ca  	jalr	-858(ra)
80003a9c: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7address14VirtualAddress8page_num17h6bc5e4406ceac210E:

0000000080003a9e <_ZN6kernel6memory7address14VirtualAddress8page_num17h6bc5e4406ceac210E>:
80003a9e: 79 71        	addi	sp, sp, -48
80003aa0: 2a f0        	sd	a0, 32(sp)
80003aa2: 2e f4        	sd	a1, 40(sp)
80003aa4: 08 61        	ld	a0, 0(a0)
80003aa6: 13 96 35 00  	slli	a2, a1, 3
80003aaa: 2e 96        	add	a2, a2, a1
80003aac: a5 46        	addi	a3, zero, 9
80003aae: b3 b5 d5 02  	<unknown>
80003ab2: 81 46        	mv	a3, zero
80003ab4: 2a ec        	sd	a0, 24(sp)
80003ab6: 32 e8        	sd	a2, 16(sp)
80003ab8: 63 9a d5 02  	bne	a1, a3, 52 <.LBB10_7>
80003abc: 09 a0        	j	2 <_ZN6kernel6memory7address14VirtualAddress8page_num17h6bc5e4406ceac210E+0x20>
80003abe: 42 65        	ld	a0, 16(sp)
80003ac0: 93 05 c5 00  	addi	a1, a0, 12
80003ac4: 2e e4        	sd	a1, 8(sp)
80003ac6: 63 e2 a5 04  	bltu	a1, a0, 68 <.LBB10_9>
80003aca: 09 a0        	j	2 <_ZN6kernel6memory7address14VirtualAddress8page_num17h6bc5e4406ceac210E+0x2e>
80003acc: 22 65        	ld	a0, 8(sp)
80003ace: 93 75 05 fc  	andi	a1, a0, -64
80003ad2: 62 66        	ld	a2, 24(sp)
80003ad4: b3 56 a6 00  	srl	a3, a2, a0
80003ad8: 01 47        	mv	a4, zero
80003ada: 36 e0        	sd	a3, 0(sp)
80003adc: 63 95 e5 04  	bne	a1, a4, 74 <.LBB10_11>
80003ae0: 09 a0        	j	2 <_ZN6kernel6memory7address14VirtualAddress8page_num17h6bc5e4406ceac210E+0x44>
80003ae2: 02 65        	ld	a0, 0(sp)
80003ae4: 13 75 f5 1f  	andi	a0, a0, 511
80003ae8: 45 61        	addi	sp, sp, 48
80003aea: 82 80        	ret

0000000080003aec <.LBB10_7>:
80003aec: 17 a5 00 00  	auipc	a0, 10
80003af0: 13 05 45 13  	addi	a0, a0, 308

0000000080003af4 <.LBB10_8>:
80003af4: 17 a6 00 00  	auipc	a2, 10
80003af8: 13 06 c6 10  	addi	a2, a2, 268
80003afc: 93 05 10 02  	addi	a1, zero, 33
80003b00: 97 80 00 00  	auipc	ra, 8
80003b04: e7 80 a0 c3  	jalr	-966(ra)
80003b08: 00 00        	unimp	

0000000080003b0a <.LBB10_9>:
80003b0a: 17 a5 00 00  	auipc	a0, 10
80003b0e: 13 05 65 0d  	addi	a0, a0, 214

0000000080003b12 <.LBB10_10>:
80003b12: 17 a6 00 00  	auipc	a2, 10
80003b16: 13 06 66 13  	addi	a2, a2, 310
80003b1a: f1 45        	addi	a1, zero, 28
80003b1c: 97 80 00 00  	auipc	ra, 8
80003b20: e7 80 e0 c1  	jalr	-994(ra)
80003b24: 00 00        	unimp	

0000000080003b26 <.LBB10_11>:
80003b26: 17 a5 00 00  	auipc	a0, 10
80003b2a: 13 05 a5 15  	addi	a0, a0, 346

0000000080003b2e <.LBB10_12>:
80003b2e: 17 a6 00 00  	auipc	a2, 10
80003b32: 13 06 26 13  	addi	a2, a2, 306
80003b36: 93 05 40 02  	addi	a1, zero, 36
80003b3a: 97 80 00 00  	auipc	ra, 8
80003b3e: e7 80 00 c0  	jalr	-1024(ra)
80003b42: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7address15PhysicalAddress3new17hd84e24f69d3ba1b6E:

0000000080003b44 <_ZN6kernel6memory7address15PhysicalAddress3new17hd84e24f69d3ba1b6E>:
80003b44: 41 11        	addi	sp, sp, -16
80003b46: 2a e4        	sd	a0, 8(sp)
80003b48: 2a e0        	sd	a0, 0(sp)
80003b4a: 41 01        	addi	sp, sp, 16
80003b4c: 82 80        	ret

Disassembly of section .text._ZN80_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$core..cmp..PartialEq$GT$2ne17hd441c6a4c77379e7E:

0000000080003b4e <_ZN80_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$core..cmp..PartialEq$GT$2ne17hd441c6a4c77379e7E>:
80003b4e: 01 11        	addi	sp, sp, -32
80003b50: 2a e0        	sd	a0, 0(sp)
80003b52: 2e e4        	sd	a1, 8(sp)
80003b54: 2e e8        	sd	a1, 16(sp)
80003b56: 2a ec        	sd	a0, 24(sp)
80003b58: 08 61        	ld	a0, 0(a0)
80003b5a: 8c 61        	ld	a1, 0(a1)
80003b5c: 2d 8d        	xor	a0, a0, a1
80003b5e: 33 35 a0 00  	snez	a0, a0
80003b62: 05 61        	addi	sp, sp, 32
80003b64: 82 80        	ret

Disassembly of section .text._ZN78_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$core..clone..Clone$GT$5clone17h3644d936f0062064E:

0000000080003b66 <_ZN78_$LT$kernel..memory..address..VirtualAddress$u20$as$u20$core..clone..Clone$GT$5clone17h3644d936f0062064E>:
80003b66: 41 11        	addi	sp, sp, -16
80003b68: 2a e4        	sd	a0, 8(sp)
80003b6a: 08 61        	ld	a0, 0(a0)
80003b6c: 41 01        	addi	sp, sp, 16
80003b6e: 82 80        	ret

Disassembly of section .text._ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h5144afb8549a16efE:

0000000080003b70 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h5144afb8549a16efE>:
80003b70: 1d 71        	addi	sp, sp, -96
80003b72: 86 ec        	sd	ra, 88(sp)
80003b74: 2a fc        	sd	a0, 56(sp)
80003b76: ae e0        	sd	a1, 64(sp)
80003b78: b2 e4        	sd	a2, 72(sp)
80003b7a: b6 e8        	sd	a3, 80(sp)
80003b7c: 2a f8        	sd	a0, 48(sp)
80003b7e: 32 85        	add	a0, zero, a2
80003b80: 2e f4        	sd	a1, 40(sp)
80003b82: b6 85        	add	a1, zero, a3
80003b84: 97 70 00 00  	auipc	ra, 7
80003b88: e7 80 80 43  	jalr	1080(ra)
80003b8c: 2a f0        	sd	a0, 32(sp)
80003b8e: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h5144afb8549a16efE+0x20>
80003b90: 02 75        	ld	a0, 32(sp)
80003b92: c2 75        	ld	a1, 48(sp)
80003b94: 97 70 00 00  	auipc	ra, 7
80003b98: e7 80 40 38  	jalr	900(ra)
80003b9c: 2a ec        	sd	a0, 24(sp)
80003b9e: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h5144afb8549a16efE+0x30>
80003ba0: 22 75        	ld	a0, 40(sp)
80003ba2: c2 75        	ld	a1, 48(sp)
80003ba4: b3 05 b5 40  	sub	a1, a0, a1
80003ba8: 62 65        	ld	a0, 24(sp)
80003baa: 97 70 00 00  	auipc	ra, 7
80003bae: e7 80 e0 e0  	jalr	-498(ra)
80003bb2: 2a e8        	sd	a0, 16(sp)
80003bb4: 2e e4        	sd	a1, 8(sp)
80003bb6: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h5144afb8549a16efE+0x48>
80003bb8: 42 65        	ld	a0, 16(sp)
80003bba: a2 65        	ld	a1, 8(sp)
80003bbc: e6 60        	ld	ra, 88(sp)
80003bbe: 25 61        	addi	sp, sp, 96
80003bc0: 82 80        	ret

Disassembly of section .text._ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE:

0000000080003bc2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE>:
80003bc2: 59 71        	addi	sp, sp, -112
80003bc4: 86 f4        	sd	ra, 104(sp)
80003bc6: aa e4        	sd	a0, 72(sp)
80003bc8: ae e8        	sd	a1, 80(sp)
80003bca: b2 ec        	sd	a2, 88(sp)
80003bcc: b6 f0        	sd	a3, 96(sp)
80003bce: ba e0        	sd	a4, 64(sp)
80003bd0: 36 fc        	sd	a3, 56(sp)
80003bd2: 32 f8        	sd	a2, 48(sp)
80003bd4: 2e f4        	sd	a1, 40(sp)
80003bd6: 2a f0        	sd	a0, 32(sp)
80003bd8: 63 fb a5 00  	bgeu	a1, a0, 22 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x2c>
80003bdc: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x1c>
80003bde: 02 75        	ld	a0, 32(sp)
80003be0: a2 75        	ld	a1, 40(sp)
80003be2: 06 66        	ld	a2, 64(sp)
80003be4: 97 90 00 00  	auipc	ra, 9
80003be8: e7 80 80 c1  	jalr	-1000(ra)
80003bec: 00 00        	unimp	
80003bee: 42 75        	ld	a0, 48(sp)
80003bf0: e2 75        	ld	a1, 56(sp)
80003bf2: 97 00 00 00  	auipc	ra, 0
80003bf6: e7 80 80 23  	jalr	568(ra)
80003bfa: 2a ec        	sd	a0, 24(sp)
80003bfc: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x3c>
80003bfe: 62 65        	ld	a0, 24(sp)
80003c00: a2 75        	ld	a1, 40(sp)
80003c02: 63 7b b5 00  	bgeu	a0, a1, 22 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x56>
80003c06: 09 a0        	j	2 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x46>
80003c08: 42 75        	ld	a0, 48(sp)
80003c0a: e2 75        	ld	a1, 56(sp)
80003c0c: 97 00 00 00  	auipc	ra, 0
80003c10: e7 80 e0 21  	jalr	542(ra)
80003c14: 2a e8        	sd	a0, 16(sp)
80003c16: 21 a8        	j	24 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x6c>
80003c18: 02 75        	ld	a0, 32(sp)
80003c1a: a2 75        	ld	a1, 40(sp)
80003c1c: 42 76        	ld	a2, 48(sp)
80003c1e: e2 76        	ld	a3, 56(sp)
80003c20: 97 00 00 00  	auipc	ra, 0
80003c24: e7 80 00 f5  	jalr	-176(ra)
80003c28: 2a e4        	sd	a0, 8(sp)
80003c2a: 2e e0        	sd	a1, 0(sp)
80003c2c: 09 a8        	j	18 <_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17hfb8051667a83e58cE+0x7c>
80003c2e: 22 75        	ld	a0, 40(sp)
80003c30: c2 65        	ld	a1, 16(sp)
80003c32: 06 66        	ld	a2, 64(sp)
80003c34: 97 90 00 00  	auipc	ra, 9
80003c38: e7 80 80 b8  	jalr	-1144(ra)
80003c3c: 00 00        	unimp	
80003c3e: 22 65        	ld	a0, 8(sp)
80003c40: 82 65        	ld	a1, 0(sp)
80003c42: a6 70        	ld	ra, 104(sp)
80003c44: 65 61        	addi	sp, sp, 112
80003c46: 82 80        	ret

Disassembly of section .text._ZN108_$LT$core..ops..range..RangeTo$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h485ad15137ae6e4fE:

0000000080003c48 <_ZN108_$LT$core..ops..range..RangeTo$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h485ad15137ae6e4fE>:
80003c48: 1d 71        	addi	sp, sp, -96
80003c4a: 86 ec        	sd	ra, 88(sp)
80003c4c: aa e0        	sd	a0, 64(sp)
80003c4e: ae e4        	sd	a1, 72(sp)
80003c50: b2 e8        	sd	a2, 80(sp)
80003c52: 01 47        	mv	a4, zero
80003c54: 3a f8        	sd	a4, 48(sp)
80003c56: 2a fc        	sd	a0, 56(sp)
80003c58: 2a f4        	sd	a0, 40(sp)
80003c5a: 3a 85        	add	a0, zero, a4
80003c5c: 22 77        	ld	a4, 40(sp)
80003c5e: 2e f0        	sd	a1, 32(sp)
80003c60: ba 85        	add	a1, zero, a4
80003c62: 82 77        	ld	a5, 32(sp)
80003c64: 32 ec        	sd	a2, 24(sp)
80003c66: 3e 86        	add	a2, zero, a5
80003c68: 62 68        	ld	a6, 24(sp)
80003c6a: 36 e8        	sd	a3, 16(sp)
80003c6c: c2 86        	add	a3, zero, a6
80003c6e: 42 67        	ld	a4, 16(sp)
80003c70: 97 00 00 00  	auipc	ra, 0
80003c74: e7 80 20 f5  	jalr	-174(ra)
80003c78: 2a e4        	sd	a0, 8(sp)
80003c7a: 2e e0        	sd	a1, 0(sp)
80003c7c: 09 a0        	j	2 <_ZN108_$LT$core..ops..range..RangeTo$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h485ad15137ae6e4fE+0x36>
80003c7e: 22 65        	ld	a0, 8(sp)
80003c80: 82 65        	ld	a1, 0(sp)
80003c82: e6 60        	ld	ra, 88(sp)
80003c84: 25 61        	addi	sp, sp, 96
80003c86: 82 80        	ret

Disassembly of section .text._ZN4core3ops5range25RangeInclusive$LT$Idx$GT$3new17h57ddb19cf713bcbcE:

0000000080003c88 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$3new17h57ddb19cf713bcbcE>:
80003c88: 41 11        	addi	sp, sp, -16
80003c8a: 2e e0        	sd	a1, 0(sp)
80003c8c: 32 e4        	sd	a2, 8(sp)
80003c8e: 0c e1        	sd	a1, 0(a0)
80003c90: 10 e5        	sd	a2, 8(a0)
80003c92: 81 45        	mv	a1, zero
80003c94: 23 08 b5 00  	sb	a1, 16(a0)
80003c98: 41 01        	addi	sp, sp, 16
80003c9a: 82 80        	ret

Disassembly of section .text._ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E:

0000000080003c9c <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E>:
80003c9c: 79 71        	addi	sp, sp, -48
80003c9e: 06 f4        	sd	ra, 40(sp)
80003ca0: 2a f0        	sd	a0, 32(sp)
80003ca2: 83 45 05 01  	lbu	a1, 16(a0)
80003ca6: 85 89        	andi	a1, a1, 1
80003ca8: 01 46        	mv	a2, zero
80003caa: 2a e8        	sd	a0, 16(sp)
80003cac: 63 8b c5 00  	beq	a1, a2, 22 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x26>
80003cb0: 09 a0        	j	2 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x16>
80003cb2: 05 45        	addi	a0, zero, 1
80003cb4: a3 0f a1 00  	sb	a0, 31(sp)
80003cb8: 31 a8        	j	28 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x38>
80003cba: 01 45        	mv	a0, zero
80003cbc: a3 0f a1 00  	sb	a0, 31(sp)
80003cc0: 11 a8        	j	20 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x38>
80003cc2: 42 65        	ld	a0, 16(sp)
80003cc4: 93 05 85 00  	addi	a1, a0, 8
80003cc8: 97 e0 ff ff  	auipc	ra, 1048574
80003ccc: e7 80 40 dd  	jalr	-556(ra)
80003cd0: 2a e4        	sd	a0, 8(sp)
80003cd2: 31 a0        	j	12 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x42>
80003cd4: 03 45 f1 01  	lbu	a0, 31(sp)
80003cd8: a2 70        	ld	ra, 40(sp)
80003cda: 45 61        	addi	sp, sp, 48
80003cdc: 82 80        	ret
80003cde: 01 45        	mv	a0, zero
80003ce0: a2 65        	ld	a1, 8(sp)
80003ce2: e3 88 a5 fc  	beq	a1, a0, -48 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x16>
80003ce6: d1 bf        	j	-44 <_ZN4core3ops5range25RangeInclusive$LT$Idx$GT$8is_empty17hdc8cdbde1d767da4E+0x1e>

Disassembly of section .text._ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E:

0000000080003ce8 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E>:
80003ce8: 1d 71        	addi	sp, sp, -96
80003cea: 86 ec        	sd	ra, 88(sp)
80003cec: aa e0        	sd	a0, 64(sp)
80003cee: 2a f0        	sd	a0, 32(sp)
80003cf0: 97 00 00 00  	auipc	ra, 0
80003cf4: e7 80 c0 fa  	jalr	-84(ra)
80003cf8: 2a ec        	sd	a0, 24(sp)
80003cfa: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x14>
80003cfc: 01 45        	mv	a0, zero
80003cfe: e2 65        	ld	a1, 24(sp)
80003d00: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x24>
80003d04: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x1e>
80003d06: 01 45        	mv	a0, zero
80003d08: 2a f4        	sd	a0, 40(sp)
80003d0a: 41 a0        	j	128 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0xa2>
80003d0c: 02 75        	ld	a0, 32(sp)
80003d0e: 93 05 85 00  	addi	a1, a0, 8
80003d12: 97 e0 ff ff  	auipc	ra, 1048574
80003d16: e7 80 00 da  	jalr	-608(ra)
80003d1a: aa 85        	add	a1, zero, a0
80003d1c: a3 07 a1 04  	sb	a0, 79(sp)
80003d20: 2e e8        	sd	a1, 16(sp)
80003d22: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x3c>
80003d24: 01 45        	mv	a0, zero
80003d26: c2 65        	ld	a1, 16(sp)
80003d28: 63 8b a5 00  	beq	a1, a0, 22 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x56>
80003d2c: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x46>
80003d2e: 02 75        	ld	a0, 32(sp)
80003d30: 21 05        	addi	a0, a0, 8
80003d32: 97 00 00 00  	auipc	ra, 0
80003d36: e7 80 e0 0e  	jalr	238(ra)
80003d3a: 2a e4        	sd	a0, 8(sp)
80003d3c: 29 a8        	j	26 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x6e>
80003d3e: 05 45        	addi	a0, zero, 1
80003d40: 82 75        	ld	a1, 32(sp)
80003d42: 23 88 a5 00  	sb	a0, 16(a1)
80003d46: 13 85 85 00  	addi	a0, a1, 8
80003d4a: 97 00 00 00  	auipc	ra, 0
80003d4e: e7 80 60 0d  	jalr	214(ra)
80003d52: 2a fc        	sd	a0, 56(sp)
80003d54: 2d a0        	j	42 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x96>
80003d56: 85 45        	addi	a1, zero, 1
80003d58: 22 65        	ld	a0, 8(sp)
80003d5a: 97 00 00 00  	auipc	ra, 0
80003d5e: e7 80 60 06  	jalr	102(ra)
80003d62: aa 85        	add	a1, zero, a0
80003d64: aa e8        	sd	a0, 80(sp)
80003d66: 2e e0        	sd	a1, 0(sp)
80003d68: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x82>
80003d6a: 02 75        	ld	a0, 32(sp)
80003d6c: 21 05        	addi	a0, a0, 8
80003d6e: 82 65        	ld	a1, 0(sp)
80003d70: 97 70 00 00  	auipc	ra, 7
80003d74: e7 80 60 f9  	jalr	-106(ra)
80003d78: 2a fc        	sd	a0, 56(sp)
80003d7a: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x94>
80003d7c: 11 a0        	j	4 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x98>
80003d7e: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0x98>
80003d80: 62 75        	ld	a0, 56(sp)
80003d82: 2a f8        	sd	a0, 48(sp)
80003d84: 05 45        	addi	a0, zero, 1
80003d86: 2a f4        	sd	a0, 40(sp)
80003d88: 09 a0        	j	2 <_ZN4core4iter5range125_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..RangeInclusive$LT$A$GT$$GT$9next_back17h1994ac336a868e39E+0xa2>
80003d8a: 22 75        	ld	a0, 40(sp)
80003d8c: c2 75        	ld	a1, 48(sp)
80003d8e: e6 60        	ld	ra, 88(sp)
80003d90: 25 61        	addi	sp, sp, 96
80003d92: 82 80        	ret

Disassembly of section .text._ZN4core4iter6traits8iterator8Iterator3rev17h5c12e07b3ceaaaf4E:

0000000080003d94 <_ZN4core4iter6traits8iterator8Iterator3rev17h5c12e07b3ceaaaf4E>:
80003d94: 01 11        	addi	sp, sp, -32
80003d96: 06 ec        	sd	ra, 24(sp)
80003d98: 90 69        	ld	a2, 16(a1)
80003d9a: 32 e8        	sd	a2, 16(sp)
80003d9c: 90 65        	ld	a2, 8(a1)
80003d9e: 32 e4        	sd	a2, 8(sp)
80003da0: 8c 61        	ld	a1, 0(a1)
80003da2: 2e e0        	sd	a1, 0(sp)
80003da4: 8a 85        	add	a1, zero, sp
80003da6: 97 00 00 00  	auipc	ra, 0
80003daa: e7 80 60 03  	jalr	54(ra)
80003dae: 09 a0        	j	2 <_ZN4core4iter6traits8iterator8Iterator3rev17h5c12e07b3ceaaaf4E+0x1c>
80003db0: e2 60        	ld	ra, 24(sp)
80003db2: 05 61        	addi	sp, sp, 32
80003db4: 82 80        	ret

Disassembly of section .text._ZN97_$LT$core..ops..range..RangeFull$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h050859c2e64bb18eE:

0000000080003db6 <_ZN97_$LT$core..ops..range..RangeFull$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h050859c2e64bb18eE>:
80003db6: 01 11        	addi	sp, sp, -32
80003db8: 2a e8        	sd	a0, 16(sp)
80003dba: 2e ec        	sd	a1, 24(sp)
80003dbc: 05 61        	addi	sp, sp, 32
80003dbe: 82 80        	ret

Disassembly of section .text._ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$18backward_unchecked17hc91e61aefecd3400E:

0000000080003dc0 <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$18backward_unchecked17hc91e61aefecd3400E>:
80003dc0: 01 11        	addi	sp, sp, -32
80003dc2: 06 ec        	sd	ra, 24(sp)
80003dc4: 2a e4        	sd	a0, 8(sp)
80003dc6: 2e e8        	sd	a1, 16(sp)
80003dc8: 97 f0 ff ff  	auipc	ra, 1048575
80003dcc: e7 80 a0 e4  	jalr	-438(ra)
80003dd0: 2a e0        	sd	a0, 0(sp)
80003dd2: 09 a0        	j	2 <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$18backward_unchecked17hc91e61aefecd3400E+0x14>
80003dd4: 02 65        	ld	a0, 0(sp)
80003dd6: e2 60        	ld	ra, 24(sp)
80003dd8: 05 61        	addi	sp, sp, 32
80003dda: 82 80        	ret

Disassembly of section .text._ZN4core4iter8adapters3rev12Rev$LT$T$GT$3new17h164afbbaf594ba26E:

0000000080003ddc <_ZN4core4iter8adapters3rev12Rev$LT$T$GT$3new17h164afbbaf594ba26E>:
80003ddc: 01 11        	addi	sp, sp, -32
80003dde: 90 69        	ld	a2, 16(a1)
80003de0: 32 ec        	sd	a2, 24(sp)
80003de2: 94 65        	ld	a3, 8(a1)
80003de4: 36 e8        	sd	a3, 16(sp)
80003de6: 8c 61        	ld	a1, 0(a1)
80003de8: 2e e4        	sd	a1, 8(sp)
80003dea: 10 e9        	sd	a2, 16(a0)
80003dec: 14 e5        	sd	a3, 8(a0)
80003dee: 0c e1        	sd	a1, 0(a0)
80003df0: 05 61        	addi	sp, sp, 32
80003df2: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h9f55ce210fc786dbE:

0000000080003df4 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h9f55ce210fc786dbE>:
80003df4: 90 69        	ld	a2, 16(a1)
80003df6: 10 e9        	sd	a2, 16(a0)
80003df8: 90 65        	ld	a2, 8(a1)
80003dfa: 10 e5        	sd	a2, 8(a0)
80003dfc: 8c 61        	ld	a1, 0(a1)
80003dfe: 0c e1        	sd	a1, 0(a0)
80003e00: 82 80        	ret

Disassembly of section .text._ZN98_$LT$core..iter..adapters..rev..Rev$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h000d6cfaebbe2b9dE:

0000000080003e02 <_ZN98_$LT$core..iter..adapters..rev..Rev$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h000d6cfaebbe2b9dE>:
80003e02: 01 11        	addi	sp, sp, -32
80003e04: 06 ec        	sd	ra, 24(sp)
80003e06: 2a e8        	sd	a0, 16(sp)
80003e08: 97 00 00 00  	auipc	ra, 0
80003e0c: e7 80 00 ee  	jalr	-288(ra)
80003e10: 2a e4        	sd	a0, 8(sp)
80003e12: 2e e0        	sd	a1, 0(sp)
80003e14: 09 a0        	j	2 <_ZN98_$LT$core..iter..adapters..rev..Rev$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h000d6cfaebbe2b9dE+0x14>
80003e16: 22 65        	ld	a0, 8(sp)
80003e18: 82 65        	ld	a1, 0(sp)
80003e1a: e2 60        	ld	ra, 24(sp)
80003e1c: 05 61        	addi	sp, sp, 32
80003e1e: 82 80        	ret

Disassembly of section .text._ZN4core5clone5impls54_$LT$impl$u20$core..clone..Clone$u20$for$u20$usize$GT$5clone17hac83905024c80f87E:

0000000080003e20 <_ZN4core5clone5impls54_$LT$impl$u20$core..clone..Clone$u20$for$u20$usize$GT$5clone17hac83905024c80f87E>:
80003e20: 41 11        	addi	sp, sp, -16
80003e22: 2a e4        	sd	a0, 8(sp)
80003e24: 08 61        	ld	a0, 0(a0)
80003e26: 41 01        	addi	sp, sp, 16
80003e28: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17haba021c706e247f7E:

0000000080003e2a <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17haba021c706e247f7E>:
80003e2a: 01 11        	addi	sp, sp, -32
80003e2c: 2a e8        	sd	a0, 16(sp)
80003e2e: 2e ec        	sd	a1, 24(sp)
80003e30: 2a e0        	sd	a0, 0(sp)
80003e32: 2e e4        	sd	a1, 8(sp)
80003e34: 2e 85        	add	a0, zero, a1
80003e36: 05 61        	addi	sp, sp, 32
80003e38: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17hd0cf8b5f07634f69E:

0000000080003e3a <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17hd0cf8b5f07634f69E>:
80003e3a: 79 71        	addi	sp, sp, -48
80003e3c: 06 f4        	sd	ra, 40(sp)
80003e3e: 2a ec        	sd	a0, 24(sp)
80003e40: 2e f0        	sd	a1, 32(sp)
80003e42: 97 f0 ff ff  	auipc	ra, 1048575
80003e46: e7 80 e0 fc  	jalr	-50(ra)
80003e4a: 2a e8        	sd	a0, 16(sp)
80003e4c: 2e e4        	sd	a1, 8(sp)
80003e4e: 09 a0        	j	2 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17hd0cf8b5f07634f69E+0x16>
80003e50: 42 65        	ld	a0, 16(sp)
80003e52: a2 65        	ld	a1, 8(sp)
80003e54: a2 70        	ld	ra, 40(sp)
80003e56: 45 61        	addi	sp, sp, 48
80003e58: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17h3b8b8ca278bf9732E:

0000000080003e5a <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17h3b8b8ca278bf9732E>:
80003e5a: 41 11        	addi	sp, sp, -16
80003e5c: 2a e0        	sd	a0, 0(sp)
80003e5e: 2e e4        	sd	a1, 8(sp)
80003e60: 41 01        	addi	sp, sp, 16
80003e62: 82 80        	ret

Disassembly of section .text._ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hef6453ad5d331e54E:

0000000080003e64 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hef6453ad5d331e54E>:
80003e64: 41 11        	addi	sp, sp, -16
80003e66: 2a e0        	sd	a0, 0(sp)
80003e68: 2e e4        	sd	a1, 8(sp)
80003e6a: 41 01        	addi	sp, sp, 16
80003e6c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$12wrapping_add17he228798530020532E:

0000000080003e6e <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$12wrapping_add17he228798530020532E>:
80003e6e: 01 11        	addi	sp, sp, -32
80003e70: 06 ec        	sd	ra, 24(sp)
80003e72: 2a e4        	sd	a0, 8(sp)
80003e74: 2e e8        	sd	a1, 16(sp)
80003e76: 97 00 00 00  	auipc	ra, 0
80003e7a: e7 80 40 01  	jalr	20(ra)
80003e7e: 2a e0        	sd	a0, 0(sp)
80003e80: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$12wrapping_add17he228798530020532E+0x14>
80003e82: 02 65        	ld	a0, 0(sp)
80003e84: e2 60        	ld	ra, 24(sp)
80003e86: 05 61        	addi	sp, sp, 32
80003e88: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$15wrapping_offset17h0f3b4b78313cf36aE:

0000000080003e8a <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$15wrapping_offset17h0f3b4b78313cf36aE>:
80003e8a: 01 11        	addi	sp, sp, -32
80003e8c: 2a e4        	sd	a0, 8(sp)
80003e8e: 2e e8        	sd	a1, 16(sp)
80003e90: 2e 95        	add	a0, a0, a1
80003e92: 2a ec        	sd	a0, 24(sp)
80003e94: 2a e0        	sd	a0, 0(sp)
80003e96: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$15wrapping_offset17h0f3b4b78313cf36aE+0xe>
80003e98: 02 65        	ld	a0, 0(sp)
80003e9a: 05 61        	addi	sp, sp, 32
80003e9c: 82 80        	ret

Disassembly of section .text._ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E:

0000000080003e9e <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E>:
80003e9e: 19 71        	addi	sp, sp, -128
80003ea0: 86 fc        	sd	ra, 120(sp)
80003ea2: aa e8        	sd	a0, 80(sp)
80003ea4: 2a f0        	sd	a0, 32(sp)
80003ea6: 97 f0 ff ff  	auipc	ra, 1048575
80003eaa: e7 80 40 2d  	jalr	724(ra)
80003eae: 2a ec        	sd	a0, 24(sp)
80003eb0: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x14>
80003eb2: 62 65        	ld	a0, 24(sp)
80003eb4: 97 00 00 00  	auipc	ra, 0
80003eb8: e7 80 20 3a  	jalr	930(ra)
80003ebc: 2a fc        	sd	a0, 56(sp)
80003ebe: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x22>
80003ec0: 62 75        	ld	a0, 56(sp)
80003ec2: 93 35 15 00  	seqz	a1, a0
80003ec6: 01 46        	mv	a2, zero
80003ec8: 63 14 c5 00  	bne	a0, a2, 8 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x32>
80003ecc: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x30>
80003ece: 1d a0        	j	38 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x56>
80003ed0: 62 75        	ld	a0, 56(sp)
80003ed2: aa f0        	sd	a0, 96(sp)
80003ed4: aa f4        	sd	a0, 104(sp)
80003ed6: 82 75        	ld	a1, 32(sp)
80003ed8: 13 86 05 01  	addi	a2, a1, 16
80003edc: 94 69        	ld	a3, 16(a1)
80003ede: b6 f8        	sd	a3, 112(sp)
80003ee0: 85 45        	addi	a1, zero, 1
80003ee2: 2a e8        	sd	a0, 16(sp)
80003ee4: 32 85        	add	a0, zero, a2
80003ee6: 36 e4        	sd	a3, 8(sp)
80003ee8: 97 00 00 00  	auipc	ra, 0
80003eec: e7 80 e0 3e  	jalr	1006(ra)
80003ef0: 39 a8        	j	30 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x70>
80003ef2: 00 00        	unimp	
80003ef4: 97 00 00 00  	auipc	ra, 0
80003ef8: e7 80 e0 33  	jalr	830(ra)
80003efc: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x60>
80003efe: 97 00 00 00  	auipc	ra, 0
80003f02: e7 80 60 34  	jalr	838(ra)
80003f06: 2a f4        	sd	a0, 40(sp)
80003f08: 2e f8        	sd	a1, 48(sp)
80003f0a: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x6e>
80003f0c: 01 a8        	j	16 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x7e>
80003f0e: 22 65        	ld	a0, 8(sp)
80003f10: aa e0        	sd	a0, 64(sp)
80003f12: c2 65        	ld	a1, 16(sp)
80003f14: ae e4        	sd	a1, 72(sp)
80003f16: 2a f4        	sd	a0, 40(sp)
80003f18: 2e f8        	sd	a1, 48(sp)
80003f1a: 09 a0        	j	2 <_ZN110_$LT$core..iter..adapters..enumerate..Enumerate$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h288869326729dd59E+0x7e>
80003f1c: 22 75        	ld	a0, 40(sp)
80003f1e: c2 75        	ld	a1, 48(sp)
80003f20: e6 70        	ld	ra, 120(sp)
80003f22: 09 61        	addi	sp, sp, 128
80003f24: 82 80        	ret

Disassembly of section .text._ZN4core4iter8adapters9enumerate18Enumerate$LT$I$GT$3new17had58be65bf838bc0E:

0000000080003f26 <_ZN4core4iter8adapters9enumerate18Enumerate$LT$I$GT$3new17had58be65bf838bc0E>:
80003f26: 41 11        	addi	sp, sp, -16
80003f28: 2e e0        	sd	a1, 0(sp)
80003f2a: 32 e4        	sd	a2, 8(sp)
80003f2c: 0c e1        	sd	a1, 0(a0)
80003f2e: 10 e5        	sd	a2, 8(a0)
80003f30: 81 45        	mv	a1, zero
80003f32: 0c e9        	sd	a1, 16(a0)
80003f34: 41 01        	addi	sp, sp, 16
80003f36: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hb541a19ea7f958fbE:

0000000080003f38 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hb541a19ea7f958fbE>:
80003f38: 90 69        	ld	a2, 16(a1)
80003f3a: 10 e9        	sd	a2, 16(a0)
80003f3c: 90 65        	ld	a2, 8(a1)
80003f3e: 10 e5        	sd	a2, 8(a0)
80003f40: 8c 61        	ld	a1, 0(a1)
80003f42: 0c e1        	sd	a1, 0(a0)
80003f44: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E:

0000000080003f46 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E>:
80003f46: 79 71        	addi	sp, sp, -48
80003f48: 06 f4        	sd	ra, 40(sp)
80003f4a: 2e 86        	add	a2, zero, a1
80003f4c: aa 86        	add	a3, zero, a0
80003f4e: 2a c4        	sw	a0, 8(sp)
80003f50: 2e c6        	sw	a1, 12(sp)
80003f52: 85 45        	addi	a1, zero, 1
80003f54: a3 0f b1 00  	sb	a1, 31(sp)
80003f58: 02 15        	slli	a0, a0, 32
80003f5a: 01 91        	srli	a0, a0, 32
80003f5c: 81 45        	mv	a1, zero
80003f5e: 63 04 b5 00  	beq	a0, a1, 8 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x20>
80003f62: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x1e>
80003f64: 31 a0        	j	12 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x2a>
80003f66: 37 05 11 00  	lui	a0, 272
80003f6a: 2a ca        	sw	a0, 20(sp)
80003f6c: 05 a8        	j	48 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x56>
80003f6e: 00 00        	unimp	
80003f70: 32 45        	lw	a0, 12(sp)
80003f72: 2a d2        	sw	a0, 36(sp)
80003f74: 81 45        	mv	a1, zero
80003f76: a3 0f b1 00  	sb	a1, 31(sp)
80003f7a: 2a cc        	sw	a0, 24(sp)
80003f7c: 97 00 00 00  	auipc	ra, 0
80003f80: e7 80 20 32  	jalr	802(ra)
80003f84: 02 15        	slli	a0, a0, 32
80003f86: 01 91        	srli	a0, a0, 32
80003f88: 2a e0        	sd	a0, 0(sp)
80003f8a: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x46>
80003f8c: 02 65        	ld	a0, 0(sp)
80003f8e: 2a ca        	sw	a0, 20(sp)
80003f90: 31 a0        	j	12 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x56>
80003f92: 52 45        	lw	a0, 20(sp)
80003f94: a2 70        	ld	ra, 40(sp)
80003f96: 45 61        	addi	sp, sp, 48
80003f98: 82 80        	ret
80003f9a: e5 bf        	j	-8 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x4c>
80003f9c: 03 45 f1 01  	lbu	a0, 31(sp)
80003fa0: 05 89        	andi	a0, a0, 1
80003fa2: 65 fd        	bnez	a0, -8 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x54>
80003fa4: fd b7        	j	-18 <_ZN4core6option15Option$LT$T$GT$3map17h4ce336ac09282e35E+0x4c>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$4take17ha1b93c8076eb5bafE:

0000000080003fa6 <_ZN4core6option15Option$LT$T$GT$4take17ha1b93c8076eb5bafE>:
80003fa6: 01 11        	addi	sp, sp, -32
80003fa8: 06 ec        	sd	ra, 24(sp)
80003faa: 2a e8        	sd	a0, 16(sp)
80003fac: 97 e0 ff ff  	auipc	ra, 1048574
80003fb0: e7 80 40 85  	jalr	-1964(ra)
80003fb4: 2a e4        	sd	a0, 8(sp)
80003fb6: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$4take17ha1b93c8076eb5bafE+0x12>
80003fb8: 22 65        	ld	a0, 8(sp)
80003fba: e2 60        	ld	ra, 24(sp)
80003fbc: 05 61        	addi	sp, sp, 32
80003fbe: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E:

0000000080003fc0 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E>:
80003fc0: 79 71        	addi	sp, sp, -48
80003fc2: 2a e4        	sd	a0, 8(sp)
80003fc4: 85 45        	addi	a1, zero, 1
80003fc6: a3 0f b1 00  	sb	a1, 31(sp)
80003fca: b3 35 a0 00  	snez	a1, a0
80003fce: 01 46        	mv	a2, zero
80003fd0: 63 04 c5 00  	beq	a0, a2, 8 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x18>
80003fd4: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x16>
80003fd6: 39 a0        	j	14 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x24>
80003fd8: 01 45        	mv	a0, zero
80003fda: a3 0f a1 00  	sb	a0, 31(sp)
80003fde: 2a e8        	sd	a0, 16(sp)
80003fe0: 11 a8        	j	20 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x34>
80003fe2: 00 00        	unimp	
80003fe4: 22 65        	ld	a0, 8(sp)
80003fe6: 2a f4        	sd	a0, 40(sp)
80003fe8: 2a e8        	sd	a0, 16(sp)
80003fea: 29 a0        	j	10 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x34>
80003fec: 42 65        	ld	a0, 16(sp)
80003fee: 45 61        	addi	sp, sp, 48
80003ff0: 82 80        	ret
80003ff2: ed bf        	j	-6 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x2c>
80003ff4: 03 45 f1 01  	lbu	a0, 31(sp)
80003ff8: 05 89        	andi	a0, a0, 1
80003ffa: 65 fd        	bnez	a0, -8 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x32>
80003ffc: c5 bf        	j	-16 <_ZN4core6option15Option$LT$T$GT$5ok_or17h94f7de3d0d875174E+0x2c>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E:

0000000080003ffe <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E>:
80003ffe: 79 71        	addi	sp, sp, -48
80004000: 2a e4        	sd	a0, 8(sp)
80004002: 85 45        	addi	a1, zero, 1
80004004: a3 0f b1 00  	sb	a1, 31(sp)
80004008: b3 35 a0 00  	snez	a1, a0
8000400c: 01 46        	mv	a2, zero
8000400e: 63 04 c5 00  	beq	a0, a2, 8 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x18>
80004012: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x16>
80004014: 39 a0        	j	14 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x24>
80004016: 01 45        	mv	a0, zero
80004018: a3 0f a1 00  	sb	a0, 31(sp)
8000401c: 2a e8        	sd	a0, 16(sp)
8000401e: 11 a8        	j	20 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x34>
80004020: 00 00        	unimp	
80004022: 22 65        	ld	a0, 8(sp)
80004024: 2a f4        	sd	a0, 40(sp)
80004026: 2a e8        	sd	a0, 16(sp)
80004028: 29 a0        	j	10 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x34>
8000402a: 42 65        	ld	a0, 16(sp)
8000402c: 45 61        	addi	sp, sp, 48
8000402e: 82 80        	ret
80004030: ed bf        	j	-6 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x2c>
80004032: 03 45 f1 01  	lbu	a0, 31(sp)
80004036: 05 89        	andi	a0, a0, 1
80004038: 65 fd        	bnez	a0, -8 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x32>
8000403a: c5 bf        	j	-16 <_ZN4core6option15Option$LT$T$GT$5ok_or17hf59ad07d01495665E+0x2c>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E:

000000008000403c <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E>:
8000403c: 01 11        	addi	sp, sp, -32
8000403e: 2a e8        	sd	a0, 16(sp)
80004040: 0c 61        	ld	a1, 0(a0)
80004042: 33 36 b0 00  	snez	a2, a1
80004046: 81 46        	mv	a3, zero
80004048: 2a e0        	sd	a0, 0(sp)
8000404a: 63 84 d5 00  	beq	a1, a3, 8 <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E+0x16>
8000404e: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E+0x14>
80004050: 29 a0        	j	10 <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E+0x1e>
80004052: 01 45        	mv	a0, zero
80004054: 2a e4        	sd	a0, 8(sp)
80004056: 31 a0        	j	12 <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E+0x26>
80004058: 00 00        	unimp	
8000405a: 02 65        	ld	a0, 0(sp)
8000405c: 2a ec        	sd	a0, 24(sp)
8000405e: 2a e4        	sd	a0, 8(sp)
80004060: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6as_mut17h11200942b2078f55E+0x26>
80004062: 22 65        	ld	a0, 8(sp)
80004064: 05 61        	addi	sp, sp, 32
80004066: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6expect17h8e722278a1c0dabdE:

0000000080004068 <_ZN4core6option15Option$LT$T$GT$6expect17h8e722278a1c0dabdE>:
80004068: 39 71        	addi	sp, sp, -64
8000406a: 2a f0        	sd	a0, 32(sp)
8000406c: 2e f4        	sd	a1, 40(sp)
8000406e: 32 f8        	sd	a2, 48(sp)
80004070: 33 37 a0 00  	snez	a4, a0
80004074: 81 47        	mv	a5, zero
80004076: 36 ec        	sd	a3, 24(sp)
80004078: 32 e8        	sd	a2, 16(sp)
8000407a: 2e e4        	sd	a1, 8(sp)
8000407c: 63 04 f5 00  	beq	a0, a5, 8 <_ZN4core6option15Option$LT$T$GT$6expect17h8e722278a1c0dabdE+0x1c>
80004080: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6expect17h8e722278a1c0dabdE+0x1a>
80004082: 11 a8        	j	20 <_ZN4core6option15Option$LT$T$GT$6expect17h8e722278a1c0dabdE+0x2e>
80004084: 22 65        	ld	a0, 8(sp)
80004086: c2 65        	ld	a1, 16(sp)
80004088: 62 66        	ld	a2, 24(sp)
8000408a: 97 70 00 00  	auipc	ra, 7
8000408e: e7 80 e0 52  	jalr	1326(ra)
80004092: 00 00        	unimp	
80004094: 00 00        	unimp	
80004096: 02 75        	ld	a0, 32(sp)
80004098: 2a fc        	sd	a0, 56(sp)
8000409a: 21 61        	addi	sp, sp, 64
8000409c: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6expect17hb30888545665a5f7E:

000000008000409e <_ZN4core6option15Option$LT$T$GT$6expect17hb30888545665a5f7E>:
8000409e: 39 71        	addi	sp, sp, -64
800040a0: 2a ec        	sd	a0, 24(sp)
800040a2: 2e f0        	sd	a1, 32(sp)
800040a4: 32 f4        	sd	a2, 40(sp)
800040a6: 36 f8        	sd	a3, 48(sp)
800040a8: aa 85        	add	a1, zero, a0
800040aa: 81 47        	mv	a5, zero
800040ac: 3a e8        	sd	a4, 16(sp)
800040ae: 36 e4        	sd	a3, 8(sp)
800040b0: 32 e0        	sd	a2, 0(sp)
800040b2: 63 04 f5 00  	beq	a0, a5, 8 <_ZN4core6option15Option$LT$T$GT$6expect17hb30888545665a5f7E+0x1c>
800040b6: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6expect17hb30888545665a5f7E+0x1a>
800040b8: 11 a8        	j	20 <_ZN4core6option15Option$LT$T$GT$6expect17hb30888545665a5f7E+0x2e>
800040ba: 02 65        	ld	a0, 0(sp)
800040bc: a2 65        	ld	a1, 8(sp)
800040be: 42 66        	ld	a2, 16(sp)
800040c0: 97 70 00 00  	auipc	ra, 7
800040c4: e7 80 80 4f  	jalr	1272(ra)
800040c8: 00 00        	unimp	
800040ca: 00 00        	unimp	
800040cc: 02 75        	ld	a0, 32(sp)
800040ce: 2a fc        	sd	a0, 56(sp)
800040d0: 21 61        	addi	sp, sp, 64
800040d2: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17h32abae9248d3f8a9E:

00000000800040d4 <_ZN4core6option15Option$LT$T$GT$6unwrap17h32abae9248d3f8a9E>:
800040d4: 01 11        	addi	sp, sp, -32
800040d6: 2a e8        	sd	a0, 16(sp)
800040d8: 33 36 a0 00  	snez	a2, a0
800040dc: 81 46        	mv	a3, zero
800040de: 2e e4        	sd	a1, 8(sp)
800040e0: 63 04 d5 00  	beq	a0, a3, 8 <.LBB8_5>
800040e4: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17h32abae9248d3f8a9E+0x12>
800040e6: 31 a8        	j	28 <.LBB8_5+0x1a>

00000000800040e8 <.LBB8_5>:
800040e8: 17 a5 00 00  	auipc	a0, 10
800040ec: 13 05 c5 bb  	addi	a0, a0, -1092
800040f0: 93 05 b0 02  	addi	a1, zero, 43
800040f4: 22 66        	ld	a2, 8(sp)
800040f6: 97 70 00 00  	auipc	ra, 7
800040fa: e7 80 40 64  	jalr	1604(ra)
800040fe: 00 00        	unimp	
80004100: 00 00        	unimp	
80004102: 42 65        	ld	a0, 16(sp)
80004104: 2a ec        	sd	a0, 24(sp)
80004106: 05 61        	addi	sp, sp, 32
80004108: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17h49d9f0b127dc92c0E:

000000008000410a <_ZN4core6option15Option$LT$T$GT$6unwrap17h49d9f0b127dc92c0E>:
8000410a: 01 11        	addi	sp, sp, -32
8000410c: 2a e8        	sd	a0, 16(sp)
8000410e: 33 36 a0 00  	snez	a2, a0
80004112: 81 46        	mv	a3, zero
80004114: 2e e4        	sd	a1, 8(sp)
80004116: 63 04 d5 00  	beq	a0, a3, 8 <.LBB9_5>
8000411a: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17h49d9f0b127dc92c0E+0x12>
8000411c: 31 a8        	j	28 <.LBB9_5+0x1a>

000000008000411e <.LBB9_5>:
8000411e: 17 a5 00 00  	auipc	a0, 10
80004122: 13 05 65 b8  	addi	a0, a0, -1146
80004126: 93 05 b0 02  	addi	a1, zero, 43
8000412a: 22 66        	ld	a2, 8(sp)
8000412c: 97 70 00 00  	auipc	ra, 7
80004130: e7 80 e0 60  	jalr	1550(ra)
80004134: 00 00        	unimp	
80004136: 00 00        	unimp	
80004138: 42 65        	ld	a0, 16(sp)
8000413a: 2a ec        	sd	a0, 24(sp)
8000413c: 05 61        	addi	sp, sp, 32
8000413e: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17h4a5e677e56c49465E:

0000000080004140 <_ZN4core6option15Option$LT$T$GT$6unwrap17h4a5e677e56c49465E>:
80004140: 41 11        	addi	sp, sp, -16
80004142: ae 86        	add	a3, zero, a1
80004144: 2a 87        	add	a4, zero, a0
80004146: 23 04 a1 00  	sb	a0, 8(sp)
8000414a: a3 04 b1 00  	sb	a1, 9(sp)
8000414e: aa 85        	add	a1, zero, a0
80004150: 81 47        	mv	a5, zero
80004152: 32 e0        	sd	a2, 0(sp)
80004154: 63 04 f5 00  	beq	a0, a5, 8 <.LBB10_5>
80004158: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17h4a5e677e56c49465E+0x1a>
8000415a: 31 a8        	j	28 <.LBB10_5+0x1a>

000000008000415c <.LBB10_5>:
8000415c: 17 a5 00 00  	auipc	a0, 10
80004160: 13 05 85 b4  	addi	a0, a0, -1208
80004164: 93 05 b0 02  	addi	a1, zero, 43
80004168: 02 66        	ld	a2, 0(sp)
8000416a: 97 70 00 00  	auipc	ra, 7
8000416e: e7 80 00 5d  	jalr	1488(ra)
80004172: 00 00        	unimp	
80004174: 00 00        	unimp	
80004176: 03 05 91 00  	lb	a0, 9(sp)
8000417a: a3 07 a1 00  	sb	a0, 15(sp)
8000417e: 41 01        	addi	sp, sp, 16
80004180: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17ha1bc5b03e0520c55E:

0000000080004182 <_ZN4core6option15Option$LT$T$GT$6unwrap17ha1bc5b03e0520c55E>:
80004182: 01 11        	addi	sp, sp, -32
80004184: 2a e8        	sd	a0, 16(sp)
80004186: 33 36 a0 00  	snez	a2, a0
8000418a: 81 46        	mv	a3, zero
8000418c: 2e e4        	sd	a1, 8(sp)
8000418e: 63 04 d5 00  	beq	a0, a3, 8 <.LBB13_5>
80004192: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17ha1bc5b03e0520c55E+0x12>
80004194: 31 a8        	j	28 <.LBB13_5+0x1a>

0000000080004196 <.LBB13_5>:
80004196: 17 a5 00 00  	auipc	a0, 10
8000419a: 13 05 e5 b0  	addi	a0, a0, -1266
8000419e: 93 05 b0 02  	addi	a1, zero, 43
800041a2: 22 66        	ld	a2, 8(sp)
800041a4: 97 70 00 00  	auipc	ra, 7
800041a8: e7 80 60 59  	jalr	1430(ra)
800041ac: 00 00        	unimp	
800041ae: 00 00        	unimp	
800041b0: 42 65        	ld	a0, 16(sp)
800041b2: 2a ec        	sd	a0, 24(sp)
800041b4: 05 61        	addi	sp, sp, 32
800041b6: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hb35b904ad6508e8eE:

00000000800041b8 <_ZN4core6option15Option$LT$T$GT$6unwrap17hb35b904ad6508e8eE>:
800041b8: 01 11        	addi	sp, sp, -32
800041ba: 2a e8        	sd	a0, 16(sp)
800041bc: 33 36 a0 00  	snez	a2, a0
800041c0: 81 46        	mv	a3, zero
800041c2: 2e e4        	sd	a1, 8(sp)
800041c4: 63 04 d5 00  	beq	a0, a3, 8 <.LBB14_5>
800041c8: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17hb35b904ad6508e8eE+0x12>
800041ca: 31 a8        	j	28 <.LBB14_5+0x1a>

00000000800041cc <.LBB14_5>:
800041cc: 17 a5 00 00  	auipc	a0, 10
800041d0: 13 05 85 ad  	addi	a0, a0, -1320
800041d4: 93 05 b0 02  	addi	a1, zero, 43
800041d8: 22 66        	ld	a2, 8(sp)
800041da: 97 70 00 00  	auipc	ra, 7
800041de: e7 80 00 56  	jalr	1376(ra)
800041e2: 00 00        	unimp	
800041e4: 00 00        	unimp	
800041e6: 42 65        	ld	a0, 16(sp)
800041e8: 2a ec        	sd	a0, 24(sp)
800041ea: 05 61        	addi	sp, sp, 32
800041ec: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$7is_none17h4a5dacc0b55a2075E:

00000000800041ee <_ZN4core6option15Option$LT$T$GT$7is_none17h4a5dacc0b55a2075E>:
800041ee: 01 11        	addi	sp, sp, -32
800041f0: 06 ec        	sd	ra, 24(sp)
800041f2: 2a e8        	sd	a0, 16(sp)
800041f4: 97 00 00 00  	auipc	ra, 0
800041f8: e7 80 80 01  	jalr	24(ra)
800041fc: 2a e4        	sd	a0, 8(sp)
800041fe: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$7is_none17h4a5dacc0b55a2075E+0x12>
80004200: 22 65        	ld	a0, 8(sp)
80004202: 13 45 15 00  	xori	a0, a0, 1
80004206: e2 60        	ld	ra, 24(sp)
80004208: 05 61        	addi	sp, sp, 32
8000420a: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE:

000000008000420c <_ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE>:
8000420c: 41 11        	addi	sp, sp, -16
8000420e: 2a e4        	sd	a0, 8(sp)
80004210: 08 61        	ld	a0, 0(a0)
80004212: 85 45        	addi	a1, zero, 1
80004214: 63 07 b5 00  	beq	a0, a1, 14 <_ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE+0x16>
80004218: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE+0xe>
8000421a: 01 45        	mv	a0, zero
8000421c: a3 03 a1 00  	sb	a0, 7(sp)
80004220: 29 a0        	j	10 <_ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE+0x1e>
80004222: 05 45        	addi	a0, zero, 1
80004224: a3 03 a1 00  	sb	a0, 7(sp)
80004228: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$7is_some17h2127f909c330be3eE+0x1e>
8000422a: 03 45 71 00  	lbu	a0, 7(sp)
8000422e: 41 01        	addi	sp, sp, 16
80004230: 82 80        	ret

Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h19ea870cbedf6d92E:

0000000080004232 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h19ea870cbedf6d92E>:
80004232: 41 11        	addi	sp, sp, -16
80004234: 41 01        	addi	sp, sp, 16
80004236: 82 80        	ret

Disassembly of section .text._ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h5c9cfc27ae6ba5c2E:

0000000080004238 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h5c9cfc27ae6ba5c2E>:
80004238: 41 11        	addi	sp, sp, -16
8000423a: 01 45        	mv	a0, zero
8000423c: 2a c0        	sw	a0, 0(sp)
8000423e: 92 45        	lw	a1, 4(sp)
80004240: 41 01        	addi	sp, sp, 16
80004242: 82 80        	ret

Disassembly of section .text._ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hadbc5b8a4c221a81E:

0000000080004244 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hadbc5b8a4c221a81E>:
80004244: 01 11        	addi	sp, sp, -32
80004246: 01 45        	mv	a0, zero
80004248: 2a e8        	sd	a0, 16(sp)
8000424a: a2 65        	ld	a1, 8(sp)
8000424c: 2a e0        	sd	a0, 0(sp)
8000424e: 2e 85        	add	a0, zero, a1
80004250: 82 65        	ld	a1, 0(sp)
80004252: 05 61        	addi	sp, sp, 32
80004254: 82 80        	ret

Disassembly of section .text._ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h291c30da0fd0af68E:

0000000080004256 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h291c30da0fd0af68E>:
80004256: 01 11        	addi	sp, sp, -32
80004258: 06 ec        	sd	ra, 24(sp)
8000425a: 2a e8        	sd	a0, 16(sp)
8000425c: 97 00 00 00  	auipc	ra, 0
80004260: e7 80 20 da  	jalr	-606(ra)
80004264: 2a e0        	sd	a0, 0(sp)
80004266: 09 a0        	j	2 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h291c30da0fd0af68E+0x12>
80004268: 02 65        	ld	a0, 0(sp)
8000426a: e2 60        	ld	ra, 24(sp)
8000426c: 05 61        	addi	sp, sp, 32
8000426e: 82 80        	ret

Disassembly of section .text._ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hfefbc5ffa88d7006E:

0000000080004270 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hfefbc5ffa88d7006E>:
80004270: 01 11        	addi	sp, sp, -32
80004272: 06 ec        	sd	ra, 24(sp)
80004274: 2a e8        	sd	a0, 16(sp)
80004276: 97 00 00 00  	auipc	ra, 0
8000427a: e7 80 a0 d4  	jalr	-694(ra)
8000427e: 2a e0        	sd	a0, 0(sp)
80004280: 09 a0        	j	2 <_ZN69_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hfefbc5ffa88d7006E+0x12>
80004282: 02 65        	ld	a0, 0(sp)
80004284: e2 60        	ld	ra, 24(sp)
80004286: 05 61        	addi	sp, sp, 32
80004288: 82 80        	ret

Disassembly of section .text._ZN72_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17hded1c5c2ab8f2f2eE:

000000008000428a <_ZN72_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17hded1c5c2ab8f2f2eE>:
8000428a: 41 11        	addi	sp, sp, -16
8000428c: 01 45        	mv	a0, zero
8000428e: 2a e4        	sd	a0, 8(sp)
80004290: 41 01        	addi	sp, sp, 16
80004292: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h84634550c0a11790E:

0000000080004294 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h84634550c0a11790E>:
80004294: 41 11        	addi	sp, sp, -16
80004296: 2a e0        	sd	a0, 0(sp)
80004298: 2e e4        	sd	a1, 8(sp)
8000429a: 41 01        	addi	sp, sp, 16
8000429c: 82 80        	ret

Disassembly of section .text._ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hc47b312706b458b0E:

000000008000429e <_ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hc47b312706b458b0E>:
8000429e: 01 11        	addi	sp, sp, -32
800042a0: 06 ec        	sd	ra, 24(sp)
800042a2: aa 85        	add	a1, zero, a0
800042a4: 2a ca        	sw	a0, 20(sp)
800042a6: 2e e4        	sd	a1, 8(sp)
800042a8: 97 00 00 00  	auipc	ra, 0
800042ac: e7 80 80 01  	jalr	24(ra)
800042b0: 02 15        	slli	a0, a0, 32
800042b2: 01 91        	srli	a0, a0, 32
800042b4: 2a e0        	sd	a0, 0(sp)
800042b6: 09 a0        	j	2 <_ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hc47b312706b458b0E+0x1a>
800042b8: 02 65        	ld	a0, 0(sp)
800042ba: e2 60        	ld	ra, 24(sp)
800042bc: 05 61        	addi	sp, sp, 32
800042be: 82 80        	ret

Disassembly of section .text._ZN4core4char7convert18from_u32_unchecked17h1e91f7d28d1be085E:

00000000800042c0 <_ZN4core4char7convert18from_u32_unchecked17h1e91f7d28d1be085E>:
800042c0: 41 11        	addi	sp, sp, -16
800042c2: aa 85        	add	a1, zero, a0
800042c4: 2a c4        	sw	a0, 8(sp)
800042c6: 2a c6        	sw	a0, 12(sp)
800042c8: 02 15        	slli	a0, a0, 32
800042ca: 01 91        	srli	a0, a0, 32
800042cc: 2a e0        	sd	a0, 0(sp)
800042ce: 09 a0        	j	2 <_ZN4core4char7convert18from_u32_unchecked17h1e91f7d28d1be085E+0x10>
800042d0: 02 65        	ld	a0, 0(sp)
800042d2: 41 01        	addi	sp, sp, 16
800042d4: 82 80        	ret

Disassembly of section .text._ZN53_$LT$usize$u20$as$u20$core..ops..arith..AddAssign$GT$10add_assign17hb10b13db086991dbE:

00000000800042d6 <_ZN53_$LT$usize$u20$as$u20$core..ops..arith..AddAssign$GT$10add_assign17hb10b13db086991dbE>:
800042d6: 01 11        	addi	sp, sp, -32
800042d8: 2a e8        	sd	a0, 16(sp)
800042da: 2e ec        	sd	a1, 24(sp)
800042dc: 10 61        	ld	a2, 0(a0)
800042de: b2 95        	add	a1, a1, a2
800042e0: 2a e4        	sd	a0, 8(sp)
800042e2: 2e e0        	sd	a1, 0(sp)
800042e4: 63 e8 c5 00  	bltu	a1, a2, 16 <.LBB0_3>
800042e8: 09 a0        	j	2 <_ZN53_$LT$usize$u20$as$u20$core..ops..arith..AddAssign$GT$10add_assign17hb10b13db086991dbE+0x14>
800042ea: 02 65        	ld	a0, 0(sp)
800042ec: a2 65        	ld	a1, 8(sp)
800042ee: 88 e1        	sd	a0, 0(a1)
800042f0: 05 61        	addi	sp, sp, 32
800042f2: 82 80        	ret

00000000800042f4 <.LBB0_3>:
800042f4: 17 a5 00 00  	auipc	a0, 10
800042f8: 13 05 c5 a6  	addi	a0, a0, -1428

00000000800042fc <.LBB0_4>:
800042fc: 17 a6 00 00  	auipc	a2, 10
80004300: 13 06 c6 a4  	addi	a2, a2, -1460
80004304: f1 45        	addi	a1, zero, 28
80004306: 97 70 00 00  	auipc	ra, 7
8000430a: e7 80 40 43  	jalr	1076(ra)
8000430e: 00 00        	unimp	

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h5a6875bba42117dcE:

0000000080004310 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h5a6875bba42117dcE>:
80004310: 79 71        	addi	sp, sp, -48
80004312: 06 f4        	sd	ra, 40(sp)
80004314: 2a f0        	sd	a0, 32(sp)
80004316: 2a ec        	sd	a0, 24(sp)
80004318: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h5a6875bba42117dcE+0xa>
8000431a: 01 45        	mv	a0, zero
8000431c: e2 65        	ld	a1, 24(sp)
8000431e: 2a e8        	sd	a0, 16(sp)
80004320: 2e 85        	add	a0, zero, a1
80004322: c2 65        	ld	a1, 16(sp)
80004324: 97 70 00 00  	auipc	ra, 7
80004328: e7 80 a0 bd  	jalr	-1062(ra)
8000432c: 2a e4        	sd	a0, 8(sp)
8000432e: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h5a6875bba42117dcE+0x20>
80004330: 22 65        	ld	a0, 8(sp)
80004332: a2 70        	ld	ra, 40(sp)
80004334: 45 61        	addi	sp, sp, 48
80004336: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9837843e2c90686cE:

0000000080004338 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9837843e2c90686cE>:
80004338: 79 71        	addi	sp, sp, -48
8000433a: 06 f4        	sd	ra, 40(sp)
8000433c: 2a f0        	sd	a0, 32(sp)
8000433e: 2a ec        	sd	a0, 24(sp)
80004340: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9837843e2c90686cE+0xa>
80004342: 01 45        	mv	a0, zero
80004344: e2 65        	ld	a1, 24(sp)
80004346: 2a e8        	sd	a0, 16(sp)
80004348: 2e 85        	add	a0, zero, a1
8000434a: c2 65        	ld	a1, 16(sp)
8000434c: 97 70 00 00  	auipc	ra, 7
80004350: e7 80 20 bb  	jalr	-1102(ra)
80004354: 2a e4        	sd	a0, 8(sp)
80004356: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9837843e2c90686cE+0x20>
80004358: 22 65        	ld	a0, 8(sp)
8000435a: a2 70        	ld	ra, 40(sp)
8000435c: 45 61        	addi	sp, sp, 48
8000435e: 82 80        	ret

Disassembly of section .text._ZN6kernel8register2tp4read17h0ae8224f07e08e03E:

0000000080004360 <_ZN6kernel8register2tp4read17h0ae8224f07e08e03E>:
80004360: 41 11        	addi	sp, sp, -16
80004362: 12 85        	add	a0, zero, tp
80004364: 2a e4        	sd	a0, 8(sp)
80004366: 41 01        	addi	sp, sp, 16
80004368: 82 80        	ret

Disassembly of section .text._ZN6kernel8register2tp5write17h782af5159c13743bE:

000000008000436a <_ZN6kernel8register2tp5write17h782af5159c13743bE>:
8000436a: 41 11        	addi	sp, sp, -16
8000436c: 2a e4        	sd	a0, 8(sp)
8000436e: 2a 82        	add	tp, zero, a0
80004370: 41 01        	addi	sp, sp, 16
80004372: 82 80        	ret

Disassembly of section .text._ZN6kernel9interrupt4trap8trapinit17h7a7e2fa873c4d502E:

0000000080004374 <_ZN6kernel9interrupt4trap8trapinit17h7a7e2fa873c4d502E>:
80004374: 39 71        	addi	sp, sp, -64
80004376: 06 fc        	sd	ra, 56(sp)

0000000080004378 <.LBB0_3>:
80004378: 97 a5 00 00  	auipc	a1, 10
8000437c: 93 85 85 a8  	addi	a1, a1, -1400

0000000080004380 <.LBB0_4>:
80004380: 97 a6 00 00  	auipc	a3, 10
80004384: 93 86 06 a9  	addi	a3, a3, -1392
80004388: 28 00        	addi	a0, sp, 8
8000438a: 05 46        	addi	a2, zero, 1
8000438c: 01 47        	mv	a4, zero
8000438e: 97 d0 ff ff  	auipc	ra, 1048573
80004392: e7 80 a0 34  	jalr	842(ra)
80004396: 09 a0        	j	2 <.LBB0_4+0x18>
80004398: 28 00        	addi	a0, sp, 8
8000439a: 97 10 00 00  	auipc	ra, 1
8000439e: e7 80 80 ec  	jalr	-312(ra)
800043a2: 09 a0        	j	2 <.LBB0_4+0x24>
800043a4: e2 70        	ld	ra, 56(sp)
800043a6: 21 61        	addi	sp, sp, 64
800043a8: 82 80        	ret

Disassembly of section .text._ZN6kernel9interrupt4trap12trapinithart17h275678c54ee50647E:

00000000800043aa <_ZN6kernel9interrupt4trap12trapinithart17h275678c54ee50647E>:
800043aa: 39 71        	addi	sp, sp, -64
800043ac: 06 fc        	sd	ra, 56(sp)

00000000800043ae <.LBB1_4>:
800043ae: 97 a5 00 00  	auipc	a1, 10
800043b2: 93 85 a5 a7  	addi	a1, a1, -1414

00000000800043b6 <.LBB1_5>:
800043b6: 97 a6 00 00  	auipc	a3, 10
800043ba: 93 86 a6 a5  	addi	a3, a3, -1446
800043be: 28 00        	addi	a0, sp, 8
800043c0: 05 46        	addi	a2, zero, 1
800043c2: 01 47        	mv	a4, zero
800043c4: 97 d0 ff ff  	auipc	ra, 1048573
800043c8: e7 80 40 31  	jalr	788(ra)
800043cc: 09 a0        	j	2 <.LBB1_5+0x18>
800043ce: 28 00        	addi	a0, sp, 8
800043d0: 97 10 00 00  	auipc	ra, 1
800043d4: e7 80 20 e9  	jalr	-366(ra)
800043d8: 09 a0        	j	2 <.LBB1_6>

00000000800043da <.LBB1_6>:
800043da: 17 c5 ff ff  	auipc	a0, 1048572
800043de: 13 05 65 c4  	addi	a0, a0, -954
800043e2: 97 20 00 00  	auipc	ra, 2
800043e6: e7 80 20 c7  	jalr	-910(ra)
800043ea: 09 a0        	j	2 <.LBB1_6+0x12>
800043ec: e2 70        	ld	ra, 56(sp)
800043ee: 21 61        	addi	sp, sp, 64
800043f0: 82 80        	ret

Disassembly of section .text.kerneltrap:

00000000800043f2 <kerneltrap>:
800043f2: 49 71        	addi	sp, sp, -368
800043f4: 86 f6        	sd	ra, 360(sp)
800043f6: 2a e6        	sd	a0, 264(sp)
800043f8: 2e ea        	sd	a1, 272(sp)
800043fa: 32 ee        	sd	a2, 280(sp)
800043fc: 36 f2        	sd	a3, 288(sp)
800043fe: 3a f6        	sd	a4, 296(sp)
80004400: 3e fa        	sd	a5, 304(sp)
80004402: 42 fe        	sd	a6, 312(sp)
80004404: c6 e2        	sd	a7, 320(sp)
80004406: c6 f0        	sd	a7, 96(sp)
80004408: b2 ec        	sd	a2, 88(sp)
8000440a: ae e8        	sd	a1, 80(sp)
8000440c: aa e4        	sd	a0, 72(sp)
8000440e: 97 20 00 00  	auipc	ra, 2
80004412: e7 80 e0 c2  	jalr	-978(ra)
80004416: aa f4        	sd	a0, 104(sp)
80004418: 09 a0        	j	2 <kerneltrap+0x28>
8000441a: 97 40 00 00  	auipc	ra, 4
8000441e: e7 80 20 f0  	jalr	-254(ra)
80004422: aa 85        	add	a1, zero, a0
80004424: aa e6        	sd	a0, 328(sp)
80004426: ae e0        	sd	a1, 64(sp)
80004428: 09 a0        	j	2 <kerneltrap+0x38>
8000442a: 97 00 00 00  	auipc	ra, 0
8000442e: e7 80 20 56  	jalr	1378(ra)
80004432: aa 85        	add	a1, zero, a0
80004434: aa ea        	sd	a0, 336(sp)
80004436: 2e fc        	sd	a1, 56(sp)
80004438: 09 a0        	j	2 <kerneltrap+0x48>
8000443a: 97 40 00 00  	auipc	ra, 4
8000443e: e7 80 40 f4  	jalr	-188(ra)
80004442: 2a f8        	sd	a0, 48(sp)
80004444: 09 a0        	j	2 <kerneltrap+0x54>
80004446: 01 45        	mv	a0, zero
80004448: c2 75        	ld	a1, 48(sp)
8000444a: 63 82 a5 02  	beq	a1, a0, 36 <.LBB4_41+0x16>
8000444e: 09 a0        	j	2 <.LBB4_40>

0000000080004450 <.LBB4_40>:
80004450: 17 a5 00 00  	auipc	a0, 10
80004454: 13 05 c5 a1  	addi	a0, a0, -1508

0000000080004458 <.LBB4_41>:
80004458: 17 a6 00 00  	auipc	a2, 10
8000445c: 13 06 86 ab  	addi	a2, a2, -1352
80004460: 93 05 00 02  	addi	a1, zero, 32
80004464: 97 70 00 00  	auipc	ra, 7
80004468: e7 80 60 2d  	jalr	726(ra)
8000446c: 00 00        	unimp	
8000446e: 97 00 00 00  	auipc	ra, 0
80004472: e7 80 60 34  	jalr	838(ra)
80004476: aa 85        	add	a1, zero, a0
80004478: aa ee        	sd	a0, 344(sp)
8000447a: 2e f4        	sd	a1, 40(sp)
8000447c: 09 a0        	j	2 <.LBB4_41+0x26>
8000447e: 01 45        	mv	a0, zero
80004480: a2 75        	ld	a1, 40(sp)
80004482: 63 8c a5 02  	beq	a1, a0, 56 <.LBB4_43+0x16>
80004486: 09 a0        	j	2 <.LBB4_41+0x30>
80004488: 05 45        	addi	a0, zero, 1
8000448a: a2 75        	ld	a1, 40(sp)
8000448c: 63 81 a5 1a  	beq	a1, a0, 418 <.LBB4_55>
80004490: 09 a0        	j	2 <.LBB4_41+0x3a>
80004492: 09 45        	addi	a0, zero, 2
80004494: a2 75        	ld	a1, 40(sp)
80004496: 63 8a a5 1a  	beq	a1, a0, 436 <.LBB4_57>
8000449a: 09 a0        	j	2 <.LBB4_42>

000000008000449c <.LBB4_42>:
8000449c: 17 a5 00 00  	auipc	a0, 10
800044a0: 13 05 c5 a8  	addi	a0, a0, -1396

00000000800044a4 <.LBB4_43>:
800044a4: 17 a6 00 00  	auipc	a2, 10
800044a8: 13 06 c6 aa  	addi	a2, a2, -1364
800044ac: 93 05 80 02  	addi	a1, zero, 40
800044b0: 97 70 00 00  	auipc	ra, 7
800044b4: e7 80 a0 28  	jalr	650(ra)
800044b8: 00 00        	unimp	
800044ba: 26 75        	ld	a0, 104(sp)
800044bc: 93 05 25 00  	addi	a1, a0, 2
800044c0: 2e f0        	sd	a1, 32(sp)
800044c2: 63 ed a5 1a  	bltu	a1, a0, 442 <.LBB4_58>
800044c6: 09 a0        	j	2 <.LBB4_43+0x24>
800044c8: 02 75        	ld	a0, 32(sp)
800044ca: aa f4        	sd	a0, 104(sp)
800044cc: 62 75        	ld	a0, 56(sp)
800044ce: 97 00 00 00  	auipc	ra, 0
800044d2: e7 80 60 63  	jalr	1590(ra)
800044d6: aa fc        	sd	a0, 120(sp)
800044d8: 09 a0        	j	2 <.LBB4_43+0x36>
800044da: a8 18        	addi	a0, sp, 120
800044dc: 97 00 00 00  	auipc	ra, 0
800044e0: e7 80 80 6d  	jalr	1752(ra)
800044e4: 23 00 a1 08  	sb	a0, 128(sp)
800044e8: a3 00 b1 08  	sb	a1, 129(sp)
800044ec: 09 a0        	j	2 <.LBB4_43+0x4a>
800044ee: 03 45 01 08  	lbu	a0, 128(sp)
800044f2: 05 89        	andi	a0, a0, 1
800044f4: 01 ed        	bnez	a0, 24 <.LBB4_43+0x68>
800044f6: 09 a0        	j	2 <.LBB4_43+0x54>
800044f8: a8 18        	addi	a0, sp, 120
800044fa: 97 00 00 00  	auipc	ra, 0
800044fe: e7 80 a0 6b  	jalr	1722(ra)
80004502: 23 00 a1 10  	sb	a0, 256(sp)
80004506: a3 00 b1 10  	sb	a1, 257(sp)
8000450a: f9 a0        	j	206 <.LBB4_51+0x28>
8000450c: 03 45 11 08  	lbu	a0, 129(sp)
80004510: 8d 45        	addi	a1, zero, 3
80004512: 2a ec        	sd	a0, 24(sp)
80004514: 63 07 b5 02  	beq	a0, a1, 46 <.LBB4_44>
80004518: 09 a0        	j	2 <.LBB4_43+0x76>
8000451a: 11 45        	addi	a0, zero, 4
8000451c: e2 65        	ld	a1, 24(sp)
8000451e: 63 89 a5 04  	beq	a1, a0, 82 <.LBB4_46>
80004522: 09 a0        	j	2 <.LBB4_43+0x80>
80004524: 21 45        	addi	a0, zero, 8
80004526: e2 65        	ld	a1, 24(sp)
80004528: 63 8e a5 08  	beq	a1, a0, 156 <.LBB4_51+0x14>
8000452c: 09 a0        	j	2 <.LBB4_43+0x8a>
8000452e: 29 45        	addi	a0, zero, 10
80004530: e2 65        	ld	a1, 24(sp)
80004532: 63 8d a5 04  	beq	a1, a0, 90 <.LBB4_48>
80004536: 09 a0        	j	2 <.LBB4_43+0x94>
80004538: 2d 45        	addi	a0, zero, 11
8000453a: e2 65        	ld	a1, 24(sp)
8000453c: 63 86 a5 06  	beq	a1, a0, 108 <.LBB4_50>
80004540: 65 bf        	j	-72 <.LBB4_43+0x54>

0000000080004542 <.LBB4_44>:
80004542: 97 a5 00 00  	auipc	a1, 10
80004546: 93 85 e5 b2  	addi	a1, a1, -1234

000000008000454a <.LBB4_45>:
8000454a: 97 a6 00 00  	auipc	a3, 10
8000454e: 93 86 66 8c  	addi	a3, a3, -1850
80004552: 28 01        	addi	a0, sp, 136
80004554: 05 46        	addi	a2, zero, 1
80004556: 01 47        	mv	a4, zero
80004558: 97 d0 ff ff  	auipc	ra, 1048573
8000455c: e7 80 00 18  	jalr	384(ra)
80004560: 09 a0        	j	2 <.LBB4_45+0x18>
80004562: 28 01        	addi	a0, sp, 136
80004564: 97 10 00 00  	auipc	ra, 1
80004568: e7 80 e0 cf  	jalr	-770(ra)
8000456c: 09 a0        	j	2 <.LBB4_45+0x24>
8000456e: 7d a8        	j	190 <.LBB4_54+0x14>

0000000080004570 <.LBB4_46>:
80004570: 17 a5 00 00  	auipc	a0, 10
80004574: 13 05 85 ac  	addi	a0, a0, -1336

0000000080004578 <.LBB4_47>:
80004578: 17 a6 00 00  	auipc	a2, 10
8000457c: 13 06 06 ad  	addi	a2, a2, -1328
80004580: ad 45        	addi	a1, zero, 11
80004582: 97 70 00 00  	auipc	ra, 7
80004586: e7 80 80 1b  	jalr	440(ra)
8000458a: 00 00        	unimp	

000000008000458c <.LBB4_48>:
8000458c: 17 95 00 00  	auipc	a0, 9
80004590: 13 05 05 7f  	addi	a0, a0, 2032

0000000080004594 <.LBB4_49>:
80004594: 17 a6 00 00  	auipc	a2, 10
80004598: 13 06 c6 a8  	addi	a2, a2, -1396
8000459c: c1 45        	addi	a1, zero, 16
8000459e: 97 70 00 00  	auipc	ra, 7
800045a2: e7 80 c0 19  	jalr	412(ra)
800045a6: 00 00        	unimp	

00000000800045a8 <.LBB4_50>:
800045a8: 17 a5 00 00  	auipc	a0, 10
800045ac: 13 05 85 a4  	addi	a0, a0, -1464

00000000800045b0 <.LBB4_51>:
800045b0: 17 a6 00 00  	auipc	a2, 10
800045b4: 13 06 86 a5  	addi	a2, a2, -1448
800045b8: c5 45        	addi	a1, zero, 17
800045ba: 97 70 00 00  	auipc	ra, 7
800045be: e7 80 00 18  	jalr	384(ra)
800045c2: 00 00        	unimp	
800045c4: 26 65        	ld	a0, 72(sp)
800045c6: c6 65        	ld	a1, 80(sp)
800045c8: 66 66        	ld	a2, 88(sp)
800045ca: 86 76        	ld	a3, 96(sp)
800045cc: 97 20 00 00  	auipc	ra, 2
800045d0: e7 80 40 dc  	jalr	-572(ra)
800045d4: 09 a0        	j	2 <.LBB4_51+0x26>
800045d6: 99 a8        	j	86 <.LBB4_54+0x14>
800045d8: 08 02        	addi	a0, sp, 256
800045da: aa fd        	sd	a0, 248(sp)
800045dc: aa f2        	sd	a0, 352(sp)

00000000800045de <.LBB4_52>:
800045de: 97 05 00 00  	auipc	a1, 0
800045e2: 93 85 65 6d  	addi	a1, a1, 1750
800045e6: 97 d0 ff ff  	auipc	ra, 1048573
800045ea: e7 80 40 04  	jalr	68(ra)
800045ee: 2a e8        	sd	a0, 16(sp)
800045f0: 2e e4        	sd	a1, 8(sp)
800045f2: 09 a0        	j	2 <.LBB4_52+0x16>
800045f4: 42 65        	ld	a0, 16(sp)
800045f6: aa f5        	sd	a0, 232(sp)
800045f8: a2 65        	ld	a1, 8(sp)
800045fa: ae f9        	sd	a1, 240(sp)

00000000800045fc <.LBB4_53>:
800045fc: 97 a5 00 00  	auipc	a1, 10
80004600: 93 85 c5 9c  	addi	a1, a1, -1588
80004604: 28 19        	addi	a0, sp, 184
80004606: b4 11        	addi	a3, sp, 232
80004608: 05 46        	addi	a2, zero, 1
8000460a: 32 e0        	sd	a2, 0(sp)
8000460c: 02 67        	ld	a4, 0(sp)
8000460e: 97 d0 ff ff  	auipc	ra, 1048573
80004612: e7 80 a0 0c  	jalr	202(ra)
80004616: 09 a0        	j	2 <.LBB4_54>

0000000080004618 <.LBB4_54>:
80004618: 97 a5 00 00  	auipc	a1, 10
8000461c: 93 85 05 9c  	addi	a1, a1, -1600
80004620: 28 19        	addi	a0, sp, 184
80004622: 97 70 00 00  	auipc	ra, 7
80004626: e7 80 40 18  	jalr	388(ra)
8000462a: 00 00        	unimp	
8000462c: 0d a8        	j	50 <.LBB4_57+0x14>

000000008000462e <.LBB4_55>:
8000462e: 17 a5 00 00  	auipc	a0, 10
80004632: 13 05 a5 93  	addi	a0, a0, -1734

0000000080004636 <.LBB4_56>:
80004636: 17 a6 00 00  	auipc	a2, 10
8000463a: 13 06 a6 94  	addi	a2, a2, -1718
8000463e: c9 45        	addi	a1, zero, 18
80004640: 97 70 00 00  	auipc	ra, 7
80004644: e7 80 a0 0f  	jalr	250(ra)
80004648: 00 00        	unimp	

000000008000464a <.LBB4_57>:
8000464a: 17 35 02 00  	auipc	a0, 35
8000464e: 13 05 65 9b  	addi	a0, a0, -1610
80004652: 97 e0 ff ff  	auipc	ra, 1048574
80004656: e7 80 c0 23  	jalr	572(ra)
8000465a: 09 a0        	j	2 <.LBB4_57+0x12>
8000465c: 09 a0        	j	2 <.LBB4_57+0x14>
8000465e: 26 75        	ld	a0, 104(sp)
80004660: 97 20 00 00  	auipc	ra, 2
80004664: e7 80 80 9e  	jalr	-1560(ra)
80004668: 09 a0        	j	2 <.LBB4_57+0x20>
8000466a: 06 65        	ld	a0, 64(sp)
8000466c: 97 40 00 00  	auipc	ra, 4
80004670: e7 80 c0 cb  	jalr	-836(ra)
80004674: 09 a0        	j	2 <.LBB4_57+0x2c>
80004676: b6 70        	ld	ra, 360(sp)
80004678: 75 61        	addi	sp, sp, 368
8000467a: 82 80        	ret

000000008000467c <.LBB4_58>:
8000467c: 17 95 00 00  	auipc	a0, 9
80004680: 13 05 45 7d  	addi	a0, a0, 2004

0000000080004684 <.LBB4_59>:
80004684: 17 a6 00 00  	auipc	a2, 10
80004688: 13 06 46 91  	addi	a2, a2, -1772
8000468c: f1 45        	addi	a1, zero, 28
8000468e: 97 70 00 00  	auipc	ra, 7
80004692: e7 80 c0 0a  	jalr	172(ra)
80004696: 00 00        	unimp	

Disassembly of section .text._ZN6kernel9interrupt4trap9clockintr17hba211978d7fe49ecE:

0000000080004698 <_ZN6kernel9interrupt4trap9clockintr17hba211978d7fe49ecE>:
80004698: 35 71        	addi	sp, sp, -160
8000469a: 06 ed        	sd	ra, 152(sp)

000000008000469c <.LBB5_15>:
8000469c: 17 65 01 00  	auipc	a0, 22
800046a0: 13 05 45 9f  	addi	a0, a0, -1548
800046a4: 97 d0 ff ff  	auipc	ra, 1048573
800046a8: e7 80 c0 75  	jalr	1884(ra)
800046ac: aa e0        	sd	a0, 64(sp)
800046ae: 09 a0        	j	2 <.LBB5_15+0x14>
800046b0: 88 00        	addi	a0, sp, 64
800046b2: 97 e0 ff ff  	auipc	ra, 1048574
800046b6: e7 80 20 ee  	jalr	-286(ra)
800046ba: 2a fc        	sd	a0, 56(sp)
800046bc: 09 a0        	j	2 <.LBB5_15+0x22>
800046be: 62 75        	ld	a0, 56(sp)
800046c0: 0c 61        	ld	a1, 0(a0)
800046c2: 13 86 15 00  	addi	a2, a1, 1
800046c6: 32 f8        	sd	a2, 48(sp)
800046c8: 63 68 b6 0c  	bltu	a2, a1, 208 <.LBB5_18>
800046cc: 09 a0        	j	2 <.LBB5_15+0x32>
800046ce: 88 00        	addi	a0, sp, 64
800046d0: 97 e0 ff ff  	auipc	ra, 1048574
800046d4: e7 80 40 f2  	jalr	-220(ra)
800046d8: 2a f4        	sd	a0, 40(sp)
800046da: 09 a0        	j	2 <.LBB5_15+0x40>
800046dc: 42 75        	ld	a0, 48(sp)
800046de: a2 75        	ld	a1, 40(sp)
800046e0: 88 e1        	sd	a0, 0(a1)
800046e2: 88 00        	addi	a0, sp, 64
800046e4: 97 e0 ff ff  	auipc	ra, 1048574
800046e8: e7 80 00 eb  	jalr	-336(ra)
800046ec: 2a f0        	sd	a0, 32(sp)
800046ee: 09 a0        	j	2 <.LBB5_15+0x54>
800046f0: 02 75        	ld	a0, 32(sp)
800046f2: 0c 61        	ld	a1, 0(a0)
800046f4: 13 d6 25 00  	srli	a2, a1, 2
800046f8: b7 f6 51 00  	lui	a3, 1311
800046fc: 9b 86 56 b8  	addiw	a3, a3, -1147
80004700: b6 06        	slli	a3, a3, 13
80004702: 93 86 76 3d  	addi	a3, a3, 983
80004706: ba 06        	slli	a3, a3, 14
80004708: 93 86 f6 28  	addi	a3, a3, 655
8000470c: b2 06        	slli	a3, a3, 12
8000470e: 93 86 36 5c  	addi	a3, a3, 1475
80004712: 33 36 d6 02  	<unknown>
80004716: 09 82        	srli	a2, a2, 2
80004718: 93 06 40 06  	addi	a3, zero, 100
8000471c: 33 06 d6 02  	<unknown>
80004720: 91 8d        	sub	a1, a1, a2
80004722: 01 46        	mv	a2, zero
80004724: 63 9a c5 00  	bne	a1, a2, 20 <.LBB5_15+0x9c>
80004728: 09 a0        	j	2 <.LBB5_15+0x8e>
8000472a: 88 00        	addi	a0, sp, 64
8000472c: 97 e0 ff ff  	auipc	ra, 1048574
80004730: e7 80 80 e6  	jalr	-408(ra)
80004734: 2a ec        	sd	a0, 24(sp)
80004736: 11 a0        	j	4 <.LBB5_15+0x9e>
80004738: b9 a0        	j	78 <.LBB5_17+0x28>
8000473a: 62 65        	ld	a0, 24(sp)
8000473c: 2a e5        	sd	a0, 136(sp)
8000473e: 2a e9        	sd	a0, 144(sp)

0000000080004740 <.LBB5_16>:
80004740: 97 95 00 00  	auipc	a1, 9
80004744: 93 85 05 b3  	addi	a1, a1, -1232
80004748: 97 70 00 00  	auipc	ra, 7
8000474c: e7 80 40 a4  	jalr	-1468(ra)
80004750: 2a e8        	sd	a0, 16(sp)
80004752: 2e e4        	sd	a1, 8(sp)
80004754: 09 a0        	j	2 <.LBB5_16+0x16>
80004756: 42 65        	ld	a0, 16(sp)
80004758: aa fc        	sd	a0, 120(sp)
8000475a: a2 65        	ld	a1, 8(sp)
8000475c: 2e e1        	sd	a1, 128(sp)

000000008000475e <.LBB5_17>:
8000475e: 97 a5 00 00  	auipc	a1, 10
80004762: 93 85 25 94  	addi	a1, a1, -1726
80004766: a8 00        	addi	a0, sp, 72
80004768: 09 46        	addi	a2, zero, 2
8000476a: b4 18        	addi	a3, sp, 120
8000476c: 05 47        	addi	a4, zero, 1
8000476e: 97 d0 ff ff  	auipc	ra, 1048573
80004772: e7 80 a0 f6  	jalr	-150(ra)
80004776: 09 a0        	j	2 <.LBB5_17+0x1a>
80004778: a8 00        	addi	a0, sp, 72
8000477a: 97 10 00 00  	auipc	ra, 1
8000477e: e7 80 80 ae  	jalr	-1304(ra)
80004782: 09 a0        	j	2 <.LBB5_17+0x26>
80004784: 09 a0        	j	2 <.LBB5_17+0x28>
80004786: 06 65        	ld	a0, 64(sp)
80004788: 97 d0 ff ff  	auipc	ra, 1048573
8000478c: e7 80 80 01  	jalr	24(ra)
80004790: 09 a0        	j	2 <.LBB5_17+0x34>
80004792: ea 60        	ld	ra, 152(sp)
80004794: 0d 61        	addi	sp, sp, 160
80004796: 82 80        	ret

0000000080004798 <.LBB5_18>:
80004798: 17 95 00 00  	auipc	a0, 9
8000479c: 13 05 85 6b  	addi	a0, a0, 1720

00000000800047a0 <.LBB5_19>:
800047a0: 17 a6 00 00  	auipc	a2, 10
800047a4: 13 06 06 8e  	addi	a2, a2, -1824
800047a8: f1 45        	addi	a1, zero, 28
800047aa: 97 70 00 00  	auipc	ra, 7
800047ae: e7 80 00 f9  	jalr	-112(ra)
800047b2: 00 00        	unimp	

Disassembly of section .text._ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E:

00000000800047b4 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E>:
800047b4: 29 71        	addi	sp, sp, -320
800047b6: 06 fe        	sd	ra, 312(sp)
800047b8: 97 00 00 00  	auipc	ra, 0
800047bc: e7 80 40 1d  	jalr	468(ra)
800047c0: aa 85        	add	a1, zero, a0
800047c2: 2a f6        	sd	a0, 296(sp)
800047c4: 2e f4        	sd	a1, 40(sp)
800047c6: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x14>
800047c8: 22 75        	ld	a0, 40(sp)
800047ca: 97 00 00 00  	auipc	ra, 0
800047ce: e7 80 a0 33  	jalr	826(ra)
800047d2: 2a fc        	sd	a0, 56(sp)
800047d4: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x22>
800047d6: 28 18        	addi	a0, sp, 56
800047d8: 97 00 00 00  	auipc	ra, 0
800047dc: e7 80 c0 3d  	jalr	988(ra)
800047e0: 23 00 a1 04  	sb	a0, 64(sp)
800047e4: a3 00 b1 04  	sb	a1, 65(sp)
800047e8: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x36>
800047ea: 03 45 01 04  	lbu	a0, 64(sp)
800047ee: 05 89        	andi	a0, a0, 1
800047f0: 11 ed        	bnez	a0, 28 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x58>
800047f2: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x40>
800047f4: 03 45 11 04  	lbu	a0, 65(sp)
800047f8: 85 45        	addi	a1, zero, 1
800047fa: 2a f0        	sd	a0, 32(sp)
800047fc: 63 02 b5 14  	beq	a0, a1, 324 <.LBB6_48+0x4c>
80004800: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x4e>
80004802: 15 45        	addi	a0, zero, 5
80004804: 82 75        	ld	a1, 32(sp)
80004806: 63 86 a5 00  	beq	a1, a0, 12 <.LBB6_41>
8000480a: 09 a0        	j	2 <_ZN6kernel9interrupt4trap7devintr17h1914f69419ee6ed1E+0x58>
8000480c: 01 45        	mv	a0, zero
8000480e: 2a f8        	sd	a0, 48(sp)
80004810: 95 aa        	j	372 <.LBB6_48+0x90>

0000000080004812 <.LBB6_41>:
80004812: 97 a5 00 00  	auipc	a1, 10
80004816: 93 85 65 8d  	addi	a1, a1, -1834

000000008000481a <.LBB6_42>:
8000481a: 97 96 00 00  	auipc	a3, 9
8000481e: 93 86 66 5f  	addi	a3, a3, 1526
80004822: a8 00        	addi	a0, sp, 72
80004824: 05 46        	addi	a2, zero, 1
80004826: 01 47        	mv	a4, zero
80004828: 97 d0 ff ff  	auipc	ra, 1048573
8000482c: e7 80 00 eb  	jalr	-336(ra)
80004830: 09 a0        	j	2 <.LBB6_42+0x18>
80004832: a8 00        	addi	a0, sp, 72
80004834: 97 10 00 00  	auipc	ra, 1
80004838: e7 80 e0 a2  	jalr	-1490(ra)
8000483c: 09 a0        	j	2 <.LBB6_42+0x24>
8000483e: 97 20 00 00  	auipc	ra, 2
80004842: e7 80 e0 97  	jalr	-1666(ra)
80004846: aa fc        	sd	a0, 120(sp)
80004848: 09 a0        	j	2 <.LBB6_42+0x30>
8000484a: 66 75        	ld	a0, 120(sp)
8000484c: a9 45        	addi	a1, zero, 10
8000484e: 63 18 b5 00  	bne	a0, a1, 16 <.LBB6_42+0x44>
80004852: 09 a0        	j	2 <.LBB6_42+0x3a>
80004854: 97 10 00 00  	auipc	ra, 1
80004858: e7 80 80 3a  	jalr	936(ra)
8000485c: 31 a0        	j	12 <.LBB6_43>
8000485e: 66 75        	ld	a0, 120(sp)
80004860: 85 45        	addi	a1, zero, 1
80004862: 63 0a b5 02  	beq	a0, a1, 52 <.LBB6_45>
80004866: 81 a8        	j	80 <.LBB6_46+0x18>

0000000080004868 <.LBB6_43>:
80004868: 97 a5 00 00  	auipc	a1, 10
8000486c: 93 85 05 8a  	addi	a1, a1, -1888

0000000080004870 <.LBB6_44>:
80004870: 97 96 00 00  	auipc	a3, 9
80004874: 93 86 06 5a  	addi	a3, a3, 1440
80004878: 08 01        	addi	a0, sp, 128
8000487a: 05 46        	addi	a2, zero, 1
8000487c: 01 47        	mv	a4, zero
8000487e: 97 d0 ff ff  	auipc	ra, 1048573
80004882: e7 80 a0 e5  	jalr	-422(ra)
80004886: 09 a0        	j	2 <.LBB6_44+0x18>
80004888: 08 01        	addi	a0, sp, 128
8000488a: 97 10 00 00  	auipc	ra, 1
8000488e: e7 80 80 9d  	jalr	-1576(ra)
80004892: 09 a0        	j	2 <.LBB6_44+0x24>
80004894: 71 a0        	j	140 <.LBB6_48+0x2c>

0000000080004896 <.LBB6_45>:
80004896: 97 a5 00 00  	auipc	a1, 10
8000489a: 93 85 a5 89  	addi	a1, a1, -1894

000000008000489e <.LBB6_46>:
8000489e: 97 96 00 00  	auipc	a3, 9
800048a2: 93 86 26 57  	addi	a3, a3, 1394
800048a6: 08 19        	addi	a0, sp, 176
800048a8: 05 46        	addi	a2, zero, 1
800048aa: 01 47        	mv	a4, zero
800048ac: 97 d0 ff ff  	auipc	ra, 1048573
800048b0: e7 80 c0 e2  	jalr	-468(ra)
800048b4: 31 a0        	j	12 <.LBB6_46+0x22>
800048b6: 66 75        	ld	a0, 120(sp)
800048b8: 81 45        	mv	a1, zero
800048ba: 63 08 b5 02  	beq	a0, a1, 48 <.LBB6_47+0x16>
800048be: 01 a8        	j	16 <.LBB6_46+0x30>
800048c0: 08 19        	addi	a0, sp, 176
800048c2: 97 10 00 00  	auipc	ra, 1
800048c6: e7 80 00 9a  	jalr	-1632(ra)
800048ca: 09 a0        	j	2 <.LBB6_46+0x2e>
800048cc: 89 a8        	j	82 <.LBB6_48+0x2a>
800048ce: a8 18        	addi	a0, sp, 120
800048d0: 2a f2        	sd	a0, 288(sp)
800048d2: 2a fa        	sd	a0, 304(sp)

00000000800048d4 <.LBB6_47>:
800048d4: 97 95 00 00  	auipc	a1, 9
800048d8: 93 85 c5 99  	addi	a1, a1, -1636
800048dc: 97 70 00 00  	auipc	ra, 7
800048e0: e7 80 00 8b  	jalr	-1872(ra)
800048e4: 2a ec        	sd	a0, 24(sp)
800048e6: 2e e8        	sd	a1, 16(sp)
800048e8: 11 a0        	j	4 <.LBB6_47+0x18>
800048ea: 0d a8        	j	50 <.LBB6_48+0x28>
800048ec: 62 65        	ld	a0, 24(sp)
800048ee: 2a ea        	sd	a0, 272(sp)
800048f0: c2 65        	ld	a1, 16(sp)
800048f2: 2e ee        	sd	a1, 280(sp)

00000000800048f4 <.LBB6_48>:
800048f4: 97 a5 00 00  	auipc	a1, 10
800048f8: 93 85 c5 86  	addi	a1, a1, -1940
800048fc: 88 11        	addi	a0, sp, 224
800048fe: 09 46        	addi	a2, zero, 2
80004900: 14 0a        	addi	a3, sp, 272
80004902: 05 47        	addi	a4, zero, 1
80004904: 97 d0 ff ff  	auipc	ra, 1048573
80004908: e7 80 40 dd  	jalr	-556(ra)
8000490c: 09 a0        	j	2 <.LBB6_48+0x1a>
8000490e: 88 11        	addi	a0, sp, 224
80004910: 97 10 00 00  	auipc	ra, 1
80004914: e7 80 20 95  	jalr	-1710(ra)
80004918: 09 a0        	j	2 <.LBB6_48+0x26>
8000491a: 09 a0        	j	2 <.LBB6_48+0x28>
8000491c: 09 a0        	j	2 <.LBB6_48+0x2a>
8000491e: 09 a0        	j	2 <.LBB6_48+0x2c>
80004920: 66 75        	ld	a0, 120(sp)
80004922: 81 45        	mv	a1, zero
80004924: 63 09 b5 00  	beq	a0, a1, 18 <.LBB6_48+0x42>
80004928: 09 a0        	j	2 <.LBB6_48+0x36>
8000492a: 66 75        	ld	a0, 120(sp)
8000492c: 97 20 00 00  	auipc	ra, 2
80004930: e7 80 00 8d  	jalr	-1840(ra)
80004934: 11 a0        	j	4 <.LBB6_48+0x44>
80004936: 11 a0        	j	4 <.LBB6_48+0x46>
80004938: 09 a0        	j	2 <.LBB6_48+0x46>
8000493a: 05 45        	addi	a0, zero, 1
8000493c: 2a f8        	sd	a0, 48(sp)
8000493e: 99 a0        	j	70 <.LBB6_48+0x90>
80004940: 97 e0 ff ff  	auipc	ra, 1048574
80004944: e7 80 20 e7  	jalr	-398(ra)
80004948: 2a e4        	sd	a0, 8(sp)
8000494a: 09 a0        	j	2 <.LBB6_48+0x58>
8000494c: 01 45        	mv	a0, zero
8000494e: a2 65        	ld	a1, 8(sp)
80004950: 63 98 a5 00  	bne	a1, a0, 16 <.LBB6_48+0x6c>
80004954: 09 a0        	j	2 <.LBB6_48+0x62>
80004956: 97 00 00 00  	auipc	ra, 0
8000495a: e7 80 20 d4  	jalr	-702(ra)
8000495e: 11 a0        	j	4 <.LBB6_48+0x6e>
80004960: 11 a0        	j	4 <.LBB6_48+0x70>
80004962: 09 a0        	j	2 <.LBB6_48+0x70>
80004964: 97 10 00 00  	auipc	ra, 1
80004968: e7 80 40 6b  	jalr	1716(ra)
8000496c: 2a e0        	sd	a0, 0(sp)
8000496e: 09 a0        	j	2 <.LBB6_48+0x7c>
80004970: 02 65        	ld	a0, 0(sp)
80004972: 75 99        	andi	a0, a0, -3
80004974: 97 10 00 00  	auipc	ra, 1
80004978: e7 80 00 6b  	jalr	1712(ra)
8000497c: 09 a0        	j	2 <.LBB6_48+0x8a>
8000497e: 09 45        	addi	a0, zero, 2
80004980: 2a f8        	sd	a0, 48(sp)
80004982: 09 a0        	j	2 <.LBB6_48+0x90>
80004984: 42 75        	ld	a0, 48(sp)
80004986: f2 70        	ld	ra, 312(sp)
80004988: 31 61        	addi	sp, sp, 320
8000498a: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause4read17h5d8f6b8f737dbd84E:

000000008000498c <_ZN6kernel8register6scause4read17h5d8f6b8f737dbd84E>:
8000498c: 41 11        	addi	sp, sp, -16
8000498e: 73 25 20 14  	csrr	a0, scause
80004992: 2a e4        	sd	a0, 8(sp)
80004994: 41 01        	addi	sp, sp, 16
80004996: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE:

0000000080004998 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE>:
80004998: 01 11        	addi	sp, sp, -32
8000499a: 2a ec        	sd	a0, 24(sp)
8000499c: 81 45        	mv	a1, zero
8000499e: 2a e4        	sd	a0, 8(sp)
800049a0: 63 00 b5 04  	beq	a0, a1, 64 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x48>
800049a4: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0xe>
800049a6: 05 45        	addi	a0, zero, 1
800049a8: a2 65        	ld	a1, 8(sp)
800049aa: 63 8f a5 02  	beq	a1, a0, 62 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x50>
800049ae: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x18>
800049b0: 11 45        	addi	a0, zero, 4
800049b2: a2 65        	ld	a1, 8(sp)
800049b4: 63 8e a5 02  	beq	a1, a0, 60 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x58>
800049b8: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x22>
800049ba: 15 45        	addi	a0, zero, 5
800049bc: a2 65        	ld	a1, 8(sp)
800049be: 63 8d a5 02  	beq	a1, a0, 58 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x60>
800049c2: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x2c>
800049c4: 21 45        	addi	a0, zero, 8
800049c6: a2 65        	ld	a1, 8(sp)
800049c8: 63 8c a5 02  	beq	a1, a0, 56 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x68>
800049cc: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x36>
800049ce: 25 45        	addi	a0, zero, 9
800049d0: a2 65        	ld	a1, 8(sp)
800049d2: 63 8b a5 02  	beq	a1, a0, 54 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x70>
800049d6: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x40>
800049d8: 19 45        	addi	a0, zero, 6
800049da: a3 0b a1 00  	sb	a0, 23(sp)
800049de: 0d a8        	j	50 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
800049e0: 01 45        	mv	a0, zero
800049e2: a3 0b a1 00  	sb	a0, 23(sp)
800049e6: 2d a0        	j	42 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
800049e8: 05 45        	addi	a0, zero, 1
800049ea: a3 0b a1 00  	sb	a0, 23(sp)
800049ee: 0d a0        	j	34 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
800049f0: 09 45        	addi	a0, zero, 2
800049f2: a3 0b a1 00  	sb	a0, 23(sp)
800049f6: 29 a8        	j	26 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
800049f8: 0d 45        	addi	a0, zero, 3
800049fa: a3 0b a1 00  	sb	a0, 23(sp)
800049fe: 09 a8        	j	18 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
80004a00: 11 45        	addi	a0, zero, 4
80004a02: a3 0b a1 00  	sb	a0, 23(sp)
80004a06: 29 a0        	j	10 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
80004a08: 15 45        	addi	a0, zero, 5
80004a0a: a3 0b a1 00  	sb	a0, 23(sp)
80004a0e: 09 a0        	j	2 <_ZN6kernel8register6scause9Interrupt4from17hacc8bbe41ba3841eE+0x78>
80004a10: 03 05 71 01  	lb	a0, 23(sp)
80004a14: 05 61        	addi	sp, sp, 32
80004a16: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E:

0000000080004a18 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E>:
80004a18: 01 11        	addi	sp, sp, -32
80004a1a: 2a ec        	sd	a0, 24(sp)
80004a1c: 81 45        	mv	a1, zero
80004a1e: 2a e4        	sd	a0, 8(sp)
80004a20: 63 0e b5 06  	beq	a0, a1, 124 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x84>
80004a24: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe>
80004a26: 05 45        	addi	a0, zero, 1
80004a28: a2 65        	ld	a1, 8(sp)
80004a2a: 63 8d a5 06  	beq	a1, a0, 122 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x8c>
80004a2e: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x18>
80004a30: 09 45        	addi	a0, zero, 2
80004a32: a2 65        	ld	a1, 8(sp)
80004a34: 63 8c a5 06  	beq	a1, a0, 120 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x94>
80004a38: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x22>
80004a3a: 0d 45        	addi	a0, zero, 3
80004a3c: a2 65        	ld	a1, 8(sp)
80004a3e: 63 8b a5 06  	beq	a1, a0, 118 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x9c>
80004a42: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x2c>
80004a44: 15 45        	addi	a0, zero, 5
80004a46: a2 65        	ld	a1, 8(sp)
80004a48: 63 8a a5 06  	beq	a1, a0, 116 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xa4>
80004a4c: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x36>
80004a4e: 19 45        	addi	a0, zero, 6
80004a50: a2 65        	ld	a1, 8(sp)
80004a52: 63 89 a5 06  	beq	a1, a0, 114 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xac>
80004a56: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x40>
80004a58: 1d 45        	addi	a0, zero, 7
80004a5a: a2 65        	ld	a1, 8(sp)
80004a5c: 63 88 a5 06  	beq	a1, a0, 112 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xb4>
80004a60: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x4a>
80004a62: 21 45        	addi	a0, zero, 8
80004a64: a2 65        	ld	a1, 8(sp)
80004a66: 63 87 a5 06  	beq	a1, a0, 110 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xbc>
80004a6a: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x54>
80004a6c: 25 45        	addi	a0, zero, 9
80004a6e: a2 65        	ld	a1, 8(sp)
80004a70: 63 86 a5 06  	beq	a1, a0, 108 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xc4>
80004a74: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x5e>
80004a76: 31 45        	addi	a0, zero, 12
80004a78: a2 65        	ld	a1, 8(sp)
80004a7a: 63 85 a5 06  	beq	a1, a0, 106 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xcc>
80004a7e: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x68>
80004a80: 35 45        	addi	a0, zero, 13
80004a82: a2 65        	ld	a1, 8(sp)
80004a84: 63 84 a5 06  	beq	a1, a0, 104 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xd4>
80004a88: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x72>
80004a8a: 3d 45        	addi	a0, zero, 15
80004a8c: a2 65        	ld	a1, 8(sp)
80004a8e: 63 83 a5 06  	beq	a1, a0, 102 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xdc>
80004a92: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0x7c>
80004a94: 31 45        	addi	a0, zero, 12
80004a96: a3 0b a1 00  	sb	a0, 23(sp)
80004a9a: 8d a0        	j	98 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004a9c: 01 45        	mv	a0, zero
80004a9e: a3 0b a1 00  	sb	a0, 23(sp)
80004aa2: a9 a8        	j	90 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004aa4: 05 45        	addi	a0, zero, 1
80004aa6: a3 0b a1 00  	sb	a0, 23(sp)
80004aaa: 89 a8        	j	82 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004aac: 09 45        	addi	a0, zero, 2
80004aae: a3 0b a1 00  	sb	a0, 23(sp)
80004ab2: a9 a0        	j	74 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004ab4: 0d 45        	addi	a0, zero, 3
80004ab6: a3 0b a1 00  	sb	a0, 23(sp)
80004aba: 89 a0        	j	66 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004abc: 11 45        	addi	a0, zero, 4
80004abe: a3 0b a1 00  	sb	a0, 23(sp)
80004ac2: 2d a8        	j	58 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004ac4: 15 45        	addi	a0, zero, 5
80004ac6: a3 0b a1 00  	sb	a0, 23(sp)
80004aca: 0d a8        	j	50 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004acc: 19 45        	addi	a0, zero, 6
80004ace: a3 0b a1 00  	sb	a0, 23(sp)
80004ad2: 2d a0        	j	42 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004ad4: 1d 45        	addi	a0, zero, 7
80004ad6: a3 0b a1 00  	sb	a0, 23(sp)
80004ada: 0d a0        	j	34 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004adc: 21 45        	addi	a0, zero, 8
80004ade: a3 0b a1 00  	sb	a0, 23(sp)
80004ae2: 29 a8        	j	26 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004ae4: 25 45        	addi	a0, zero, 9
80004ae6: a3 0b a1 00  	sb	a0, 23(sp)
80004aea: 09 a8        	j	18 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004aec: 29 45        	addi	a0, zero, 10
80004aee: a3 0b a1 00  	sb	a0, 23(sp)
80004af2: 29 a0        	j	10 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004af4: 2d 45        	addi	a0, zero, 11
80004af6: a3 0b a1 00  	sb	a0, 23(sp)
80004afa: 09 a0        	j	2 <_ZN6kernel8register6scause9Exception4from17h8f3dfd55847a52e9E+0xe4>
80004afc: 03 05 71 01  	lb	a0, 23(sp)
80004b00: 05 61        	addi	sp, sp, 32
80004b02: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause6Scause3new17h3493d0702cd944dbE:

0000000080004b04 <_ZN6kernel8register6scause6Scause3new17h3493d0702cd944dbE>:
80004b04: 41 11        	addi	sp, sp, -16
80004b06: 2a e4        	sd	a0, 8(sp)
80004b08: 2a e0        	sd	a0, 0(sp)
80004b0a: 41 01        	addi	sp, sp, 16
80004b0c: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E:

0000000080004b0e <_ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E>:
80004b0e: 79 71        	addi	sp, sp, -48
80004b10: 2a f0        	sd	a0, 32(sp)
80004b12: 2a ec        	sd	a0, 24(sp)
80004b14: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E+0x8>
80004b16: 13 05 00 04  	addi	a0, zero, 64
80004b1a: 81 45        	mv	a1, zero
80004b1c: 2a e8        	sd	a0, 16(sp)
80004b1e: 95 ed        	bnez	a1, 60 <.LBB4_8>
80004b20: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E+0x14>
80004b22: 42 65        	ld	a0, 16(sp)
80004b24: 93 05 f5 ff  	addi	a1, a0, -1
80004b28: 2e e4        	sd	a1, 8(sp)
80004b2a: 63 67 b5 04  	bltu	a0, a1, 78 <.LBB4_10>
80004b2e: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E+0x22>
80004b30: 22 65        	ld	a0, 8(sp)
80004b32: 93 75 05 fc  	andi	a1, a0, -64
80004b36: 05 46        	addi	a2, zero, 1
80004b38: 33 16 a6 00  	sll	a2, a2, a0
80004b3c: 81 46        	mv	a3, zero
80004b3e: 32 e0        	sd	a2, 0(sp)
80004b40: 63 9b d5 04  	bne	a1, a3, 86 <.LBB4_12>
80004b44: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause4code17hefdc752b6860e129E+0x38>
80004b46: 02 65        	ld	a0, 0(sp)
80004b48: 2a f4        	sd	a0, 40(sp)
80004b4a: e2 65        	ld	a1, 24(sp)
80004b4c: 90 61        	ld	a2, 0(a1)
80004b4e: 93 46 f5 ff  	not	a3, a0
80004b52: 33 75 d6 00  	and	a0, a2, a3
80004b56: 45 61        	addi	sp, sp, 48
80004b58: 82 80        	ret

0000000080004b5a <.LBB4_8>:
80004b5a: 17 95 00 00  	auipc	a0, 9
80004b5e: 13 05 65 65  	addi	a0, a0, 1622

0000000080004b62 <.LBB4_9>:
80004b62: 17 96 00 00  	auipc	a2, 9
80004b66: 13 06 66 63  	addi	a2, a2, 1590
80004b6a: 93 05 10 02  	addi	a1, zero, 33
80004b6e: 97 70 00 00  	auipc	ra, 7
80004b72: e7 80 c0 bc  	jalr	-1076(ra)
80004b76: 00 00        	unimp	

0000000080004b78 <.LBB4_10>:
80004b78: 17 95 00 00  	auipc	a0, 9
80004b7c: 13 05 85 67  	addi	a0, a0, 1656

0000000080004b80 <.LBB4_11>:
80004b80: 17 96 00 00  	auipc	a2, 9
80004b84: 13 06 86 65  	addi	a2, a2, 1624
80004b88: 93 05 10 02  	addi	a1, zero, 33
80004b8c: 97 70 00 00  	auipc	ra, 7
80004b90: e7 80 e0 ba  	jalr	-1106(ra)
80004b94: 00 00        	unimp	

0000000080004b96 <.LBB4_12>:
80004b96: 17 95 00 00  	auipc	a0, 9
80004b9a: 13 05 a5 69  	addi	a0, a0, 1690

0000000080004b9e <.LBB4_13>:
80004b9e: 17 96 00 00  	auipc	a2, 9
80004ba2: 13 06 a6 67  	addi	a2, a2, 1658
80004ba6: 93 05 30 02  	addi	a1, zero, 35
80004baa: 97 70 00 00  	auipc	ra, 7
80004bae: e7 80 00 b9  	jalr	-1136(ra)
80004bb2: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E:

0000000080004bb4 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E>:
80004bb4: 5d 71        	addi	sp, sp, -80
80004bb6: 86 e4        	sd	ra, 72(sp)
80004bb8: aa e0        	sd	a0, 64(sp)
80004bba: 2a f8        	sd	a0, 48(sp)
80004bbc: 97 00 00 00  	auipc	ra, 0
80004bc0: e7 80 00 08  	jalr	128(ra)
80004bc4: 2a f4        	sd	a0, 40(sp)
80004bc6: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x14>
80004bc8: 01 45        	mv	a0, zero
80004bca: a2 75        	ld	a1, 40(sp)
80004bcc: 63 8a a5 00  	beq	a1, a0, 20 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x2c>
80004bd0: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x1e>
80004bd2: 42 75        	ld	a0, 48(sp)
80004bd4: 97 00 00 00  	auipc	ra, 0
80004bd8: e7 80 a0 f3  	jalr	-198(ra)
80004bdc: 2a f0        	sd	a0, 32(sp)
80004bde: 01 a8        	j	16 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x3a>
80004be0: 42 75        	ld	a0, 48(sp)
80004be2: 97 00 00 00  	auipc	ra, 0
80004be6: e7 80 c0 f2  	jalr	-212(ra)
80004bea: 2a ec        	sd	a0, 24(sp)
80004bec: 0d a0        	j	34 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x5a>
80004bee: 02 75        	ld	a0, 32(sp)
80004bf0: 97 00 00 00  	auipc	ra, 0
80004bf4: e7 80 80 da  	jalr	-600(ra)
80004bf8: 13 75 f5 0f  	andi	a0, a0, 255
80004bfc: 2a e8        	sd	a0, 16(sp)
80004bfe: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x4c>
80004c00: 42 65        	ld	a0, 16(sp)
80004c02: a3 0c a1 02  	sb	a0, 57(sp)
80004c06: 81 45        	mv	a1, zero
80004c08: 23 0c b1 02  	sb	a1, 56(sp)
80004c0c: 0d a0        	j	34 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x7a>
80004c0e: 62 65        	ld	a0, 24(sp)
80004c10: 97 00 00 00  	auipc	ra, 0
80004c14: e7 80 80 e0  	jalr	-504(ra)
80004c18: 13 75 f5 0f  	andi	a0, a0, 255
80004c1c: 2a e4        	sd	a0, 8(sp)
80004c1e: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x6c>
80004c20: 22 65        	ld	a0, 8(sp)
80004c22: a3 0c a1 02  	sb	a0, 57(sp)
80004c26: 85 45        	addi	a1, zero, 1
80004c28: 23 0c b1 02  	sb	a1, 56(sp)
80004c2c: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause5cause17h23c366c85d27b237E+0x7a>
80004c2e: 03 45 81 03  	lbu	a0, 56(sp)
80004c32: 83 05 91 03  	lb	a1, 57(sp)
80004c36: a6 60        	ld	ra, 72(sp)
80004c38: 61 61        	addi	sp, sp, 80
80004c3a: 82 80        	ret

Disassembly of section .text._ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE:

0000000080004c3c <_ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE>:
80004c3c: 79 71        	addi	sp, sp, -48
80004c3e: 06 f4        	sd	ra, 40(sp)
80004c40: 2a f0        	sd	a0, 32(sp)
80004c42: 2a ec        	sd	a0, 24(sp)
80004c44: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE+0xa>
80004c46: 13 05 00 04  	addi	a0, zero, 64
80004c4a: 81 45        	mv	a1, zero
80004c4c: 2a e8        	sd	a0, 16(sp)
80004c4e: 8d e5        	bnez	a1, 42 <.LBB6_7>
80004c50: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE+0x16>
80004c52: 42 65        	ld	a0, 16(sp)
80004c54: 93 05 f5 ff  	addi	a1, a0, -1
80004c58: 2e e4        	sd	a1, 8(sp)
80004c5a: 63 6e b5 02  	bltu	a0, a1, 60 <.LBB6_9>
80004c5e: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE+0x24>
80004c60: 62 65        	ld	a0, 24(sp)
80004c62: a2 65        	ld	a1, 8(sp)
80004c64: 97 00 00 00  	auipc	ra, 0
80004c68: e7 80 20 58  	jalr	1410(ra)
80004c6c: 2a e0        	sd	a0, 0(sp)
80004c6e: 09 a0        	j	2 <_ZN6kernel8register6scause6Scause12is_interrupt17h08161f29540311dcE+0x34>
80004c70: 02 65        	ld	a0, 0(sp)
80004c72: a2 70        	ld	ra, 40(sp)
80004c74: 45 61        	addi	sp, sp, 48
80004c76: 82 80        	ret

0000000080004c78 <.LBB6_7>:
80004c78: 17 95 00 00  	auipc	a0, 9
80004c7c: 13 05 85 53  	addi	a0, a0, 1336

0000000080004c80 <.LBB6_8>:
80004c80: 17 96 00 00  	auipc	a2, 9
80004c84: 13 06 86 5d  	addi	a2, a2, 1496
80004c88: 93 05 10 02  	addi	a1, zero, 33
80004c8c: 97 70 00 00  	auipc	ra, 7
80004c90: e7 80 e0 aa  	jalr	-1362(ra)
80004c94: 00 00        	unimp	

0000000080004c96 <.LBB6_9>:
80004c96: 17 95 00 00  	auipc	a0, 9
80004c9a: 13 05 a5 55  	addi	a0, a0, 1370

0000000080004c9e <.LBB6_10>:
80004c9e: 17 96 00 00  	auipc	a2, 9
80004ca2: 13 06 a6 5b  	addi	a2, a2, 1466
80004ca6: 93 05 10 02  	addi	a1, zero, 33
80004caa: 97 70 00 00  	auipc	ra, 7
80004cae: e7 80 00 a9  	jalr	-1392(ra)
80004cb2: 00 00        	unimp	

Disassembly of section .text._ZN67_$LT$kernel..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17hbf48580e0a44fc51E:

0000000080004cb4 <_ZN67_$LT$kernel..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17hbf48580e0a44fc51E>:
80004cb4: 75 71        	addi	sp, sp, -144
80004cb6: 06 e5        	sd	ra, 136(sp)
80004cb8: aa f4        	sd	a0, 104(sp)
80004cba: ae f8        	sd	a1, 112(sp)
80004cbc: 2a f0        	sd	a0, 32(sp)
80004cbe: 03 45 05 00  	lbu	a0, 0(a0)
80004cc2: 05 89        	andi	a0, a0, 1
80004cc4: 01 46        	mv	a2, zero
80004cc6: 2e e8        	sd	a1, 16(sp)
80004cc8: 63 05 c5 02  	beq	a0, a2, 42 <.LBB7_12+0x1e>
80004ccc: 09 a0        	j	2 <_ZN67_$LT$kernel..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17hbf48580e0a44fc51E+0x1a>
80004cce: 02 75        	ld	a0, 32(sp)
80004cd0: 05 05        	addi	a0, a0, 1
80004cd2: aa fc        	sd	a0, 120(sp)

0000000080004cd4 <.LBB7_12>:
80004cd4: 17 96 00 00  	auipc	a2, 9
80004cd8: 13 06 c6 59  	addi	a2, a2, 1436
80004cdc: ac 00        	addi	a1, sp, 72
80004cde: a5 46        	addi	a3, zero, 9
80004ce0: 2a e4        	sd	a0, 8(sp)
80004ce2: 2e 85        	add	a0, zero, a1
80004ce4: c2 65        	ld	a1, 16(sp)
80004ce6: 97 70 00 00  	auipc	ra, 7
80004cea: e7 80 e0 6c  	jalr	1742(ra)
80004cee: 89 a8        	j	82 <.LBB7_14+0x28>
80004cf0: 00 00        	unimp	
80004cf2: 02 75        	ld	a0, 32(sp)
80004cf4: 05 05        	addi	a0, a0, 1
80004cf6: 2a e1        	sd	a0, 128(sp)

0000000080004cf8 <.LBB7_13>:
80004cf8: 17 96 00 00  	auipc	a2, 9
80004cfc: 13 06 86 5a  	addi	a2, a2, 1448
80004d00: 2c 10        	addi	a1, sp, 40
80004d02: a5 46        	addi	a3, zero, 9
80004d04: 2a e0        	sd	a0, 0(sp)
80004d06: 2e 85        	add	a0, zero, a1
80004d08: c2 65        	ld	a1, 16(sp)
80004d0a: 97 70 00 00  	auipc	ra, 7
80004d0e: e7 80 a0 6a  	jalr	1706(ra)
80004d12: 09 a0        	j	2 <.LBB7_13+0x1c>
80004d14: 02 65        	ld	a0, 0(sp)
80004d16: aa e0        	sd	a0, 64(sp)

0000000080004d18 <.LBB7_14>:
80004d18: 17 96 00 00  	auipc	a2, 9
80004d1c: 13 06 86 59  	addi	a2, a2, 1432
80004d20: 28 10        	addi	a0, sp, 40
80004d22: 8c 00        	addi	a1, sp, 64
80004d24: 97 70 00 00  	auipc	ra, 7
80004d28: e7 80 e0 be  	jalr	-1042(ra)
80004d2c: 09 a0        	j	2 <.LBB7_14+0x16>
80004d2e: 28 10        	addi	a0, sp, 40
80004d30: 97 70 00 00  	auipc	ra, 7
80004d34: e7 80 60 cd  	jalr	-810(ra)
80004d38: a3 0f a1 00  	sb	a0, 31(sp)
80004d3c: 09 a0        	j	2 <.LBB7_14+0x26>
80004d3e: 3d a0        	j	46 <.LBB7_15+0x28>
80004d40: 22 65        	ld	a0, 8(sp)
80004d42: aa f0        	sd	a0, 96(sp)

0000000080004d44 <.LBB7_15>:
80004d44: 17 96 00 00  	auipc	a2, 9
80004d48: 13 06 c6 53  	addi	a2, a2, 1340
80004d4c: a8 00        	addi	a0, sp, 72
80004d4e: 8c 10        	addi	a1, sp, 96
80004d50: 97 70 00 00  	auipc	ra, 7
80004d54: e7 80 20 bc  	jalr	-1086(ra)
80004d58: 09 a0        	j	2 <.LBB7_15+0x16>
80004d5a: a8 00        	addi	a0, sp, 72
80004d5c: 97 70 00 00  	auipc	ra, 7
80004d60: e7 80 a0 ca  	jalr	-854(ra)
80004d64: a3 0f a1 00  	sb	a0, 31(sp)
80004d68: 09 a0        	j	2 <.LBB7_15+0x26>
80004d6a: 09 a0        	j	2 <.LBB7_15+0x28>
80004d6c: 03 45 f1 01  	lbu	a0, 31(sp)
80004d70: aa 60        	ld	ra, 136(sp)
80004d72: 49 61        	addi	sp, sp, 144
80004d74: 82 80        	ret

Disassembly of section .text._ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E:

0000000080004d76 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E>:
80004d76: 15 71        	addi	sp, sp, -224
80004d78: 86 ed        	sd	ra, 216(sp)
80004d7a: aa e5        	sd	a0, 200(sp)
80004d7c: ae e9        	sd	a1, 208(sp)
80004d7e: 2a ec        	sd	a0, 24(sp)
80004d80: 03 45 05 00  	lbu	a0, 0(a0)
80004d84: 01 46        	mv	a2, zero
80004d86: 2e e4        	sd	a1, 8(sp)
80004d88: 2a e0        	sd	a0, 0(sp)
80004d8a: 63 09 c5 04  	beq	a0, a2, 82 <.LBB8_31>
80004d8e: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E+0x1a>
80004d90: 05 45        	addi	a0, zero, 1
80004d92: 82 65        	ld	a1, 0(sp)
80004d94: 63 89 a5 06  	beq	a1, a0, 114 <.LBB8_32>
80004d98: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E+0x24>
80004d9a: 09 45        	addi	a0, zero, 2
80004d9c: 82 65        	ld	a1, 0(sp)
80004d9e: 63 89 a5 08  	beq	a1, a0, 146 <.LBB8_33>
80004da2: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E+0x2e>
80004da4: 0d 45        	addi	a0, zero, 3
80004da6: 82 65        	ld	a1, 0(sp)
80004da8: 63 89 a5 0a  	beq	a1, a0, 178 <.LBB8_34>
80004dac: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E+0x38>
80004dae: 11 45        	addi	a0, zero, 4
80004db0: 82 65        	ld	a1, 0(sp)
80004db2: 63 89 a5 0c  	beq	a1, a0, 210 <.LBB8_35>
80004db6: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hdf8aa1293aa88216E+0x42>
80004db8: 15 45        	addi	a0, zero, 5
80004dba: 82 65        	ld	a1, 0(sp)
80004dbc: 63 89 a5 0e  	beq	a1, a0, 242 <.LBB8_36>
80004dc0: 09 a0        	j	2 <.LBB8_30>

0000000080004dc2 <.LBB8_30>:
80004dc2: 17 96 00 00  	auipc	a2, 9
80004dc6: 13 06 e6 50  	addi	a2, a2, 1294
80004dca: 08 19        	addi	a0, sp, 176
80004dcc: 9d 46        	addi	a3, zero, 7
80004dce: a2 65        	ld	a1, 8(sp)
80004dd0: 97 70 00 00  	auipc	ra, 7
80004dd4: e7 80 40 5e  	jalr	1508(ra)
80004dd8: 01 a2        	j	256 <.LBB8_36+0x2a>
80004dda: 00 00        	unimp	

0000000080004ddc <.LBB8_31>:
80004ddc: 17 96 00 00  	auipc	a2, 9
80004de0: 13 06 46 9a  	addi	a2, a2, -1628
80004de4: 08 10        	addi	a0, sp, 32
80004de6: a1 46        	addi	a3, zero, 8
80004de8: a2 65        	ld	a1, 8(sp)
80004dea: 97 70 00 00  	auipc	ra, 7
80004dee: e7 80 a0 5c  	jalr	1482(ra)
80004df2: 09 a0        	j	2 <.LBB8_31+0x18>
80004df4: 08 10        	addi	a0, sp, 32
80004df6: 97 70 00 00  	auipc	ra, 7
80004dfa: e7 80 00 c1  	jalr	-1008(ra)
80004dfe: a3 0b a1 00  	sb	a0, 23(sp)
80004e02: 09 a0        	j	2 <.LBB8_31+0x28>
80004e04: dd a0        	j	230 <.LBB8_36+0x3c>

0000000080004e06 <.LBB8_32>:
80004e06: 17 96 00 00  	auipc	a2, 9
80004e0a: 13 06 76 50  	addi	a2, a2, 1287
80004e0e: 28 18        	addi	a0, sp, 56
80004e10: b9 46        	addi	a3, zero, 14
80004e12: a2 65        	ld	a1, 8(sp)
80004e14: 97 70 00 00  	auipc	ra, 7
80004e18: e7 80 00 5a  	jalr	1440(ra)
80004e1c: 09 a0        	j	2 <.LBB8_32+0x18>
80004e1e: 28 18        	addi	a0, sp, 56
80004e20: 97 70 00 00  	auipc	ra, 7
80004e24: e7 80 60 be  	jalr	-1050(ra)
80004e28: a3 0b a1 00  	sb	a0, 23(sp)
80004e2c: 09 a0        	j	2 <.LBB8_32+0x28>
80004e2e: 75 a8        	j	188 <.LBB8_36+0x3c>

0000000080004e30 <.LBB8_33>:
80004e30: 17 96 00 00  	auipc	a2, 9
80004e34: 13 06 46 4d  	addi	a2, a2, 1236
80004e38: 88 08        	addi	a0, sp, 80
80004e3a: a5 46        	addi	a3, zero, 9
80004e3c: a2 65        	ld	a1, 8(sp)
80004e3e: 97 70 00 00  	auipc	ra, 7
80004e42: e7 80 60 57  	jalr	1398(ra)
80004e46: 09 a0        	j	2 <.LBB8_33+0x18>
80004e48: 88 08        	addi	a0, sp, 80
80004e4a: 97 70 00 00  	auipc	ra, 7
80004e4e: e7 80 c0 bb  	jalr	-1092(ra)
80004e52: a3 0b a1 00  	sb	a0, 23(sp)
80004e56: 09 a0        	j	2 <.LBB8_33+0x28>
80004e58: 49 a8        	j	146 <.LBB8_36+0x3c>

0000000080004e5a <.LBB8_34>:
80004e5a: 17 96 00 00  	auipc	a2, 9
80004e5e: 13 06 b6 49  	addi	a2, a2, 1179
80004e62: a8 10        	addi	a0, sp, 104
80004e64: bd 46        	addi	a3, zero, 15
80004e66: a2 65        	ld	a1, 8(sp)
80004e68: 97 70 00 00  	auipc	ra, 7
80004e6c: e7 80 c0 54  	jalr	1356(ra)
80004e70: 09 a0        	j	2 <.LBB8_34+0x18>
80004e72: a8 10        	addi	a0, sp, 104
80004e74: 97 70 00 00  	auipc	ra, 7
80004e78: e7 80 20 b9  	jalr	-1134(ra)
80004e7c: a3 0b a1 00  	sb	a0, 23(sp)
80004e80: 09 a0        	j	2 <.LBB8_34+0x28>
80004e82: a5 a0        	j	104 <.LBB8_36+0x3c>

0000000080004e84 <.LBB8_35>:
80004e84: 17 96 00 00  	auipc	a2, 9
80004e88: 13 06 56 46  	addi	a2, a2, 1125
80004e8c: 08 01        	addi	a0, sp, 128
80004e8e: b1 46        	addi	a3, zero, 12
80004e90: a2 65        	ld	a1, 8(sp)
80004e92: 97 70 00 00  	auipc	ra, 7
80004e96: e7 80 20 52  	jalr	1314(ra)
80004e9a: 09 a0        	j	2 <.LBB8_35+0x18>
80004e9c: 08 01        	addi	a0, sp, 128
80004e9e: 97 70 00 00  	auipc	ra, 7
80004ea2: e7 80 80 b6  	jalr	-1176(ra)
80004ea6: a3 0b a1 00  	sb	a0, 23(sp)
80004eaa: 09 a0        	j	2 <.LBB8_35+0x28>
80004eac: 3d a8        	j	62 <.LBB8_36+0x3c>

0000000080004eae <.LBB8_36>:
80004eae: 17 96 00 00  	auipc	a2, 9
80004eb2: 13 06 96 42  	addi	a2, a2, 1065
80004eb6: 28 09        	addi	a0, sp, 152
80004eb8: c9 46        	addi	a3, zero, 18
80004eba: a2 65        	ld	a1, 8(sp)
80004ebc: 97 70 00 00  	auipc	ra, 7
80004ec0: e7 80 80 4f  	jalr	1272(ra)
80004ec4: 09 a0        	j	2 <.LBB8_36+0x18>
80004ec6: 28 09        	addi	a0, sp, 152
80004ec8: 97 70 00 00  	auipc	ra, 7
80004ecc: e7 80 e0 b3  	jalr	-1218(ra)
80004ed0: a3 0b a1 00  	sb	a0, 23(sp)
80004ed4: 09 a0        	j	2 <.LBB8_36+0x28>
80004ed6: 11 a8        	j	20 <.LBB8_36+0x3c>
80004ed8: 08 19        	addi	a0, sp, 176
80004eda: 97 70 00 00  	auipc	ra, 7
80004ede: e7 80 c0 b2  	jalr	-1236(ra)
80004ee2: a3 0b a1 00  	sb	a0, 23(sp)
80004ee6: 09 a0        	j	2 <.LBB8_36+0x3a>
80004ee8: 09 a0        	j	2 <.LBB8_36+0x3c>
80004eea: 03 45 71 01  	lbu	a0, 23(sp)
80004eee: ee 60        	ld	ra, 216(sp)
80004ef0: 2d 61        	addi	sp, sp, 224
80004ef2: 82 80        	ret

Disassembly of section .text._ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E:

0000000080004ef4 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E>:
80004ef4: 49 71        	addi	sp, sp, -368
80004ef6: 86 f6        	sd	ra, 360(sp)
80004ef8: aa ee        	sd	a0, 344(sp)
80004efa: ae f2        	sd	a1, 352(sp)
80004efc: 2a ec        	sd	a0, 24(sp)
80004efe: 03 45 05 00  	lbu	a0, 0(a0)
80004f02: 01 46        	mv	a2, zero
80004f04: 2e e4        	sd	a1, 8(sp)
80004f06: 2a e0        	sd	a0, 0(sp)
80004f08: 63 07 c5 08  	beq	a0, a2, 142 <.LBB9_55>
80004f0c: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x1a>
80004f0e: 05 45        	addi	a0, zero, 1
80004f10: 82 65        	ld	a1, 0(sp)
80004f12: 63 87 a5 0a  	beq	a1, a0, 174 <.LBB9_56>
80004f16: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x24>
80004f18: 09 45        	addi	a0, zero, 2
80004f1a: 82 65        	ld	a1, 0(sp)
80004f1c: 63 87 a5 0c  	beq	a1, a0, 206 <.LBB9_57>
80004f20: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x2e>
80004f22: 0d 45        	addi	a0, zero, 3
80004f24: 82 65        	ld	a1, 0(sp)
80004f26: 63 87 a5 0e  	beq	a1, a0, 238 <.LBB9_58>
80004f2a: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x38>
80004f2c: 11 45        	addi	a0, zero, 4
80004f2e: 82 65        	ld	a1, 0(sp)
80004f30: 63 87 a5 10  	beq	a1, a0, 270 <.LBB9_59>
80004f34: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x42>
80004f36: 15 45        	addi	a0, zero, 5
80004f38: 82 65        	ld	a1, 0(sp)
80004f3a: 63 87 a5 12  	beq	a1, a0, 302 <.LBB9_60>
80004f3e: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x4c>
80004f40: 19 45        	addi	a0, zero, 6
80004f42: 82 65        	ld	a1, 0(sp)
80004f44: 63 87 a5 14  	beq	a1, a0, 334 <.LBB9_61>
80004f48: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x56>
80004f4a: 1d 45        	addi	a0, zero, 7
80004f4c: 82 65        	ld	a1, 0(sp)
80004f4e: 63 87 a5 16  	beq	a1, a0, 366 <.LBB9_62>
80004f52: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x60>
80004f54: 21 45        	addi	a0, zero, 8
80004f56: 82 65        	ld	a1, 0(sp)
80004f58: 63 87 a5 18  	beq	a1, a0, 398 <.LBB9_63>
80004f5c: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x6a>
80004f5e: 25 45        	addi	a0, zero, 9
80004f60: 82 65        	ld	a1, 0(sp)
80004f62: 63 87 a5 1a  	beq	a1, a0, 430 <.LBB9_64>
80004f66: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x74>
80004f68: 29 45        	addi	a0, zero, 10
80004f6a: 82 65        	ld	a1, 0(sp)
80004f6c: 63 87 a5 1c  	beq	a1, a0, 462 <.LBB9_65>
80004f70: 09 a0        	j	2 <_ZN72_$LT$kernel..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h51af753ff4d32b77E+0x7e>
80004f72: 2d 45        	addi	a0, zero, 11
80004f74: 82 65        	ld	a1, 0(sp)
80004f76: 63 87 a5 1e  	beq	a1, a0, 494 <.LBB9_66>
80004f7a: 09 a0        	j	2 <.LBB9_54>

0000000080004f7c <.LBB9_54>:
80004f7c: 17 96 00 00  	auipc	a2, 9
80004f80: 13 06 46 35  	addi	a2, a2, 852
80004f84: 88 02        	addi	a0, sp, 320
80004f86: 9d 46        	addi	a3, zero, 7
80004f88: a2 65        	ld	a1, 8(sp)
80004f8a: 97 70 00 00  	auipc	ra, 7
80004f8e: e7 80 a0 42  	jalr	1066(ra)
80004f92: f5 aa        	j	508 <.LBB9_66+0x2a>
80004f94: 00 00        	unimp	

0000000080004f96 <.LBB9_55>:
80004f96: 17 96 00 00  	auipc	a2, 9
80004f9a: 13 06 a6 40  	addi	a2, a2, 1034
80004f9e: 08 10        	addi	a0, sp, 32
80004fa0: d5 46        	addi	a3, zero, 21
80004fa2: a2 65        	ld	a1, 8(sp)
80004fa4: 97 70 00 00  	auipc	ra, 7
80004fa8: e7 80 00 41  	jalr	1040(ra)
80004fac: 09 a0        	j	2 <.LBB9_55+0x18>
80004fae: 08 10        	addi	a0, sp, 32
80004fb0: 97 70 00 00  	auipc	ra, 7
80004fb4: e7 80 60 a5  	jalr	-1450(ra)
80004fb8: a3 0b a1 00  	sb	a0, 23(sp)
80004fbc: 09 a0        	j	2 <.LBB9_55+0x28>
80004fbe: cd a2        	j	482 <.LBB9_66+0x3c>

0000000080004fc0 <.LBB9_56>:
80004fc0: 17 96 00 00  	auipc	a2, 9
80004fc4: 13 06 c6 e2  	addi	a2, a2, -468
80004fc8: 28 18        	addi	a0, sp, 56
80004fca: c1 46        	addi	a3, zero, 16
80004fcc: a2 65        	ld	a1, 8(sp)
80004fce: 97 70 00 00  	auipc	ra, 7
80004fd2: e7 80 60 3e  	jalr	998(ra)
80004fd6: 09 a0        	j	2 <.LBB9_56+0x18>
80004fd8: 28 18        	addi	a0, sp, 56
80004fda: 97 70 00 00  	auipc	ra, 7
80004fde: e7 80 c0 a2  	jalr	-1492(ra)
80004fe2: a3 0b a1 00  	sb	a0, 23(sp)
80004fe6: 09 a0        	j	2 <.LBB9_56+0x28>
80004fe8: 65 aa        	j	440 <.LBB9_66+0x3c>

0000000080004fea <.LBB9_57>:
80004fea: 17 96 00 00  	auipc	a2, 9
80004fee: 13 06 46 3a  	addi	a2, a2, 932
80004ff2: 88 08        	addi	a0, sp, 80
80004ff4: c9 46        	addi	a3, zero, 18
80004ff6: a2 65        	ld	a1, 8(sp)
80004ff8: 97 70 00 00  	auipc	ra, 7
80004ffc: e7 80 c0 3b  	jalr	956(ra)
80005000: 09 a0        	j	2 <.LBB9_57+0x18>
80005002: 88 08        	addi	a0, sp, 80
80005004: 97 70 00 00  	auipc	ra, 7
80005008: e7 80 20 a0  	jalr	-1534(ra)
8000500c: a3 0b a1 00  	sb	a0, 23(sp)
80005010: 09 a0        	j	2 <.LBB9_57+0x28>
80005012: 79 a2        	j	398 <.LBB9_66+0x3c>

0000000080005014 <.LBB9_58>:
80005014: 17 96 00 00  	auipc	a2, 9
80005018: 13 06 06 37  	addi	a2, a2, 880
8000501c: a8 10        	addi	a0, sp, 104
8000501e: a9 46        	addi	a3, zero, 10
80005020: a2 65        	ld	a1, 8(sp)
80005022: 97 70 00 00  	auipc	ra, 7
80005026: e7 80 20 39  	jalr	914(ra)
8000502a: 09 a0        	j	2 <.LBB9_58+0x18>
8000502c: a8 10        	addi	a0, sp, 104
8000502e: 97 70 00 00  	auipc	ra, 7
80005032: e7 80 80 9d  	jalr	-1576(ra)
80005036: a3 0b a1 00  	sb	a0, 23(sp)
8000503a: 09 a0        	j	2 <.LBB9_58+0x28>
8000503c: 95 a2        	j	356 <.LBB9_66+0x3c>

000000008000503e <.LBB9_59>:
8000503e: 17 96 00 00  	auipc	a2, 9
80005042: 13 06 d6 33  	addi	a2, a2, 829
80005046: 08 01        	addi	a0, sp, 128
80005048: a5 46        	addi	a3, zero, 9
8000504a: a2 65        	ld	a1, 8(sp)
8000504c: 97 70 00 00  	auipc	ra, 7
80005050: e7 80 80 36  	jalr	872(ra)
80005054: 09 a0        	j	2 <.LBB9_59+0x18>
80005056: 08 01        	addi	a0, sp, 128
80005058: 97 70 00 00  	auipc	ra, 7
8000505c: e7 80 e0 9a  	jalr	-1618(ra)
80005060: a3 0b a1 00  	sb	a0, 23(sp)
80005064: 09 a0        	j	2 <.LBB9_59+0x28>
80005066: 2d aa        	j	314 <.LBB9_66+0x3c>

0000000080005068 <.LBB9_60>:
80005068: 17 96 00 00  	auipc	a2, 9
8000506c: 13 06 46 30  	addi	a2, a2, 772
80005070: 28 09        	addi	a0, sp, 152
80005072: bd 46        	addi	a3, zero, 15
80005074: a2 65        	ld	a1, 8(sp)
80005076: 97 70 00 00  	auipc	ra, 7
8000507a: e7 80 e0 33  	jalr	830(ra)
8000507e: 09 a0        	j	2 <.LBB9_60+0x18>
80005080: 28 09        	addi	a0, sp, 152
80005082: 97 70 00 00  	auipc	ra, 7
80005086: e7 80 40 98  	jalr	-1660(ra)
8000508a: a3 0b a1 00  	sb	a0, 23(sp)
8000508e: 09 a0        	j	2 <.LBB9_60+0x28>
80005090: 01 aa        	j	272 <.LBB9_66+0x3c>

0000000080005092 <.LBB9_61>:
80005092: 17 96 00 00  	auipc	a2, 9
80005096: 13 06 06 2d  	addi	a2, a2, 720
8000509a: 08 19        	addi	a0, sp, 176
8000509c: a9 46        	addi	a3, zero, 10
8000509e: a2 65        	ld	a1, 8(sp)
800050a0: 97 70 00 00  	auipc	ra, 7
800050a4: e7 80 40 31  	jalr	788(ra)
800050a8: 09 a0        	j	2 <.LBB9_61+0x18>
800050aa: 08 19        	addi	a0, sp, 176
800050ac: 97 70 00 00  	auipc	ra, 7
800050b0: e7 80 a0 95  	jalr	-1702(ra)
800050b4: a3 0b a1 00  	sb	a0, 23(sp)
800050b8: 09 a0        	j	2 <.LBB9_61+0x28>
800050ba: dd a0        	j	230 <.LBB9_66+0x3c>

00000000800050bc <.LBB9_62>:
800050bc: 17 96 00 00  	auipc	a2, 9
800050c0: 13 06 b6 29  	addi	a2, a2, 667
800050c4: a8 01        	addi	a0, sp, 200
800050c6: ad 46        	addi	a3, zero, 11
800050c8: a2 65        	ld	a1, 8(sp)
800050ca: 97 70 00 00  	auipc	ra, 7
800050ce: e7 80 a0 2e  	jalr	746(ra)
800050d2: 09 a0        	j	2 <.LBB9_62+0x18>
800050d4: a8 01        	addi	a0, sp, 200
800050d6: 97 70 00 00  	auipc	ra, 7
800050da: e7 80 00 93  	jalr	-1744(ra)
800050de: a3 0b a1 00  	sb	a0, 23(sp)
800050e2: 09 a0        	j	2 <.LBB9_62+0x28>
800050e4: 75 a8        	j	188 <.LBB9_66+0x3c>

00000000800050e6 <.LBB9_63>:
800050e6: 17 96 00 00  	auipc	a2, 9
800050ea: 13 06 46 26  	addi	a2, a2, 612
800050ee: 88 11        	addi	a0, sp, 224
800050f0: b5 46        	addi	a3, zero, 13
800050f2: a2 65        	ld	a1, 8(sp)
800050f4: 97 70 00 00  	auipc	ra, 7
800050f8: e7 80 00 2c  	jalr	704(ra)
800050fc: 09 a0        	j	2 <.LBB9_63+0x18>
800050fe: 88 11        	addi	a0, sp, 224
80005100: 97 70 00 00  	auipc	ra, 7
80005104: e7 80 60 90  	jalr	-1786(ra)
80005108: a3 0b a1 00  	sb	a0, 23(sp)
8000510c: 09 a0        	j	2 <.LBB9_63+0x28>
8000510e: 49 a8        	j	146 <.LBB9_66+0x3c>

0000000080005110 <.LBB9_64>:
80005110: 17 96 00 00  	auipc	a2, 9
80005114: 13 06 66 22  	addi	a2, a2, 550
80005118: a8 19        	addi	a0, sp, 248
8000511a: d1 46        	addi	a3, zero, 20
8000511c: a2 65        	ld	a1, 8(sp)
8000511e: 97 70 00 00  	auipc	ra, 7
80005122: e7 80 60 29  	jalr	662(ra)
80005126: 09 a0        	j	2 <.LBB9_64+0x18>
80005128: a8 19        	addi	a0, sp, 248
8000512a: 97 70 00 00  	auipc	ra, 7
8000512e: e7 80 c0 8d  	jalr	-1828(ra)
80005132: a3 0b a1 00  	sb	a0, 23(sp)
80005136: 09 a0        	j	2 <.LBB9_64+0x28>
80005138: a5 a0        	j	104 <.LBB9_66+0x3c>

000000008000513a <.LBB9_65>:
8000513a: 17 96 00 00  	auipc	a2, 9
8000513e: 13 06 f6 1e  	addi	a2, a2, 495
80005142: 08 0a        	addi	a0, sp, 272
80005144: b5 46        	addi	a3, zero, 13
80005146: a2 65        	ld	a1, 8(sp)
80005148: 97 70 00 00  	auipc	ra, 7
8000514c: e7 80 c0 26  	jalr	620(ra)
80005150: 09 a0        	j	2 <.LBB9_65+0x18>
80005152: 08 0a        	addi	a0, sp, 272
80005154: 97 70 00 00  	auipc	ra, 7
80005158: e7 80 20 8b  	jalr	-1870(ra)
8000515c: a3 0b a1 00  	sb	a0, 23(sp)
80005160: 09 a0        	j	2 <.LBB9_65+0x28>
80005162: 3d a8        	j	62 <.LBB9_66+0x3c>

0000000080005164 <.LBB9_66>:
80005164: 17 96 00 00  	auipc	a2, 9
80005168: 13 06 76 1b  	addi	a2, a2, 439
8000516c: 28 12        	addi	a0, sp, 296
8000516e: b9 46        	addi	a3, zero, 14
80005170: a2 65        	ld	a1, 8(sp)
80005172: 97 70 00 00  	auipc	ra, 7
80005176: e7 80 20 24  	jalr	578(ra)
8000517a: 09 a0        	j	2 <.LBB9_66+0x18>
8000517c: 28 12        	addi	a0, sp, 296
8000517e: 97 70 00 00  	auipc	ra, 7
80005182: e7 80 80 88  	jalr	-1912(ra)
80005186: a3 0b a1 00  	sb	a0, 23(sp)
8000518a: 09 a0        	j	2 <.LBB9_66+0x28>
8000518c: 11 a8        	j	20 <.LBB9_66+0x3c>
8000518e: 88 02        	addi	a0, sp, 320
80005190: 97 70 00 00  	auipc	ra, 7
80005194: e7 80 60 87  	jalr	-1930(ra)
80005198: a3 0b a1 00  	sb	a0, 23(sp)
8000519c: 09 a0        	j	2 <.LBB9_66+0x3a>
8000519e: 09 a0        	j	2 <.LBB9_66+0x3c>
800051a0: 03 45 71 01  	lbu	a0, 23(sp)
800051a4: b6 70        	ld	ra, 360(sp)
800051a6: 75 61        	addi	sp, sp, 368
800051a8: 82 80        	ret

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ca22c18240cabbE:

00000000800051aa <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ca22c18240cabbE>:
800051aa: 01 11        	addi	sp, sp, -32
800051ac: 06 ec        	sd	ra, 24(sp)
800051ae: 2a e4        	sd	a0, 8(sp)
800051b0: 2e e8        	sd	a1, 16(sp)
800051b2: 08 61        	ld	a0, 0(a0)
800051b4: 97 00 00 00  	auipc	ra, 0
800051b8: e7 80 00 d4  	jalr	-704(ra)
800051bc: 2a e0        	sd	a0, 0(sp)
800051be: 09 a0        	j	2 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ca22c18240cabbE+0x16>
800051c0: 02 65        	ld	a0, 0(sp)
800051c2: e2 60        	ld	ra, 24(sp)
800051c4: 05 61        	addi	sp, sp, 32
800051c6: 82 80        	ret

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbb0e71623416b79E:

00000000800051c8 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbb0e71623416b79E>:
800051c8: 01 11        	addi	sp, sp, -32
800051ca: 06 ec        	sd	ra, 24(sp)
800051cc: 2a e4        	sd	a0, 8(sp)
800051ce: 2e e8        	sd	a1, 16(sp)
800051d0: 08 61        	ld	a0, 0(a0)
800051d2: 97 00 00 00  	auipc	ra, 0
800051d6: e7 80 40 ba  	jalr	-1116(ra)
800051da: 2a e0        	sd	a0, 0(sp)
800051dc: 09 a0        	j	2 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbb0e71623416b79E+0x16>
800051de: 02 65        	ld	a0, 0(sp)
800051e0: e2 60        	ld	ra, 24(sp)
800051e2: 05 61        	addi	sp, sp, 32
800051e4: 82 80        	ret

Disassembly of section .text._ZN45_$LT$usize$u20$as$u20$bit_field..BitField$GT$7get_bit17h524052b4f2f75a47E:

00000000800051e6 <_ZN45_$LT$usize$u20$as$u20$bit_field..BitField$GT$7get_bit17h524052b4f2f75a47E>:
800051e6: 79 71        	addi	sp, sp, -48
800051e8: 2a f0        	sd	a0, 32(sp)
800051ea: 2e f4        	sd	a1, 40(sp)
800051ec: 13 06 00 04  	addi	a2, zero, 64
800051f0: 2e ec        	sd	a1, 24(sp)
800051f2: 2a e8        	sd	a0, 16(sp)
800051f4: 63 e2 c5 02  	bltu	a1, a2, 36 <.LBB0_6+0x16>
800051f8: 09 a0        	j	2 <.LBB0_5>

00000000800051fa <.LBB0_5>:
800051fa: 17 95 00 00  	auipc	a0, 9
800051fe: 13 05 b5 1b  	addi	a0, a0, 443

0000000080005202 <.LBB0_6>:
80005202: 17 96 00 00  	auipc	a2, 9
80005206: 13 06 66 23  	addi	a2, a2, 566
8000520a: 93 05 80 02  	addi	a1, zero, 40
8000520e: 97 60 00 00  	auipc	ra, 6
80005212: e7 80 c0 52  	jalr	1324(ra)
80005216: 00 00        	unimp	
80005218: 42 65        	ld	a0, 16(sp)
8000521a: 0c 61        	ld	a1, 0(a0)
8000521c: 62 66        	ld	a2, 24(sp)
8000521e: 93 76 06 fc  	andi	a3, a2, -64
80005222: 05 47        	addi	a4, zero, 1
80005224: 33 17 c7 00  	sll	a4, a4, a2
80005228: 81 47        	mv	a5, zero
8000522a: 2e e4        	sd	a1, 8(sp)
8000522c: 3a e0        	sd	a4, 0(sp)
8000522e: 63 9b f6 00  	bne	a3, a5, 22 <.LBB0_7>
80005232: 09 a0        	j	2 <.LBB0_6+0x32>
80005234: 22 65        	ld	a0, 8(sp)
80005236: 82 65        	ld	a1, 0(sp)
80005238: 33 76 b5 00  	and	a2, a0, a1
8000523c: 33 35 c0 00  	snez	a0, a2
80005240: 45 61        	addi	sp, sp, 48
80005242: 82 80        	ret

0000000080005244 <.LBB0_7>:
80005244: 17 95 00 00  	auipc	a0, 9
80005248: 13 05 c5 20  	addi	a0, a0, 524

000000008000524c <.LBB0_8>:
8000524c: 17 96 00 00  	auipc	a2, 9
80005250: 13 06 c6 1e  	addi	a2, a2, 492
80005254: 93 05 30 02  	addi	a1, zero, 35
80005258: 97 60 00 00  	auipc	ra, 6
8000525c: e7 80 20 4e  	jalr	1250(ra)
80005260: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6printf6_print17hacfab2f62dd270d5E:

0000000080005262 <_ZN6kernel6printf6_print17hacfab2f62dd270d5E>:
80005262: 1d 71        	addi	sp, sp, -96
80005264: 86 ec        	sd	ra, 88(sp)

0000000080005266 <.LBB0_6>:
80005266: 97 55 01 00  	auipc	a1, 21
8000526a: 93 85 25 e5  	addi	a1, a1, -430
8000526e: 2a ec        	sd	a0, 24(sp)
80005270: 2e 85        	add	a0, zero, a1
80005272: 97 d0 ff ff  	auipc	ra, 1048573
80005276: e7 80 e0 a2  	jalr	-1490(ra)
8000527a: 2a f0        	sd	a0, 32(sp)
8000527c: 09 a0        	j	2 <.LBB0_6+0x18>
8000527e: 08 10        	addi	a0, sp, 32
80005280: 97 d0 ff ff  	auipc	ra, 1048573
80005284: e7 80 40 3b  	jalr	948(ra)
80005288: 2a e8        	sd	a0, 16(sp)
8000528a: 09 a0        	j	2 <.LBB0_6+0x26>
8000528c: 62 65        	ld	a0, 24(sp)
8000528e: 0c 75        	ld	a1, 40(a0)
80005290: ae e8        	sd	a1, 80(sp)
80005292: 0c 71        	ld	a1, 32(a0)
80005294: ae e4        	sd	a1, 72(sp)
80005296: 0c 6d        	ld	a1, 24(a0)
80005298: ae e0        	sd	a1, 64(sp)
8000529a: 0c 69        	ld	a1, 16(a0)
8000529c: 2e fc        	sd	a1, 56(sp)
8000529e: 0c 65        	ld	a1, 8(a0)
800052a0: 2e f8        	sd	a1, 48(sp)
800052a2: 0c 61        	ld	a1, 0(a0)
800052a4: 2e f4        	sd	a1, 40(sp)
800052a6: 2c 10        	addi	a1, sp, 40
800052a8: 42 65        	ld	a0, 16(sp)
800052aa: 97 00 00 00  	auipc	ra, 0
800052ae: e7 80 20 0f  	jalr	242(ra)
800052b2: 2a e4        	sd	a0, 8(sp)
800052b4: 09 a0        	j	2 <.LBB0_7>

00000000800052b6 <.LBB0_7>:
800052b6: 97 95 00 00  	auipc	a1, 9
800052ba: 93 85 a5 1c  	addi	a1, a1, 458
800052be: 22 65        	ld	a0, 8(sp)
800052c0: 97 e0 ff ff  	auipc	ra, 1048574
800052c4: e7 80 c0 6e  	jalr	1772(ra)
800052c8: 09 a0        	j	2 <.LBB0_7+0x14>
800052ca: 02 75        	ld	a0, 32(sp)
800052cc: 97 c0 ff ff  	auipc	ra, 1048572
800052d0: e7 80 c0 47  	jalr	1148(ra)
800052d4: 09 a0        	j	2 <.LBB0_7+0x20>
800052d6: e6 60        	ld	ra, 88(sp)
800052d8: 25 61        	addi	sp, sp, 96
800052da: 82 80        	ret

Disassembly of section .text.rust_begin_unwind:

00000000800052dc <rust_begin_unwind>:
800052dc: 59 71        	addi	sp, sp, -112
800052de: 86 f4        	sd	ra, 104(sp)
800052e0: 2a e8        	sd	a0, 16(sp)
800052e2: 08 08        	addi	a0, sp, 16
800052e4: aa ec        	sd	a0, 88(sp)
800052e6: aa f0        	sd	a0, 96(sp)

00000000800052e8 <.LBB1_6>:
800052e8: 97 05 00 00  	auipc	a1, 0
800052ec: 93 85 25 05  	addi	a1, a1, 82
800052f0: 97 c0 ff ff  	auipc	ra, 1048572
800052f4: e7 80 00 3a  	jalr	928(ra)
800052f8: 2a e4        	sd	a0, 8(sp)
800052fa: 2e e0        	sd	a1, 0(sp)
800052fc: 09 a0        	j	2 <.LBB1_6+0x16>
800052fe: 22 65        	ld	a0, 8(sp)
80005300: aa e4        	sd	a0, 72(sp)
80005302: 82 65        	ld	a1, 0(sp)
80005304: ae e8        	sd	a1, 80(sp)

0000000080005306 <.LBB1_7>:
80005306: 97 95 00 00  	auipc	a1, 9
8000530a: 93 85 a5 1a  	addi	a1, a1, 426
8000530e: 28 08        	addi	a0, sp, 24
80005310: 09 46        	addi	a2, zero, 2
80005312: b4 00        	addi	a3, sp, 72
80005314: 05 47        	addi	a4, zero, 1
80005316: 97 c0 ff ff  	auipc	ra, 1048572
8000531a: e7 80 20 3c  	jalr	962(ra)
8000531e: 09 a0        	j	2 <.LBB1_7+0x1a>
80005320: 28 08        	addi	a0, sp, 24
80005322: 97 00 00 00  	auipc	ra, 0
80005326: e7 80 00 f4  	jalr	-192(ra)
8000532a: 09 a0        	j	2 <.LBB1_7+0x26>
8000532c: 97 10 00 00  	auipc	ra, 1
80005330: e7 80 00 cb  	jalr	-848(ra)
80005334: 09 a0        	j	2 <.LBB1_7+0x30>
80005336: 09 a0        	j	2 <.LBB1_7+0x32>
80005338: 01 a0        	j	0 <.LBB1_7+0x32>

Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hc7016c9747e40b85E:

000000008000533a <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hc7016c9747e40b85E>:
8000533a: 01 11        	addi	sp, sp, -32
8000533c: 06 ec        	sd	ra, 24(sp)
8000533e: 2a e4        	sd	a0, 8(sp)
80005340: 2e e8        	sd	a1, 16(sp)
80005342: 08 61        	ld	a0, 0(a0)
80005344: 97 60 00 00  	auipc	ra, 6
80005348: e7 80 a0 2f  	jalr	762(ra)
8000534c: 2a e0        	sd	a0, 0(sp)
8000534e: 09 a0        	j	2 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hc7016c9747e40b85E+0x16>
80005350: 02 65        	ld	a0, 0(sp)
80005352: e2 60        	ld	ra, 24(sp)
80005354: 05 61        	addi	sp, sp, 32
80005356: 82 80        	ret

Disassembly of section .text._ZN4core3fmt5Write10write_char17ha66b663f04754bfcE:

0000000080005358 <_ZN4core3fmt5Write10write_char17ha66b663f04754bfcE>:
80005358: 5d 71        	addi	sp, sp, -80
8000535a: 86 e4        	sd	ra, 72(sp)
8000535c: 2e 86        	add	a2, zero, a1
8000535e: 2a fc        	sd	a0, 56(sp)
80005360: ae c2        	sw	a1, 68(sp)
80005362: 81 46        	mv	a3, zero
80005364: 36 da        	sw	a3, 52(sp)
80005366: 54 18        	addi	a3, sp, 52
80005368: 11 47        	addi	a4, zero, 4
8000536a: 2a f4        	sd	a0, 40(sp)
8000536c: 2e 85        	add	a0, zero, a1
8000536e: b6 85        	add	a1, zero, a3
80005370: 32 f0        	sd	a2, 32(sp)
80005372: 3a 86        	add	a2, zero, a4
80005374: 97 00 00 00  	auipc	ra, 0
80005378: e7 80 c0 32  	jalr	812(ra)
8000537c: 2a ec        	sd	a0, 24(sp)
8000537e: 2e e8        	sd	a1, 16(sp)
80005380: 09 a0        	j	2 <_ZN4core3fmt5Write10write_char17ha66b663f04754bfcE+0x2a>
80005382: 22 75        	ld	a0, 40(sp)
80005384: e2 65        	ld	a1, 24(sp)
80005386: 42 66        	ld	a2, 16(sp)
80005388: 97 00 00 00  	auipc	ra, 0
8000538c: e7 80 60 76  	jalr	1894(ra)
80005390: 2a e4        	sd	a0, 8(sp)
80005392: 09 a0        	j	2 <_ZN4core3fmt5Write10write_char17ha66b663f04754bfcE+0x3c>
80005394: 22 65        	ld	a0, 8(sp)
80005396: a6 60        	ld	ra, 72(sp)
80005398: 61 61        	addi	sp, sp, 80
8000539a: 82 80        	ret

Disassembly of section .text._ZN4core3fmt5Write9write_fmt17habe223c43a3ed9eaE:

000000008000539c <_ZN4core3fmt5Write9write_fmt17habe223c43a3ed9eaE>:
8000539c: 5d 71        	addi	sp, sp, -80
8000539e: 86 e4        	sd	ra, 72(sp)
800053a0: 2a e8        	sd	a0, 16(sp)
800053a2: 88 61        	ld	a0, 0(a1)
800053a4: 2a ec        	sd	a0, 24(sp)
800053a6: 88 65        	ld	a0, 8(a1)
800053a8: 2a f0        	sd	a0, 32(sp)
800053aa: 88 69        	ld	a0, 16(a1)
800053ac: 2a f4        	sd	a0, 40(sp)
800053ae: 88 6d        	ld	a0, 24(a1)
800053b0: 2a f8        	sd	a0, 48(sp)
800053b2: 88 71        	ld	a0, 32(a1)
800053b4: 2a fc        	sd	a0, 56(sp)
800053b6: 88 75        	ld	a0, 40(a1)
800053b8: aa e0        	sd	a0, 64(sp)

00000000800053ba <.LBB1_2>:
800053ba: 97 95 00 00  	auipc	a1, 9
800053be: 93 85 65 11  	addi	a1, a1, 278
800053c2: 08 08        	addi	a0, sp, 16
800053c4: 30 08        	addi	a2, sp, 24
800053c6: 97 70 00 00  	auipc	ra, 7
800053ca: e7 80 a0 8e  	jalr	-1814(ra)
800053ce: 2a e4        	sd	a0, 8(sp)
800053d0: 09 a0        	j	2 <.LBB1_2+0x18>
800053d2: 22 65        	ld	a0, 8(sp)
800053d4: a6 60        	ld	ra, 72(sp)
800053d6: 61 61        	addi	sp, sp, 80
800053d8: 82 80        	ret

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hc2916c1eb02d5786E:

00000000800053da <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hc2916c1eb02d5786E>:
800053da: 79 71        	addi	sp, sp, -48
800053dc: 06 f4        	sd	ra, 40(sp)
800053de: 2e 86        	add	a2, zero, a1
800053e0: 2a ec        	sd	a0, 24(sp)
800053e2: 2e d2        	sw	a1, 36(sp)
800053e4: 08 61        	ld	a0, 0(a0)
800053e6: 32 e8        	sd	a2, 16(sp)
800053e8: 97 00 00 00  	auipc	ra, 0
800053ec: e7 80 00 f7  	jalr	-144(ra)
800053f0: 2a e4        	sd	a0, 8(sp)
800053f2: 09 a0        	j	2 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17hc2916c1eb02d5786E+0x1a>
800053f4: 22 65        	ld	a0, 8(sp)
800053f6: a2 70        	ld	ra, 40(sp)
800053f8: 45 61        	addi	sp, sp, 48
800053fa: 82 80        	ret

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hb6eddd37750f019bE:

00000000800053fc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hb6eddd37750f019bE>:
800053fc: 5d 71        	addi	sp, sp, -80
800053fe: 86 e4        	sd	ra, 72(sp)
80005400: aa e0        	sd	a0, 64(sp)
80005402: 08 61        	ld	a0, 0(a0)
80005404: 90 75        	ld	a2, 40(a1)
80005406: 32 fc        	sd	a2, 56(sp)
80005408: 90 71        	ld	a2, 32(a1)
8000540a: 32 f8        	sd	a2, 48(sp)
8000540c: 90 6d        	ld	a2, 24(a1)
8000540e: 32 f4        	sd	a2, 40(sp)
80005410: 90 69        	ld	a2, 16(a1)
80005412: 32 f0        	sd	a2, 32(sp)
80005414: 90 65        	ld	a2, 8(a1)
80005416: 32 ec        	sd	a2, 24(sp)
80005418: 8c 61        	ld	a1, 0(a1)
8000541a: 2e e8        	sd	a1, 16(sp)
8000541c: 0c 08        	addi	a1, sp, 16
8000541e: 97 00 00 00  	auipc	ra, 0
80005422: e7 80 e0 f7  	jalr	-130(ra)
80005426: 2a e4        	sd	a0, 8(sp)
80005428: 09 a0        	j	2 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hb6eddd37750f019bE+0x2e>
8000542a: 22 65        	ld	a0, 8(sp)
8000542c: a6 60        	ld	ra, 72(sp)
8000542e: 61 61        	addi	sp, sp, 80
80005430: 82 80        	ret

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3965eae931399d4cE:

0000000080005432 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3965eae931399d4cE>:
80005432: 79 71        	addi	sp, sp, -48
80005434: 06 f4        	sd	ra, 40(sp)
80005436: 2a e8        	sd	a0, 16(sp)
80005438: 2e ec        	sd	a1, 24(sp)
8000543a: 32 f0        	sd	a2, 32(sp)
8000543c: 08 61        	ld	a0, 0(a0)
8000543e: 97 00 00 00  	auipc	ra, 0
80005442: e7 80 00 6b  	jalr	1712(ra)
80005446: 2a e4        	sd	a0, 8(sp)
80005448: 09 a0        	j	2 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h3965eae931399d4cE+0x18>
8000544a: 22 65        	ld	a0, 8(sp)
8000544c: a2 70        	ld	ra, 40(sp)
8000544e: 45 61        	addi	sp, sp, 48
80005450: 82 80        	ret

Disassembly of section .text._ZN4core4char7methods15encode_utf8_raw17hf63a36dbfb63fc49E:

0000000080005452 <_ZN4core4char7methods15encode_utf8_raw17hf63a36dbfb63fc49E>:
80005452: 45 71        	addi	sp, sp, -464
80005454: 86 e7        	sd	ra, 456(sp)
80005456: aa 86        	add	a3, zero, a0
80005458: 2a cf        	sw	a0, 156(sp)
8000545a: ae ea        	sd	a1, 336(sp)
8000545c: b2 ee        	sd	a2, 344(sp)
8000545e: 32 e9        	sd	a2, 144(sp)
80005460: 2e e5        	sd	a1, 136(sp)
80005462: 36 e1        	sd	a3, 128(sp)
80005464: 97 00 00 00  	auipc	ra, 0
80005468: e7 80 40 27  	jalr	628(ra)
8000546c: 2a f1        	sd	a0, 160(sp)
8000546e: 09 a0        	j	2 <_ZN4core4char7methods15encode_utf8_raw17hf63a36dbfb63fc49E+0x1e>
80005470: 0a 75        	ld	a0, 160(sp)

0000000080005472 <.LBB0_22>:
80005472: 17 96 00 00  	auipc	a2, 9
80005476: 13 06 66 10  	addi	a2, a2, 262
8000547a: aa 65        	ld	a1, 136(sp)
8000547c: aa fc        	sd	a0, 120(sp)
8000547e: 2e 85        	add	a0, zero, a1
80005480: ca 65        	ld	a1, 144(sp)
80005482: 97 40 00 00  	auipc	ra, 4
80005486: e7 80 e0 ee  	jalr	-274(ra)
8000548a: aa f8        	sd	a0, 112(sp)
8000548c: ae f4        	sd	a1, 104(sp)
8000548e: 09 a0        	j	2 <.LBB0_22+0x1e>
80005490: 66 75        	ld	a0, 120(sp)
80005492: 2a f5        	sd	a0, 168(sp)
80005494: c6 75        	ld	a1, 112(sp)
80005496: 2e f9        	sd	a1, 176(sp)
80005498: 26 76        	ld	a2, 104(sp)
8000549a: 32 fd        	sd	a2, 184(sp)
8000549c: 85 46        	addi	a3, zero, 1
8000549e: 66 77        	ld	a4, 120(sp)
800054a0: aa f0        	sd	a0, 96(sp)
800054a2: 63 02 d7 02  	beq	a4, a3, 36 <.LBB0_22+0x54>
800054a6: 09 a0        	j	2 <.LBB0_22+0x36>
800054a8: 09 45        	addi	a0, zero, 2
800054aa: 86 75        	ld	a1, 96(sp)
800054ac: 63 8a a5 02  	beq	a1, a0, 52 <.LBB0_22+0x6e>
800054b0: 09 a0        	j	2 <.LBB0_22+0x40>
800054b2: 0d 45        	addi	a0, zero, 3
800054b4: 86 75        	ld	a1, 96(sp)
800054b6: 63 8a a5 02  	beq	a1, a0, 52 <.LBB0_22+0x78>
800054ba: 09 a0        	j	2 <.LBB0_22+0x4a>
800054bc: 11 45        	addi	a0, zero, 4
800054be: 86 75        	ld	a1, 96(sp)
800054c0: 63 8a a5 02  	beq	a1, a0, 52 <.LBB0_22+0x82>
800054c4: 31 a0        	j	12 <.LBB0_22+0x5e>
800054c6: 6a 75        	ld	a0, 184(sp)
800054c8: 81 45        	mv	a1, zero
800054ca: 63 1a b5 02  	bne	a0, a1, 52 <.LBB0_22+0x8c>
800054ce: 09 a0        	j	2 <.LBB0_22+0x5e>
800054d0: 2a 65        	ld	a0, 136(sp)
800054d2: ca 65        	ld	a1, 144(sp)
800054d4: 97 f0 ff ff  	auipc	ra, 1048575
800054d8: e7 80 60 95  	jalr	-1706(ra)
800054dc: aa e2        	sd	a0, 320(sp)
800054de: fd a0        	j	238 <.LBB0_22+0x15a>
800054e0: 6a 75        	ld	a0, 184(sp)
800054e2: 85 45        	addi	a1, zero, 1
800054e4: 63 e4 a5 02  	bltu	a1, a0, 40 <.LBB0_22+0x9a>
800054e8: e5 b7        	j	-24 <.LBB0_22+0x5e>
800054ea: 6a 75        	ld	a0, 184(sp)
800054ec: 89 45        	addi	a1, zero, 2
800054ee: 63 e4 a5 04  	bltu	a1, a0, 72 <.LBB0_22+0xc4>
800054f2: f9 bf        	j	-34 <.LBB0_22+0x5e>
800054f4: 6a 75        	ld	a0, 184(sp)
800054f6: 8d 45        	addi	a1, zero, 3
800054f8: 63 ef a5 06  	bltu	a1, a0, 126 <.LBB0_22+0x104>
800054fc: d1 bf        	j	-44 <.LBB0_22+0x5e>
800054fe: 4a 75        	ld	a0, 176(sp)
80005500: 2a f7        	sd	a0, 424(sp)
80005502: 83 05 c1 09  	lb	a1, 156(sp)
80005506: 23 00 b5 00  	sb	a1, 0(a0)
8000550a: a5 a2        	j	360 <.LBB0_27+0x14>
8000550c: 4a 75        	ld	a0, 176(sp)
8000550e: 2a ef        	sd	a0, 408(sp)
80005510: 93 05 15 00  	addi	a1, a0, 1
80005514: 2e f3        	sd	a1, 416(sp)
80005516: fa 45        	lw	a1, 156(sp)
80005518: 99 81        	srli	a1, a1, 6
8000551a: fd 89        	andi	a1, a1, 31
8000551c: 93 e5 05 0c  	ori	a1, a1, 192
80005520: 23 00 b5 00  	sb	a1, 0(a0)
80005524: 83 45 c1 09  	lbu	a1, 156(sp)
80005528: 93 f5 f5 03  	andi	a1, a1, 63
8000552c: 93 e5 05 08  	ori	a1, a1, 128
80005530: a3 00 b5 00  	sb	a1, 1(a0)
80005534: 3d aa        	j	318 <.LBB0_27+0x14>
80005536: 4a 75        	ld	a0, 176(sp)
80005538: 2a e3        	sd	a0, 384(sp)
8000553a: 93 05 15 00  	addi	a1, a0, 1
8000553e: 2e e7        	sd	a1, 392(sp)
80005540: 93 05 25 00  	addi	a1, a0, 2
80005544: 2e eb        	sd	a1, 400(sp)
80005546: fa 45        	lw	a1, 156(sp)
80005548: b1 81        	srli	a1, a1, 12
8000554a: bd 89        	andi	a1, a1, 15
8000554c: 93 e5 05 0e  	ori	a1, a1, 224
80005550: 23 00 b5 00  	sb	a1, 0(a0)
80005554: fa 45        	lw	a1, 156(sp)
80005556: 99 81        	srli	a1, a1, 6
80005558: 93 f5 f5 03  	andi	a1, a1, 63
8000555c: 93 e5 05 08  	ori	a1, a1, 128
80005560: a3 00 b5 00  	sb	a1, 1(a0)
80005564: 83 45 c1 09  	lbu	a1, 156(sp)
80005568: 93 f5 f5 03  	andi	a1, a1, 63
8000556c: 93 e5 05 08  	ori	a1, a1, 128
80005570: 23 01 b5 00  	sb	a1, 2(a0)
80005574: fd a8        	j	254 <.LBB0_27+0x14>
80005576: 4a 75        	ld	a0, 176(sp)
80005578: aa f2        	sd	a0, 352(sp)
8000557a: 93 05 15 00  	addi	a1, a0, 1
8000557e: ae f6        	sd	a1, 360(sp)
80005580: 93 05 25 00  	addi	a1, a0, 2
80005584: ae fa        	sd	a1, 368(sp)
80005586: 93 05 35 00  	addi	a1, a0, 3
8000558a: ae fe        	sd	a1, 376(sp)
8000558c: fa 45        	lw	a1, 156(sp)
8000558e: c9 81        	srli	a1, a1, 18
80005590: 9d 89        	andi	a1, a1, 7
80005592: 93 e5 05 0f  	ori	a1, a1, 240
80005596: 23 00 b5 00  	sb	a1, 0(a0)
8000559a: fa 45        	lw	a1, 156(sp)
8000559c: b1 81        	srli	a1, a1, 12
8000559e: 93 f5 f5 03  	andi	a1, a1, 63
800055a2: 93 e5 05 08  	ori	a1, a1, 128
800055a6: a3 00 b5 00  	sb	a1, 1(a0)
800055aa: fa 45        	lw	a1, 156(sp)
800055ac: 99 81        	srli	a1, a1, 6
800055ae: 93 f5 f5 03  	andi	a1, a1, 63
800055b2: 93 e5 05 08  	ori	a1, a1, 128
800055b6: 23 01 b5 00  	sb	a1, 2(a0)
800055ba: 83 45 c1 09  	lbu	a1, 156(sp)
800055be: 93 f5 f5 03  	andi	a1, a1, 63
800055c2: 93 e5 05 08  	ori	a1, a1, 128
800055c6: a3 01 b5 00  	sb	a1, 3(a0)
800055ca: 65 a0        	j	168 <.LBB0_27+0x14>
800055cc: 08 11        	addi	a0, sp, 160
800055ce: 2a f6        	sd	a0, 296(sp)
800055d0: 6c 09        	addi	a1, sp, 156
800055d2: 2e fa        	sd	a1, 304(sp)
800055d4: 90 02        	addi	a2, sp, 320
800055d6: 32 fe        	sd	a2, 312(sp)
800055d8: 2a fb        	sd	a0, 432(sp)
800055da: 2e ff        	sd	a1, 440(sp)
800055dc: b2 e3        	sd	a2, 448(sp)

00000000800055de <.LBB0_23>:
800055de: 97 86 00 00  	auipc	a3, 8
800055e2: 93 86 26 c9  	addi	a3, a3, -878
800055e6: ae ec        	sd	a1, 88(sp)
800055e8: b6 85        	add	a1, zero, a3
800055ea: b2 e8        	sd	a2, 80(sp)
800055ec: 97 60 00 00  	auipc	ra, 6
800055f0: e7 80 00 ba  	jalr	-1120(ra)
800055f4: aa e4        	sd	a0, 72(sp)
800055f6: ae e0        	sd	a1, 64(sp)
800055f8: 09 a0        	j	2 <.LBB0_24>

00000000800055fa <.LBB0_24>:
800055fa: 97 85 00 00  	auipc	a1, 8
800055fe: 93 85 a5 85  	addi	a1, a1, -1958
80005602: 66 65        	ld	a0, 88(sp)
80005604: 97 c0 ff ff  	auipc	ra, 1048572
80005608: e7 80 80 04  	jalr	72(ra)
8000560c: 2a fc        	sd	a0, 56(sp)
8000560e: 2e f8        	sd	a1, 48(sp)
80005610: 09 a0        	j	2 <.LBB0_25>

0000000080005612 <.LBB0_25>:
80005612: 97 85 00 00  	auipc	a1, 8
80005616: 93 85 e5 c5  	addi	a1, a1, -930
8000561a: 46 65        	ld	a0, 80(sp)
8000561c: 97 60 00 00  	auipc	ra, 6
80005620: e7 80 00 b7  	jalr	-1168(ra)
80005624: 2a f4        	sd	a0, 40(sp)
80005626: 2e f0        	sd	a1, 32(sp)
80005628: 09 a0        	j	2 <.LBB0_25+0x18>
8000562a: 26 65        	ld	a0, 72(sp)
8000562c: aa fd        	sd	a0, 248(sp)
8000562e: 86 65        	ld	a1, 64(sp)
80005630: 2e e2        	sd	a1, 256(sp)
80005632: 62 76        	ld	a2, 56(sp)
80005634: 32 e6        	sd	a2, 264(sp)
80005636: c2 76        	ld	a3, 48(sp)
80005638: 36 ea        	sd	a3, 272(sp)
8000563a: 22 77        	ld	a4, 40(sp)
8000563c: 3a ee        	sd	a4, 280(sp)
8000563e: 82 77        	ld	a5, 32(sp)
80005640: 3e f2        	sd	a5, 288(sp)

0000000080005642 <.LBB0_26>:
80005642: 97 95 00 00  	auipc	a1, 9
80005646: 93 85 65 fa  	addi	a1, a1, -90
8000564a: a8 01        	addi	a0, sp, 200
8000564c: b4 19        	addi	a3, sp, 248
8000564e: 0d 48        	addi	a6, zero, 3
80005650: 42 86        	add	a2, zero, a6
80005652: 42 87        	add	a4, zero, a6
80005654: 97 c0 ff ff  	auipc	ra, 1048572
80005658: e7 80 40 08  	jalr	132(ra)
8000565c: 09 a0        	j	2 <.LBB0_27>

000000008000565e <.LBB0_27>:
8000565e: 97 95 00 00  	auipc	a1, 9
80005662: 93 85 a5 fb  	addi	a1, a1, -70
80005666: a8 01        	addi	a0, sp, 200
80005668: 97 60 00 00  	auipc	ra, 6
8000566c: e7 80 e0 13  	jalr	318(ra)
80005670: 00 00        	unimp	
80005672: 0a 75        	ld	a0, 160(sp)
80005674: aa e6        	sd	a0, 328(sp)

0000000080005676 <.LBB0_28>:
80005676: 97 96 00 00  	auipc	a3, 9
8000567a: 93 86 a6 f1  	addi	a3, a3, -230
8000567e: aa 65        	ld	a1, 136(sp)
80005680: 2a ec        	sd	a0, 24(sp)
80005682: 2e 85        	add	a0, zero, a1
80005684: ca 65        	ld	a1, 144(sp)
80005686: 62 66        	ld	a2, 24(sp)
80005688: 97 40 00 00  	auipc	ra, 4
8000568c: e7 80 80 d0  	jalr	-760(ra)
80005690: 2a e8        	sd	a0, 16(sp)
80005692: 2e e4        	sd	a1, 8(sp)
80005694: 09 a0        	j	2 <.LBB0_28+0x20>
80005696: 42 65        	ld	a0, 16(sp)
80005698: a2 65        	ld	a1, 8(sp)
8000569a: be 60        	ld	ra, 456(sp)
8000569c: 79 61        	addi	sp, sp, 464
8000569e: 82 80        	ret

Disassembly of section .text._ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817ha99e7a2fe1bc28aaE:

00000000800056a0 <_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817ha99e7a2fe1bc28aaE>:
800056a0: 5d 71        	addi	sp, sp, -80
800056a2: 86 e4        	sd	ra, 72(sp)
800056a4: aa 86        	add	a3, zero, a0
800056a6: 2a da        	sw	a0, 52(sp)
800056a8: 2e fc        	sd	a1, 56(sp)
800056aa: b2 e0        	sd	a2, 64(sp)
800056ac: 36 f4        	sd	a3, 40(sp)
800056ae: 97 00 00 00  	auipc	ra, 0
800056b2: e7 80 40 da  	jalr	-604(ra)
800056b6: 2a f0        	sd	a0, 32(sp)
800056b8: 2e ec        	sd	a1, 24(sp)
800056ba: 09 a0        	j	2 <_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817ha99e7a2fe1bc28aaE+0x1c>
800056bc: 02 75        	ld	a0, 32(sp)
800056be: e2 65        	ld	a1, 24(sp)
800056c0: 97 00 00 00  	auipc	ra, 0
800056c4: e7 80 e0 06  	jalr	110(ra)
800056c8: 2a e8        	sd	a0, 16(sp)
800056ca: 2e e4        	sd	a1, 8(sp)
800056cc: 09 a0        	j	2 <_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817ha99e7a2fe1bc28aaE+0x2e>
800056ce: 42 65        	ld	a0, 16(sp)
800056d0: a2 65        	ld	a1, 8(sp)
800056d2: a6 60        	ld	ra, 72(sp)
800056d4: 61 61        	addi	sp, sp, 80
800056d6: 82 80        	ret

Disassembly of section .text._ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E:

00000000800056d8 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E>:
800056d8: 01 11        	addi	sp, sp, -32
800056da: 9b 05 05 00  	sext.w	a1, a0
800056de: 2a 86        	add	a2, zero, a0
800056e0: 2a ce        	sw	a0, 28(sp)
800056e2: 13 05 f0 07  	addi	a0, zero, 127
800056e6: 32 e4        	sd	a2, 8(sp)
800056e8: 63 66 b5 00  	bltu	a0, a1, 12 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x1c>
800056ec: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x16>
800056ee: 05 45        	addi	a0, zero, 1
800056f0: 2a e8        	sd	a0, 16(sp)
800056f2: 1d a8        	j	54 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x50>
800056f4: 22 65        	ld	a0, 8(sp)
800056f6: 9b 05 05 00  	sext.w	a1, a0
800056fa: 13 06 f0 7f  	addi	a2, zero, 2047
800056fe: 63 66 b6 00  	bltu	a2, a1, 12 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x32>
80005702: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x2c>
80005704: 09 45        	addi	a0, zero, 2
80005706: 2a e8        	sd	a0, 16(sp)
80005708: 39 a8        	j	30 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x4e>
8000570a: 22 65        	ld	a0, 8(sp)
8000570c: 9b 55 05 01  	srliw	a1, a0, 16
80005710: 01 46        	mv	a2, zero
80005712: 63 96 c5 00  	bne	a1, a2, 12 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x46>
80005716: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x40>
80005718: 0d 45        	addi	a0, zero, 3
8000571a: 2a e8        	sd	a0, 16(sp)
8000571c: 21 a0        	j	8 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x4c>
8000571e: 11 45        	addi	a0, zero, 4
80005720: 2a e8        	sd	a0, 16(sp)
80005722: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x4c>
80005724: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x4e>
80005726: 09 a0        	j	2 <_ZN4core4char7methods8len_utf817hdd58919bf9fc30d0E+0x50>
80005728: 42 65        	ld	a0, 16(sp)
8000572a: 05 61        	addi	sp, sp, 32
8000572c: 82 80        	ret

Disassembly of section .text._ZN4core3str8converts23from_utf8_unchecked_mut17h6efb4c0ebf63e07fE:

000000008000572e <_ZN4core3str8converts23from_utf8_unchecked_mut17h6efb4c0ebf63e07fE>:
8000572e: 41 11        	addi	sp, sp, -16
80005730: 2a e0        	sd	a0, 0(sp)
80005732: 2e e4        	sd	a1, 8(sp)
80005734: 41 01        	addi	sp, sp, 16
80005736: 82 80        	ret

Disassembly of section .text._ZN6kernel7console4uart9uart_init17ha65aa70d9c1117c1E:

0000000080005738 <_ZN6kernel7console4uart9uart_init17ha65aa70d9c1117c1E>:
80005738: 01 11        	addi	sp, sp, -32
8000573a: 06 ec        	sd	ra, 24(sp)

000000008000573c <.LBB0_5>:
8000573c: 17 55 01 00  	auipc	a0, 21
80005740: 13 05 c5 97  	addi	a0, a0, -1668
80005744: 97 c0 ff ff  	auipc	ra, 1048572
80005748: e7 80 c0 55  	jalr	1372(ra)
8000574c: 2a e8        	sd	a0, 16(sp)
8000574e: 09 a0        	j	2 <.LBB0_5+0x14>
80005750: 08 08        	addi	a0, sp, 16
80005752: 97 d0 ff ff  	auipc	ra, 1048573
80005756: e7 80 20 ee  	jalr	-286(ra)
8000575a: 2a e4        	sd	a0, 8(sp)
8000575c: 09 a0        	j	2 <.LBB0_5+0x22>
8000575e: 22 65        	ld	a0, 8(sp)
80005760: 97 00 00 00  	auipc	ra, 0
80005764: e7 80 c0 01  	jalr	28(ra)
80005768: 09 a0        	j	2 <.LBB0_5+0x2e>
8000576a: 42 65        	ld	a0, 16(sp)
8000576c: 97 c0 ff ff  	auipc	ra, 1048572
80005770: e7 80 c0 fd  	jalr	-36(ra)
80005774: 09 a0        	j	2 <.LBB0_5+0x3a>
80005776: e2 60        	ld	ra, 24(sp)
80005778: 05 61        	addi	sp, sp, 32
8000577a: 82 80        	ret

Disassembly of section .text._ZN6kernel7console4uart4Uart4init17h4a881759503be904E:

000000008000577c <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E>:
8000577c: 71 71        	addi	sp, sp, -176
8000577e: 06 f5        	sd	ra, 168(sp)
80005780: 2a e9        	sd	a0, 144(sp)
80005782: 08 61        	ld	a0, 0(a0)
80005784: 2a ed        	sd	a0, 152(sp)
80005786: 8d 45        	addi	a1, zero, 3
80005788: 2a e5        	sd	a0, 136(sp)
8000578a: 97 50 00 00  	auipc	ra, 5
8000578e: e7 80 e0 78  	jalr	1934(ra)
80005792: 2a e1        	sd	a0, 128(sp)
80005794: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x1a>
80005796: 8d 45        	addi	a1, zero, 3
80005798: 0a 65        	ld	a0, 128(sp)
8000579a: 97 e0 ff ff  	auipc	ra, 1048574
8000579e: e7 80 c0 ac  	jalr	-1332(ra)
800057a2: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x28>
800057a4: 89 45        	addi	a1, zero, 2
800057a6: 2a 65        	ld	a0, 136(sp)
800057a8: 97 50 00 00  	auipc	ra, 5
800057ac: e7 80 00 77  	jalr	1904(ra)
800057b0: aa fc        	sd	a0, 120(sp)
800057b2: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x38>
800057b4: 85 45        	addi	a1, zero, 1
800057b6: 66 75        	ld	a0, 120(sp)
800057b8: 97 e0 ff ff  	auipc	ra, 1048574
800057bc: e7 80 e0 aa  	jalr	-1362(ra)
800057c0: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x46>
800057c2: 85 45        	addi	a1, zero, 1
800057c4: 2a 65        	ld	a0, 136(sp)
800057c6: 97 50 00 00  	auipc	ra, 5
800057ca: e7 80 20 75  	jalr	1874(ra)
800057ce: aa f8        	sd	a0, 112(sp)
800057d0: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x56>
800057d2: 85 45        	addi	a1, zero, 1
800057d4: 46 75        	ld	a0, 112(sp)
800057d6: 97 e0 ff ff  	auipc	ra, 1048574
800057da: e7 80 00 a9  	jalr	-1392(ra)
800057de: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x64>
800057e0: 13 05 00 25  	addi	a0, zero, 592
800057e4: 23 11 a1 0a  	sh	a0, 162(sp)
800057e8: 13 05 00 05  	addi	a0, zero, 80
800057ec: 97 00 00 00  	auipc	ra, 0
800057f0: e7 80 60 4e  	jalr	1254(ra)
800057f4: aa f4        	sd	a0, 104(sp)
800057f6: ae f0        	sd	a1, 96(sp)
800057f8: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart4init17h4a881759503be904E+0x7e>
800057fa: 26 75        	ld	a0, 104(sp)
800057fc: 05 89        	andi	a0, a0, 1

00000000800057fe <.LBB1_22>:
800057fe: 17 96 00 00  	auipc	a2, 9
80005802: 13 06 a6 e4  	addi	a2, a2, -438
80005806: 86 75        	ld	a1, 96(sp)
80005808: 97 e0 ff ff  	auipc	ra, 1048574
8000580c: e7 80 00 1e  	jalr	480(ra)
80005810: aa 85        	add	a1, zero, a0
80005812: a3 02 a1 0a  	sb	a0, 165(sp)
80005816: ae ec        	sd	a1, 88(sp)
80005818: 09 a0        	j	2 <.LBB1_22+0x1c>
8000581a: 09 a0        	j	2 <.LBB1_22+0x1e>
8000581c: 09 45        	addi	a0, zero, 2
8000581e: 97 00 00 00  	auipc	ra, 0
80005822: e7 80 40 4b  	jalr	1204(ra)
80005826: aa e8        	sd	a0, 80(sp)
80005828: ae e4        	sd	a1, 72(sp)
8000582a: 09 a0        	j	2 <.LBB1_22+0x2e>
8000582c: 46 65        	ld	a0, 80(sp)
8000582e: 05 89        	andi	a0, a0, 1

0000000080005830 <.LBB1_23>:
80005830: 17 96 00 00  	auipc	a2, 9
80005834: 13 06 06 e3  	addi	a2, a2, -464
80005838: a6 65        	ld	a1, 72(sp)
8000583a: 97 e0 ff ff  	auipc	ra, 1048574
8000583e: e7 80 e0 1a  	jalr	430(ra)
80005842: aa 85        	add	a1, zero, a0
80005844: 23 03 a1 0a  	sb	a0, 166(sp)
80005848: ae e0        	sd	a1, 64(sp)
8000584a: 09 a0        	j	2 <.LBB1_23+0x1c>
8000584c: 8d 45        	addi	a1, zero, 3
8000584e: 2a 65        	ld	a0, 136(sp)
80005850: 97 50 00 00  	auipc	ra, 5
80005854: e7 80 80 6c  	jalr	1736(ra)
80005858: 2a fc        	sd	a0, 56(sp)
8000585a: 09 a0        	j	2 <.LBB1_23+0x2c>
8000585c: 62 75        	ld	a0, 56(sp)
8000585e: 97 e0 ff ff  	auipc	ra, 1048574
80005862: e7 80 e0 9e  	jalr	-1554(ra)
80005866: aa 85        	add	a1, zero, a0
80005868: a3 03 a1 0a  	sb	a0, 167(sp)
8000586c: 2e f8        	sd	a1, 48(sp)
8000586e: 09 a0        	j	2 <.LBB1_23+0x40>
80005870: 8d 45        	addi	a1, zero, 3
80005872: 2a 65        	ld	a0, 136(sp)
80005874: 97 50 00 00  	auipc	ra, 5
80005878: e7 80 40 6a  	jalr	1700(ra)
8000587c: 2a f4        	sd	a0, 40(sp)
8000587e: 09 a0        	j	2 <.LBB1_23+0x50>
80005880: 42 75        	ld	a0, 48(sp)
80005882: 93 65 05 f8  	ori	a1, a0, -128
80005886: 22 75        	ld	a0, 40(sp)
80005888: 97 e0 ff ff  	auipc	ra, 1048574
8000588c: e7 80 e0 9d  	jalr	-1570(ra)
80005890: 09 a0        	j	2 <.LBB1_23+0x62>
80005892: 01 45        	mv	a0, zero
80005894: aa 65        	ld	a1, 136(sp)
80005896: 2a f0        	sd	a0, 32(sp)
80005898: 2e 85        	add	a0, zero, a1
8000589a: 82 75        	ld	a1, 32(sp)
8000589c: 97 50 00 00  	auipc	ra, 5
800058a0: e7 80 c0 67  	jalr	1660(ra)
800058a4: 2a ec        	sd	a0, 24(sp)
800058a6: 09 a0        	j	2 <.LBB1_23+0x78>
800058a8: 62 65        	ld	a0, 24(sp)
800058aa: e6 65        	ld	a1, 88(sp)
800058ac: 97 e0 ff ff  	auipc	ra, 1048574
800058b0: e7 80 a0 9b  	jalr	-1606(ra)
800058b4: 09 a0        	j	2 <.LBB1_23+0x86>
800058b6: 85 45        	addi	a1, zero, 1
800058b8: 2a 65        	ld	a0, 136(sp)
800058ba: 97 50 00 00  	auipc	ra, 5
800058be: e7 80 e0 65  	jalr	1630(ra)
800058c2: 2a e8        	sd	a0, 16(sp)
800058c4: 09 a0        	j	2 <.LBB1_23+0x96>
800058c6: 42 65        	ld	a0, 16(sp)
800058c8: 86 65        	ld	a1, 64(sp)
800058ca: 97 e0 ff ff  	auipc	ra, 1048574
800058ce: e7 80 c0 99  	jalr	-1636(ra)
800058d2: 09 a0        	j	2 <.LBB1_23+0xa4>
800058d4: 8d 45        	addi	a1, zero, 3
800058d6: 2a 65        	ld	a0, 136(sp)
800058d8: 97 50 00 00  	auipc	ra, 5
800058dc: e7 80 00 64  	jalr	1600(ra)
800058e0: 2a e4        	sd	a0, 8(sp)
800058e2: 09 a0        	j	2 <.LBB1_23+0xb4>
800058e4: 22 65        	ld	a0, 8(sp)
800058e6: c2 75        	ld	a1, 48(sp)
800058e8: 97 e0 ff ff  	auipc	ra, 1048574
800058ec: e7 80 e0 97  	jalr	-1666(ra)
800058f0: 09 a0        	j	2 <.LBB1_23+0xc2>
800058f2: aa 70        	ld	ra, 168(sp)
800058f4: 4d 61        	addi	sp, sp, 176
800058f6: 82 80        	ret

Disassembly of section .text._ZN6kernel7console4uart4Uart10uart_start17h4e0efe6fa17183beE:

00000000800058f8 <_ZN6kernel7console4uart4Uart10uart_start17h4e0efe6fa17183beE>:
800058f8: 59 71        	addi	sp, sp, -112
800058fa: 86 f4        	sd	ra, 104(sp)
800058fc: aa e8        	sd	a0, 80(sp)
800058fe: aa e0        	sd	a0, 64(sp)
80005900: 09 a0        	j	2 <.LBB2_15>

0000000080005902 <.LBB2_15>:
80005902: 17 35 02 00  	auipc	a0, 35
80005906: 13 05 65 70  	addi	a0, a0, 1798
8000590a: 08 61        	ld	a0, 0(a0)

000000008000590c <.LBB2_16>:
8000590c: 97 35 02 00  	auipc	a1, 35
80005910: 93 85 45 6f  	addi	a1, a1, 1780
80005914: 8c 61        	ld	a1, 0(a1)
80005916: 63 14 b5 00  	bne	a0, a1, 8 <.LBB2_16+0x12>
8000591a: 09 a0        	j	2 <.LBB2_16+0x10>
8000591c: 45 a8        	j	176 <.LBB2_19+0x32>
8000591e: 06 65        	ld	a0, 64(sp)
80005920: 0c 61        	ld	a1, 0(a0)
80005922: ae ec        	sd	a1, 88(sp)
80005924: 15 46        	addi	a2, zero, 5
80005926: 2e 85        	add	a0, zero, a1
80005928: 2e fc        	sd	a1, 56(sp)
8000592a: b2 85        	add	a1, zero, a2
8000592c: 97 50 00 00  	auipc	ra, 5
80005930: e7 80 c0 5e  	jalr	1516(ra)
80005934: 2a f8        	sd	a0, 48(sp)
80005936: 09 a0        	j	2 <.LBB2_16+0x2c>
80005938: 42 75        	ld	a0, 48(sp)
8000593a: 97 e0 ff ff  	auipc	ra, 1048574
8000593e: e7 80 20 91  	jalr	-1774(ra)
80005942: aa 85        	add	a1, zero, a0
80005944: 23 03 a1 06  	sb	a0, 102(sp)
80005948: 2e f4        	sd	a1, 40(sp)
8000594a: 09 a0        	j	2 <.LBB2_16+0x40>
8000594c: 22 75        	ld	a0, 40(sp)
8000594e: 93 75 05 02  	andi	a1, a0, 32
80005952: 01 46        	mv	a2, zero
80005954: 63 94 c5 00  	bne	a1, a2, 8 <.LBB2_17>
80005958: 09 a0        	j	2 <.LBB2_16+0x4e>
8000595a: 8d a8        	j	114 <.LBB2_19+0x32>

000000008000595c <.LBB2_17>:
8000595c: 17 35 02 00  	auipc	a0, 35
80005960: 13 05 c5 6a  	addi	a0, a0, 1708
80005964: 08 61        	ld	a0, 0(a0)
80005966: 7d 89        	andi	a0, a0, 31
80005968: fd 45        	addi	a1, zero, 31
8000596a: 2a f0        	sd	a0, 32(sp)
8000596c: 63 e3 a5 06  	bltu	a1, a0, 102 <.LBB2_20>
80005970: 09 a0        	j	2 <.LBB2_17+0x16>
80005972: 06 65        	ld	a0, 64(sp)
80005974: 82 75        	ld	a1, 32(sp)
80005976: 33 06 b5 00  	add	a2, a0, a1
8000597a: 03 46 86 00  	lbu	a2, 8(a2)
8000597e: a3 03 c1 06  	sb	a2, 103(sp)

0000000080005982 <.LBB2_18>:
80005982: 97 36 02 00  	auipc	a3, 35
80005986: 93 86 66 68  	addi	a3, a3, 1670
8000598a: 94 62        	ld	a3, 0(a3)
8000598c: 13 87 16 00  	addi	a4, a3, 1
80005990: 32 ec        	sd	a2, 24(sp)
80005992: 3a e8        	sd	a4, 16(sp)
80005994: 63 6b d7 04  	bltu	a4, a3, 86 <.LBB2_21>
80005998: 09 a0        	j	2 <.LBB2_19>

000000008000599a <.LBB2_19>:
8000599a: 17 35 02 00  	auipc	a0, 35
8000599e: 13 05 e5 66  	addi	a0, a0, 1646
800059a2: c2 65        	ld	a1, 16(sp)
800059a4: 0c e1        	sd	a1, 0(a0)
800059a6: 01 45        	mv	a0, zero
800059a8: 62 76        	ld	a2, 56(sp)
800059aa: 2a e4        	sd	a0, 8(sp)
800059ac: 32 85        	add	a0, zero, a2
800059ae: a2 65        	ld	a1, 8(sp)
800059b0: 97 50 00 00  	auipc	ra, 5
800059b4: e7 80 80 56  	jalr	1384(ra)
800059b8: 2a e0        	sd	a0, 0(sp)
800059ba: 09 a0        	j	2 <.LBB2_19+0x22>
800059bc: 02 65        	ld	a0, 0(sp)
800059be: e2 65        	ld	a1, 24(sp)
800059c0: 97 e0 ff ff  	auipc	ra, 1048574
800059c4: e7 80 60 8a  	jalr	-1882(ra)
800059c8: 09 a0        	j	2 <.LBB2_19+0x30>
800059ca: 25 bf        	j	-200 <.LBB2_15>
800059cc: a6 70        	ld	ra, 104(sp)
800059ce: 65 61        	addi	sp, sp, 112
800059d0: 82 80        	ret

00000000800059d2 <.LBB2_20>:
800059d2: 17 96 00 00  	auipc	a2, 9
800059d6: 13 06 66 ca  	addi	a2, a2, -858
800059da: 93 05 00 02  	addi	a1, zero, 32
800059de: 02 75        	ld	a0, 32(sp)
800059e0: 97 60 00 00  	auipc	ra, 6
800059e4: e7 80 60 d8  	jalr	-634(ra)
800059e8: 00 00        	unimp	

00000000800059ea <.LBB2_21>:
800059ea: 17 95 00 00  	auipc	a0, 9
800059ee: 13 05 65 cc  	addi	a0, a0, -826

00000000800059f2 <.LBB2_22>:
800059f2: 17 96 00 00  	auipc	a2, 9
800059f6: 13 06 e6 c9  	addi	a2, a2, -866
800059fa: f1 45        	addi	a1, zero, 28
800059fc: 97 60 00 00  	auipc	ra, 6
80005a00: e7 80 e0 d3  	jalr	-706(ra)
80005a04: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E:

0000000080005a06 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E>:
80005a06: 5d 71        	addi	sp, sp, -80
80005a08: 86 e4        	sd	ra, 72(sp)
80005a0a: 2e 86        	add	a2, zero, a1
80005a0c: 2a f8        	sd	a0, 48(sp)
80005a0e: a3 0f b1 02  	sb	a1, 63(sp)
80005a12: 08 61        	ld	a0, 0(a0)
80005a14: aa e0        	sd	a0, 64(sp)
80005a16: 32 f4        	sd	a2, 40(sp)
80005a18: 2a f0        	sd	a0, 32(sp)
80005a1a: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x16>
80005a1c: 95 45        	addi	a1, zero, 5
80005a1e: 02 75        	ld	a0, 32(sp)
80005a20: 97 50 00 00  	auipc	ra, 5
80005a24: e7 80 80 4f  	jalr	1272(ra)
80005a28: 2a ec        	sd	a0, 24(sp)
80005a2a: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x26>
80005a2c: 62 65        	ld	a0, 24(sp)
80005a2e: 97 e0 ff ff  	auipc	ra, 1048574
80005a32: e7 80 e0 81  	jalr	-2018(ra)
80005a36: 2a e8        	sd	a0, 16(sp)
80005a38: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x34>
80005a3a: 42 65        	ld	a0, 16(sp)
80005a3c: 93 75 05 02  	andi	a1, a0, 32
80005a40: 01 46        	mv	a2, zero
80005a42: 63 8e c5 00  	beq	a1, a2, 28 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x58>
80005a46: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x42>
80005a48: 01 45        	mv	a0, zero
80005a4a: 82 75        	ld	a1, 32(sp)
80005a4c: 2a e4        	sd	a0, 8(sp)
80005a4e: 2e 85        	add	a0, zero, a1
80005a50: a2 65        	ld	a1, 8(sp)
80005a52: 97 50 00 00  	auipc	ra, 5
80005a56: e7 80 60 4c  	jalr	1222(ra)
80005a5a: 2a e0        	sd	a0, 0(sp)
80005a5c: 11 a0        	j	4 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x5a>
80005a5e: 7d bf        	j	-66 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x16>
80005a60: 02 65        	ld	a0, 0(sp)
80005a62: a2 75        	ld	a1, 40(sp)
80005a64: 97 e0 ff ff  	auipc	ra, 1048574
80005a68: e7 80 20 80  	jalr	-2046(ra)
80005a6c: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3put17h38abdc1e02b32da1E+0x68>
80005a6e: a6 60        	ld	ra, 72(sp)
80005a70: 61 61        	addi	sp, sp, 80
80005a72: 82 80        	ret

Disassembly of section .text._ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E:

0000000080005a74 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E>:
80005a74: 5d 71        	addi	sp, sp, -80
80005a76: 86 e4        	sd	ra, 72(sp)
80005a78: 2a fc        	sd	a0, 56(sp)
80005a7a: 08 61        	ld	a0, 0(a0)
80005a7c: aa e0        	sd	a0, 64(sp)
80005a7e: 95 45        	addi	a1, zero, 5
80005a80: 2a f4        	sd	a0, 40(sp)
80005a82: 97 50 00 00  	auipc	ra, 5
80005a86: e7 80 60 49  	jalr	1174(ra)
80005a8a: 2a f0        	sd	a0, 32(sp)
80005a8c: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x1a>
80005a8e: 02 75        	ld	a0, 32(sp)
80005a90: 97 d0 ff ff  	auipc	ra, 1048573
80005a94: e7 80 c0 7b  	jalr	1980(ra)
80005a98: 2a ec        	sd	a0, 24(sp)
80005a9a: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x28>
80005a9c: 62 65        	ld	a0, 24(sp)
80005a9e: 93 75 15 00  	andi	a1, a0, 1
80005aa2: 91 e5        	bnez	a1, 12 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x3a>
80005aa4: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x32>
80005aa6: 01 45        	mv	a0, zero
80005aa8: 23 08 a1 02  	sb	a0, 48(sp)
80005aac: 15 a8        	j	52 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x6c>
80005aae: 01 45        	mv	a0, zero
80005ab0: a2 75        	ld	a1, 40(sp)
80005ab2: 2a e8        	sd	a0, 16(sp)
80005ab4: 2e 85        	add	a0, zero, a1
80005ab6: c2 65        	ld	a1, 16(sp)
80005ab8: 97 50 00 00  	auipc	ra, 5
80005abc: e7 80 00 46  	jalr	1120(ra)
80005ac0: 2a e4        	sd	a0, 8(sp)
80005ac2: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x50>
80005ac4: 22 65        	ld	a0, 8(sp)
80005ac6: 97 d0 ff ff  	auipc	ra, 1048573
80005aca: e7 80 60 78  	jalr	1926(ra)
80005ace: 2a e0        	sd	a0, 0(sp)
80005ad0: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x5e>
80005ad2: 02 65        	ld	a0, 0(sp)
80005ad4: a3 08 a1 02  	sb	a0, 49(sp)
80005ad8: 85 45        	addi	a1, zero, 1
80005ada: 23 08 b1 02  	sb	a1, 48(sp)
80005ade: 09 a0        	j	2 <_ZN6kernel7console4uart4Uart3get17hd0e774c92b4999a2E+0x6c>
80005ae0: 03 45 01 03  	lbu	a0, 48(sp)
80005ae4: 83 05 11 03  	lb	a1, 49(sp)
80005ae8: a6 60        	ld	ra, 72(sp)
80005aea: 61 61        	addi	sp, sp, 80
80005aec: 82 80        	ret

Disassembly of section .text._ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE:

0000000080005aee <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE>:
80005aee: 6d 71        	addi	sp, sp, -272
80005af0: 06 e6        	sd	ra, 264(sp)
80005af2: 2a f5        	sd	a0, 168(sp)
80005af4: 2e f9        	sd	a1, 176(sp)
80005af6: 32 fd        	sd	a2, 184(sp)
80005af8: 81 46        	mv	a3, zero
80005afa: b6 da        	sw	a3, 116(sp)
80005afc: aa f4        	sd	a0, 104(sp)
80005afe: 2e 85        	add	a0, zero, a1
80005b00: b2 85        	add	a1, zero, a2
80005b02: 97 30 00 00  	auipc	ra, 3
80005b06: e7 80 c0 8a  	jalr	-1876(ra)
80005b0a: aa f0        	sd	a0, 96(sp)
80005b0c: ae ec        	sd	a1, 88(sp)
80005b0e: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x22>
80005b10: 06 75        	ld	a0, 96(sp)
80005b12: e6 65        	ld	a1, 88(sp)
80005b14: 97 e0 ff ff  	auipc	ra, 1048574
80005b18: e7 80 00 78  	jalr	1920(ra)
80005b1c: aa e8        	sd	a0, 80(sp)
80005b1e: ae e4        	sd	a1, 72(sp)
80005b20: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x34>
80005b22: 46 65        	ld	a0, 80(sp)
80005b24: aa fc        	sd	a0, 120(sp)
80005b26: a6 65        	ld	a1, 72(sp)
80005b28: 2e e1        	sd	a1, 128(sp)
80005b2a: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x3e>
80005b2c: a8 18        	addi	a0, sp, 120
80005b2e: 97 00 00 00  	auipc	ra, 0
80005b32: e7 80 60 20  	jalr	518(ra)
80005b36: 02 15        	slli	a0, a0, 32
80005b38: 01 91        	srli	a0, a0, 32
80005b3a: 2a c7        	sw	a0, 140(sp)
80005b3c: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x50>
80005b3e: 3a 45        	lw	a0, 140(sp)
80005b40: b7 05 ef ff  	lui	a1, 1048304
80005b44: 2e 95        	add	a0, a0, a1
80005b46: 02 15        	slli	a0, a0, 32
80005b48: 01 91        	srli	a0, a0, 32
80005b4a: b3 35 a0 00  	snez	a1, a0
80005b4e: 01 46        	mv	a2, zero
80005b50: 63 04 c5 00  	beq	a0, a2, 8 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x6a>
80005b54: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x68>
80005b56: 01 a8        	j	16 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x78>
80005b58: 01 45        	mv	a0, zero
80005b5a: a3 09 a1 06  	sb	a0, 115(sp)
80005b5e: b2 60        	ld	ra, 264(sp)
80005b60: 51 61        	addi	sp, sp, 272
80005b62: 82 80        	ret
80005b64: 00 00        	unimp	
80005b66: 3a 45        	lw	a0, 140(sp)
80005b68: aa c3        	sw	a0, 196(sp)
80005b6a: aa c5        	sw	a0, 200(sp)
80005b6c: aa c7        	sw	a0, 204(sp)
80005b6e: cc 18        	addi	a1, sp, 116
80005b70: 11 46        	addi	a2, zero, 4
80005b72: 97 00 00 00  	auipc	ra, 0
80005b76: e7 80 e0 b2  	jalr	-1234(ra)
80005b7a: aa e0        	sd	a0, 64(sp)
80005b7c: 2e fc        	sd	a1, 56(sp)
80005b7e: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x92>
80005b80: 06 65        	ld	a0, 64(sp)
80005b82: aa f5        	sd	a0, 232(sp)
80005b84: e2 75        	ld	a1, 56(sp)
80005b86: ae f9        	sd	a1, 240(sp)
80005b88: aa fd        	sd	a0, 248(sp)
80005b8a: 2e e2        	sd	a1, 256(sp)
80005b8c: 2a f8        	sd	a0, 48(sp)
80005b8e: 2e f4        	sd	a1, 40(sp)
80005b90: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xa4>
80005b92: 42 75        	ld	a0, 48(sp)
80005b94: a2 75        	ld	a1, 40(sp)
80005b96: 97 e0 ff ff  	auipc	ra, 1048574
80005b9a: e7 80 40 2a  	jalr	676(ra)
80005b9e: 2a f0        	sd	a0, 32(sp)
80005ba0: 2e ec        	sd	a1, 24(sp)
80005ba2: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xb6>
80005ba4: 02 75        	ld	a0, 32(sp)
80005ba6: e2 65        	ld	a1, 24(sp)
80005ba8: 97 d0 ff ff  	auipc	ra, 1048573
80005bac: e7 80 20 45  	jalr	1106(ra)
80005bb0: 2a e8        	sd	a0, 16(sp)
80005bb2: 2e e4        	sd	a1, 8(sp)
80005bb4: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xc8>
80005bb6: 42 65        	ld	a0, 16(sp)
80005bb8: 2a e9        	sd	a0, 144(sp)
80005bba: a2 65        	ld	a1, 8(sp)
80005bbc: 2e ed        	sd	a1, 152(sp)
80005bbe: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xd2>
80005bc0: 08 09        	addi	a0, sp, 144
80005bc2: 97 d0 ff ff  	auipc	ra, 1048573
80005bc6: e7 80 c0 44  	jalr	1100(ra)
80005bca: 2a f1        	sd	a0, 160(sp)
80005bcc: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xe0>
80005bce: 0a 75        	ld	a0, 160(sp)
80005bd0: b3 35 a0 00  	snez	a1, a0
80005bd4: 01 46        	mv	a2, zero
80005bd6: 63 04 c5 00  	beq	a0, a2, 8 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xf0>
80005bda: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xee>
80005bdc: 19 a0        	j	6 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xf4>
80005bde: b9 b7        	j	-178 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x3e>
80005be0: 00 00        	unimp	
80005be2: 0a 75        	ld	a0, 160(sp)
80005be4: aa e9        	sd	a0, 208(sp)
80005be6: aa ed        	sd	a0, 216(sp)
80005be8: aa f1        	sd	a0, 224(sp)
80005bea: 83 05 05 00  	lb	a1, 0(a0)
80005bee: 26 75        	ld	a0, 104(sp)
80005bf0: 97 00 00 00  	auipc	ra, 0
80005bf4: e7 80 60 e1  	jalr	-490(ra)
80005bf8: 09 a0        	j	2 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0x10c>
80005bfa: d9 b7        	j	-58 <_ZN64_$LT$kernel..console..uart..Uart$u20$as$u20$core..fmt..Write$GT$9write_str17h8e6200ed9d9eca0bE+0xd2>

Disassembly of section .text._ZN6kernel7console4uart9uart_intr17hfffd51055679e212E:

0000000080005bfc <_ZN6kernel7console4uart9uart_intr17hfffd51055679e212E>:
80005bfc: 5d 71        	addi	sp, sp, -80
80005bfe: 86 e4        	sd	ra, 72(sp)
80005c00: 09 a0        	j	2 <.LBB6_13>

0000000080005c02 <.LBB6_13>:
80005c02: 17 45 01 00  	auipc	a0, 20
80005c06: 13 05 65 4b  	addi	a0, a0, 1206
80005c0a: 97 c0 ff ff  	auipc	ra, 1048572
80005c0e: e7 80 60 09  	jalr	150(ra)
80005c12: 2a f8        	sd	a0, 48(sp)
80005c14: 09 a0        	j	2 <.LBB6_13+0x14>
80005c16: 08 18        	addi	a0, sp, 48
80005c18: 97 d0 ff ff  	auipc	ra, 1048573
80005c1c: e7 80 c0 a1  	jalr	-1508(ra)
80005c20: 2a f4        	sd	a0, 40(sp)
80005c22: 09 a0        	j	2 <.LBB6_13+0x22>
80005c24: 22 75        	ld	a0, 40(sp)
80005c26: 97 00 00 00  	auipc	ra, 0
80005c2a: e7 80 e0 e4  	jalr	-434(ra)
80005c2e: 2a f0        	sd	a0, 32(sp)
80005c30: 2e ec        	sd	a1, 24(sp)
80005c32: 09 a0        	j	2 <.LBB6_13+0x32>
80005c34: 02 75        	ld	a0, 32(sp)
80005c36: 05 89        	andi	a0, a0, 1

0000000080005c38 <.LBB6_14>:
80005c38: 17 96 00 00  	auipc	a2, 9
80005c3c: 13 06 86 a9  	addi	a2, a2, -1384
80005c40: e2 65        	ld	a1, 24(sp)
80005c42: 97 e0 ff ff  	auipc	ra, 1048574
80005c46: e7 80 e0 4f  	jalr	1278(ra)
80005c4a: aa 85        	add	a1, zero, a0
80005c4c: a3 03 a1 04  	sb	a0, 71(sp)
80005c50: 2e e8        	sd	a1, 16(sp)
80005c52: 09 a0        	j	2 <.LBB6_14+0x1c>
80005c54: 42 75        	ld	a0, 48(sp)
80005c56: 97 c0 ff ff  	auipc	ra, 1048572
80005c5a: e7 80 20 af  	jalr	-1294(ra)
80005c5e: 09 a0        	j	2 <.LBB6_14+0x28>
80005c60: 42 65        	ld	a0, 16(sp)
80005c62: 93 75 f5 0f  	andi	a1, a0, 255
80005c66: 29 46        	addi	a2, zero, 10
80005c68: 63 84 c5 00  	beq	a1, a2, 8 <.LBB6_15>
80005c6c: 09 a0        	j	2 <.LBB6_14+0x36>
80005c6e: 51 bf        	j	-108 <.LBB6_13>

0000000080005c70 <.LBB6_15>:
80005c70: 17 45 01 00  	auipc	a0, 20
80005c74: 13 05 85 44  	addi	a0, a0, 1096
80005c78: 97 c0 ff ff  	auipc	ra, 1048572
80005c7c: e7 80 80 02  	jalr	40(ra)
80005c80: 2a fc        	sd	a0, 56(sp)
80005c82: 09 a0        	j	2 <.LBB6_15+0x14>
80005c84: 28 18        	addi	a0, sp, 56
80005c86: 97 d0 ff ff  	auipc	ra, 1048573
80005c8a: e7 80 e0 9a  	jalr	-1618(ra)
80005c8e: 2a e4        	sd	a0, 8(sp)
80005c90: 09 a0        	j	2 <.LBB6_15+0x22>
80005c92: 22 65        	ld	a0, 8(sp)
80005c94: 97 00 00 00  	auipc	ra, 0
80005c98: e7 80 40 c6  	jalr	-924(ra)
80005c9c: 09 a0        	j	2 <.LBB6_15+0x2e>
80005c9e: 62 75        	ld	a0, 56(sp)
80005ca0: 97 c0 ff ff  	auipc	ra, 1048572
80005ca4: e7 80 80 aa  	jalr	-1368(ra)
80005ca8: 09 a0        	j	2 <.LBB6_15+0x3a>
80005caa: a6 60        	ld	ra, 72(sp)
80005cac: 61 61        	addi	sp, sp, 80
80005cae: 82 80        	ret

Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h4d49c50d49eae448E:

0000000080005cb0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h4d49c50d49eae448E>:
80005cb0: 41 11        	addi	sp, sp, -16
80005cb2: 2a e4        	sd	a0, 8(sp)
80005cb4: 41 01        	addi	sp, sp, 16
80005cb6: 82 80        	ret

Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h96fddf3601b04efaE:

0000000080005cb8 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h96fddf3601b04efaE>:
80005cb8: 01 11        	addi	sp, sp, -32
80005cba: 06 ec        	sd	ra, 24(sp)
80005cbc: 2a e8        	sd	a0, 16(sp)
80005cbe: 97 00 00 00  	auipc	ra, 0
80005cc2: e7 80 20 ff  	jalr	-14(ra)
80005cc6: 2a e4        	sd	a0, 8(sp)
80005cc8: 09 a0        	j	2 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h96fddf3601b04efaE+0x12>
80005cca: 22 65        	ld	a0, 8(sp)
80005ccc: e2 60        	ld	ra, 24(sp)
80005cce: 05 61        	addi	sp, sp, 32
80005cd0: 82 80        	ret

Disassembly of section .text._ZN53_$LT$T$u20$as$u20$core..convert..TryInto$LT$U$GT$$GT$8try_into17h4909e451a2fe4232E:

0000000080005cd2 <_ZN53_$LT$T$u20$as$u20$core..convert..TryInto$LT$U$GT$$GT$8try_into17h4909e451a2fe4232E>:
80005cd2: 79 71        	addi	sp, sp, -48
80005cd4: 06 f4        	sd	ra, 40(sp)
80005cd6: aa 85        	add	a1, zero, a0
80005cd8: 23 13 a1 02  	sh	a0, 38(sp)
80005cdc: 2e ec        	sd	a1, 24(sp)
80005cde: 97 00 00 00  	auipc	ra, 0
80005ce2: e7 80 a0 01  	jalr	26(ra)
80005ce6: 2a e8        	sd	a0, 16(sp)
80005ce8: 2e e4        	sd	a1, 8(sp)
80005cea: 09 a0        	j	2 <_ZN53_$LT$T$u20$as$u20$core..convert..TryInto$LT$U$GT$$GT$8try_into17h4909e451a2fe4232E+0x1a>
80005cec: 42 65        	ld	a0, 16(sp)
80005cee: 05 89        	andi	a0, a0, 1
80005cf0: a2 65        	ld	a1, 8(sp)
80005cf2: a2 70        	ld	ra, 40(sp)
80005cf4: 45 61        	addi	sp, sp, 48
80005cf6: 82 80        	ret

Disassembly of section .text._ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E:

0000000080005cf8 <_ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E>:
80005cf8: 41 11        	addi	sp, sp, -16
80005cfa: c1 65        	lui	a1, 16
80005cfc: fd 35        	addiw	a1, a1, -1
80005cfe: e9 8d        	and	a1, a1, a0
80005d00: 2a 86        	add	a2, zero, a0
80005d02: 23 17 a1 00  	sh	a0, 14(sp)
80005d06: 13 05 00 10  	addi	a0, zero, 256
80005d0a: 32 e0        	sd	a2, 0(sp)
80005d0c: 63 e7 a5 00  	bltu	a1, a0, 14 <_ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E+0x22>
80005d10: 09 a0        	j	2 <_ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E+0x1a>
80005d12: 05 45        	addi	a0, zero, 1
80005d14: 23 04 a1 00  	sb	a0, 8(sp)
80005d18: 01 a8        	j	16 <_ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E+0x30>
80005d1a: 02 65        	ld	a0, 0(sp)
80005d1c: a3 04 a1 00  	sb	a0, 9(sp)
80005d20: 81 45        	mv	a1, zero
80005d22: 23 04 b1 00  	sb	a1, 8(sp)
80005d26: 09 a0        	j	2 <_ZN4core7convert3num66_$LT$impl$u20$core..convert..TryFrom$LT$u16$GT$$u20$for$u20$u8$GT$8try_from17h9bb7c35ace9e1423E+0x30>
80005d28: 03 45 81 00  	lbu	a0, 8(sp)
80005d2c: 83 05 91 00  	lb	a1, 9(sp)
80005d30: 41 01        	addi	sp, sp, 16
80005d32: 82 80        	ret

Disassembly of section .text._ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h94dd3c2cd5dfe648E:

0000000080005d34 <_ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h94dd3c2cd5dfe648E>:
80005d34: 79 71        	addi	sp, sp, -48
80005d36: 06 f4        	sd	ra, 40(sp)
80005d38: 2a f0        	sd	a0, 32(sp)
80005d3a: 97 00 00 00  	auipc	ra, 0
80005d3e: e7 80 a0 02  	jalr	42(ra)
80005d42: 2a e8        	sd	a0, 16(sp)
80005d44: 2e e4        	sd	a1, 8(sp)
80005d46: 09 a0        	j	2 <_ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h94dd3c2cd5dfe648E+0x14>
80005d48: 42 65        	ld	a0, 16(sp)
80005d4a: a2 65        	ld	a1, 8(sp)
80005d4c: 97 e0 ff ff  	auipc	ra, 1048574
80005d50: e7 80 a0 1f  	jalr	506(ra)
80005d54: 02 15        	slli	a0, a0, 32
80005d56: 01 91        	srli	a0, a0, 32
80005d58: 2a e0        	sd	a0, 0(sp)
80005d5a: 09 a0        	j	2 <_ZN81_$LT$core..str..iter..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h94dd3c2cd5dfe648E+0x28>
80005d5c: 02 65        	ld	a0, 0(sp)
80005d5e: a2 70        	ld	ra, 40(sp)
80005d60: 45 61        	addi	sp, sp, 48
80005d62: 82 80        	ret

Disassembly of section .text._ZN4core3str11validations15next_code_point17h251515a7dc81425dE:

0000000080005d64 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE>:
80005d64: 31 71        	addi	sp, sp, -192
80005d66: 06 fd        	sd	ra, 184(sp)
80005d68: 2a e5        	sd	a0, 136(sp)
80005d6a: aa f4        	sd	a0, 104(sp)
80005d6c: 97 d0 ff ff  	auipc	ra, 1048573
80005d70: e7 80 20 2a  	jalr	674(ra)
80005d74: aa f0        	sd	a0, 96(sp)
80005d76: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x14>
80005d78: 06 75        	ld	a0, 96(sp)
80005d7a: 97 e0 ff ff  	auipc	ra, 1048574
80005d7e: e7 80 60 4f  	jalr	1270(ra)
80005d82: aa fc        	sd	a0, 120(sp)
80005d84: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x22>
80005d86: 66 75        	ld	a0, 120(sp)
80005d88: 93 35 15 00  	seqz	a1, a0
80005d8c: 01 46        	mv	a2, zero
80005d8e: 63 14 c5 00  	bne	a0, a2, 8 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x32>
80005d92: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x30>
80005d94: 39 a8        	j	30 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x4e>
80005d96: 66 75        	ld	a0, 120(sp)
80005d98: 2a ed        	sd	a0, 152(sp)
80005d9a: 03 05 05 00  	lb	a0, 0(a0)
80005d9e: 93 75 f5 0f  	andi	a1, a0, 255
80005da2: a3 03 a1 0a  	sb	a0, 167(sp)
80005da6: 7d 56        	addi	a2, zero, -1
80005da8: ae ec        	sd	a1, 88(sp)
80005daa: 63 41 a6 02  	blt	a2, a0, 34 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x68>
80005dae: 25 a0        	j	40 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x72>
80005db0: 00 00        	unimp	
80005db2: 97 e0 ff ff  	auipc	ra, 1048574
80005db6: e7 80 00 48  	jalr	1152(ra)
80005dba: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x58>
80005dbc: 97 e0 ff ff  	auipc	ra, 1048574
80005dc0: e7 80 c0 47  	jalr	1148(ra)
80005dc4: aa d8        	sw	a0, 112(sp)
80005dc6: ae da        	sw	a1, 116(sp)
80005dc8: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x66>
80005dca: 29 a2        	j	266 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x170>
80005dcc: 66 65        	ld	a0, 88(sp)
80005dce: aa da        	sw	a0, 116(sp)
80005dd0: 85 45        	addi	a1, zero, 1
80005dd2: ae d8        	sw	a1, 112(sp)
80005dd4: 01 a2        	j	256 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x170>
80005dd6: 89 45        	addi	a1, zero, 2
80005dd8: 66 65        	ld	a0, 88(sp)
80005dda: 97 00 00 00  	auipc	ra, 0
80005dde: e7 80 a0 13  	jalr	314(ra)
80005de2: aa 85        	add	a1, zero, a0
80005de4: 2a d5        	sw	a0, 168(sp)
80005de6: ae e8        	sd	a1, 80(sp)
80005de8: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x86>
80005dea: 26 75        	ld	a0, 104(sp)
80005dec: 97 d0 ff ff  	auipc	ra, 1048573
80005df0: e7 80 20 22  	jalr	546(ra)
80005df4: aa e4        	sd	a0, 72(sp)
80005df6: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x94>
80005df8: 26 65        	ld	a0, 72(sp)
80005dfa: 97 00 00 00  	auipc	ra, 0
80005dfe: e7 80 60 0e  	jalr	230(ra)
80005e02: aa 85        	add	a1, zero, a0
80005e04: 23 07 a1 0a  	sb	a0, 174(sp)
80005e08: ae e0        	sd	a1, 64(sp)
80005e0a: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xa8>
80005e0c: 46 65        	ld	a0, 80(sp)
80005e0e: 86 65        	ld	a1, 64(sp)
80005e10: 97 00 00 00  	auipc	ra, 0
80005e14: e7 80 00 12  	jalr	288(ra)
80005e18: 2a c3        	sw	a0, 132(sp)
80005e1a: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xb8>
80005e1c: 13 05 00 0e  	addi	a0, zero, 224
80005e20: e6 65        	ld	a1, 88(sp)
80005e22: 63 ea a5 00  	bltu	a1, a0, 20 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xd2>
80005e26: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xc4>
80005e28: 26 75        	ld	a0, 104(sp)
80005e2a: 97 d0 ff ff  	auipc	ra, 1048573
80005e2e: e7 80 40 1e  	jalr	484(ra)
80005e32: 2a fc        	sd	a0, 56(sp)
80005e34: 11 a0        	j	4 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xd4>
80005e36: 51 a8        	j	148 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x166>
80005e38: 62 75        	ld	a0, 56(sp)
80005e3a: 97 00 00 00  	auipc	ra, 0
80005e3e: e7 80 60 0a  	jalr	166(ra)
80005e42: aa 85        	add	a1, zero, a0
80005e44: a3 07 a1 0a  	sb	a0, 175(sp)
80005e48: 2e f8        	sd	a1, 48(sp)
80005e4a: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0xe8>
80005e4c: 06 65        	ld	a0, 64(sp)
80005e4e: 13 75 f5 03  	andi	a0, a0, 63
80005e52: c2 75        	ld	a1, 48(sp)
80005e54: 97 00 00 00  	auipc	ra, 0
80005e58: e7 80 c0 0d  	jalr	220(ra)
80005e5c: aa 85        	add	a1, zero, a0
80005e5e: 2a d9        	sw	a0, 176(sp)
80005e60: 2e f4        	sd	a1, 40(sp)
80005e62: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x100>
80005e64: 46 65        	ld	a0, 80(sp)
80005e66: 93 15 c5 00  	slli	a1, a0, 12
80005e6a: 22 76        	ld	a2, 40(sp)
80005e6c: d1 8d        	or	a1, a1, a2
80005e6e: 2e c3        	sw	a1, 132(sp)
80005e70: 93 05 00 0f  	addi	a1, zero, 240
80005e74: e6 66        	ld	a3, 88(sp)
80005e76: 63 ea b6 00  	bltu	a3, a1, 20 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x126>
80005e7a: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x118>
80005e7c: 26 75        	ld	a0, 104(sp)
80005e7e: 97 d0 ff ff  	auipc	ra, 1048573
80005e82: e7 80 00 19  	jalr	400(ra)
80005e86: 2a f0        	sd	a0, 32(sp)
80005e88: 11 a0        	j	4 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x128>
80005e8a: 3d a8        	j	62 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x164>
80005e8c: 02 75        	ld	a0, 32(sp)
80005e8e: 97 00 00 00  	auipc	ra, 0
80005e92: e7 80 20 05  	jalr	82(ra)
80005e96: aa 85        	add	a1, zero, a0
80005e98: a3 0b a1 0a  	sb	a0, 183(sp)
80005e9c: 2e ec        	sd	a1, 24(sp)
80005e9e: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x13c>
80005ea0: 46 65        	ld	a0, 80(sp)
80005ea2: 93 75 75 00  	andi	a1, a0, 7
80005ea6: ca 05        	slli	a1, a1, 18
80005ea8: 22 75        	ld	a0, 40(sp)
80005eaa: 62 66        	ld	a2, 24(sp)
80005eac: 2e e8        	sd	a1, 16(sp)
80005eae: b2 85        	add	a1, zero, a2
80005eb0: 97 00 00 00  	auipc	ra, 0
80005eb4: e7 80 00 08  	jalr	128(ra)
80005eb8: 2a e4        	sd	a0, 8(sp)
80005eba: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x158>
80005ebc: 42 65        	ld	a0, 16(sp)
80005ebe: a2 65        	ld	a1, 8(sp)
80005ec0: 33 66 b5 00  	or	a2, a0, a1
80005ec4: 32 c3        	sw	a2, 132(sp)
80005ec6: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x164>
80005ec8: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x166>
80005eca: 1a 45        	lw	a0, 132(sp)
80005ecc: aa da        	sw	a0, 116(sp)
80005ece: 05 45        	addi	a0, zero, 1
80005ed0: aa d8        	sw	a0, 112(sp)
80005ed2: 11 a0        	j	4 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x172>
80005ed4: 09 a0        	j	2 <_ZN4core3str11validations15next_code_point17h251515a7dc81425dE+0x172>
80005ed6: 46 55        	lw	a0, 112(sp)
80005ed8: d6 55        	lw	a1, 116(sp)
80005eda: ea 70        	ld	ra, 184(sp)
80005edc: 29 61        	addi	sp, sp, 192
80005ede: 82 80        	ret

Disassembly of section .text._ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E:

0000000080005ee0 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E>:
80005ee0: 41 11        	addi	sp, sp, -16
80005ee2: 2a e0        	sd	a0, 0(sp)
80005ee4: b3 35 a0 00  	snez	a1, a0
80005ee8: 01 46        	mv	a2, zero
80005eea: 63 04 c5 00  	beq	a0, a2, 8 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E+0x12>
80005eee: 09 a0        	j	2 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E+0x10>
80005ef0: 31 a0        	j	12 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E+0x1c>
80005ef2: 01 45        	mv	a0, zero
80005ef4: 23 07 a1 00  	sb	a0, 14(sp)
80005ef8: 11 a8        	j	20 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E+0x2c>
80005efa: 00 00        	unimp	
80005efc: 02 65        	ld	a0, 0(sp)
80005efe: 03 05 05 00  	lb	a0, 0(a0)
80005f02: a3 07 a1 00  	sb	a0, 15(sp)
80005f06: 23 07 a1 00  	sb	a0, 14(sp)
80005f0a: 09 a0        	j	2 <_ZN4core3str11validations11unwrap_or_017h3b5c5d5d972650f2E+0x2c>
80005f0c: 03 05 e1 00  	lb	a0, 14(sp)
80005f10: 41 01        	addi	sp, sp, 16
80005f12: 82 80        	ret

Disassembly of section .text._ZN4core3str11validations15utf8_first_byte17h0e25b6245a24876fE:

0000000080005f14 <_ZN4core3str11validations15utf8_first_byte17h0e25b6245a24876fE>:
80005f14: 41 11        	addi	sp, sp, -16
80005f16: 2e 86        	add	a2, zero, a1
80005f18: aa 86        	add	a3, zero, a0
80005f1a: a3 05 a1 00  	sb	a0, 11(sp)
80005f1e: 2e c6        	sw	a1, 12(sp)
80005f20: 9d 89        	andi	a1, a1, 7
80005f22: 13 07 f0 07  	addi	a4, zero, 127
80005f26: b3 55 b7 00  	srl	a1, a4, a1
80005f2a: 6d 8d        	and	a0, a0, a1
80005f2c: 41 01        	addi	sp, sp, 16
80005f2e: 82 80        	ret

Disassembly of section .text._ZN4core3str11validations18utf8_acc_cont_byte17hae3993db8b28e2d4E:

0000000080005f30 <_ZN4core3str11validations18utf8_acc_cont_byte17hae3993db8b28e2d4E>:
80005f30: 41 11        	addi	sp, sp, -16
80005f32: 2e 86        	add	a2, zero, a1
80005f34: aa 86        	add	a3, zero, a0
80005f36: 2a c4        	sw	a0, 8(sp)
80005f38: a3 07 b1 00  	sb	a1, 15(sp)
80005f3c: 1a 05        	slli	a0, a0, 6
80005f3e: 93 f5 f5 03  	andi	a1, a1, 63
80005f42: 4d 8d        	or	a0, a0, a1
80005f44: 41 01        	addi	sp, sp, 16
80005f46: 82 80        	ret

Disassembly of section .text._ZN6kernel8shutdown12system_reset17h87be2009588664d0E:

0000000080005f48 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E>:
80005f48: 79 71        	addi	sp, sp, -48
80005f4a: 06 f4        	sd	ra, 40(sp)
80005f4c: 2a ec        	sd	a0, 24(sp)
80005f4e: 2e f0        	sd	a1, 32(sp)
80005f50: 01 46        	mv	a2, zero
80005f52: 2e e4        	sd	a1, 8(sp)
80005f54: 2a e0        	sd	a0, 0(sp)
80005f56: 63 02 c5 02  	beq	a0, a2, 36 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x32>
80005f5a: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x14>
80005f5c: 05 45        	addi	a0, zero, 1
80005f5e: 82 65        	ld	a1, 0(sp)
80005f60: 63 82 a5 02  	beq	a1, a0, 36 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x3c>
80005f64: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x1e>
80005f66: 09 45        	addi	a0, zero, 2
80005f68: 82 65        	ld	a1, 0(sp)
80005f6a: 63 82 a5 02  	beq	a1, a0, 36 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x46>
80005f6e: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x28>
80005f70: 0d 65        	lui	a0, 3
80005f72: 1b 05 35 33  	addiw	a0, a0, 819
80005f76: 2a ca        	sw	a0, 20(sp)
80005f78: 05 a0        	j	32 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x50>
80005f7a: 15 65        	lui	a0, 5
80005f7c: 1b 05 55 55  	addiw	a0, a0, 1365
80005f80: 2a ca        	sw	a0, 20(sp)
80005f82: 19 a8        	j	22 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x50>
80005f84: 1d 65        	lui	a0, 7
80005f86: 1b 05 75 77  	addiw	a0, a0, 1911
80005f8a: 2a ca        	sw	a0, 20(sp)
80005f8c: 31 a0        	j	12 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x50>
80005f8e: 1d 65        	lui	a0, 7
80005f90: 1b 05 75 77  	addiw	a0, a0, 1911
80005f94: 2a ca        	sw	a0, 20(sp)
80005f96: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x50>
80005f98: 05 45        	addi	a0, zero, 1
80005f9a: a2 65        	ld	a1, 8(sp)
80005f9c: 63 98 a5 00  	bne	a1, a0, 16 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x64>
80005fa0: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x5a>
80005fa2: 0d 65        	lui	a0, 3
80005fa4: 1b 05 35 33  	addiw	a0, a0, 819
80005fa8: 2a ca        	sw	a0, 20(sp)
80005faa: 11 a0        	j	4 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x66>
80005fac: 09 a0        	j	2 <_ZN6kernel8shutdown12system_reset17h87be2009588664d0E+0x66>
80005fae: d2 45        	lw	a1, 20(sp)
80005fb0: 37 05 10 00  	lui	a0, 256
80005fb4: 97 d0 ff ff  	auipc	ra, 1048573
80005fb8: e7 80 c0 32  	jalr	812(ra)
80005fbc: 09 a0        	j	2 <.LBB0_12>

0000000080005fbe <.LBB0_12>:
80005fbe: 17 85 00 00  	auipc	a0, 8
80005fc2: 13 05 a5 72  	addi	a0, a0, 1834

0000000080005fc6 <.LBB0_13>:
80005fc6: 17 86 00 00  	auipc	a2, 8
80005fca: 13 06 a6 75  	addi	a2, a2, 1882
80005fce: 93 05 80 02  	addi	a1, zero, 40
80005fd2: 97 50 00 00  	auipc	ra, 5
80005fd6: e7 80 80 76  	jalr	1896(ra)
80005fda: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8shutdown8shutdown17haee6c0e08b2b0cdfE:

0000000080005fdc <_ZN6kernel8shutdown8shutdown17haee6c0e08b2b0cdfE>:
80005fdc: 41 11        	addi	sp, sp, -16
80005fde: 06 e4        	sd	ra, 8(sp)
80005fe0: 21 45        	addi	a0, zero, 8
80005fe2: 81 45        	mv	a1, zero
80005fe4: 2e e0        	sd	a1, 0(sp)
80005fe6: 02 66        	ld	a2, 0(sp)
80005fe8: 82 66        	ld	a3, 0(sp)
80005fea: 97 00 00 00  	auipc	ra, 0
80005fee: e7 80 00 01  	jalr	16(ra)
80005ff2: 09 a0        	j	2 <_ZN6kernel8shutdown8shutdown17haee6c0e08b2b0cdfE+0x18>
80005ff4: a2 60        	ld	ra, 8(sp)
80005ff6: 41 01        	addi	sp, sp, 16
80005ff8: 82 80        	ret

Disassembly of section .text._ZN6kernel14kernel_syscall14kernel_syscall17h69b38539254a0301E:

0000000080005ffa <_ZN6kernel14kernel_syscall14kernel_syscall17h69b38539254a0301E>:
80005ffa: 79 71        	addi	sp, sp, -48
80005ffc: 2a e8        	sd	a0, 16(sp)
80005ffe: 2e ec        	sd	a1, 24(sp)
80006000: 32 f0        	sd	a2, 32(sp)
80006002: 36 f4        	sd	a3, 40(sp)
80006004: 2a e0        	sd	a0, 0(sp)
80006006: 2e 85        	add	a0, zero, a1
80006008: b2 85        	add	a1, zero, a2
8000600a: 36 86        	add	a2, zero, a3
8000600c: 82 68        	ld	a7, 0(sp)
8000600e: 73 00 00 00  	ecall	
80006012: 2a e4        	sd	a0, 8(sp)
80006014: 45 61        	addi	sp, sp, 48
80006016: 82 80        	ret

Disassembly of section .text._ZN6kernel8register3sip4read17h33449c856b58e68aE:

0000000080006018 <_ZN6kernel8register3sip4read17h33449c856b58e68aE>:
80006018: 41 11        	addi	sp, sp, -16
8000601a: 73 25 40 14  	csrr	a0, sip
8000601e: 2a e4        	sd	a0, 8(sp)
80006020: 41 01        	addi	sp, sp, 16
80006022: 82 80        	ret

Disassembly of section .text._ZN6kernel8register3sip5write17ha82fba878265c3f6E:

0000000080006024 <_ZN6kernel8register3sip5write17ha82fba878265c3f6E>:
80006024: 41 11        	addi	sp, sp, -16
80006026: 2a e4        	sd	a0, 8(sp)
80006028: 73 10 45 14  	csrw	sip, a0
8000602c: 41 01        	addi	sp, sp, 16
8000602e: 82 80        	ret

Disassembly of section .text._ZN6kernel8register4satp5write17h70fd2b3395cf0b70E:

0000000080006030 <_ZN6kernel8register4satp5write17h70fd2b3395cf0b70E>:
80006030: 41 11        	addi	sp, sp, -16
80006032: 2a e4        	sd	a0, 8(sp)
80006034: 73 10 05 18  	csrw	satp, a0
80006038: 41 01        	addi	sp, sp, 16
8000603a: 82 80        	ret

Disassembly of section .text._ZN6kernel8register4sepc4read17h71be73d3d2d53f84E:

000000008000603c <_ZN6kernel8register4sepc4read17h71be73d3d2d53f84E>:
8000603c: 41 11        	addi	sp, sp, -16
8000603e: 73 25 10 14  	csrr	a0, sepc
80006042: 2a e4        	sd	a0, 8(sp)
80006044: 41 01        	addi	sp, sp, 16
80006046: 82 80        	ret

Disassembly of section .text._ZN6kernel8register4sepc5write17h519422aaabdd13acE:

0000000080006048 <_ZN6kernel8register4sepc5write17h519422aaabdd13acE>:
80006048: 41 11        	addi	sp, sp, -16
8000604a: 2a e4        	sd	a0, 8(sp)
8000604c: 73 10 15 14  	csrw	sepc, a0
80006050: 41 01        	addi	sp, sp, 16
80006052: 82 80        	ret

Disassembly of section .text._ZN6kernel8register5stvec5write17h6cf30cf76e8f0376E:

0000000080006054 <_ZN6kernel8register5stvec5write17h6cf30cf76e8f0376E>:
80006054: 41 11        	addi	sp, sp, -16
80006056: 2a e4        	sd	a0, 8(sp)
80006058: 73 10 55 10  	csrw	stvec, a0
8000605c: 41 01        	addi	sp, sp, 16
8000605e: 82 80        	ret

Disassembly of section .text._ZN6kernel9interrupt4plic8plicinit17hfd20bec34fdbd803E:

0000000080006060 <_ZN6kernel9interrupt4plic8plicinit17hfd20bec34fdbd803E>:
80006060: 59 71        	addi	sp, sp, -112
80006062: 86 f4        	sd	ra, 104(sp)

0000000080006064 <.LBB0_10>:
80006064: 97 85 00 00  	auipc	a1, 8
80006068: 93 85 45 6d  	addi	a1, a1, 1748

000000008000606c <.LBB0_11>:
8000606c: 97 86 00 00  	auipc	a3, 8
80006070: 93 86 c6 6d  	addi	a3, a3, 1756
80006074: 08 10        	addi	a0, sp, 32
80006076: 05 46        	addi	a2, zero, 1
80006078: 01 47        	mv	a4, zero
8000607a: 97 b0 ff ff  	auipc	ra, 1048571
8000607e: e7 80 e0 65  	jalr	1630(ra)
80006082: 09 a0        	j	2 <.LBB0_11+0x18>
80006084: 08 10        	addi	a0, sp, 32
80006086: 97 f0 ff ff  	auipc	ra, 1048575
8000608a: e7 80 c0 1d  	jalr	476(ra)
8000608e: 09 a0        	j	2 <.LBB0_12>

0000000080006090 <.LBB0_12>:
80006090: 17 75 00 00  	auipc	a0, 7
80006094: 13 05 05 71  	addi	a0, a0, 1808
80006098: 08 61        	ld	a0, 0(a0)
8000609a: aa ec        	sd	a0, 88(sp)
8000609c: 97 00 00 00  	auipc	ra, 0
800060a0: e7 80 e0 19  	jalr	414(ra)
800060a4: aa 85        	add	a1, zero, a0
800060a6: aa f0        	sd	a0, 96(sp)
800060a8: 2e ec        	sd	a1, 24(sp)
800060aa: 09 a0        	j	2 <.LBB0_12+0x1c>
800060ac: 62 65        	ld	a0, 24(sp)
800060ae: 93 05 85 02  	addi	a1, a0, 40
800060b2: 2e e8        	sd	a1, 16(sp)
800060b4: 63 ed a5 02  	bltu	a1, a0, 58 <.LBB0_13>
800060b8: 09 a0        	j	2 <.LBB0_12+0x2a>
800060ba: 42 65        	ld	a0, 16(sp)
800060bc: aa e8        	sd	a0, 80(sp)
800060be: 85 45        	addi	a1, zero, 1
800060c0: 97 d0 ff ff  	auipc	ra, 1048573
800060c4: e7 80 00 22  	jalr	544(ra)
800060c8: 09 a0        	j	2 <.LBB0_12+0x3a>
800060ca: 62 65        	ld	a0, 24(sp)
800060cc: 93 05 85 02  	addi	a1, a0, 40
800060d0: 2e e4        	sd	a1, 8(sp)
800060d2: 63 ec a5 02  	bltu	a1, a0, 56 <.LBB0_15>
800060d6: 09 a0        	j	2 <.LBB0_12+0x48>
800060d8: 22 65        	ld	a0, 8(sp)
800060da: aa e8        	sd	a0, 80(sp)
800060dc: 85 45        	addi	a1, zero, 1
800060de: 97 d0 ff ff  	auipc	ra, 1048573
800060e2: e7 80 20 20  	jalr	514(ra)
800060e6: 09 a0        	j	2 <.LBB0_12+0x58>
800060e8: a6 70        	ld	ra, 104(sp)
800060ea: 65 61        	addi	sp, sp, 112
800060ec: 82 80        	ret

00000000800060ee <.LBB0_13>:
800060ee: 17 85 00 00  	auipc	a0, 8
800060f2: 13 05 25 69  	addi	a0, a0, 1682

00000000800060f6 <.LBB0_14>:
800060f6: 17 86 00 00  	auipc	a2, 8
800060fa: 13 06 a6 66  	addi	a2, a2, 1642
800060fe: f1 45        	addi	a1, zero, 28
80006100: 97 50 00 00  	auipc	ra, 5
80006104: e7 80 a0 63  	jalr	1594(ra)
80006108: 00 00        	unimp	

000000008000610a <.LBB0_15>:
8000610a: 17 85 00 00  	auipc	a0, 8
8000610e: 13 05 65 67  	addi	a0, a0, 1654

0000000080006112 <.LBB0_16>:
80006112: 17 86 00 00  	auipc	a2, 8
80006116: 13 06 e6 68  	addi	a2, a2, 1678
8000611a: f1 45        	addi	a1, zero, 28
8000611c: 97 50 00 00  	auipc	ra, 5
80006120: e7 80 e0 61  	jalr	1566(ra)
80006124: 00 00        	unimp	

Disassembly of section .text._ZN6kernel9interrupt4plic12plicinithart17h2c6c52f14512b821E:

0000000080006126 <_ZN6kernel9interrupt4plic12plicinithart17h2c6c52f14512b821E>:
80006126: 19 71        	addi	sp, sp, -128
80006128: 86 fc        	sd	ra, 120(sp)

000000008000612a <.LBB1_8>:
8000612a: 97 85 00 00  	auipc	a1, 8
8000612e: 93 85 65 6a  	addi	a1, a1, 1702

0000000080006132 <.LBB1_9>:
80006132: 97 86 00 00  	auipc	a3, 8
80006136: 93 86 66 61  	addi	a3, a3, 1558
8000613a: 28 10        	addi	a0, sp, 40
8000613c: 05 46        	addi	a2, zero, 1
8000613e: 01 47        	mv	a4, zero
80006140: 97 b0 ff ff  	auipc	ra, 1048571
80006144: e7 80 80 59  	jalr	1432(ra)
80006148: 09 a0        	j	2 <.LBB1_9+0x18>
8000614a: 28 10        	addi	a0, sp, 40
8000614c: 97 f0 ff ff  	auipc	ra, 1048575
80006150: e7 80 60 11  	jalr	278(ra)
80006154: 09 a0        	j	2 <.LBB1_9+0x24>
80006156: 97 c0 ff ff  	auipc	ra, 1048572
8000615a: e7 80 c0 65  	jalr	1628(ra)
8000615e: aa 85        	add	a1, zero, a0
80006160: aa ec        	sd	a0, 88(sp)
80006162: 2e f0        	sd	a1, 32(sp)
80006164: 09 a0        	j	2 <.LBB1_9+0x34>
80006166: 02 75        	ld	a0, 32(sp)
80006168: 97 00 00 00  	auipc	ra, 0
8000616c: e7 80 80 15  	jalr	344(ra)
80006170: aa 85        	add	a1, zero, a0
80006172: aa f0        	sd	a0, 96(sp)
80006174: 2e ec        	sd	a1, 24(sp)
80006176: 09 a0        	j	2 <.LBB1_9+0x46>
80006178: 13 05 20 40  	addi	a0, zero, 1026
8000617c: aa d6        	sw	a0, 108(sp)
8000617e: e2 65        	ld	a1, 24(sp)
80006180: 2a e8        	sd	a0, 16(sp)
80006182: 2e 85        	add	a0, zero, a1
80006184: c2 65        	ld	a1, 16(sp)
80006186: 97 d0 ff ff  	auipc	ra, 1048573
8000618a: e7 80 a0 15  	jalr	346(ra)
8000618e: 09 a0        	j	2 <.LBB1_9+0x5e>
80006190: 02 75        	ld	a0, 32(sp)
80006192: 97 00 00 00  	auipc	ra, 0
80006196: e7 80 60 0c  	jalr	198(ra)
8000619a: aa 85        	add	a1, zero, a0
8000619c: aa f8        	sd	a0, 112(sp)
8000619e: 2e e4        	sd	a1, 8(sp)
800061a0: 09 a0        	j	2 <.LBB1_9+0x70>
800061a2: 01 45        	mv	a0, zero
800061a4: a2 65        	ld	a1, 8(sp)
800061a6: 2a e0        	sd	a0, 0(sp)
800061a8: 2e 85        	add	a0, zero, a1
800061aa: 82 65        	ld	a1, 0(sp)
800061ac: 97 d0 ff ff  	auipc	ra, 1048573
800061b0: e7 80 40 13  	jalr	308(ra)
800061b4: 09 a0        	j	2 <.LBB1_9+0x84>
800061b6: e6 70        	ld	ra, 120(sp)
800061b8: 09 61        	addi	sp, sp, 128
800061ba: 82 80        	ret

Disassembly of section .text._ZN6kernel9interrupt4plic10plic_claim17h29e82e8ce6326976E:

00000000800061bc <_ZN6kernel9interrupt4plic10plic_claim17h29e82e8ce6326976E>:
800061bc: 39 71        	addi	sp, sp, -64
800061be: 06 fc        	sd	ra, 56(sp)
800061c0: 97 c0 ff ff  	auipc	ra, 1048572
800061c4: e7 80 20 5f  	jalr	1522(ra)
800061c8: aa 85        	add	a1, zero, a0
800061ca: 2a f0        	sd	a0, 32(sp)
800061cc: 2e ec        	sd	a1, 24(sp)
800061ce: 09 a0        	j	2 <_ZN6kernel9interrupt4plic10plic_claim17h29e82e8ce6326976E+0x14>
800061d0: 62 65        	ld	a0, 24(sp)
800061d2: 97 00 00 00  	auipc	ra, 0
800061d6: e7 80 60 15  	jalr	342(ra)
800061da: aa 85        	add	a1, zero, a0
800061dc: 2a f4        	sd	a0, 40(sp)
800061de: 2e e8        	sd	a1, 16(sp)
800061e0: 09 a0        	j	2 <_ZN6kernel9interrupt4plic10plic_claim17h29e82e8ce6326976E+0x26>
800061e2: 42 65        	ld	a0, 16(sp)
800061e4: 97 d0 ff ff  	auipc	ra, 1048573
800061e8: e7 80 60 0c  	jalr	198(ra)
800061ec: aa 85        	add	a1, zero, a0
800061ee: 2a f8        	sd	a0, 48(sp)
800061f0: 2e e4        	sd	a1, 8(sp)
800061f2: 09 a0        	j	2 <_ZN6kernel9interrupt4plic10plic_claim17h29e82e8ce6326976E+0x38>
800061f4: 22 65        	ld	a0, 8(sp)
800061f6: e2 70        	ld	ra, 56(sp)
800061f8: 21 61        	addi	sp, sp, 64
800061fa: 82 80        	ret

Disassembly of section .text._ZN6kernel9interrupt4plic13plic_complete17h9447c58af8af6c8eE:

00000000800061fc <_ZN6kernel9interrupt4plic13plic_complete17h9447c58af8af6c8eE>:
800061fc: 39 71        	addi	sp, sp, -64
800061fe: 06 fc        	sd	ra, 56(sp)
80006200: 2a f0        	sd	a0, 32(sp)
80006202: 2a ec        	sd	a0, 24(sp)
80006204: 97 c0 ff ff  	auipc	ra, 1048572
80006208: e7 80 e0 5a  	jalr	1454(ra)
8000620c: aa 85        	add	a1, zero, a0
8000620e: 2a f4        	sd	a0, 40(sp)
80006210: 2e e8        	sd	a1, 16(sp)
80006212: 09 a0        	j	2 <_ZN6kernel9interrupt4plic13plic_complete17h9447c58af8af6c8eE+0x18>
80006214: 42 65        	ld	a0, 16(sp)
80006216: 97 00 00 00  	auipc	ra, 0
8000621a: e7 80 20 11  	jalr	274(ra)
8000621e: aa 85        	add	a1, zero, a0
80006220: 2a f8        	sd	a0, 48(sp)
80006222: 2e e4        	sd	a1, 8(sp)
80006224: 09 a0        	j	2 <_ZN6kernel9interrupt4plic13plic_complete17h9447c58af8af6c8eE+0x2a>
80006226: 22 65        	ld	a0, 8(sp)
80006228: e2 65        	ld	a1, 24(sp)
8000622a: 97 d0 ff ff  	auipc	ra, 1048573
8000622e: e7 80 60 0c  	jalr	198(ra)
80006232: 09 a0        	j	2 <_ZN6kernel9interrupt4plic13plic_complete17h9447c58af8af6c8eE+0x38>
80006234: e2 70        	ld	ra, 56(sp)
80006236: 21 61        	addi	sp, sp, 64
80006238: 82 80        	ret

Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h0c631ae7a05fc8a4E:

000000008000623a <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h0c631ae7a05fc8a4E>:
8000623a: 79 71        	addi	sp, sp, -48
8000623c: 06 f4        	sd	ra, 40(sp)
8000623e: 2a ec        	sd	a0, 24(sp)
80006240: 2a e8        	sd	a0, 16(sp)
80006242: 2a f0        	sd	a0, 32(sp)
80006244: 97 30 00 00  	auipc	ra, 3
80006248: e7 80 a0 1b  	jalr	442(ra)
8000624c: 2a e4        	sd	a0, 8(sp)
8000624e: 09 a0        	j	2 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h0c631ae7a05fc8a4E+0x16>
80006250: 22 65        	ld	a0, 8(sp)
80006252: a2 70        	ld	ra, 40(sp)
80006254: 45 61        	addi	sp, sp, 48
80006256: 82 80        	ret

Disassembly of section .text._ZN6kernel6define9memlayout14plic_spriority17h72cabe594ae1f62dE:

0000000080006258 <_ZN6kernel6define9memlayout14plic_spriority17h72cabe594ae1f62dE>:
80006258: 39 71        	addi	sp, sp, -64
8000625a: 06 fc        	sd	ra, 56(sp)
8000625c: 2a f0        	sd	a0, 32(sp)
8000625e: 85 45        	addi	a1, zero, 1
80006260: ce 15        	slli	a1, a1, 51
80006262: fd 15        	addi	a1, a1, -1
80006264: e9 8d        	and	a1, a1, a0
80006266: 13 16 d5 00  	slli	a2, a0, 13
8000626a: 32 e8        	sd	a2, 16(sp)
8000626c: 63 9b a5 02  	bne	a1, a0, 54 <.LBB0_6>
80006270: 09 a0        	j	2 <.LBB0_5>

0000000080006272 <.LBB0_5>:
80006272: 17 75 00 00  	auipc	a0, 7
80006276: 13 05 e5 4f  	addi	a0, a0, 1278
8000627a: c2 65        	ld	a1, 16(sp)
8000627c: 97 30 00 00  	auipc	ra, 3
80006280: e7 80 c0 14  	jalr	332(ra)
80006284: 2a f4        	sd	a0, 40(sp)
80006286: 2a ec        	sd	a0, 24(sp)
80006288: 09 a0        	j	2 <.LBB0_5+0x18>
8000628a: 62 65        	ld	a0, 24(sp)
8000628c: 97 00 00 00  	auipc	ra, 0
80006290: e7 80 e0 fa  	jalr	-82(ra)
80006294: 2a e4        	sd	a0, 8(sp)
80006296: 09 a0        	j	2 <.LBB0_5+0x26>
80006298: 22 65        	ld	a0, 8(sp)
8000629a: 2a f8        	sd	a0, 48(sp)
8000629c: e2 70        	ld	ra, 56(sp)
8000629e: 21 61        	addi	sp, sp, 64
800062a0: 82 80        	ret

00000000800062a2 <.LBB0_6>:
800062a2: 17 85 00 00  	auipc	a0, 8
800062a6: 13 05 e5 56  	addi	a0, a0, 1390

00000000800062aa <.LBB0_7>:
800062aa: 17 86 00 00  	auipc	a2, 8
800062ae: 13 06 e6 54  	addi	a2, a2, 1358
800062b2: 93 05 10 02  	addi	a1, zero, 33
800062b6: 97 50 00 00  	auipc	ra, 5
800062ba: e7 80 40 48  	jalr	1156(ra)
800062be: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6define9memlayout12plic_senable17h09ed39d1f5b963e5E:

00000000800062c0 <_ZN6kernel6define9memlayout12plic_senable17h09ed39d1f5b963e5E>:
800062c0: 39 71        	addi	sp, sp, -64
800062c2: 06 fc        	sd	ra, 56(sp)
800062c4: 2a f0        	sd	a0, 32(sp)
800062c6: 85 45        	addi	a1, zero, 1
800062c8: e2 15        	slli	a1, a1, 56
800062ca: fd 15        	addi	a1, a1, -1
800062cc: e9 8d        	and	a1, a1, a0
800062ce: 13 16 85 00  	slli	a2, a0, 8
800062d2: 32 e8        	sd	a2, 16(sp)
800062d4: 63 9b a5 02  	bne	a1, a0, 54 <.LBB1_6>
800062d8: 09 a0        	j	2 <.LBB1_5>

00000000800062da <.LBB1_5>:
800062da: 17 75 00 00  	auipc	a0, 7
800062de: 13 05 e5 4b  	addi	a0, a0, 1214
800062e2: c2 65        	ld	a1, 16(sp)
800062e4: 97 30 00 00  	auipc	ra, 3
800062e8: e7 80 40 0e  	jalr	228(ra)
800062ec: 2a f4        	sd	a0, 40(sp)
800062ee: 2a ec        	sd	a0, 24(sp)
800062f0: 09 a0        	j	2 <.LBB1_5+0x18>
800062f2: 62 65        	ld	a0, 24(sp)
800062f4: 97 00 00 00  	auipc	ra, 0
800062f8: e7 80 60 f4  	jalr	-186(ra)
800062fc: 2a e4        	sd	a0, 8(sp)
800062fe: 09 a0        	j	2 <.LBB1_5+0x26>
80006300: 22 65        	ld	a0, 8(sp)
80006302: 2a f8        	sd	a0, 48(sp)
80006304: e2 70        	ld	ra, 56(sp)
80006306: 21 61        	addi	sp, sp, 64
80006308: 82 80        	ret

000000008000630a <.LBB1_6>:
8000630a: 17 85 00 00  	auipc	a0, 8
8000630e: 13 05 65 50  	addi	a0, a0, 1286

0000000080006312 <.LBB1_7>:
80006312: 17 86 00 00  	auipc	a2, 8
80006316: 13 06 66 52  	addi	a2, a2, 1318
8000631a: 93 05 10 02  	addi	a1, zero, 33
8000631e: 97 50 00 00  	auipc	ra, 5
80006322: e7 80 c0 41  	jalr	1052(ra)
80006326: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6define9memlayout11plic_sclaim17h449ce0f1c4a6bdd7E:

0000000080006328 <_ZN6kernel6define9memlayout11plic_sclaim17h449ce0f1c4a6bdd7E>:
80006328: 39 71        	addi	sp, sp, -64
8000632a: 06 fc        	sd	ra, 56(sp)
8000632c: 2a f0        	sd	a0, 32(sp)
8000632e: 85 45        	addi	a1, zero, 1
80006330: ce 15        	slli	a1, a1, 51
80006332: fd 15        	addi	a1, a1, -1
80006334: e9 8d        	and	a1, a1, a0
80006336: 13 16 d5 00  	slli	a2, a0, 13
8000633a: 32 e8        	sd	a2, 16(sp)
8000633c: 63 9b a5 02  	bne	a1, a0, 54 <.LBB2_6>
80006340: 09 a0        	j	2 <.LBB2_5>

0000000080006342 <.LBB2_5>:
80006342: 17 75 00 00  	auipc	a0, 7
80006346: 13 05 e5 41  	addi	a0, a0, 1054
8000634a: c2 65        	ld	a1, 16(sp)
8000634c: 97 30 00 00  	auipc	ra, 3
80006350: e7 80 c0 07  	jalr	124(ra)
80006354: 2a f4        	sd	a0, 40(sp)
80006356: 2a ec        	sd	a0, 24(sp)
80006358: 09 a0        	j	2 <.LBB2_5+0x18>
8000635a: 62 65        	ld	a0, 24(sp)
8000635c: 97 00 00 00  	auipc	ra, 0
80006360: e7 80 e0 ed  	jalr	-290(ra)
80006364: 2a e4        	sd	a0, 8(sp)
80006366: 09 a0        	j	2 <.LBB2_5+0x26>
80006368: 22 65        	ld	a0, 8(sp)
8000636a: 2a f8        	sd	a0, 48(sp)
8000636c: e2 70        	ld	ra, 56(sp)
8000636e: 21 61        	addi	sp, sp, 64
80006370: 82 80        	ret

0000000080006372 <.LBB2_6>:
80006372: 17 85 00 00  	auipc	a0, 8
80006376: 13 05 e5 49  	addi	a0, a0, 1182

000000008000637a <.LBB2_7>:
8000637a: 17 86 00 00  	auipc	a2, 8
8000637e: 13 06 66 4d  	addi	a2, a2, 1238
80006382: 93 05 10 02  	addi	a1, zero, 33
80006386: 97 50 00 00  	auipc	ra, 5
8000638a: e7 80 40 3b  	jalr	948(ra)
8000638e: 00 00        	unimp	

Disassembly of section .text._ZN6kernel9interrupt7handler14kernel_syscall17ha906a99060ba65d7E:

0000000080006390 <_ZN6kernel9interrupt7handler14kernel_syscall17ha906a99060ba65d7E>:
80006390: 35 71        	addi	sp, sp, -160
80006392: 06 ed        	sd	ra, 152(sp)
80006394: aa fc        	sd	a0, 120(sp)
80006396: 2e e1        	sd	a1, 128(sp)
80006398: 32 e5        	sd	a2, 136(sp)
8000639a: 36 e9        	sd	a3, 144(sp)
8000639c: 01 45        	mv	a0, zero
8000639e: 36 e4        	sd	a3, 8(sp)
800063a0: 97 00 00 00  	auipc	ra, 0
800063a4: e7 80 00 c9  	jalr	-880(ra)
800063a8: 09 a0        	j	2 <_ZN6kernel9interrupt7handler14kernel_syscall17ha906a99060ba65d7E+0x1a>
800063aa: 21 45        	addi	a0, zero, 8
800063ac: a2 65        	ld	a1, 8(sp)
800063ae: 63 86 a5 02  	beq	a1, a0, 44 <.LBB0_15>
800063b2: 09 a0        	j	2 <_ZN6kernel9interrupt7handler14kernel_syscall17ha906a99060ba65d7E+0x24>
800063b4: 25 45        	addi	a0, zero, 9
800063b6: a2 65        	ld	a1, 8(sp)
800063b8: 63 80 a5 06  	beq	a1, a0, 96 <.LBB0_17>
800063bc: 09 a0        	j	2 <.LBB0_13>

00000000800063be <.LBB0_13>:
800063be: 17 85 00 00  	auipc	a0, 8
800063c2: 13 05 a5 4a  	addi	a0, a0, 1194

00000000800063c6 <.LBB0_14>:
800063c6: 17 86 00 00  	auipc	a2, 8
800063ca: 13 06 a6 4d  	addi	a2, a2, 1242
800063ce: e9 45        	addi	a1, zero, 26
800063d0: 97 50 00 00  	auipc	ra, 5
800063d4: e7 80 a0 36  	jalr	874(ra)
800063d8: 00 00        	unimp	

00000000800063da <.LBB0_15>:
800063da: 97 85 00 00  	auipc	a1, 8
800063de: 93 85 e5 51  	addi	a1, a1, 1310

00000000800063e2 <.LBB0_16>:
800063e2: 97 86 00 00  	auipc	a3, 8
800063e6: 93 86 e6 4f  	addi	a3, a3, 1278
800063ea: 28 08        	addi	a0, sp, 24
800063ec: 05 46        	addi	a2, zero, 1
800063ee: 01 47        	mv	a4, zero
800063f0: 97 b0 ff ff  	auipc	ra, 1048571
800063f4: e7 80 80 2e  	jalr	744(ra)
800063f8: 09 a0        	j	2 <.LBB0_16+0x18>
800063fa: 28 08        	addi	a0, sp, 24
800063fc: 97 f0 ff ff  	auipc	ra, 1048575
80006400: e7 80 60 e6  	jalr	-410(ra)
80006404: 09 a0        	j	2 <.LBB0_16+0x24>
80006406: 01 45        	mv	a0, zero
80006408: 2a e0        	sd	a0, 0(sp)
8000640a: 82 65        	ld	a1, 0(sp)
8000640c: 97 00 00 00  	auipc	ra, 0
80006410: e7 80 c0 b3  	jalr	-1220(ra)
80006414: 09 a0        	j	2 <.LBB0_16+0x34>
80006416: 3d a8        	j	62 <.LBB0_18+0x34>

0000000080006418 <.LBB0_17>:
80006418: 97 85 00 00  	auipc	a1, 8
8000641c: 93 85 85 4b  	addi	a1, a1, 1208

0000000080006420 <.LBB0_18>:
80006420: 97 86 00 00  	auipc	a3, 8
80006424: 93 86 06 4c  	addi	a3, a3, 1216
80006428: a8 00        	addi	a0, sp, 72
8000642a: 05 46        	addi	a2, zero, 1
8000642c: 01 47        	mv	a4, zero
8000642e: 97 b0 ff ff  	auipc	ra, 1048571
80006432: e7 80 a0 2a  	jalr	682(ra)
80006436: 09 a0        	j	2 <.LBB0_18+0x18>
80006438: a8 00        	addi	a0, sp, 72
8000643a: 97 f0 ff ff  	auipc	ra, 1048575
8000643e: e7 80 80 e2  	jalr	-472(ra)
80006442: 09 a0        	j	2 <.LBB0_18+0x24>
80006444: 05 45        	addi	a0, zero, 1
80006446: 81 45        	mv	a1, zero
80006448: 97 00 00 00  	auipc	ra, 0
8000644c: e7 80 00 b0  	jalr	-1280(ra)
80006450: 09 a0        	j	2 <.LBB0_18+0x32>
80006452: 09 a0        	j	2 <.LBB0_18+0x34>
80006454: ea 60        	ld	ra, 152(sp)
80006456: 0d 61        	addi	sp, sp, 160
80006458: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE:

000000008000645a <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE>:
8000645a: 39 71        	addi	sp, sp, -64
8000645c: 06 fc        	sd	ra, 56(sp)
8000645e: 97 b0 ff ff  	auipc	ra, 1048571
80006462: e7 80 80 0d  	jalr	216(ra)
80006466: 2a ec        	sd	a0, 24(sp)
80006468: 2e f0        	sd	a1, 32(sp)
8000646a: 09 a0        	j	2 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE+0x12>
8000646c: 62 65        	ld	a0, 24(sp)
8000646e: 81 45        	mv	a1, zero
80006470: 63 04 b5 00  	beq	a0, a1, 8 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE+0x1e>
80006474: 09 a0        	j	2 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE+0x1c>
80006476: 29 a0        	j	10 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$3new17he0f589548b39391dE+0x26>
80006478: 01 45        	mv	a0, zero
8000647a: 2a e8        	sd	a0, 16(sp)
8000647c: 0d a8        	j	50 <.LBB0_9+0x1e>
8000647e: 00 00        	unimp	
80006480: 02 75        	ld	a0, 32(sp)
80006482: 2a f8        	sd	a0, 48(sp)
80006484: 97 b0 ff ff  	auipc	ra, 1048571
80006488: e7 80 00 64  	jalr	1600(ra)
8000648c: 2a e4        	sd	a0, 8(sp)
8000648e: 09 a0        	j	2 <.LBB0_9>

0000000080006490 <.LBB0_9>:
80006490: 97 85 00 00  	auipc	a1, 8
80006494: 93 85 85 49  	addi	a1, a1, 1176
80006498: 22 65        	ld	a0, 8(sp)
8000649a: 97 e0 ff ff  	auipc	ra, 1048574
8000649e: e7 80 a0 c3  	jalr	-966(ra)
800064a2: 2a e0        	sd	a0, 0(sp)
800064a4: 09 a0        	j	2 <.LBB0_9+0x16>
800064a6: 02 65        	ld	a0, 0(sp)
800064a8: 2a f4        	sd	a0, 40(sp)
800064aa: 2a e8        	sd	a0, 16(sp)
800064ac: 09 a0        	j	2 <.LBB0_9+0x1e>
800064ae: 42 65        	ld	a0, 16(sp)
800064b0: e2 70        	ld	ra, 56(sp)
800064b2: 21 61        	addi	sp, sp, 64
800064b4: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory9container5boxed12Box$LT$T$GT$8into_raw17hf6b357ecc17d7d41E:

00000000800064b6 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$8into_raw17hf6b357ecc17d7d41E>:
800064b6: 79 71        	addi	sp, sp, -48
800064b8: 06 f4        	sd	ra, 40(sp)
800064ba: 2a ec        	sd	a0, 24(sp)
800064bc: 2a e8        	sd	a0, 16(sp)
800064be: 97 b0 ff ff  	auipc	ra, 1048571
800064c2: e7 80 20 65  	jalr	1618(ra)
800064c6: aa 85        	add	a1, zero, a0
800064c8: 2a f0        	sd	a0, 32(sp)
800064ca: 2e e4        	sd	a1, 8(sp)
800064cc: 09 a0        	j	2 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$8into_raw17hf6b357ecc17d7d41E+0x18>
800064ce: 42 65        	ld	a0, 16(sp)
800064d0: 97 b0 ff ff  	auipc	ra, 1048571
800064d4: e7 80 c0 35  	jalr	860(ra)
800064d8: 09 a0        	j	2 <_ZN6kernel6memory9container5boxed12Box$LT$T$GT$8into_raw17hf6b357ecc17d7d41E+0x24>
800064da: 22 65        	ld	a0, 8(sp)
800064dc: a2 70        	ld	ra, 40(sp)
800064de: 45 61        	addi	sp, sp, 48
800064e0: 82 80        	ret

Disassembly of section .text._ZN93_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h0bbd6376dd53205bE:

00000000800064e2 <_ZN93_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h0bbd6376dd53205bE>:
800064e2: 01 11        	addi	sp, sp, -32
800064e4: 06 ec        	sd	ra, 24(sp)
800064e6: 2a e8        	sd	a0, 16(sp)
800064e8: 97 b0 ff ff  	auipc	ra, 1048571
800064ec: e7 80 c0 60  	jalr	1548(ra)
800064f0: 2a e4        	sd	a0, 8(sp)
800064f2: 09 a0        	j	2 <_ZN93_$LT$kernel..memory..container..boxed..Box$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h0bbd6376dd53205bE+0x12>
800064f4: 22 65        	ld	a0, 8(sp)
800064f6: e2 60        	ld	ra, 24(sp)
800064f8: 05 61        	addi	sp, sp, 32
800064fa: 82 80        	ret

Disassembly of section .text.start:

00000000800064fc <start>:
800064fc: 01 11        	addi	sp, sp, -32
800064fe: 06 ec        	sd	ra, 24(sp)
80006500: 97 00 00 00  	auipc	ra, 0
80006504: e7 80 20 42  	jalr	1058(ra)
80006508: 09 a0        	j	2 <.LBB0_12>

000000008000650a <.LBB0_12>:
8000650a: 17 05 00 00  	auipc	a0, 0
8000650e: 13 05 e5 47  	addi	a0, a0, 1150
80006512: 97 00 00 00  	auipc	ra, 0
80006516: e7 80 80 1e  	jalr	488(ra)
8000651a: 09 a0        	j	2 <.LBB0_12+0x12>
8000651c: 01 45        	mv	a0, zero
8000651e: 97 00 00 00  	auipc	ra, 0
80006522: e7 80 20 b1  	jalr	-1262(ra)
80006526: 09 a0        	j	2 <.LBB0_12+0x1e>
80006528: 41 65        	lui	a0, 16
8000652a: 7d 35        	addiw	a0, a0, -1
8000652c: 97 00 00 00  	auipc	ra, 0
80006530: e7 80 a0 3b  	jalr	954(ra)
80006534: 09 a0        	j	2 <.LBB0_12+0x2c>
80006536: 41 65        	lui	a0, 16
80006538: 7d 35        	addiw	a0, a0, -1
8000653a: 97 00 00 00  	auipc	ra, 0
8000653e: e7 80 40 3c  	jalr	964(ra)
80006542: 09 a0        	j	2 <.LBB0_12+0x3a>
80006544: 97 00 00 00  	auipc	ra, 0
80006548: e7 80 e0 19  	jalr	414(ra)
8000654c: 2a e4        	sd	a0, 8(sp)
8000654e: 09 a0        	j	2 <.LBB0_12+0x46>
80006550: 22 65        	ld	a0, 8(sp)
80006552: 13 65 25 22  	ori	a0, a0, 546
80006556: 97 00 00 00  	auipc	ra, 0
8000655a: e7 80 80 19  	jalr	408(ra)
8000655e: 09 a0        	j	2 <.LBB0_12+0x56>
80006560: 97 00 00 00  	auipc	ra, 0
80006564: e7 80 e0 02  	jalr	46(ra)
80006568: 09 a0        	j	2 <.LBB0_12+0x60>
8000656a: 97 00 00 00  	auipc	ra, 0
8000656e: e7 80 80 38  	jalr	904(ra)
80006572: aa 85        	add	a1, zero, a0
80006574: 2a e8        	sd	a0, 16(sp)
80006576: 2e e0        	sd	a1, 0(sp)
80006578: 09 a0        	j	2 <.LBB0_12+0x70>
8000657a: 02 65        	ld	a0, 0(sp)
8000657c: 97 e0 ff ff  	auipc	ra, 1048574
80006580: e7 80 e0 de  	jalr	-530(ra)
80006584: 09 a0        	j	2 <.LBB0_12+0x7c>
80006586: 73 00 20 30  	mret	
8000658a: 09 a0        	j	2 <.LBB0_12+0x82>
8000658c: 01 a0        	j	0 <.LBB0_12+0x82>

Disassembly of section .text._ZN6kernel5start9timerinit17he98d010db58d4765E:

000000008000658e <_ZN6kernel5start9timerinit17he98d010db58d4765E>:
8000658e: 39 71        	addi	sp, sp, -64
80006590: 06 fc        	sd	ra, 56(sp)
80006592: 97 00 00 00  	auipc	ra, 0
80006596: e7 80 00 36  	jalr	864(ra)
8000659a: aa 85        	add	a1, zero, a0
8000659c: 2a f4        	sd	a0, 40(sp)
8000659e: 2e f0        	sd	a1, 32(sp)
800065a0: 09 a0        	j	2 <_ZN6kernel5start9timerinit17he98d010db58d4765E+0x14>
800065a2: 37 45 0f 00  	lui	a0, 244
800065a6: 1b 05 05 24  	addiw	a0, a0, 576
800065aa: 2a f8        	sd	a0, 48(sp)
800065ac: 82 75        	ld	a1, 32(sp)
800065ae: 2a ec        	sd	a0, 24(sp)
800065b0: 2e 85        	add	a0, zero, a1
800065b2: e2 65        	ld	a1, 24(sp)
800065b4: 97 00 00 00  	auipc	ra, 0
800065b8: e7 80 00 22  	jalr	544(ra)
800065bc: 09 a0        	j	2 <_ZN6kernel5start9timerinit17he98d010db58d4765E+0x30>
800065be: 02 75        	ld	a0, 32(sp)
800065c0: 97 00 00 00  	auipc	ra, 0
800065c4: e7 80 00 27  	jalr	624(ra)
800065c8: 2a e8        	sd	a0, 16(sp)
800065ca: 09 a0        	j	2 <_ZN6kernel5start9timerinit17he98d010db58d4765E+0x3e>
800065cc: 1d 45        	addi	a0, zero, 7
800065ce: 82 75        	ld	a1, 32(sp)
800065d0: 63 6c b5 0a  	bltu	a0, a1, 184 <.LBB1_20>
800065d4: 09 a0        	j	2 <_ZN6kernel5start9timerinit17he98d010db58d4765E+0x48>
800065d6: 13 05 80 02  	addi	a0, zero, 40
800065da: 82 75        	ld	a1, 32(sp)
800065dc: 33 85 a5 02  	<unknown>

00000000800065e0 <.LBB1_16>:
800065e0: 17 16 02 00  	auipc	a2, 33
800065e4: 13 06 06 e6  	addi	a2, a2, -416
800065e8: 32 95        	add	a0, a0, a2
800065ea: 42 66        	ld	a2, 16(sp)
800065ec: 10 ed        	sd	a2, 24(a0)
800065ee: 1d 45        	addi	a0, zero, 7
800065f0: 63 67 b5 0a  	bltu	a0, a1, 174 <.LBB1_21>
800065f4: 09 a0        	j	2 <.LBB1_16+0x16>
800065f6: 13 05 80 02  	addi	a0, zero, 40
800065fa: 82 75        	ld	a1, 32(sp)
800065fc: 33 85 a5 02  	<unknown>

0000000080006600 <.LBB1_17>:
80006600: 17 16 02 00  	auipc	a2, 33
80006604: 13 06 06 e4  	addi	a2, a2, -448
80006608: 32 95        	add	a0, a0, a2
8000660a: 37 46 0f 00  	lui	a2, 244
8000660e: 1b 06 06 24  	addiw	a2, a2, 576
80006612: 10 f1        	sd	a2, 32(a0)
80006614: 1d 45        	addi	a0, zero, 7
80006616: 63 6f b5 08  	bltu	a0, a1, 158 <.LBB1_22>
8000661a: 09 a0        	j	2 <.LBB1_17+0x1c>
8000661c: 13 05 80 02  	addi	a0, zero, 40
80006620: 82 75        	ld	a1, 32(sp)
80006622: 33 85 a5 02  	<unknown>

0000000080006626 <.LBB1_18>:
80006626: 17 16 02 00  	auipc	a2, 33
8000662a: 13 06 a6 e1  	addi	a2, a2, -486
8000662e: 32 95        	add	a0, a0, a2
80006630: 95 45        	addi	a1, zero, 5
80006632: 97 e0 ff ff  	auipc	ra, 1048574
80006636: e7 80 80 82  	jalr	-2008(ra)
8000663a: 2a e4        	sd	a0, 8(sp)
8000663c: 09 a0        	j	2 <.LBB1_18+0x18>
8000663e: 22 65        	ld	a0, 8(sp)
80006640: 97 00 00 00  	auipc	ra, 0
80006644: e7 80 c0 33  	jalr	828(ra)
80006648: 09 a0        	j	2 <.LBB1_19>

000000008000664a <.LBB1_19>:
8000664a: 17 a5 ff ff  	auipc	a0, 1048570
8000664e: 13 05 65 a6  	addi	a0, a0, -1434
80006652: 97 20 00 00  	auipc	ra, 2
80006656: e7 80 00 d5  	jalr	-688(ra)
8000665a: 09 a0        	j	2 <.LBB1_19+0x12>
8000665c: 97 00 00 00  	auipc	ra, 0
80006660: e7 80 a0 2f  	jalr	762(ra)
80006664: 09 a0        	j	2 <.LBB1_19+0x1c>
80006666: 97 00 00 00  	auipc	ra, 0
8000666a: e7 80 40 06  	jalr	100(ra)
8000666e: 2a e0        	sd	a0, 0(sp)
80006670: 09 a0        	j	2 <.LBB1_19+0x28>
80006672: 02 65        	ld	a0, 0(sp)
80006674: 13 65 05 08  	ori	a0, a0, 128
80006678: 97 00 00 00  	auipc	ra, 0
8000667c: e7 80 e0 05  	jalr	94(ra)
80006680: 09 a0        	j	2 <.LBB1_19+0x38>
80006682: e2 70        	ld	ra, 56(sp)
80006684: 21 61        	addi	sp, sp, 64
80006686: 82 80        	ret

0000000080006688 <.LBB1_20>:
80006688: 17 86 00 00  	auipc	a2, 8
8000668c: 13 06 86 2c  	addi	a2, a2, 712
80006690: a1 45        	addi	a1, zero, 8
80006692: 02 75        	ld	a0, 32(sp)
80006694: 97 50 00 00  	auipc	ra, 5
80006698: e7 80 20 0d  	jalr	210(ra)
8000669c: 00 00        	unimp	

000000008000669e <.LBB1_21>:
8000669e: 17 86 00 00  	auipc	a2, 8
800066a2: 13 06 a6 2c  	addi	a2, a2, 714
800066a6: a1 45        	addi	a1, zero, 8
800066a8: 02 75        	ld	a0, 32(sp)
800066aa: 97 50 00 00  	auipc	ra, 5
800066ae: e7 80 c0 0b  	jalr	188(ra)
800066b2: 00 00        	unimp	

00000000800066b4 <.LBB1_22>:
800066b4: 17 86 00 00  	auipc	a2, 8
800066b8: 13 06 c6 2c  	addi	a2, a2, 716
800066bc: a1 45        	addi	a1, zero, 8
800066be: 02 75        	ld	a0, 32(sp)
800066c0: 97 50 00 00  	auipc	ra, 5
800066c4: e7 80 60 0a  	jalr	166(ra)
800066c8: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register3mie4read17h9c808305461db971E:

00000000800066ca <_ZN6kernel8register3mie4read17h9c808305461db971E>:
800066ca: 41 11        	addi	sp, sp, -16
800066cc: 73 25 40 30  	csrr	a0, mie
800066d0: 2a e4        	sd	a0, 8(sp)
800066d2: 41 01        	addi	sp, sp, 16
800066d4: 82 80        	ret

Disassembly of section .text._ZN6kernel8register3mie5write17h909dd6bf98847b59E:

00000000800066d6 <_ZN6kernel8register3mie5write17h909dd6bf98847b59E>:
800066d6: 41 11        	addi	sp, sp, -16
800066d8: 2a e4        	sd	a0, 8(sp)
800066da: 73 10 45 30  	csrw	mie, a0
800066de: 41 01        	addi	sp, sp, 16
800066e0: 82 80        	ret

Disassembly of section .text._ZN6kernel8register3sie4read17h0bfdc1ea7cf3c8b6E:

00000000800066e2 <_ZN6kernel8register3sie4read17h0bfdc1ea7cf3c8b6E>:
800066e2: 41 11        	addi	sp, sp, -16
800066e4: 73 25 40 10  	csrr	a0, sie
800066e8: 2a e4        	sd	a0, 8(sp)
800066ea: 41 01        	addi	sp, sp, 16
800066ec: 82 80        	ret

Disassembly of section .text._ZN6kernel8register3sie5write17h5801d73224e7c0b4E:

00000000800066ee <_ZN6kernel8register3sie5write17h5801d73224e7c0b4E>:
800066ee: 41 11        	addi	sp, sp, -16
800066f0: 2a e4        	sd	a0, 8(sp)
800066f2: 73 10 45 10  	csrw	sie, a0
800066f6: 41 01        	addi	sp, sp, 16
800066f8: 82 80        	ret

Disassembly of section .text._ZN6kernel8register4mepc5write17hc2e343c69a1a4c12E:

00000000800066fa <_ZN6kernel8register4mepc5write17hc2e343c69a1a4c12E>:
800066fa: 41 11        	addi	sp, sp, -16
800066fc: 2a e4        	sd	a0, 8(sp)
800066fe: 73 10 15 34  	csrw	mepc, a0
80006702: 41 01        	addi	sp, sp, 16
80006704: 82 80        	ret

Disassembly of section .text._ZN6kernel8register5clint10read_mtime17hf3eb1079ae00a236E:

0000000080006706 <_ZN6kernel8register5clint10read_mtime17hf3eb1079ae00a236E>:
80006706: 01 11        	addi	sp, sp, -32
80006708: 06 ec        	sd	ra, 24(sp)

000000008000670a <.LBB0_3>:
8000670a: 17 75 00 00  	auipc	a0, 7
8000670e: 13 05 65 04  	addi	a0, a0, 70
80006712: 08 61        	ld	a0, 0(a0)
80006714: 2a e8        	sd	a0, 16(sp)
80006716: 97 00 00 00  	auipc	ra, 0
8000671a: e7 80 40 b2  	jalr	-1244(ra)
8000671e: 2a e4        	sd	a0, 8(sp)
80006720: 09 a0        	j	2 <.LBB0_3+0x18>
80006722: 22 65        	ld	a0, 8(sp)
80006724: 97 d0 ff ff  	auipc	ra, 1048573
80006728: e7 80 40 b7  	jalr	-1164(ra)
8000672c: 2a e0        	sd	a0, 0(sp)
8000672e: 09 a0        	j	2 <.LBB0_3+0x26>
80006730: 02 65        	ld	a0, 0(sp)
80006732: e2 60        	ld	ra, 24(sp)
80006734: 05 61        	addi	sp, sp, 32
80006736: 82 80        	ret

Disassembly of section .text._ZN6kernel8register5clint14write_mtimecmp17h061b045db86a7a70E:

0000000080006738 <_ZN6kernel8register5clint14write_mtimecmp17h061b045db86a7a70E>:
80006738: 5d 71        	addi	sp, sp, -80
8000673a: 86 e4        	sd	ra, 72(sp)
8000673c: 2a f4        	sd	a0, 40(sp)
8000673e: 2e f8        	sd	a1, 48(sp)

0000000080006740 <.LBB1_7>:
80006740: 17 76 00 00  	auipc	a2, 7
80006744: 13 06 06 09  	addi	a2, a2, 144
80006748: 10 62        	ld	a2, 0(a2)
8000674a: 32 fc        	sd	a2, 56(sp)
8000674c: 2a f0        	sd	a0, 32(sp)
8000674e: 32 85        	add	a0, zero, a2
80006750: 2e ec        	sd	a1, 24(sp)
80006752: 97 00 00 00  	auipc	ra, 0
80006756: e7 80 80 ae  	jalr	-1304(ra)
8000675a: 2a e8        	sd	a0, 16(sp)
8000675c: 09 a0        	j	2 <.LBB1_7+0x1e>
8000675e: 05 45        	addi	a0, zero, 1
80006760: 76 15        	slli	a0, a0, 61
80006762: 7d 15        	addi	a0, a0, -1
80006764: 82 75        	ld	a1, 32(sp)
80006766: 6d 8d        	and	a0, a0, a1
80006768: 13 96 35 00  	slli	a2, a1, 3
8000676c: 32 e4        	sd	a2, 8(sp)
8000676e: 63 16 b5 02  	bne	a0, a1, 44 <.LBB1_8>
80006772: 09 a0        	j	2 <.LBB1_7+0x34>
80006774: 42 65        	ld	a0, 16(sp)
80006776: a2 65        	ld	a1, 8(sp)
80006778: 33 06 b5 00  	add	a2, a0, a1
8000677c: 32 e0        	sd	a2, 0(sp)
8000677e: 63 6d a6 02  	bltu	a2, a0, 58 <.LBB1_10>
80006782: 09 a0        	j	2 <.LBB1_7+0x44>
80006784: 02 65        	ld	a0, 0(sp)
80006786: aa e0        	sd	a0, 64(sp)
80006788: e2 65        	ld	a1, 24(sp)
8000678a: 97 d0 ff ff  	auipc	ra, 1048573
8000678e: e7 80 80 b4  	jalr	-1208(ra)
80006792: 09 a0        	j	2 <.LBB1_7+0x54>
80006794: a6 60        	ld	ra, 72(sp)
80006796: 61 61        	addi	sp, sp, 80
80006798: 82 80        	ret

000000008000679a <.LBB1_8>:
8000679a: 17 85 00 00  	auipc	a0, 8
8000679e: 13 05 65 23  	addi	a0, a0, 566

00000000800067a2 <.LBB1_9>:
800067a2: 17 86 00 00  	auipc	a2, 8
800067a6: 13 06 e6 20  	addi	a2, a2, 526
800067aa: 93 05 10 02  	addi	a1, zero, 33
800067ae: 97 50 00 00  	auipc	ra, 5
800067b2: e7 80 c0 f8  	jalr	-116(ra)
800067b6: 00 00        	unimp	

00000000800067b8 <.LBB1_10>:
800067b8: 17 85 00 00  	auipc	a0, 8
800067bc: 13 05 85 25  	addi	a0, a0, 600

00000000800067c0 <.LBB1_11>:
800067c0: 17 86 00 00  	auipc	a2, 8
800067c4: 13 06 86 23  	addi	a2, a2, 568
800067c8: f1 45        	addi	a1, zero, 28
800067ca: 97 50 00 00  	auipc	ra, 5
800067ce: e7 80 00 f7  	jalr	-144(ra)
800067d2: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register5clint12add_mtimecmp17h6b2c7c1de8972b0fE:

00000000800067d4 <_ZN6kernel8register5clint12add_mtimecmp17h6b2c7c1de8972b0fE>:
800067d4: 39 71        	addi	sp, sp, -64
800067d6: 06 fc        	sd	ra, 56(sp)
800067d8: 2a f0        	sd	a0, 32(sp)
800067da: 2e f4        	sd	a1, 40(sp)
800067dc: 2e ec        	sd	a1, 24(sp)
800067de: 2a e8        	sd	a0, 16(sp)
800067e0: 97 00 00 00  	auipc	ra, 0
800067e4: e7 80 60 f2  	jalr	-218(ra)
800067e8: aa 85        	add	a1, zero, a0
800067ea: 2a f8        	sd	a0, 48(sp)
800067ec: 2e e4        	sd	a1, 8(sp)
800067ee: 09 a0        	j	2 <_ZN6kernel8register5clint12add_mtimecmp17h6b2c7c1de8972b0fE+0x1c>
800067f0: 22 65        	ld	a0, 8(sp)
800067f2: e2 65        	ld	a1, 24(sp)
800067f4: 33 06 b5 00  	add	a2, a0, a1
800067f8: 32 e0        	sd	a2, 0(sp)
800067fa: 63 6d a6 00  	bltu	a2, a0, 26 <.LBB2_5>
800067fe: 09 a0        	j	2 <_ZN6kernel8register5clint12add_mtimecmp17h6b2c7c1de8972b0fE+0x2c>
80006800: 42 65        	ld	a0, 16(sp)
80006802: 82 65        	ld	a1, 0(sp)
80006804: 97 00 00 00  	auipc	ra, 0
80006808: e7 80 40 f3  	jalr	-204(ra)
8000680c: 09 a0        	j	2 <_ZN6kernel8register5clint12add_mtimecmp17h6b2c7c1de8972b0fE+0x3a>
8000680e: e2 70        	ld	ra, 56(sp)
80006810: 21 61        	addi	sp, sp, 64
80006812: 82 80        	ret

0000000080006814 <.LBB2_5>:
80006814: 17 85 00 00  	auipc	a0, 8
80006818: 13 05 c5 1f  	addi	a0, a0, 508

000000008000681c <.LBB2_6>:
8000681c: 17 86 00 00  	auipc	a2, 8
80006820: 13 06 46 21  	addi	a2, a2, 532
80006824: f1 45        	addi	a1, zero, 28
80006826: 97 50 00 00  	auipc	ra, 5
8000682a: e7 80 40 f1  	jalr	-236(ra)
8000682e: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register5clint13count_mtiecmp17h5ded2b3a8011e16dE:

0000000080006830 <_ZN6kernel8register5clint13count_mtiecmp17h5ded2b3a8011e16dE>:
80006830: 5d 71        	addi	sp, sp, -80
80006832: 86 e4        	sd	ra, 72(sp)
80006834: 2a f8        	sd	a0, 48(sp)

0000000080006836 <.LBB3_8>:
80006836: 97 75 00 00  	auipc	a1, 7
8000683a: 93 85 a5 fa  	addi	a1, a1, -86
8000683e: 8c 61        	ld	a1, 0(a1)
80006840: 2e fc        	sd	a1, 56(sp)
80006842: 2a f4        	sd	a0, 40(sp)
80006844: 2e 85        	add	a0, zero, a1
80006846: 97 00 00 00  	auipc	ra, 0
8000684a: e7 80 40 9f  	jalr	-1548(ra)
8000684e: 2a f0        	sd	a0, 32(sp)
80006850: 09 a0        	j	2 <.LBB3_8+0x1c>
80006852: 05 45        	addi	a0, zero, 1
80006854: 76 15        	slli	a0, a0, 61
80006856: 7d 15        	addi	a0, a0, -1
80006858: a2 75        	ld	a1, 40(sp)
8000685a: 6d 8d        	and	a0, a0, a1
8000685c: 13 96 35 00  	slli	a2, a1, 3
80006860: 32 ec        	sd	a2, 24(sp)
80006862: 63 17 b5 02  	bne	a0, a1, 46 <.LBB3_9>
80006866: 09 a0        	j	2 <.LBB3_8+0x32>
80006868: 02 75        	ld	a0, 32(sp)
8000686a: e2 65        	ld	a1, 24(sp)
8000686c: 33 06 b5 00  	add	a2, a0, a1
80006870: 32 e8        	sd	a2, 16(sp)
80006872: 63 6e a6 02  	bltu	a2, a0, 60 <.LBB3_11>
80006876: 09 a0        	j	2 <.LBB3_8+0x42>
80006878: 11 65        	lui	a0, 4
8000687a: c2 65        	ld	a1, 16(sp)
8000687c: 2e 95        	add	a0, a0, a1
8000687e: 2a e4        	sd	a0, 8(sp)
80006880: 63 65 b5 04  	bltu	a0, a1, 74 <.LBB3_13>
80006884: 09 a0        	j	2 <.LBB3_8+0x50>
80006886: 22 65        	ld	a0, 8(sp)
80006888: aa e0        	sd	a0, 64(sp)
8000688a: a6 60        	ld	ra, 72(sp)
8000688c: 61 61        	addi	sp, sp, 80
8000688e: 82 80        	ret

0000000080006890 <.LBB3_9>:
80006890: 17 85 00 00  	auipc	a0, 8
80006894: 13 05 05 14  	addi	a0, a0, 320

0000000080006898 <.LBB3_10>:
80006898: 17 86 00 00  	auipc	a2, 8
8000689c: 13 06 06 1b  	addi	a2, a2, 432
800068a0: 93 05 10 02  	addi	a1, zero, 33
800068a4: 97 50 00 00  	auipc	ra, 5
800068a8: e7 80 60 e9  	jalr	-362(ra)
800068ac: 00 00        	unimp	

00000000800068ae <.LBB3_11>:
800068ae: 17 85 00 00  	auipc	a0, 8
800068b2: 13 05 25 16  	addi	a0, a0, 354

00000000800068b6 <.LBB3_12>:
800068b6: 17 86 00 00  	auipc	a2, 8
800068ba: 13 06 a6 1a  	addi	a2, a2, 426
800068be: f1 45        	addi	a1, zero, 28
800068c0: 97 50 00 00  	auipc	ra, 5
800068c4: e7 80 a0 e7  	jalr	-390(ra)
800068c8: 00 00        	unimp	

00000000800068ca <.LBB3_13>:
800068ca: 17 85 00 00  	auipc	a0, 8
800068ce: 13 05 65 14  	addi	a0, a0, 326

00000000800068d2 <.LBB3_14>:
800068d2: 17 86 00 00  	auipc	a2, 8
800068d6: 13 06 e6 18  	addi	a2, a2, 398
800068da: f1 45        	addi	a1, zero, 28
800068dc: 97 50 00 00  	auipc	ra, 5
800068e0: e7 80 e0 e5  	jalr	-418(ra)
800068e4: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register7medeleg5write17he8f75bd01d2f435bE:

00000000800068e6 <_ZN6kernel8register7medeleg5write17he8f75bd01d2f435bE>:
800068e6: 41 11        	addi	sp, sp, -16
800068e8: 2a e4        	sd	a0, 8(sp)
800068ea: 73 10 25 30  	csrw	medeleg, a0
800068ee: 41 01        	addi	sp, sp, 16
800068f0: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mhartid4read17h8f4a6968554101cdE:

00000000800068f2 <_ZN6kernel8register7mhartid4read17h8f4a6968554101cdE>:
800068f2: 41 11        	addi	sp, sp, -16
800068f4: 73 25 40 f1  	csrr	a0, mhartid
800068f8: 2a e4        	sd	a0, 8(sp)
800068fa: 41 01        	addi	sp, sp, 16
800068fc: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mideleg5write17h530c9b610bcfa2e7E:

00000000800068fe <_ZN6kernel8register7mideleg5write17h530c9b610bcfa2e7E>:
800068fe: 41 11        	addi	sp, sp, -16
80006900: 2a e4        	sd	a0, 8(sp)
80006902: 73 10 35 30  	csrw	mideleg, a0
80006906: 41 01        	addi	sp, sp, 16
80006908: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mstatus4read17h6b2fbb48d9b38feeE:

000000008000690a <_ZN6kernel8register7mstatus4read17h6b2fbb48d9b38feeE>:
8000690a: 41 11        	addi	sp, sp, -16
8000690c: 73 25 00 30  	csrr	a0, mstatus
80006910: 2a e4        	sd	a0, 8(sp)
80006912: 41 01        	addi	sp, sp, 16
80006914: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mstatus5write17heddca904321233e4E:

0000000080006916 <_ZN6kernel8register7mstatus5write17heddca904321233e4E>:
80006916: 41 11        	addi	sp, sp, -16
80006918: 2a e4        	sd	a0, 8(sp)
8000691a: 73 10 05 30  	csrw	mstatus, a0
8000691e: 41 01        	addi	sp, sp, 16
80006920: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mstatus7set_mpp17h50613d8cbfa492f4E:

0000000080006922 <_ZN6kernel8register7mstatus7set_mpp17h50613d8cbfa492f4E>:
80006922: 41 11        	addi	sp, sp, -16
80006924: 06 e4        	sd	ra, 8(sp)
80006926: 97 00 00 00  	auipc	ra, 0
8000692a: e7 80 40 fe  	jalr	-28(ra)
8000692e: 2a e0        	sd	a0, 0(sp)
80006930: 09 a0        	j	2 <_ZN6kernel8register7mstatus7set_mpp17h50613d8cbfa492f4E+0x10>
80006932: 02 65        	ld	a0, 0(sp)
80006934: f9 75        	lui	a1, 1048574
80006936: 9b 85 f5 7f  	addiw	a1, a1, 2047
8000693a: 6d 8d        	and	a0, a0, a1
8000693c: 85 65        	lui	a1, 1
8000693e: 9b 85 05 80  	addiw	a1, a1, -2048
80006942: 4d 8d        	or	a0, a0, a1
80006944: 2a e0        	sd	a0, 0(sp)
80006946: 97 00 00 00  	auipc	ra, 0
8000694a: e7 80 00 fd  	jalr	-48(ra)
8000694e: 09 a0        	j	2 <_ZN6kernel8register7mstatus7set_mpp17h50613d8cbfa492f4E+0x2e>
80006950: a2 60        	ld	ra, 8(sp)
80006952: 41 01        	addi	sp, sp, 16
80006954: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7mstatus16enable_interrupt17h520e2c9c4889767aE:

0000000080006956 <_ZN6kernel8register7mstatus16enable_interrupt17h520e2c9c4889767aE>:
80006956: 41 11        	addi	sp, sp, -16
80006958: 06 e4        	sd	ra, 8(sp)
8000695a: 97 00 00 00  	auipc	ra, 0
8000695e: e7 80 00 fb  	jalr	-80(ra)
80006962: 2a e0        	sd	a0, 0(sp)
80006964: 09 a0        	j	2 <_ZN6kernel8register7mstatus16enable_interrupt17h520e2c9c4889767aE+0x10>
80006966: 02 65        	ld	a0, 0(sp)
80006968: 13 65 85 00  	ori	a0, a0, 8
8000696c: 97 00 00 00  	auipc	ra, 0
80006970: e7 80 a0 fa  	jalr	-86(ra)
80006974: 09 a0        	j	2 <_ZN6kernel8register7mstatus16enable_interrupt17h520e2c9c4889767aE+0x20>
80006976: a2 60        	ld	ra, 8(sp)
80006978: 41 01        	addi	sp, sp, 16
8000697a: 82 80        	ret

Disassembly of section .text._ZN6kernel8register8mscratch5write17hfc337845c2278776E:

000000008000697c <_ZN6kernel8register8mscratch5write17hfc337845c2278776E>:
8000697c: 41 11        	addi	sp, sp, -16
8000697e: 2a e4        	sd	a0, 8(sp)
80006980: 73 10 05 34  	csrw	mscratch, a0
80006984: 41 01        	addi	sp, sp, 16
80006986: 82 80        	ret

Disassembly of section .text.rust_main:

0000000080006988 <rust_main>:
80006988: 01 71        	addi	sp, sp, -512
8000698a: 86 ff        	sd	ra, 504(sp)
8000698c: 97 c0 ff ff  	auipc	ra, 1048572
80006990: e7 80 60 e2  	jalr	-474(ra)
80006994: aa f0        	sd	a0, 96(sp)
80006996: 09 a0        	j	2 <rust_main+0x10>
80006998: 01 45        	mv	a0, zero
8000699a: 86 75        	ld	a1, 96(sp)
8000699c: 63 98 a5 00  	bne	a1, a0, 16 <rust_main+0x24>
800069a0: 09 a0        	j	2 <rust_main+0x1a>
800069a2: 97 f0 ff ff  	auipc	ra, 1048575
800069a6: e7 80 60 d9  	jalr	-618(ra)
800069aa: 11 a0        	j	4 <.LBB0_37>
800069ac: 8d a2        	j	354 <.LBB0_48+0x14>

00000000800069ae <.LBB0_37>:
800069ae: 17 85 00 00  	auipc	a0, 8
800069b2: 13 05 25 3c  	addi	a0, a0, 962
800069b6: 2a f5        	sd	a0, 168(sp)
800069b8: aa f7        	sd	a0, 488(sp)

00000000800069ba <.LBB0_38>:
800069ba: 97 b5 ff ff  	auipc	a1, 1048571
800069be: 93 85 45 c4  	addi	a1, a1, -956
800069c2: 97 b0 ff ff  	auipc	ra, 1048571
800069c6: e7 80 c0 ca  	jalr	-852(ra)
800069ca: aa ec        	sd	a0, 88(sp)
800069cc: ae e8        	sd	a1, 80(sp)
800069ce: 09 a0        	j	2 <.LBB0_38+0x16>
800069d0: 66 65        	ld	a0, 88(sp)
800069d2: 2a ed        	sd	a0, 152(sp)
800069d4: c6 65        	ld	a1, 80(sp)
800069d6: 2e f1        	sd	a1, 160(sp)

00000000800069d8 <.LBB0_39>:
800069d8: 97 85 00 00  	auipc	a1, 8
800069dc: 93 85 05 12  	addi	a1, a1, 288
800069e0: a8 10        	addi	a0, sp, 104
800069e2: 09 46        	addi	a2, zero, 2
800069e4: 34 09        	addi	a3, sp, 152
800069e6: 05 47        	addi	a4, zero, 1
800069e8: 97 b0 ff ff  	auipc	ra, 1048571
800069ec: e7 80 00 cf  	jalr	-784(ra)
800069f0: 09 a0        	j	2 <.LBB0_39+0x1a>
800069f2: a8 10        	addi	a0, sp, 104
800069f4: 97 f0 ff ff  	auipc	ra, 1048575
800069f8: e7 80 e0 86  	jalr	-1938(ra)
800069fc: 09 a0        	j	2 <.LBB0_40>

00000000800069fe <.LBB0_40>:
800069fe: 97 85 00 00  	auipc	a1, 8
80006a02: 93 85 a5 39  	addi	a1, a1, 922

0000000080006a06 <.LBB0_41>:
80006a06: 97 86 00 00  	auipc	a3, 8
80006a0a: 93 86 a6 0e  	addi	a3, a3, 234
80006a0e: 08 19        	addi	a0, sp, 176
80006a10: 05 46        	addi	a2, zero, 1
80006a12: 01 47        	mv	a4, zero
80006a14: 97 b0 ff ff  	auipc	ra, 1048571
80006a18: e7 80 40 cc  	jalr	-828(ra)
80006a1c: 09 a0        	j	2 <.LBB0_41+0x18>
80006a1e: 08 19        	addi	a0, sp, 176
80006a20: 97 f0 ff ff  	auipc	ra, 1048575
80006a24: e7 80 20 84  	jalr	-1982(ra)
80006a28: 09 a0        	j	2 <.LBB0_42>

0000000080006a2a <.LBB0_42>:
80006a2a: 17 b5 00 00  	auipc	a0, 11
80006a2e: 13 05 e5 5f  	addi	a0, a0, 1534
80006a32: 97 b0 ff ff  	auipc	ra, 1048571
80006a36: e7 80 00 83  	jalr	-2000(ra)
80006a3a: 09 a0        	j	2 <.LBB0_42+0x12>
80006a3c: 97 00 00 00  	auipc	ra, 0
80006a40: e7 80 e0 6e  	jalr	1774(ra)
80006a44: 09 a0        	j	2 <.LBB0_42+0x1c>
80006a46: 97 00 00 00  	auipc	ra, 0
80006a4a: e7 80 00 75  	jalr	1872(ra)
80006a4e: 09 a0        	j	2 <.LBB0_43>

0000000080006a50 <.LBB0_43>:
80006a50: 17 c5 01 00  	auipc	a0, 28
80006a54: 13 05 05 99  	addi	a0, a0, -1648
80006a58: 97 10 00 00  	auipc	ra, 1
80006a5c: e7 80 c0 c2  	jalr	-980(ra)
80006a60: 09 a0        	j	2 <.LBB0_43+0x12>
80006a62: 97 e0 ff ff  	auipc	ra, 1048574
80006a66: e7 80 20 91  	jalr	-1774(ra)
80006a6a: 09 a0        	j	2 <.LBB0_43+0x1c>
80006a6c: 97 e0 ff ff  	auipc	ra, 1048574
80006a70: e7 80 e0 93  	jalr	-1730(ra)
80006a74: 09 a0        	j	2 <.LBB0_43+0x26>
80006a76: 97 f0 ff ff  	auipc	ra, 1048575
80006a7a: e7 80 a0 5e  	jalr	1514(ra)
80006a7e: 09 a0        	j	2 <.LBB0_43+0x30>
80006a80: 97 f0 ff ff  	auipc	ra, 1048575
80006a84: e7 80 60 6a  	jalr	1702(ra)
80006a88: 09 a0        	j	2 <.LBB0_44>

0000000080006a8a <.LBB0_44>:
80006a8a: 17 35 01 00  	auipc	a0, 19
80006a8e: 13 05 65 67  	addi	a0, a0, 1654
80006a92: 97 00 00 00  	auipc	ra, 0
80006a96: e7 80 c0 17  	jalr	380(ra)
80006a9a: 09 a0        	j	2 <.LBB0_45>

0000000080006a9c <.LBB0_45>:
80006a9c: 17 c5 01 00  	auipc	a0, 28
80006aa0: 13 05 45 94  	addi	a0, a0, -1724
80006aa4: 97 10 00 00  	auipc	ra, 1
80006aa8: e7 80 a0 df  	jalr	-518(ra)
80006aac: 09 a0        	j	2 <.LBB0_45+0x12>
80006aae: 97 c0 ff ff  	auipc	ra, 1048572
80006ab2: e7 80 40 d0  	jalr	-764(ra)
80006ab6: 2a f6        	sd	a0, 296(sp)
80006ab8: 09 a0        	j	2 <.LBB0_45+0x1e>
80006aba: 28 12        	addi	a0, sp, 296
80006abc: 2a f2        	sd	a0, 288(sp)
80006abe: aa fb        	sd	a0, 496(sp)

0000000080006ac0 <.LBB0_46>:
80006ac0: 97 65 00 00  	auipc	a1, 6
80006ac4: 93 85 05 7b  	addi	a1, a1, 1968
80006ac8: 97 40 00 00  	auipc	ra, 4
80006acc: e7 80 40 6c  	jalr	1732(ra)
80006ad0: aa e4        	sd	a0, 72(sp)
80006ad2: ae e0        	sd	a1, 64(sp)
80006ad4: 09 a0        	j	2 <.LBB0_46+0x16>
80006ad6: 26 65        	ld	a0, 72(sp)
80006ad8: 2a ea        	sd	a0, 272(sp)
80006ada: 86 65        	ld	a1, 64(sp)
80006adc: 2e ee        	sd	a1, 280(sp)

0000000080006ade <.LBB0_47>:
80006ade: 97 85 00 00  	auipc	a1, 8
80006ae2: 93 85 a5 fe  	addi	a1, a1, -22
80006ae6: 88 11        	addi	a0, sp, 224
80006ae8: 14 0a        	addi	a3, sp, 272
80006aea: 05 46        	addi	a2, zero, 1
80006aec: 32 fc        	sd	a2, 56(sp)
80006aee: 62 77        	ld	a4, 56(sp)
80006af0: 97 b0 ff ff  	auipc	ra, 1048571
80006af4: e7 80 80 be  	jalr	-1048(ra)
80006af8: 09 a0        	j	2 <.LBB0_48>

0000000080006afa <.LBB0_48>:
80006afa: 97 85 00 00  	auipc	a1, 8
80006afe: 93 85 e5 2a  	addi	a1, a1, 686
80006b02: 88 11        	addi	a0, sp, 224
80006b04: 97 50 00 00  	auipc	ra, 5
80006b08: e7 80 20 ca  	jalr	-862(ra)
80006b0c: 00 00        	unimp	
80006b0e: 11 45        	addi	a0, zero, 4
80006b10: a3 0b a1 12  	sb	a0, 311(sp)

0000000080006b14 <.LBB0_49>:
80006b14: 97 25 02 00  	auipc	a1, 34
80006b18: 93 85 c5 4f  	addi	a1, a1, 1276
80006b1c: 2a f8        	sd	a0, 48(sp)
80006b1e: 2e 85        	add	a0, zero, a1
80006b20: c2 75        	ld	a1, 48(sp)
80006b22: 97 20 00 00  	auipc	ra, 2
80006b26: e7 80 20 42  	jalr	1058(ra)
80006b2a: 2a f4        	sd	a0, 40(sp)
80006b2c: 09 a0        	j	2 <.LBB0_49+0x1a>
80006b2e: 01 45        	mv	a0, zero
80006b30: a2 75        	ld	a1, 40(sp)
80006b32: 63 89 a5 00  	beq	a1, a0, 18 <.LBB0_49+0x30>
80006b36: 09 a0        	j	2 <.LBB0_49+0x24>
80006b38: 97 c0 ff ff  	auipc	ra, 1048572
80006b3c: e7 80 a0 c7  	jalr	-902(ra)
80006b40: 2a e3        	sd	a0, 384(sp)
80006b42: 11 a0        	j	4 <.LBB0_49+0x32>
80006b44: e9 b7        	j	-54 <.LBB0_48+0x14>
80006b46: 08 03        	addi	a0, sp, 384
80006b48: aa fe        	sd	a0, 376(sp)
80006b4a: aa ef        	sd	a0, 472(sp)

0000000080006b4c <.LBB0_50>:
80006b4c: 97 65 00 00  	auipc	a1, 6
80006b50: 93 85 45 72  	addi	a1, a1, 1828
80006b54: 97 40 00 00  	auipc	ra, 4
80006b58: e7 80 80 63  	jalr	1592(ra)
80006b5c: 2a f0        	sd	a0, 32(sp)
80006b5e: 2e ec        	sd	a1, 24(sp)
80006b60: 09 a0        	j	2 <.LBB0_50+0x16>
80006b62: 02 75        	ld	a0, 32(sp)
80006b64: aa f6        	sd	a0, 360(sp)
80006b66: e2 65        	ld	a1, 24(sp)
80006b68: ae fa        	sd	a1, 368(sp)

0000000080006b6a <.LBB0_51>:
80006b6a: 97 85 00 00  	auipc	a1, 8
80006b6e: 93 85 e5 f1  	addi	a1, a1, -226
80006b72: 28 1a        	addi	a0, sp, 312
80006b74: 09 46        	addi	a2, zero, 2
80006b76: b4 12        	addi	a3, sp, 360
80006b78: 05 47        	addi	a4, zero, 1
80006b7a: 97 b0 ff ff  	auipc	ra, 1048571
80006b7e: e7 80 e0 b5  	jalr	-1186(ra)
80006b82: 09 a0        	j	2 <.LBB0_51+0x1a>
80006b84: 28 1a        	addi	a0, sp, 312
80006b86: 97 e0 ff ff  	auipc	ra, 1048574
80006b8a: e7 80 c0 6d  	jalr	1756(ra)
80006b8e: 09 a0        	j	2 <.LBB0_51+0x26>
80006b90: 97 00 00 00  	auipc	ra, 0
80006b94: e7 80 60 60  	jalr	1542(ra)
80006b98: 09 a0        	j	2 <.LBB0_51+0x30>
80006b9a: 97 e0 ff ff  	auipc	ra, 1048574
80006b9e: e7 80 00 81  	jalr	-2032(ra)
80006ba2: 09 a0        	j	2 <.LBB0_51+0x3a>
80006ba4: 97 f0 ff ff  	auipc	ra, 1048575
80006ba8: e7 80 20 58  	jalr	1410(ra)
80006bac: 09 a0        	j	2 <.LBB0_51+0x44>
80006bae: 97 c0 ff ff  	auipc	ra, 1048572
80006bb2: e7 80 40 c0  	jalr	-1020(ra)
80006bb6: aa eb        	sd	a0, 464(sp)
80006bb8: 09 a0        	j	2 <.LBB0_51+0x50>
80006bba: 88 0b        	addi	a0, sp, 464
80006bbc: aa e7        	sd	a0, 456(sp)
80006bbe: aa f3        	sd	a0, 480(sp)

0000000080006bc0 <.LBB0_52>:
80006bc0: 97 65 00 00  	auipc	a1, 6
80006bc4: 93 85 05 6b  	addi	a1, a1, 1712
80006bc8: 97 40 00 00  	auipc	ra, 4
80006bcc: e7 80 40 5c  	jalr	1476(ra)
80006bd0: 2a e8        	sd	a0, 16(sp)
80006bd2: 2e e4        	sd	a1, 8(sp)
80006bd4: 09 a0        	j	2 <.LBB0_52+0x16>
80006bd6: 42 65        	ld	a0, 16(sp)
80006bd8: 2a ff        	sd	a0, 440(sp)
80006bda: a2 65        	ld	a1, 8(sp)
80006bdc: ae e3        	sd	a1, 448(sp)

0000000080006bde <.LBB0_53>:
80006bde: 97 85 00 00  	auipc	a1, 8
80006be2: 93 85 a5 ee  	addi	a1, a1, -278
80006be6: 28 03        	addi	a0, sp, 392
80006be8: 34 1b        	addi	a3, sp, 440
80006bea: 05 46        	addi	a2, zero, 1
80006bec: 32 e0        	sd	a2, 0(sp)
80006bee: 02 67        	ld	a4, 0(sp)
80006bf0: 97 b0 ff ff  	auipc	ra, 1048571
80006bf4: e7 80 80 ae  	jalr	-1304(ra)
80006bf8: 09 a0        	j	2 <.LBB0_54>

0000000080006bfa <.LBB0_54>:
80006bfa: 97 85 00 00  	auipc	a1, 8
80006bfe: 93 85 e5 ed  	addi	a1, a1, -290
80006c02: 28 03        	addi	a0, sp, 392
80006c04: 97 50 00 00  	auipc	ra, 5
80006c08: e7 80 20 ba  	jalr	-1118(ra)
80006c0c: 00 00        	unimp	

Disassembly of section .text._ZN6kernel2fs3bio10BcacheList5binit17hbe095110d95b6d55E:

0000000080006c0e <_ZN6kernel2fs3bio10BcacheList5binit17hbe095110d95b6d55E>:
80006c0e: 0d 71        	addi	sp, sp, -352
80006c10: 86 ee        	sd	ra, 344(sp)
80006c12: 2a fa        	sd	a0, 304(sp)

0000000080006c14 <.LBB0_37>:
80006c14: 97 85 00 00  	auipc	a1, 8
80006c18: 93 85 45 1c  	addi	a1, a1, 452

0000000080006c1c <.LBB0_38>:
80006c1c: 97 86 00 00  	auipc	a3, 8
80006c20: 93 86 c6 1c  	addi	a3, a3, 460
80006c24: 30 19        	addi	a2, sp, 184
80006c26: 05 47        	addi	a4, zero, 1
80006c28: 81 47        	mv	a5, zero
80006c2a: 2a f9        	sd	a0, 176(sp)
80006c2c: 32 85        	add	a0, zero, a2
80006c2e: 3a 86        	add	a2, zero, a4
80006c30: 3e 87        	add	a4, zero, a5
80006c32: 97 b0 ff ff  	auipc	ra, 1048571
80006c36: e7 80 60 aa  	jalr	-1370(ra)
80006c3a: 09 a0        	j	2 <.LBB0_38+0x20>
80006c3c: 28 19        	addi	a0, sp, 184
80006c3e: 97 e0 ff ff  	auipc	ra, 1048574
80006c42: e7 80 40 62  	jalr	1572(ra)
80006c46: 09 a0        	j	2 <.LBB0_38+0x2c>
80006c48: 4a 75        	ld	a0, 176(sp)
80006c4a: 97 00 00 00  	auipc	ra, 0
80006c4e: e7 80 80 27  	jalr	632(ra)
80006c52: aa f5        	sd	a0, 232(sp)
80006c54: ae f9        	sd	a1, 240(sp)
80006c56: 09 a0        	j	2 <.LBB0_38+0x3c>
80006c58: a8 11        	addi	a0, sp, 232
80006c5a: 97 00 00 00  	auipc	ra, 0
80006c5e: e7 80 60 4c  	jalr	1222(ra)
80006c62: 2a f5        	sd	a0, 168(sp)
80006c64: 09 a0        	j	2 <.LBB0_38+0x4a>
80006c66: 21 65        	lui	a0, 8
80006c68: 1b 05 05 e9  	addiw	a0, a0, -368
80006c6c: aa 75        	ld	a1, 168(sp)
80006c6e: 2e 95        	add	a0, a0, a1
80006c70: 2a fe        	sd	a0, 312(sp)
80006c72: 2a f1        	sd	a0, 160(sp)
80006c74: 97 c0 ff ff  	auipc	ra, 1048572
80006c78: e7 80 e0 04  	jalr	78(ra)
80006c7c: 2a ed        	sd	a0, 152(sp)
80006c7e: 09 a0        	j	2 <.LBB0_38+0x64>
80006c80: a8 11        	addi	a0, sp, 232
80006c82: 97 00 00 00  	auipc	ra, 0
80006c86: e7 80 e0 49  	jalr	1182(ra)
80006c8a: 2a e9        	sd	a0, 144(sp)
80006c8c: 09 a0        	j	2 <.LBB0_38+0x72>
80006c8e: 21 65        	lui	a0, 8
80006c90: 1b 05 85 eb  	addiw	a0, a0, -328
80006c94: ca 65        	ld	a1, 144(sp)
80006c96: 2e 95        	add	a0, a0, a1
80006c98: 6a 66        	ld	a2, 152(sp)
80006c9a: 10 e1        	sd	a2, 0(a0)
80006c9c: 0a 75        	ld	a0, 160(sp)
80006c9e: 97 c0 ff ff  	auipc	ra, 1048572
80006ca2: e7 80 40 02  	jalr	36(ra)
80006ca6: 2a e5        	sd	a0, 136(sp)
80006ca8: 09 a0        	j	2 <.LBB0_38+0x8e>
80006caa: a8 11        	addi	a0, sp, 232
80006cac: 97 00 00 00  	auipc	ra, 0
80006cb0: e7 80 40 47  	jalr	1140(ra)
80006cb4: 2a e1        	sd	a0, 128(sp)
80006cb6: 09 a0        	j	2 <.LBB0_38+0x9c>
80006cb8: 21 65        	lui	a0, 8
80006cba: 1b 05 05 ec  	addiw	a0, a0, -320
80006cbe: 8a 65        	ld	a1, 128(sp)
80006cc0: 2e 95        	add	a0, a0, a1
80006cc2: 2a 66        	ld	a2, 136(sp)
80006cc4: 10 e1        	sd	a2, 0(a0)
80006cc6: 01 45        	mv	a0, zero
80006cc8: aa fd        	sd	a0, 248(sp)
80006cca: f9 46        	addi	a3, zero, 30
80006ccc: 36 e2        	sd	a3, 256(sp)
80006cce: b6 85        	add	a1, zero, a3
80006cd0: 97 40 00 00  	auipc	ra, 4
80006cd4: e7 80 00 f2  	jalr	-224(ra)
80006cd8: aa fc        	sd	a0, 120(sp)
80006cda: ae f8        	sd	a1, 112(sp)
80006cdc: 09 a0        	j	2 <.LBB0_38+0xc2>
80006cde: 66 75        	ld	a0, 120(sp)
80006ce0: 2a e6        	sd	a0, 264(sp)
80006ce2: c6 75        	ld	a1, 112(sp)
80006ce4: 2e ea        	sd	a1, 272(sp)
80006ce6: 09 a0        	j	2 <.LBB0_38+0xcc>
80006ce8: 28 02        	addi	a0, sp, 264
80006cea: 97 40 00 00  	auipc	ra, 4
80006cee: e7 80 80 e9  	jalr	-360(ra)
80006cf2: 2a ee        	sd	a0, 280(sp)
80006cf4: 2e f2        	sd	a1, 288(sp)
80006cf6: 09 a0        	j	2 <.LBB0_38+0xdc>
80006cf8: 72 65        	ld	a0, 280(sp)
80006cfa: 81 45        	mv	a1, zero
80006cfc: 63 04 b5 00  	beq	a0, a1, 8 <.LBB0_38+0xe8>
80006d00: 09 a0        	j	2 <.LBB0_38+0xe6>
80006d02: 09 a8        	j	18 <.LBB0_38+0xf8>
80006d04: 2e 75        	ld	a0, 232(sp)
80006d06: ce 75        	ld	a1, 240(sp)
80006d08: 97 b0 ff ff  	auipc	ra, 1048571
80006d0c: e7 80 80 a5  	jalr	-1448(ra)
80006d10: 91 aa        	j	340 <.LBB0_39+0x78>
80006d12: 00 00        	unimp	
80006d14: 12 75        	ld	a0, 288(sp)
80006d16: aa e2        	sd	a0, 320(sp)
80006d18: aa e6        	sd	a0, 328(sp)
80006d1a: aa ea        	sd	a0, 336(sp)
80006d1c: ac 11        	addi	a1, sp, 232
80006d1e: aa f4        	sd	a0, 104(sp)
80006d20: 2e 85        	add	a0, zero, a1
80006d22: 97 00 00 00  	auipc	ra, 0
80006d26: e7 80 40 3f  	jalr	1012(ra)
80006d2a: aa f0        	sd	a0, 96(sp)
80006d2c: 09 a0        	j	2 <.LBB0_38+0x112>
80006d2e: 21 65        	lui	a0, 8
80006d30: 1b 05 05 ec  	addiw	a0, a0, -320
80006d34: 86 75        	ld	a1, 96(sp)
80006d36: 2e 95        	add	a0, a0, a1
80006d38: 08 61        	ld	a0, 0(a0)
80006d3a: b0 11        	addi	a2, sp, 232
80006d3c: aa ec        	sd	a0, 88(sp)
80006d3e: 32 85        	add	a0, zero, a2
80006d40: 97 00 00 00  	auipc	ra, 0
80006d44: e7 80 00 3e  	jalr	992(ra)
80006d48: aa e8        	sd	a0, 80(sp)
80006d4a: 09 a0        	j	2 <.LBB0_38+0x130>
80006d4c: 75 45        	addi	a0, zero, 29
80006d4e: a6 75        	ld	a1, 104(sp)
80006d50: 63 6d b5 10  	bltu	a0, a1, 282 <.LBB0_40>
80006d54: 09 a0        	j	2 <.LBB0_38+0x13a>
80006d56: 13 05 80 43  	addi	a0, zero, 1080
80006d5a: a6 75        	ld	a1, 104(sp)
80006d5c: 33 85 a5 02  	<unknown>
80006d60: 46 66        	ld	a2, 80(sp)
80006d62: 32 95        	add	a0, a0, a2
80006d64: e6 66        	ld	a3, 88(sp)
80006d66: 14 f9        	sd	a3, 48(a0)
80006d68: 0a 75        	ld	a0, 160(sp)
80006d6a: 97 c0 ff ff  	auipc	ra, 1048572
80006d6e: e7 80 80 f5  	jalr	-168(ra)
80006d72: aa e4        	sd	a0, 72(sp)
80006d74: 09 a0        	j	2 <.LBB0_38+0x15a>
80006d76: a8 11        	addi	a0, sp, 232
80006d78: 97 00 00 00  	auipc	ra, 0
80006d7c: e7 80 80 3a  	jalr	936(ra)
80006d80: aa e0        	sd	a0, 64(sp)
80006d82: 09 a0        	j	2 <.LBB0_38+0x168>
80006d84: 75 45        	addi	a0, zero, 29
80006d86: a6 75        	ld	a1, 104(sp)
80006d88: 63 6c b5 0e  	bltu	a0, a1, 248 <.LBB0_41>
80006d8c: 09 a0        	j	2 <.LBB0_38+0x172>
80006d8e: 13 05 80 43  	addi	a0, zero, 1080
80006d92: a6 75        	ld	a1, 104(sp)
80006d94: 33 85 a5 02  	<unknown>
80006d98: 06 66        	ld	a2, 64(sp)
80006d9a: 32 95        	add	a0, a0, a2
80006d9c: a6 66        	ld	a3, 72(sp)
80006d9e: 14 f5        	sd	a3, 40(a0)
80006da0: a8 11        	addi	a0, sp, 232
80006da2: 97 00 00 00  	auipc	ra, 0
80006da6: e7 80 e0 37  	jalr	894(ra)
80006daa: 2a fc        	sd	a0, 56(sp)
80006dac: 09 a0        	j	2 <.LBB0_38+0x192>
80006dae: 75 45        	addi	a0, zero, 29
80006db0: a6 75        	ld	a1, 104(sp)
80006db2: 63 62 b5 0e  	bltu	a0, a1, 228 <.LBB0_42>
80006db6: 09 a0        	j	2 <.LBB0_38+0x19c>
80006db8: 13 05 80 43  	addi	a0, zero, 1080
80006dbc: a6 75        	ld	a1, 104(sp)
80006dbe: 33 85 a5 02  	<unknown>
80006dc2: 62 76        	ld	a2, 56(sp)
80006dc4: 32 95        	add	a0, a0, a2
80006dc6: 97 c0 ff ff  	auipc	ra, 1048572
80006dca: e7 80 c0 ef  	jalr	-260(ra)
80006dce: 2a f8        	sd	a0, 48(sp)
80006dd0: 09 a0        	j	2 <.LBB0_38+0x1b6>
80006dd2: a8 11        	addi	a0, sp, 232
80006dd4: 97 00 00 00  	auipc	ra, 0
80006dd8: e7 80 20 34  	jalr	834(ra)
80006ddc: 2a f4        	sd	a0, 40(sp)
80006dde: 09 a0        	j	2 <.LBB0_38+0x1c4>
80006de0: 21 65        	lui	a0, 8
80006de2: 1b 05 05 ec  	addiw	a0, a0, -320
80006de6: a2 75        	ld	a1, 40(sp)
80006de8: 2e 95        	add	a0, a0, a1
80006dea: 08 61        	ld	a0, 0(a0)

0000000080006dec <.LBB0_39>:
80006dec: 97 85 00 00  	auipc	a1, 8
80006df0: 93 85 45 05  	addi	a1, a1, 84
80006df4: 97 d0 ff ff  	auipc	ra, 1048573
80006df8: e7 80 40 3c  	jalr	964(ra)
80006dfc: 2a f6        	sd	a0, 296(sp)
80006dfe: 09 a0        	j	2 <.LBB0_39+0x14>
80006e00: 28 12        	addi	a0, sp, 296
80006e02: 97 c0 ff ff  	auipc	ra, 1048572
80006e06: e7 80 80 f1  	jalr	-232(ra)
80006e0a: 2a f0        	sd	a0, 32(sp)
80006e0c: 09 a0        	j	2 <.LBB0_39+0x22>
80006e0e: 42 75        	ld	a0, 48(sp)
80006e10: 82 75        	ld	a1, 32(sp)
80006e12: 88 f5        	sd	a0, 40(a1)
80006e14: a8 11        	addi	a0, sp, 232
80006e16: 97 00 00 00  	auipc	ra, 0
80006e1a: e7 80 a0 30  	jalr	778(ra)
80006e1e: 2a ec        	sd	a0, 24(sp)
80006e20: 09 a0        	j	2 <.LBB0_39+0x36>
80006e22: 75 45        	addi	a0, zero, 29
80006e24: a6 75        	ld	a1, 104(sp)
80006e26: 63 63 b5 08  	bltu	a0, a1, 134 <.LBB0_43>
80006e2a: 09 a0        	j	2 <.LBB0_39+0x40>
80006e2c: 13 05 80 43  	addi	a0, zero, 1080
80006e30: a6 75        	ld	a1, 104(sp)
80006e32: 33 85 a5 02  	<unknown>
80006e36: 62 66        	ld	a2, 24(sp)
80006e38: 32 95        	add	a0, a0, a2
80006e3a: 97 c0 ff ff  	auipc	ra, 1048572
80006e3e: e7 80 80 e8  	jalr	-376(ra)
80006e42: 2a e8        	sd	a0, 16(sp)
80006e44: 09 a0        	j	2 <.LBB0_39+0x5a>
80006e46: a8 11        	addi	a0, sp, 232
80006e48: 97 00 00 00  	auipc	ra, 0
80006e4c: e7 80 80 2d  	jalr	728(ra)
80006e50: 2a e4        	sd	a0, 8(sp)
80006e52: 09 a0        	j	2 <.LBB0_39+0x68>
80006e54: 21 65        	lui	a0, 8
80006e56: 1b 05 05 ec  	addiw	a0, a0, -320
80006e5a: a2 65        	ld	a1, 8(sp)
80006e5c: 2e 95        	add	a0, a0, a1
80006e5e: 42 66        	ld	a2, 16(sp)
80006e60: 10 e1        	sd	a2, 0(a0)
80006e62: 59 b5        	j	-378 <.LBB0_38+0xcc>
80006e64: f6 60        	ld	ra, 344(sp)
80006e66: 35 61        	addi	sp, sp, 352
80006e68: 82 80        	ret

0000000080006e6a <.LBB0_40>:
80006e6a: 17 86 00 00  	auipc	a2, 8
80006e6e: 13 06 e6 f8  	addi	a2, a2, -114
80006e72: f9 45        	addi	a1, zero, 30
80006e74: 26 75        	ld	a0, 104(sp)
80006e76: 97 50 00 00  	auipc	ra, 5
80006e7a: e7 80 00 8f  	jalr	-1808(ra)
80006e7e: 00 00        	unimp	

0000000080006e80 <.LBB0_41>:
80006e80: 17 86 00 00  	auipc	a2, 8
80006e84: 13 06 06 f9  	addi	a2, a2, -112
80006e88: f9 45        	addi	a1, zero, 30
80006e8a: 26 75        	ld	a0, 104(sp)
80006e8c: 97 50 00 00  	auipc	ra, 5
80006e90: e7 80 a0 8d  	jalr	-1830(ra)
80006e94: 00 00        	unimp	

0000000080006e96 <.LBB0_42>:
80006e96: 17 86 00 00  	auipc	a2, 8
80006e9a: 13 06 26 f9  	addi	a2, a2, -110
80006e9e: f9 45        	addi	a1, zero, 30
80006ea0: 26 75        	ld	a0, 104(sp)
80006ea2: 97 50 00 00  	auipc	ra, 5
80006ea6: e7 80 40 8c  	jalr	-1852(ra)
80006eaa: 00 00        	unimp	

0000000080006eac <.LBB0_43>:
80006eac: 17 86 00 00  	auipc	a2, 8
80006eb0: 13 06 c6 fa  	addi	a2, a2, -84
80006eb4: f9 45        	addi	a1, zero, 30
80006eb6: 26 75        	ld	a0, 104(sp)
80006eb8: 97 50 00 00  	auipc	ra, 5
80006ebc: e7 80 e0 8a  	jalr	-1874(ra)
80006ec0: 00 00        	unimp	

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE:

0000000080006ec2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE>:
80006ec2: 39 71        	addi	sp, sp, -64
80006ec4: 06 fc        	sd	ra, 56(sp)
80006ec6: 2a f0        	sd	a0, 32(sp)
80006ec8: 97 00 00 00  	auipc	ra, 0
80006ecc: e7 80 20 0e  	jalr	226(ra)
80006ed0: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x10>
80006ed2: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x12>
80006ed4: 02 75        	ld	a0, 32(sp)
80006ed6: 45 05        	addi	a0, a0, 17
80006ed8: 97 b0 ff ff  	auipc	ra, 1048571
80006edc: e7 80 80 7b  	jalr	1976(ra)
80006ee0: 2a ec        	sd	a0, 24(sp)
80006ee2: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x22>
80006ee4: 62 65        	ld	a0, 24(sp)
80006ee6: 11 e9        	bnez	a0, 20 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x38>
80006ee8: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x28>
80006eea: 02 75        	ld	a0, 32(sp)
80006eec: 45 05        	addi	a0, a0, 17
80006eee: 85 45        	addi	a1, zero, 1
80006ef0: 97 b0 ff ff  	auipc	ra, 1048571
80006ef4: e7 80 e0 7b  	jalr	1982(ra)
80006ef8: 01 a8        	j	16 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x46>
80006efa: 02 75        	ld	a0, 32(sp)
80006efc: 97 00 00 00  	auipc	ra, 0
80006f00: e7 80 c0 03  	jalr	60(ra)
80006f04: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x44>
80006f06: f9 b7        	j	-50 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x12>
80006f08: 02 75        	ld	a0, 32(sp)
80006f0a: 97 00 00 00  	auipc	ra, 0
80006f0e: e7 80 40 16  	jalr	356(ra)
80006f12: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x52>
80006f14: 02 75        	ld	a0, 32(sp)
80006f16: 93 05 85 01  	addi	a1, a0, 24
80006f1a: 2a e8        	sd	a0, 16(sp)
80006f1c: 2e 85        	add	a0, zero, a1
80006f1e: 97 c0 ff ff  	auipc	ra, 1048572
80006f22: e7 80 c0 87  	jalr	-1924(ra)
80006f26: 2a e4        	sd	a0, 8(sp)
80006f28: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$4lock17h562ede97bef4729cE+0x68>
80006f2a: 42 65        	ld	a0, 16(sp)
80006f2c: 2a f4        	sd	a0, 40(sp)
80006f2e: a2 65        	ld	a1, 8(sp)
80006f30: 2e f8        	sd	a1, 48(sp)
80006f32: e2 70        	ld	ra, 56(sp)
80006f34: 21 61        	addi	sp, sp, 64
80006f36: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$5sleep17hada45df5b5af5911E:

0000000080006f38 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$5sleep17hada45df5b5af5911E>:
80006f38: 41 11        	addi	sp, sp, -16
80006f3a: 2a e4        	sd	a0, 8(sp)
80006f3c: 41 01        	addi	sp, sp, 16
80006f3e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E:

0000000080006f40 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E>:
80006f40: 01 11        	addi	sp, sp, -32
80006f42: 06 ec        	sd	ra, 24(sp)
80006f44: 2a e8        	sd	a0, 16(sp)
80006f46: 2a e4        	sd	a0, 8(sp)
80006f48: 97 00 00 00  	auipc	ra, 0
80006f4c: e7 80 20 06  	jalr	98(ra)
80006f50: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E+0x12>
80006f52: 22 65        	ld	a0, 8(sp)
80006f54: 45 05        	addi	a0, a0, 17
80006f56: 81 45        	mv	a1, zero
80006f58: 97 b0 ff ff  	auipc	ra, 1048571
80006f5c: e7 80 60 75  	jalr	1878(ra)
80006f60: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E+0x22>
80006f62: 22 65        	ld	a0, 8(sp)
80006f64: 97 00 00 00  	auipc	ra, 0
80006f68: e7 80 c0 01  	jalr	28(ra)
80006f6c: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E+0x2e>
80006f6e: 22 65        	ld	a0, 8(sp)
80006f70: 97 00 00 00  	auipc	ra, 0
80006f74: e7 80 e0 0f  	jalr	254(ra)
80006f78: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6unlock17he3281825a70eed04E+0x3a>
80006f7a: e2 60        	ld	ra, 24(sp)
80006f7c: 05 61        	addi	sp, sp, 32
80006f7e: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6wakeup17h346fa7bd87343dd5E:

0000000080006f80 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$6wakeup17h346fa7bd87343dd5E>:
80006f80: 41 11        	addi	sp, sp, -16
80006f82: 2a e4        	sd	a0, 8(sp)
80006f84: 41 01        	addi	sp, sp, 16
80006f86: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7holding17h5990b470a7b6f9d4E:

0000000080006f88 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7holding17h5990b470a7b6f9d4E>:
80006f88: 01 11        	addi	sp, sp, -32
80006f8a: 06 ec        	sd	ra, 24(sp)
80006f8c: 2a e8        	sd	a0, 16(sp)
80006f8e: 41 05        	addi	a0, a0, 16
80006f90: 81 45        	mv	a1, zero
80006f92: a3 07 b1 00  	sb	a1, 15(sp)
80006f96: 97 20 00 00  	auipc	ra, 2
80006f9a: e7 80 e0 fa  	jalr	-82(ra)
80006f9e: 2a e0        	sd	a0, 0(sp)
80006fa0: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7holding17h5990b470a7b6f9d4E+0x1a>
80006fa2: 02 65        	ld	a0, 0(sp)
80006fa4: e2 60        	ld	ra, 24(sp)
80006fa6: 05 61        	addi	sp, sp, 32
80006fa8: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7acquire17h723d96a49718473aE:

0000000080006faa <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7acquire17h723d96a49718473aE>:
80006faa: 35 71        	addi	sp, sp, -160
80006fac: 06 ed        	sd	ra, 152(sp)
80006fae: 2a e5        	sd	a0, 136(sp)
80006fb0: 2a f8        	sd	a0, 48(sp)
80006fb2: 97 c0 ff ff  	auipc	ra, 1048572
80006fb6: e7 80 e0 a7  	jalr	-1410(ra)
80006fba: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7acquire17h723d96a49718473aE+0x12>
80006fbc: 42 75        	ld	a0, 48(sp)
80006fbe: 97 00 00 00  	auipc	ra, 0
80006fc2: e7 80 a0 fc  	jalr	-54(ra)
80006fc6: 2a f4        	sd	a0, 40(sp)
80006fc8: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7acquire17h723d96a49718473aE+0x20>
80006fca: 01 45        	mv	a0, zero
80006fcc: a2 75        	ld	a1, 40(sp)
80006fce: 63 81 a5 02  	beq	a1, a0, 34 <.LBB5_13+0x16>
80006fd2: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7acquire17h723d96a49718473aE+0x2a>
80006fd4: 42 75        	ld	a0, 48(sp)
80006fd6: aa fc        	sd	a0, 120(sp)
80006fd8: 2a e9        	sd	a0, 144(sp)

0000000080006fda <.LBB5_13>:
80006fda: 97 a5 ff ff  	auipc	a1, 1048570
80006fde: 93 85 45 62  	addi	a1, a1, 1572
80006fe2: 97 a0 ff ff  	auipc	ra, 1048570
80006fe6: e7 80 c0 68  	jalr	1676(ra)
80006fea: 2a f0        	sd	a0, 32(sp)
80006fec: 2e ec        	sd	a1, 24(sp)
80006fee: 11 a0        	j	4 <.LBB5_13+0x18>
80006ff0: 25 a8        	j	56 <.LBB5_15+0x14>
80006ff2: 02 75        	ld	a0, 32(sp)
80006ff4: aa f4        	sd	a0, 104(sp)
80006ff6: e2 65        	ld	a1, 24(sp)
80006ff8: ae f8        	sd	a1, 112(sp)

0000000080006ffa <.LBB5_14>:
80006ffa: 97 85 00 00  	auipc	a1, 8
80006ffe: 93 85 65 e8  	addi	a1, a1, -378
80007002: 28 18        	addi	a0, sp, 56
80007004: 09 46        	addi	a2, zero, 2
80007006: b4 10        	addi	a3, sp, 104
80007008: 05 47        	addi	a4, zero, 1
8000700a: 97 a0 ff ff  	auipc	ra, 1048570
8000700e: e7 80 e0 6c  	jalr	1742(ra)
80007012: 09 a0        	j	2 <.LBB5_15>

0000000080007014 <.LBB5_15>:
80007014: 97 85 00 00  	auipc	a1, 8
80007018: 93 85 45 ea  	addi	a1, a1, -348
8000701c: 28 18        	addi	a0, sp, 56
8000701e: 97 40 00 00  	auipc	ra, 4
80007022: e7 80 80 78  	jalr	1928(ra)
80007026: 00 00        	unimp	
80007028: 42 75        	ld	a0, 48(sp)
8000702a: 41 05        	addi	a0, a0, 16
8000702c: 89 45        	addi	a1, zero, 2
8000702e: 23 03 b1 08  	sb	a1, 134(sp)
80007032: 05 46        	addi	a2, zero, 1
80007034: 2e e8        	sd	a1, 16(sp)
80007036: b2 85        	add	a1, zero, a2
80007038: 42 66        	ld	a2, 16(sp)
8000703a: 97 20 00 00  	auipc	ra, 2
8000703e: e7 80 40 f4  	jalr	-188(ra)
80007042: 2a e4        	sd	a0, 8(sp)
80007044: 09 a0        	j	2 <.LBB5_15+0x32>
80007046: 22 65        	ld	a0, 8(sp)
80007048: 11 e9        	bnez	a0, 20 <.LBB5_15+0x48>
8000704a: 09 a0        	j	2 <.LBB5_15+0x38>
8000704c: 11 45        	addi	a0, zero, 4
8000704e: a3 03 a1 08  	sb	a0, 135(sp)
80007052: 97 20 00 00  	auipc	ra, 2
80007056: e7 80 80 fa  	jalr	-88(ra)
8000705a: 39 a0        	j	14 <.LBB5_15+0x54>
8000705c: 97 10 00 00  	auipc	ra, 1
80007060: e7 80 e0 2b  	jalr	702(ra)
80007064: 09 a0        	j	2 <.LBB5_15+0x52>
80007066: c9 b7        	j	-62 <.LBB5_15+0x14>
80007068: ea 60        	ld	ra, 152(sp)
8000706a: 0d 61        	addi	sp, sp, 160
8000706c: 82 80        	ret

Disassembly of section .text._ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7release17h2272bab30ade5b0cE:

000000008000706e <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7release17h2272bab30ade5b0cE>:
8000706e: 75 71        	addi	sp, sp, -144
80007070: 06 e5        	sd	ra, 136(sp)
80007072: aa fc        	sd	a0, 120(sp)
80007074: 2a f0        	sd	a0, 32(sp)
80007076: 97 00 00 00  	auipc	ra, 0
8000707a: e7 80 20 f1  	jalr	-238(ra)
8000707e: 2a ec        	sd	a0, 24(sp)
80007080: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7release17h2272bab30ade5b0cE+0x14>
80007082: 62 65        	ld	a0, 24(sp)
80007084: 05 e1        	bnez	a0, 32 <.LBB6_9+0x16>
80007086: 09 a0        	j	2 <_ZN6kernel4lock9sleeplock18SleepLock$LT$T$GT$7release17h2272bab30ade5b0cE+0x1a>
80007088: 02 75        	ld	a0, 32(sp)
8000708a: aa f4        	sd	a0, 104(sp)
8000708c: 2a e1        	sd	a0, 128(sp)

000000008000708e <.LBB6_9>:
8000708e: 97 a5 ff ff  	auipc	a1, 1048570
80007092: 93 85 05 57  	addi	a1, a1, 1392
80007096: 97 a0 ff ff  	auipc	ra, 1048570
8000709a: e7 80 80 5d  	jalr	1496(ra)
8000709e: 2a e8        	sd	a0, 16(sp)
800070a0: 2e e4        	sd	a1, 8(sp)
800070a2: 09 a8        	j	18 <.LBB6_9+0x26>
800070a4: 11 45        	addi	a0, zero, 4
800070a6: 23 0b a1 06  	sb	a0, 118(sp)
800070aa: 97 20 00 00  	auipc	ra, 2
800070ae: e7 80 00 f5  	jalr	-176(ra)
800070b2: 25 a8        	j	56 <.LBB6_11+0x14>
800070b4: 42 65        	ld	a0, 16(sp)
800070b6: aa ec        	sd	a0, 88(sp)
800070b8: a2 65        	ld	a1, 8(sp)
800070ba: ae f0        	sd	a1, 96(sp)

00000000800070bc <.LBB6_10>:
800070bc: 97 85 00 00  	auipc	a1, 8
800070c0: 93 85 45 e1  	addi	a1, a1, -492
800070c4: 28 10        	addi	a0, sp, 40
800070c6: 09 46        	addi	a2, zero, 2
800070c8: b4 08        	addi	a3, sp, 88
800070ca: 05 47        	addi	a4, zero, 1
800070cc: 97 a0 ff ff  	auipc	ra, 1048570
800070d0: e7 80 c0 60  	jalr	1548(ra)
800070d4: 09 a0        	j	2 <.LBB6_11>

00000000800070d6 <.LBB6_11>:
800070d6: 97 85 00 00  	auipc	a1, 8
800070da: 93 85 a5 e1  	addi	a1, a1, -486
800070de: 28 10        	addi	a0, sp, 40
800070e0: 97 40 00 00  	auipc	ra, 4
800070e4: e7 80 60 6c  	jalr	1734(ra)
800070e8: 00 00        	unimp	
800070ea: 02 75        	ld	a0, 32(sp)
800070ec: 41 05        	addi	a0, a0, 16
800070ee: 85 45        	addi	a1, zero, 1
800070f0: a3 0b b1 06  	sb	a1, 119(sp)
800070f4: 01 46        	mv	a2, zero
800070f6: 2e e0        	sd	a1, 0(sp)
800070f8: b2 85        	add	a1, zero, a2
800070fa: 02 66        	ld	a2, 0(sp)
800070fc: 97 20 00 00  	auipc	ra, 2
80007100: e7 80 60 ec  	jalr	-314(ra)
80007104: 09 a0        	j	2 <.LBB6_11+0x30>
80007106: 97 c0 ff ff  	auipc	ra, 1048572
8000710a: e7 80 e0 9a  	jalr	-1618(ra)
8000710e: 09 a0        	j	2 <.LBB6_11+0x3a>
80007110: aa 60        	ld	ra, 136(sp)
80007112: 49 61        	addi	sp, sp, 144
80007114: 82 80        	ret

Disassembly of section .text._ZN92_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3d268c7b6c49723E:

0000000080007116 <_ZN92_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3d268c7b6c49723E>:
80007116: 41 11        	addi	sp, sp, -16
80007118: 2a e4        	sd	a0, 8(sp)
8000711a: 08 65        	ld	a0, 8(a0)
8000711c: 41 01        	addi	sp, sp, 16
8000711e: 82 80        	ret

Disassembly of section .text._ZN95_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h188c2c5204330443E:

0000000080007120 <_ZN95_$LT$kernel..lock..sleeplock..SleepLockGuard$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h188c2c5204330443E>:
80007120: 41 11        	addi	sp, sp, -16
80007122: 2a e4        	sd	a0, 8(sp)
80007124: 08 65        	ld	a0, 8(a0)
80007126: 41 01        	addi	sp, sp, 16
80007128: 82 80        	ret

Disassembly of section .text.kvminit:

000000008000712a <kvminit>:
8000712a: 59 71        	addi	sp, sp, -112
8000712c: 86 f4        	sd	ra, 104(sp)

000000008000712e <.LBB0_6>:
8000712e: 97 85 00 00  	auipc	a1, 8
80007132: 93 85 a5 de  	addi	a1, a1, -534

0000000080007136 <.LBB0_7>:
80007136: 97 86 00 00  	auipc	a3, 8
8000713a: 93 86 26 df  	addi	a3, a3, -526
8000713e: 28 00        	addi	a0, sp, 8
80007140: 05 46        	addi	a2, zero, 1
80007142: 01 47        	mv	a4, zero
80007144: 97 a0 ff ff  	auipc	ra, 1048570
80007148: e7 80 40 59  	jalr	1428(ra)
8000714c: 09 a0        	j	2 <.LBB0_7+0x18>
8000714e: 28 00        	addi	a0, sp, 8
80007150: 97 e0 ff ff  	auipc	ra, 1048574
80007154: e7 80 20 11  	jalr	274(ra)
80007158: 09 a0        	j	2 <.LBB0_7+0x24>
8000715a: 97 00 00 00  	auipc	ra, 0
8000715e: e7 80 80 0c  	jalr	200(ra)
80007162: 09 a0        	j	2 <.LBB0_8>

0000000080007164 <.LBB0_8>:
80007164: 97 85 00 00  	auipc	a1, 8
80007168: 93 85 c5 dd  	addi	a1, a1, -548

000000008000716c <.LBB0_9>:
8000716c: 97 86 00 00  	auipc	a3, 8
80007170: 93 86 c6 db  	addi	a3, a3, -580
80007174: 28 18        	addi	a0, sp, 56
80007176: 05 46        	addi	a2, zero, 1
80007178: 01 47        	mv	a4, zero
8000717a: 97 a0 ff ff  	auipc	ra, 1048570
8000717e: e7 80 e0 55  	jalr	1374(ra)
80007182: 09 a0        	j	2 <.LBB0_9+0x18>
80007184: 28 18        	addi	a0, sp, 56
80007186: 97 e0 ff ff  	auipc	ra, 1048574
8000718a: e7 80 c0 0d  	jalr	220(ra)
8000718e: 09 a0        	j	2 <.LBB0_9+0x24>
80007190: a6 70        	ld	ra, 104(sp)
80007192: 65 61        	addi	sp, sp, 112
80007194: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping3kvm11kvminithart17hfdfa91dc9e2f522dE:

0000000080007196 <_ZN6kernel6memory7mapping3kvm11kvminithart17hfdfa91dc9e2f522dE>:
80007196: 59 71        	addi	sp, sp, -112
80007198: 86 f4        	sd	ra, 104(sp)

000000008000719a <.LBB1_8>:
8000719a: 97 85 00 00  	auipc	a1, 8
8000719e: 93 85 e5 dc  	addi	a1, a1, -562

00000000800071a2 <.LBB1_9>:
800071a2: 97 86 00 00  	auipc	a3, 8
800071a6: 93 86 66 d8  	addi	a3, a3, -634
800071aa: 28 00        	addi	a0, sp, 8
800071ac: 05 46        	addi	a2, zero, 1
800071ae: 01 47        	mv	a4, zero
800071b0: 97 a0 ff ff  	auipc	ra, 1048570
800071b4: e7 80 80 52  	jalr	1320(ra)
800071b8: 09 a0        	j	2 <.LBB1_9+0x18>
800071ba: 28 00        	addi	a0, sp, 8
800071bc: 97 e0 ff ff  	auipc	ra, 1048574
800071c0: e7 80 60 0a  	jalr	166(ra)
800071c4: 09 a0        	j	2 <.LBB1_10>

00000000800071c6 <.LBB1_10>:
800071c6: 17 15 02 00  	auipc	a0, 33
800071ca: 13 05 a5 e3  	addi	a0, a0, -454
800071ce: 97 10 00 00  	auipc	ra, 1
800071d2: e7 80 40 23  	jalr	564(ra)
800071d6: 2a e0        	sd	a0, 0(sp)
800071d8: 09 a0        	j	2 <.LBB1_10+0x14>
800071da: 02 65        	ld	a0, 0(sp)
800071dc: 97 f0 ff ff  	auipc	ra, 1048575
800071e0: e7 80 40 e5  	jalr	-428(ra)
800071e4: 09 a0        	j	2 <.LBB1_10+0x20>
800071e6: 97 10 00 00  	auipc	ra, 1
800071ea: e7 80 60 b9  	jalr	-1130(ra)
800071ee: 09 a0        	j	2 <.LBB1_11>

00000000800071f0 <.LBB1_11>:
800071f0: 97 85 00 00  	auipc	a1, 8
800071f4: 93 85 05 da  	addi	a1, a1, -608

00000000800071f8 <.LBB1_12>:
800071f8: 97 86 00 00  	auipc	a3, 8
800071fc: 93 86 06 d3  	addi	a3, a3, -720
80007200: 28 18        	addi	a0, sp, 56
80007202: 05 46        	addi	a2, zero, 1
80007204: 01 47        	mv	a4, zero
80007206: 97 a0 ff ff  	auipc	ra, 1048570
8000720a: e7 80 20 4d  	jalr	1234(ra)
8000720e: 09 a0        	j	2 <.LBB1_12+0x18>
80007210: 28 18        	addi	a0, sp, 56
80007212: 97 e0 ff ff  	auipc	ra, 1048574
80007216: e7 80 00 05  	jalr	80(ra)
8000721a: 09 a0        	j	2 <.LBB1_12+0x24>
8000721c: a6 70        	ld	ra, 104(sp)
8000721e: 65 61        	addi	sp, sp, 112
80007220: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping3kvm7kvmmake17hd73b66e59e66d482E:

0000000080007222 <_ZN6kernel6memory7mapping3kvm7kvmmake17hd73b66e59e66d482E>:
80007222: 13 01 01 d6  	addi	sp, sp, -672
80007226: 23 3c 11 28  	sd	ra, 664(sp)

000000008000722a <.LBB2_54>:
8000722a: 97 85 00 00  	auipc	a1, 8
8000722e: 93 85 e5 d8  	addi	a1, a1, -626

0000000080007232 <.LBB2_55>:
80007232: 97 86 00 00  	auipc	a3, 8
80007236: 93 86 66 cf  	addi	a3, a3, -778
8000723a: a8 09        	addi	a0, sp, 216
8000723c: 05 46        	addi	a2, zero, 1
8000723e: 01 47        	mv	a4, zero
80007240: 97 a0 ff ff  	auipc	ra, 1048570
80007244: e7 80 80 49  	jalr	1176(ra)
80007248: 09 a0        	j	2 <.LBB2_55+0x18>
8000724a: a8 09        	addi	a0, sp, 216
8000724c: 97 e0 ff ff  	auipc	ra, 1048574
80007250: e7 80 60 01  	jalr	22(ra)
80007254: 09 a0        	j	2 <.LBB2_56>

0000000080007256 <.LBB2_56>:
80007256: 97 85 00 00  	auipc	a1, 8
8000725a: 93 85 25 d8  	addi	a1, a1, -638

000000008000725e <.LBB2_57>:
8000725e: 97 86 00 00  	auipc	a3, 8
80007262: 93 86 a6 cc  	addi	a3, a3, -822
80007266: 28 02        	addi	a0, sp, 264
80007268: 05 46        	addi	a2, zero, 1
8000726a: 01 47        	mv	a4, zero
8000726c: 97 a0 ff ff  	auipc	ra, 1048570
80007270: e7 80 c0 46  	jalr	1132(ra)
80007274: 09 a0        	j	2 <.LBB2_57+0x18>
80007276: 28 02        	addi	a0, sp, 264
80007278: 97 e0 ff ff  	auipc	ra, 1048574
8000727c: e7 80 a0 fe  	jalr	-22(ra)
80007280: 09 a0        	j	2 <.LBB2_57+0x24>
80007282: 37 05 00 10  	lui	a0, 65536
80007286: 97 c0 ff ff  	auipc	ra, 1048572
8000728a: e7 80 80 7d  	jalr	2008(ra)
8000728e: aa e9        	sd	a0, 208(sp)
80007290: 09 a0        	j	2 <.LBB2_57+0x34>
80007292: 37 05 00 10  	lui	a0, 65536
80007296: 97 d0 ff ff  	auipc	ra, 1048573
8000729a: e7 80 e0 8a  	jalr	-1874(ra)
8000729e: aa e5        	sd	a0, 200(sp)
800072a0: 09 a0        	j	2 <.LBB2_57+0x44>
800072a2: 09 45        	addi	a0, zero, 2
800072a4: 91 45        	addi	a1, zero, 4
800072a6: 97 c0 ff ff  	auipc	ra, 1048572
800072aa: e7 80 e0 6e  	jalr	1774(ra)
800072ae: aa e1        	sd	a0, 192(sp)
800072b0: 09 a0        	j	2 <.LBB2_58>

00000000800072b2 <.LBB2_58>:
800072b2: 17 15 02 00  	auipc	a0, 33
800072b6: 13 05 e5 d4  	addi	a0, a0, -690
800072ba: 85 66        	lui	a3, 1
800072bc: ce 65        	ld	a1, 208(sp)
800072be: 2e 66        	ld	a2, 200(sp)
800072c0: 0e 67        	ld	a4, 192(sp)
800072c2: 97 10 00 00  	auipc	ra, 1
800072c6: e7 80 40 7c  	jalr	1988(ra)
800072ca: 09 a0        	j	2 <.LBB2_59>

00000000800072cc <.LBB2_59>:
800072cc: 97 85 00 00  	auipc	a1, 8
800072d0: 93 85 45 d3  	addi	a1, a1, -716

00000000800072d4 <.LBB2_60>:
800072d4: 97 86 00 00  	auipc	a3, 8
800072d8: 93 86 46 c5  	addi	a3, a3, -940
800072dc: 28 1a        	addi	a0, sp, 312
800072de: 05 46        	addi	a2, zero, 1
800072e0: 01 47        	mv	a4, zero
800072e2: 97 a0 ff ff  	auipc	ra, 1048570
800072e6: e7 80 60 3f  	jalr	1014(ra)
800072ea: 09 a0        	j	2 <.LBB2_60+0x18>
800072ec: 28 1a        	addi	a0, sp, 312
800072ee: 97 e0 ff ff  	auipc	ra, 1048574
800072f2: e7 80 40 f7  	jalr	-140(ra)
800072f6: 09 a0        	j	2 <.LBB2_60+0x24>
800072f8: 37 15 00 10  	lui	a0, 65537
800072fc: 97 c0 ff ff  	auipc	ra, 1048572
80007300: e7 80 20 76  	jalr	1890(ra)
80007304: 2a fd        	sd	a0, 184(sp)
80007306: 09 a0        	j	2 <.LBB2_60+0x34>
80007308: 37 15 00 10  	lui	a0, 65537
8000730c: 97 d0 ff ff  	auipc	ra, 1048573
80007310: e7 80 80 83  	jalr	-1992(ra)
80007314: 2a f9        	sd	a0, 176(sp)
80007316: 09 a0        	j	2 <.LBB2_60+0x44>
80007318: 09 45        	addi	a0, zero, 2
8000731a: 91 45        	addi	a1, zero, 4
8000731c: 97 c0 ff ff  	auipc	ra, 1048572
80007320: e7 80 80 67  	jalr	1656(ra)
80007324: 2a f5        	sd	a0, 168(sp)
80007326: 09 a0        	j	2 <.LBB2_61>

0000000080007328 <.LBB2_61>:
80007328: 17 15 02 00  	auipc	a0, 33
8000732c: 13 05 85 cd  	addi	a0, a0, -808
80007330: 85 66        	lui	a3, 1
80007332: ea 75        	ld	a1, 184(sp)
80007334: 4a 76        	ld	a2, 176(sp)
80007336: 2a 77        	ld	a4, 168(sp)
80007338: 97 10 00 00  	auipc	ra, 1
8000733c: e7 80 e0 74  	jalr	1870(ra)
80007340: 09 a0        	j	2 <.LBB2_62>

0000000080007342 <.LBB2_62>:
80007342: 97 85 00 00  	auipc	a1, 8
80007346: 93 85 e5 cd  	addi	a1, a1, -802

000000008000734a <.LBB2_63>:
8000734a: 97 86 00 00  	auipc	a3, 8
8000734e: 93 86 e6 bd  	addi	a3, a3, -1058
80007352: a8 12        	addi	a0, sp, 360
80007354: 05 46        	addi	a2, zero, 1
80007356: 01 47        	mv	a4, zero
80007358: 97 a0 ff ff  	auipc	ra, 1048570
8000735c: e7 80 00 38  	jalr	896(ra)
80007360: 09 a0        	j	2 <.LBB2_63+0x18>
80007362: a8 12        	addi	a0, sp, 360
80007364: 97 e0 ff ff  	auipc	ra, 1048574
80007368: e7 80 e0 ef  	jalr	-258(ra)
8000736c: 09 a0        	j	2 <.LBB2_64>

000000008000736e <.LBB2_64>:
8000736e: 17 65 00 00  	auipc	a0, 6
80007372: 13 05 25 43  	addi	a0, a0, 1074
80007376: 97 20 00 00  	auipc	ra, 2
8000737a: e7 80 80 04  	jalr	72(ra)
8000737e: 2a f1        	sd	a0, 160(sp)
80007380: 09 a0        	j	2 <.LBB2_64+0x14>
80007382: 0a 75        	ld	a0, 160(sp)
80007384: 97 c0 ff ff  	auipc	ra, 1048572
80007388: e7 80 a0 6d  	jalr	1754(ra)
8000738c: 2a ed        	sd	a0, 152(sp)
8000738e: 09 a0        	j	2 <.LBB2_65>

0000000080007390 <.LBB2_65>:
80007390: 17 65 00 00  	auipc	a0, 6
80007394: 13 05 05 41  	addi	a0, a0, 1040
80007398: 97 20 00 00  	auipc	ra, 2
8000739c: e7 80 60 02  	jalr	38(ra)
800073a0: 2a e9        	sd	a0, 144(sp)
800073a2: 09 a0        	j	2 <.LBB2_65+0x14>
800073a4: 4a 65        	ld	a0, 144(sp)
800073a6: 97 c0 ff ff  	auipc	ra, 1048572
800073aa: e7 80 e0 79  	jalr	1950(ra)
800073ae: 2a e5        	sd	a0, 136(sp)
800073b0: 09 a0        	j	2 <.LBB2_65+0x22>
800073b2: 09 45        	addi	a0, zero, 2
800073b4: 91 45        	addi	a1, zero, 4
800073b6: 97 c0 ff ff  	auipc	ra, 1048572
800073ba: e7 80 e0 5d  	jalr	1502(ra)
800073be: 2a e1        	sd	a0, 128(sp)
800073c0: 09 a0        	j	2 <.LBB2_66>

00000000800073c2 <.LBB2_66>:
800073c2: 17 15 02 00  	auipc	a0, 33
800073c6: 13 05 e5 c3  	addi	a0, a0, -962
800073ca: b7 06 40 00  	lui	a3, 1024
800073ce: ea 65        	ld	a1, 152(sp)
800073d0: 2a 66        	ld	a2, 136(sp)
800073d2: 0a 67        	ld	a4, 128(sp)
800073d4: 97 10 00 00  	auipc	ra, 1
800073d8: e7 80 20 6b  	jalr	1714(ra)
800073dc: 09 a0        	j	2 <.LBB2_67>

00000000800073de <.LBB2_67>:
800073de: 97 85 00 00  	auipc	a1, 8
800073e2: 93 85 25 c6  	addi	a1, a1, -926

00000000800073e6 <.LBB2_68>:
800073e6: 97 86 00 00  	auipc	a3, 8
800073ea: 93 86 26 b4  	addi	a3, a3, -1214
800073ee: 28 0b        	addi	a0, sp, 408
800073f0: 05 46        	addi	a2, zero, 1
800073f2: 01 47        	mv	a4, zero
800073f4: 97 a0 ff ff  	auipc	ra, 1048570
800073f8: e7 80 40 2e  	jalr	740(ra)
800073fc: 09 a0        	j	2 <.LBB2_68+0x18>
800073fe: 28 0b        	addi	a0, sp, 408
80007400: 97 e0 ff ff  	auipc	ra, 1048574
80007404: e7 80 20 e6  	jalr	-414(ra)
80007408: 09 a0        	j	2 <.LBB2_69>

000000008000740a <.LBB2_69>:
8000740a: 17 65 00 00  	auipc	a0, 6
8000740e: 13 05 65 3b  	addi	a0, a0, 950
80007412: 97 20 00 00  	auipc	ra, 2
80007416: e7 80 c0 fa  	jalr	-84(ra)
8000741a: aa fc        	sd	a0, 120(sp)
8000741c: 09 a0        	j	2 <.LBB2_69+0x14>
8000741e: 66 75        	ld	a0, 120(sp)
80007420: 97 c0 ff ff  	auipc	ra, 1048572
80007424: e7 80 e0 63  	jalr	1598(ra)
80007428: aa f8        	sd	a0, 112(sp)
8000742a: 09 a0        	j	2 <.LBB2_70>

000000008000742c <.LBB2_70>:
8000742c: 17 65 00 00  	auipc	a0, 6
80007430: 13 05 45 39  	addi	a0, a0, 916
80007434: 97 20 00 00  	auipc	ra, 2
80007438: e7 80 a0 f8  	jalr	-118(ra)
8000743c: aa f4        	sd	a0, 104(sp)
8000743e: 09 a0        	j	2 <.LBB2_70+0x14>
80007440: 26 75        	ld	a0, 104(sp)
80007442: 97 c0 ff ff  	auipc	ra, 1048572
80007446: e7 80 20 70  	jalr	1794(ra)
8000744a: aa f0        	sd	a0, 96(sp)
8000744c: 09 a0        	j	2 <.LBB2_71>

000000008000744e <.LBB2_71>:
8000744e: 17 65 00 00  	auipc	a0, 6
80007452: 13 05 25 37  	addi	a0, a0, 882
80007456: 08 61        	ld	a0, 0(a0)
80007458: 23 34 a1 28  	sd	a0, 648(sp)
8000745c: 97 f0 ff ff  	auipc	ra, 1048575
80007460: e7 80 e0 dd  	jalr	-546(ra)
80007464: aa ec        	sd	a0, 88(sp)
80007466: 09 a0        	j	2 <.LBB2_72>

0000000080007468 <.LBB2_72>:
80007468: 17 b5 00 00  	auipc	a0, 11
8000746c: 13 05 85 b9  	addi	a0, a0, -1128
80007470: e6 65        	ld	a1, 88(sp)
80007472: 33 06 b5 40  	sub	a2, a0, a1
80007476: b2 e8        	sd	a2, 80(sp)
80007478: 63 68 c5 1c  	bltu	a0, a2, 464 <.LBB2_90>
8000747c: 09 a0        	j	2 <.LBB2_72+0x16>
8000747e: 09 45        	addi	a0, zero, 2
80007480: a1 45        	addi	a1, zero, 8
80007482: 97 c0 ff ff  	auipc	ra, 1048572
80007486: e7 80 20 51  	jalr	1298(ra)
8000748a: aa e4        	sd	a0, 72(sp)
8000748c: 09 a0        	j	2 <.LBB2_73>

000000008000748e <.LBB2_73>:
8000748e: 17 15 02 00  	auipc	a0, 33
80007492: 13 05 25 b7  	addi	a0, a0, -1166
80007496: c6 75        	ld	a1, 112(sp)
80007498: 06 76        	ld	a2, 96(sp)
8000749a: c6 66        	ld	a3, 80(sp)
8000749c: 26 67        	ld	a4, 72(sp)
8000749e: 97 10 00 00  	auipc	ra, 1
800074a2: e7 80 80 5e  	jalr	1512(ra)
800074a6: 09 a0        	j	2 <.LBB2_74>

00000000800074a8 <.LBB2_74>:
800074a8: 97 85 00 00  	auipc	a1, 8
800074ac: 93 85 05 c2  	addi	a1, a1, -992

00000000800074b0 <.LBB2_75>:
800074b0: 97 86 00 00  	auipc	a3, 8
800074b4: 93 86 86 a7  	addi	a3, a3, -1416
800074b8: a8 03        	addi	a0, sp, 456
800074ba: 05 46        	addi	a2, zero, 1
800074bc: 01 47        	mv	a4, zero
800074be: 97 a0 ff ff  	auipc	ra, 1048570
800074c2: e7 80 a0 21  	jalr	538(ra)
800074c6: 09 a0        	j	2 <.LBB2_75+0x18>
800074c8: a8 03        	addi	a0, sp, 456
800074ca: 97 e0 ff ff  	auipc	ra, 1048574
800074ce: e7 80 80 d9  	jalr	-616(ra)
800074d2: 09 a0        	j	2 <.LBB2_76>

00000000800074d4 <.LBB2_76>:
800074d4: 17 b5 00 00  	auipc	a0, 11
800074d8: 13 05 c5 b2  	addi	a0, a0, -1236
800074dc: 97 c0 ff ff  	auipc	ra, 1048572
800074e0: e7 80 20 58  	jalr	1410(ra)
800074e4: aa e0        	sd	a0, 64(sp)
800074e6: 09 a0        	j	2 <.LBB2_77>

00000000800074e8 <.LBB2_77>:
800074e8: 17 b5 00 00  	auipc	a0, 11
800074ec: 13 05 85 b1  	addi	a0, a0, -1256
800074f0: 97 c0 ff ff  	auipc	ra, 1048572
800074f4: e7 80 40 65  	jalr	1620(ra)
800074f8: 2a fc        	sd	a0, 56(sp)
800074fa: 09 a0        	j	2 <.LBB2_78>

00000000800074fc <.LBB2_78>:
800074fc: 17 65 00 00  	auipc	a0, 6
80007500: 13 05 45 2b  	addi	a0, a0, 692
80007504: 08 61        	ld	a0, 0(a0)
80007506: 23 38 a1 28  	sd	a0, 656(sp)
8000750a: 97 f0 ff ff  	auipc	ra, 1048575
8000750e: e7 80 00 d3  	jalr	-720(ra)
80007512: 2a f8        	sd	a0, 48(sp)
80007514: 09 a0        	j	2 <.LBB2_79>

0000000080007516 <.LBB2_79>:
80007516: 17 b5 00 00  	auipc	a0, 11
8000751a: 13 05 a5 ae  	addi	a0, a0, -1302
8000751e: c2 75        	ld	a1, 48(sp)
80007520: 33 85 a5 40  	sub	a0, a1, a0
80007524: 2a f4        	sd	a0, 40(sp)
80007526: 63 e0 a5 14  	bltu	a1, a0, 320 <.LBB2_92>
8000752a: 09 a0        	j	2 <.LBB2_79+0x16>
8000752c: 09 45        	addi	a0, zero, 2
8000752e: 91 45        	addi	a1, zero, 4
80007530: 97 c0 ff ff  	auipc	ra, 1048572
80007534: e7 80 40 46  	jalr	1124(ra)
80007538: 2a f0        	sd	a0, 32(sp)
8000753a: 09 a0        	j	2 <.LBB2_80>

000000008000753c <.LBB2_80>:
8000753c: 17 15 02 00  	auipc	a0, 33
80007540: 13 05 45 ac  	addi	a0, a0, -1340
80007544: 86 65        	ld	a1, 64(sp)
80007546: 62 76        	ld	a2, 56(sp)
80007548: a2 76        	ld	a3, 40(sp)
8000754a: 02 77        	ld	a4, 32(sp)
8000754c: 97 10 00 00  	auipc	ra, 1
80007550: e7 80 a0 53  	jalr	1338(ra)
80007554: 09 a0        	j	2 <.LBB2_81>

0000000080007556 <.LBB2_81>:
80007556: 97 85 00 00  	auipc	a1, 8
8000755a: 93 85 25 bb  	addi	a1, a1, -1102

000000008000755e <.LBB2_82>:
8000755e: 97 86 00 00  	auipc	a3, 8
80007562: 93 86 a6 9c  	addi	a3, a3, -1590
80007566: a8 1b        	addi	a0, sp, 504
80007568: 05 46        	addi	a2, zero, 1
8000756a: 01 47        	mv	a4, zero
8000756c: 97 a0 ff ff  	auipc	ra, 1048570
80007570: e7 80 c0 16  	jalr	364(ra)
80007574: 09 a0        	j	2 <.LBB2_82+0x18>
80007576: a8 1b        	addi	a0, sp, 504
80007578: 97 e0 ff ff  	auipc	ra, 1048574
8000757c: e7 80 a0 ce  	jalr	-790(ra)
80007580: 09 a0        	j	2 <.LBB2_82+0x24>
80007582: 37 05 00 04  	lui	a0, 16384
80007586: 7d 35        	addiw	a0, a0, -1
80007588: 32 05        	slli	a0, a0, 12
8000758a: 97 c0 ff ff  	auipc	ra, 1048572
8000758e: e7 80 40 4d  	jalr	1236(ra)
80007592: 2a ec        	sd	a0, 24(sp)
80007594: 09 a0        	j	2 <.LBB2_83>

0000000080007596 <.LBB2_83>:
80007596: 17 a5 ff ff  	auipc	a0, 1048570
8000759a: 13 05 a5 a6  	addi	a0, a0, -1430
8000759e: 97 c0 ff ff  	auipc	ra, 1048572
800075a2: e7 80 60 5a  	jalr	1446(ra)
800075a6: 2a e8        	sd	a0, 16(sp)
800075a8: 09 a0        	j	2 <.LBB2_83+0x14>
800075aa: 09 45        	addi	a0, zero, 2
800075ac: a1 45        	addi	a1, zero, 8
800075ae: 97 c0 ff ff  	auipc	ra, 1048572
800075b2: e7 80 60 3e  	jalr	998(ra)
800075b6: 2a e4        	sd	a0, 8(sp)
800075b8: 09 a0        	j	2 <.LBB2_84>

00000000800075ba <.LBB2_84>:
800075ba: 17 15 02 00  	auipc	a0, 33
800075be: 13 05 65 a4  	addi	a0, a0, -1466
800075c2: 85 66        	lui	a3, 1
800075c4: e2 65        	ld	a1, 24(sp)
800075c6: 42 66        	ld	a2, 16(sp)
800075c8: 22 67        	ld	a4, 8(sp)
800075ca: 97 10 00 00  	auipc	ra, 1
800075ce: e7 80 c0 4b  	jalr	1212(ra)
800075d2: 09 a0        	j	2 <.LBB2_85>

00000000800075d4 <.LBB2_85>:
800075d4: 97 85 00 00  	auipc	a1, 8
800075d8: 93 85 c5 b5  	addi	a1, a1, -1188

00000000800075dc <.LBB2_86>:
800075dc: 97 86 00 00  	auipc	a3, 8
800075e0: 93 86 c6 94  	addi	a3, a3, -1716
800075e4: 28 14        	addi	a0, sp, 552
800075e6: 05 46        	addi	a2, zero, 1
800075e8: 01 47        	mv	a4, zero
800075ea: 97 a0 ff ff  	auipc	ra, 1048570
800075ee: e7 80 e0 0e  	jalr	238(ra)
800075f2: 09 a0        	j	2 <.LBB2_86+0x18>
800075f4: 28 14        	addi	a0, sp, 552
800075f6: 97 e0 ff ff  	auipc	ra, 1048574
800075fa: e7 80 c0 c6  	jalr	-916(ra)
800075fe: 09 a0        	j	2 <.LBB2_87>

0000000080007600 <.LBB2_87>:
80007600: 17 b5 01 00  	auipc	a0, 27
80007604: 13 05 05 de  	addi	a0, a0, -544
80007608: 97 00 00 00  	auipc	ra, 0
8000760c: e7 80 c0 18  	jalr	396(ra)
80007610: 09 a0        	j	2 <.LBB2_88>

0000000080007612 <.LBB2_88>:
80007612: 97 85 00 00  	auipc	a1, 8
80007616: 93 85 e5 b4  	addi	a1, a1, -1202

000000008000761a <.LBB2_89>:
8000761a: 97 86 00 00  	auipc	a3, 8
8000761e: 93 86 e6 90  	addi	a3, a3, -1778
80007622: a8 0c        	addi	a0, sp, 600
80007624: 05 46        	addi	a2, zero, 1
80007626: 01 47        	mv	a4, zero
80007628: 97 a0 ff ff  	auipc	ra, 1048570
8000762c: e7 80 00 0b  	jalr	176(ra)
80007630: 09 a0        	j	2 <.LBB2_89+0x18>
80007632: a8 0c        	addi	a0, sp, 600
80007634: 97 e0 ff ff  	auipc	ra, 1048574
80007638: e7 80 e0 c2  	jalr	-978(ra)
8000763c: 09 a0        	j	2 <.LBB2_89+0x24>
8000763e: 83 30 81 29  	ld	ra, 664(sp)
80007642: 13 01 01 2a  	addi	sp, sp, 672
80007646: 82 80        	ret

0000000080007648 <.LBB2_90>:
80007648: 17 85 00 00  	auipc	a0, 8
8000764c: 13 05 85 a4  	addi	a0, a0, -1464

0000000080007650 <.LBB2_91>:
80007650: 17 86 00 00  	auipc	a2, 8
80007654: 13 06 06 a2  	addi	a2, a2, -1504
80007658: 93 05 10 02  	addi	a1, zero, 33
8000765c: 97 40 00 00  	auipc	ra, 4
80007660: e7 80 e0 0d  	jalr	222(ra)
80007664: 00 00        	unimp	

0000000080007666 <.LBB2_92>:
80007666: 17 85 00 00  	auipc	a0, 8
8000766a: 13 05 a5 a2  	addi	a0, a0, -1494

000000008000766e <.LBB2_93>:
8000766e: 17 86 00 00  	auipc	a2, 8
80007672: 13 06 a6 a6  	addi	a2, a2, -1430
80007676: 93 05 10 02  	addi	a1, zero, 33
8000767a: 97 40 00 00  	auipc	ra, 4
8000767e: e7 80 00 0c  	jalr	192(ra)
80007682: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process9scheduler11ProcManager8procinit17h637c9c5d446bd1efE:

0000000080007684 <_ZN6kernel7process9scheduler11ProcManager8procinit17h637c9c5d446bd1efE>:
80007684: 69 71        	addi	sp, sp, -304
80007686: 06 f6        	sd	ra, 296(sp)
80007688: aa f9        	sd	a0, 240(sp)

000000008000768a <.LBB0_17>:
8000768a: 97 85 00 00  	auipc	a1, 8
8000768e: 93 85 e5 af  	addi	a1, a1, -1282

0000000080007692 <.LBB0_18>:
80007692: 97 86 00 00  	auipc	a3, 8
80007696: 93 86 66 b0  	addi	a3, a3, -1274
8000769a: 30 18        	addi	a2, sp, 56
8000769c: 05 47        	addi	a4, zero, 1
8000769e: 81 47        	mv	a5, zero
800076a0: 2a f8        	sd	a0, 48(sp)
800076a2: 32 85        	add	a0, zero, a2
800076a4: 3a 86        	add	a2, zero, a4
800076a6: 3e 87        	add	a4, zero, a5
800076a8: 97 a0 ff ff  	auipc	ra, 1048570
800076ac: e7 80 00 03  	jalr	48(ra)
800076b0: 09 a0        	j	2 <.LBB0_18+0x20>
800076b2: 28 18        	addi	a0, sp, 56
800076b4: 97 e0 ff ff  	auipc	ra, 1048574
800076b8: e7 80 e0 ba  	jalr	-1106(ra)
800076bc: 09 a0        	j	2 <.LBB0_18+0x2c>
800076be: 93 05 00 04  	addi	a1, zero, 64
800076c2: 42 75        	ld	a0, 48(sp)
800076c4: 97 b0 ff ff  	auipc	ra, 1048571
800076c8: e7 80 40 71  	jalr	1812(ra)
800076cc: 2a f4        	sd	a0, 40(sp)
800076ce: 2e f0        	sd	a1, 32(sp)
800076d0: 09 a0        	j	2 <.LBB0_18+0x40>
800076d2: 08 01        	addi	a0, sp, 128
800076d4: a2 75        	ld	a1, 40(sp)
800076d6: 02 76        	ld	a2, 32(sp)
800076d8: 97 b0 ff ff  	auipc	ra, 1048571
800076dc: e7 80 00 72  	jalr	1824(ra)
800076e0: 09 a0        	j	2 <.LBB0_18+0x50>
800076e2: a8 10        	addi	a0, sp, 104
800076e4: 0c 01        	addi	a1, sp, 128
800076e6: 97 d0 ff ff  	auipc	ra, 1048573
800076ea: e7 80 20 85  	jalr	-1966(ra)
800076ee: 09 a0        	j	2 <.LBB0_18+0x5e>
800076f0: 66 75        	ld	a0, 120(sp)
800076f2: 2a f5        	sd	a0, 168(sp)
800076f4: 46 75        	ld	a0, 112(sp)
800076f6: 2a f1        	sd	a0, 160(sp)
800076f8: 26 75        	ld	a0, 104(sp)
800076fa: 2a ed        	sd	a0, 152(sp)
800076fc: 09 a0        	j	2 <.LBB0_18+0x6c>
800076fe: 28 09        	addi	a0, sp, 152
80007700: 97 c0 ff ff  	auipc	ra, 1048572
80007704: e7 80 e0 79  	jalr	1950(ra)
80007708: 2a f9        	sd	a0, 176(sp)
8000770a: 2e fd        	sd	a1, 184(sp)
8000770c: 09 a0        	j	2 <.LBB0_18+0x7c>
8000770e: 6a 75        	ld	a0, 184(sp)
80007710: b3 35 a0 00  	snez	a1, a0
80007714: 01 46        	mv	a2, zero
80007716: 63 04 c5 00  	beq	a0, a2, 8 <.LBB0_19>
8000771a: 09 a0        	j	2 <.LBB0_18+0x8a>
8000771c: 15 a0        	j	36 <.LBB0_20+0x1a>

000000008000771e <.LBB0_19>:
8000771e: 97 85 00 00  	auipc	a1, 8
80007722: 93 85 25 a9  	addi	a1, a1, -1390

0000000080007726 <.LBB0_20>:
80007726: 97 86 00 00  	auipc	a3, 8
8000772a: 93 86 26 a7  	addi	a3, a3, -1422
8000772e: 88 01        	addi	a0, sp, 192
80007730: 05 46        	addi	a2, zero, 1
80007732: 01 47        	mv	a4, zero
80007734: 97 a0 ff ff  	auipc	ra, 1048570
80007738: e7 80 40 fa  	jalr	-92(ra)
8000773c: 99 a0        	j	70 <.LBB0_20+0x5c>
8000773e: 00 00        	unimp	
80007740: 4a 75        	ld	a0, 176(sp)
80007742: ea 75        	ld	a1, 184(sp)
80007744: aa fd        	sd	a0, 248(sp)
80007746: 2e e2        	sd	a1, 256(sp)
80007748: 2a e6        	sd	a0, 264(sp)
8000774a: 2e ea        	sd	a1, 272(sp)
8000774c: 2a ee        	sd	a0, 280(sp)
8000774e: 2e f2        	sd	a1, 288(sp)
80007750: 93 85 85 04  	addi	a1, a1, 72
80007754: 2a ec        	sd	a0, 24(sp)
80007756: 2e 85        	add	a0, zero, a1
80007758: 97 b0 ff ff  	auipc	ra, 1048571
8000775c: e7 80 20 05  	jalr	82(ra)
80007760: 2a e8        	sd	a0, 16(sp)
80007762: 09 a0        	j	2 <.LBB0_20+0x3e>
80007764: 62 65        	ld	a0, 24(sp)
80007766: 97 00 00 00  	auipc	ra, 0
8000776a: e7 80 80 53  	jalr	1336(ra)
8000776e: 2a e4        	sd	a0, 8(sp)
80007770: 09 a0        	j	2 <.LBB0_20+0x4c>
80007772: 42 65        	ld	a0, 16(sp)
80007774: a2 65        	ld	a1, 8(sp)
80007776: 97 10 00 00  	auipc	ra, 1
8000777a: e7 80 e0 8d  	jalr	-1826(ra)
8000777e: 09 a0        	j	2 <.LBB0_20+0x5a>
80007780: bd bf        	j	-130 <.LBB0_18+0x6c>
80007782: 88 01        	addi	a0, sp, 192
80007784: 97 e0 ff ff  	auipc	ra, 1048574
80007788: e7 80 e0 ad  	jalr	-1314(ra)
8000778c: 09 a0        	j	2 <.LBB0_20+0x68>
8000778e: b2 70        	ld	ra, 296(sp)
80007790: 55 61        	addi	sp, sp, 304
80007792: 82 80        	ret

Disassembly of section .text._ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E:

0000000080007794 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E>:
80007794: 51 71        	addi	sp, sp, -240
80007796: 86 f5        	sd	ra, 232(sp)
80007798: 2a f5        	sd	a0, 168(sp)
8000779a: 93 05 00 04  	addi	a1, zero, 64
8000779e: 97 b0 ff ff  	auipc	ra, 1048571
800077a2: e7 80 a0 63  	jalr	1594(ra)
800077a6: aa e4        	sd	a0, 72(sp)
800077a8: ae e0        	sd	a1, 64(sp)
800077aa: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x18>
800077ac: a8 10        	addi	a0, sp, 104
800077ae: a6 65        	ld	a1, 72(sp)
800077b0: 06 66        	ld	a2, 64(sp)
800077b2: 97 b0 ff ff  	auipc	ra, 1048571
800077b6: e7 80 60 64  	jalr	1606(ra)
800077ba: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x28>
800077bc: 88 08        	addi	a0, sp, 80
800077be: ac 10        	addi	a1, sp, 104
800077c0: 97 c0 ff ff  	auipc	ra, 1048572
800077c4: e7 80 80 77  	jalr	1912(ra)
800077c8: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x36>
800077ca: 06 75        	ld	a0, 96(sp)
800077cc: 2a e9        	sd	a0, 144(sp)
800077ce: 66 65        	ld	a0, 88(sp)
800077d0: 2a e5        	sd	a0, 136(sp)
800077d2: 46 65        	ld	a0, 80(sp)
800077d4: 2a e1        	sd	a0, 128(sp)
800077d6: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x44>
800077d8: 08 01        	addi	a0, sp, 128
800077da: 97 c0 ff ff  	auipc	ra, 1048572
800077de: e7 80 40 6c  	jalr	1732(ra)
800077e2: 2a ed        	sd	a0, 152(sp)
800077e4: 2e f1        	sd	a1, 160(sp)
800077e6: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x54>
800077e8: 0a 75        	ld	a0, 160(sp)
800077ea: b3 35 a0 00  	snez	a1, a0
800077ee: 01 46        	mv	a2, zero
800077f0: 63 04 c5 00  	beq	a0, a2, 8 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x64>
800077f4: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x62>
800077f6: 29 a0        	j	10 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x6c>
800077f8: ae 70        	ld	ra, 232(sp)
800077fa: 6d 61        	addi	sp, sp, 240
800077fc: 82 80        	ret
800077fe: 00 00        	unimp	
80007800: 6a 65        	ld	a0, 152(sp)
80007802: 8a 75        	ld	a1, 160(sp)
80007804: 2a f9        	sd	a0, 176(sp)
80007806: 2e fd        	sd	a1, 184(sp)
80007808: aa e1        	sd	a0, 192(sp)
8000780a: ae e5        	sd	a1, 200(sp)
8000780c: aa e9        	sd	a0, 208(sp)
8000780e: 2a fc        	sd	a0, 56(sp)
80007810: 97 a0 ff ff  	auipc	ra, 1048570
80007814: e7 80 60 d2  	jalr	-730(ra)
80007818: 2a f8        	sd	a0, 48(sp)
8000781a: 2e f4        	sd	a1, 40(sp)
8000781c: 09 a0        	j	2 <.LBB1_17>

000000008000781e <.LBB1_17>:
8000781e: 17 86 00 00  	auipc	a2, 8
80007822: 13 06 26 9a  	addi	a2, a2, -1630

0000000080007826 <.LBB1_18>:
80007826: 17 87 00 00  	auipc	a4, 8
8000782a: 13 07 27 9d  	addi	a4, a4, -1582
8000782e: fd 46        	addi	a3, zero, 31
80007830: 42 75        	ld	a0, 48(sp)
80007832: a2 75        	ld	a1, 40(sp)
80007834: 97 d0 ff ff  	auipc	ra, 1048573
80007838: e7 80 a0 86  	jalr	-1942(ra)
8000783c: aa 85        	add	a1, zero, a0
8000783e: aa ed        	sd	a0, 216(sp)
80007840: 2e f0        	sd	a1, 32(sp)
80007842: 09 a0        	j	2 <.LBB1_18+0x1e>
80007844: 62 75        	ld	a0, 56(sp)
80007846: 97 00 00 00  	auipc	ra, 0
8000784a: e7 80 80 45  	jalr	1112(ra)
8000784e: aa 85        	add	a1, zero, a0
80007850: aa f1        	sd	a0, 224(sp)
80007852: 2e ec        	sd	a1, 24(sp)
80007854: 09 a0        	j	2 <.LBB1_18+0x30>
80007856: 62 65        	ld	a0, 24(sp)
80007858: 97 c0 ff ff  	auipc	ra, 1048572
8000785c: e7 80 60 20  	jalr	518(ra)
80007860: 2a e8        	sd	a0, 16(sp)
80007862: 09 a0        	j	2 <.LBB1_18+0x3e>
80007864: 02 75        	ld	a0, 32(sp)
80007866: 97 c0 ff ff  	auipc	ra, 1048572
8000786a: e7 80 e0 2d  	jalr	734(ra)
8000786e: 2a e4        	sd	a0, 8(sp)
80007870: 09 a0        	j	2 <.LBB1_18+0x4c>
80007872: 09 45        	addi	a0, zero, 2
80007874: 91 45        	addi	a1, zero, 4
80007876: 97 c0 ff ff  	auipc	ra, 1048572
8000787a: e7 80 e0 11  	jalr	286(ra)
8000787e: 2a e0        	sd	a0, 0(sp)
80007880: 09 a0        	j	2 <.LBB1_19>

0000000080007882 <.LBB1_19>:
80007882: 17 05 02 00  	auipc	a0, 32
80007886: 13 05 e5 77  	addi	a0, a0, 1918
8000788a: 85 66        	lui	a3, 1
8000788c: c2 65        	ld	a1, 16(sp)
8000788e: 22 66        	ld	a2, 8(sp)
80007890: 02 67        	ld	a4, 0(sp)
80007892: 97 10 00 00  	auipc	ra, 1
80007896: e7 80 40 1f  	jalr	500(ra)
8000789a: 09 a0        	j	2 <.LBB1_19+0x1a>
8000789c: 35 bf        	j	-196 <_ZN6kernel7process9scheduler11ProcManager14proc_mapstacks17h98e1b353ba732f87E+0x44>

Disassembly of section .text._ZN6kernel7process9scheduler11ProcManager8userinit17hb2414e1312e7c2aaE:

000000008000789e <_ZN6kernel7process9scheduler11ProcManager8userinit17hb2414e1312e7c2aaE>:
8000789e: 31 71        	addi	sp, sp, -192
800078a0: 06 fd        	sd	ra, 184(sp)
800078a2: 2a ed        	sd	a0, 152(sp)

00000000800078a4 <.LBB2_16>:
800078a4: 97 85 00 00  	auipc	a1, 8
800078a8: 93 85 c5 98  	addi	a1, a1, -1652

00000000800078ac <.LBB2_17>:
800078ac: 97 86 00 00  	auipc	a3, 8
800078b0: 93 86 c6 8e  	addi	a3, a3, -1812
800078b4: b0 08        	addi	a2, sp, 88
800078b6: 05 47        	addi	a4, zero, 1
800078b8: 81 47        	mv	a5, zero
800078ba: aa e8        	sd	a0, 80(sp)
800078bc: 32 85        	add	a0, zero, a2
800078be: 3a 86        	add	a2, zero, a4
800078c0: 3e 87        	add	a4, zero, a5
800078c2: 97 a0 ff ff  	auipc	ra, 1048570
800078c6: e7 80 60 e1  	jalr	-490(ra)
800078ca: 09 a0        	j	2 <.LBB2_17+0x20>
800078cc: a8 08        	addi	a0, sp, 88
800078ce: 97 e0 ff ff  	auipc	ra, 1048574
800078d2: e7 80 40 99  	jalr	-1644(ra)
800078d6: 09 a0        	j	2 <.LBB2_17+0x2c>
800078d8: 46 65        	ld	a0, 80(sp)
800078da: 97 00 00 00  	auipc	ra, 0
800078de: e7 80 40 11  	jalr	276(ra)
800078e2: aa e4        	sd	a0, 72(sp)
800078e4: 09 a0        	j	2 <.LBB2_18>

00000000800078e6 <.LBB2_18>:
800078e6: 97 85 00 00  	auipc	a1, 8
800078ea: 93 85 a5 95  	addi	a1, a1, -1702

00000000800078ee <.LBB2_19>:
800078ee: 97 86 00 00  	auipc	a3, 8
800078f2: 93 86 26 97  	addi	a3, a3, -1678
800078f6: 69 46        	addi	a2, zero, 26
800078f8: 26 65        	ld	a0, 72(sp)
800078fa: 97 c0 ff ff  	auipc	ra, 1048572
800078fe: e7 80 e0 76  	jalr	1902(ra)
80007902: aa 85        	add	a1, zero, a0
80007904: 2a f1        	sd	a0, 160(sp)
80007906: ae e0        	sd	a1, 64(sp)
80007908: 09 a0        	j	2 <.LBB2_19+0x1c>
8000790a: 06 65        	ld	a0, 64(sp)
8000790c: 13 05 85 04  	addi	a0, a0, 72
80007910: 97 b0 ff ff  	auipc	ra, 1048571
80007914: e7 80 a0 e9  	jalr	-358(ra)
80007918: aa 85        	add	a1, zero, a0
8000791a: 2a f5        	sd	a0, 168(sp)
8000791c: 2e fc        	sd	a1, 56(sp)
8000791e: 09 a0        	j	2 <.LBB2_19+0x32>
80007920: 62 75        	ld	a0, 56(sp)
80007922: 41 05        	addi	a0, a0, 16
80007924: 97 c0 ff ff  	auipc	ra, 1048572
80007928: e7 80 80 71  	jalr	1816(ra)
8000792c: 2a f8        	sd	a0, 48(sp)
8000792e: 09 a0        	j	2 <.LBB2_20>

0000000080007930 <.LBB2_20>:
80007930: 97 85 00 00  	auipc	a1, 8
80007934: 93 85 85 94  	addi	a1, a1, -1720
80007938: 42 75        	ld	a0, 48(sp)
8000793a: 97 d0 ff ff  	auipc	ra, 1048573
8000793e: e7 80 80 84  	jalr	-1976(ra)
80007942: 2a f4        	sd	a0, 40(sp)
80007944: 09 a0        	j	2 <.LBB2_20+0x16>
80007946: 22 75        	ld	a0, 40(sp)
80007948: 97 f0 ff ff  	auipc	ra, 1048575
8000794c: e7 80 a0 b9  	jalr	-1126(ra)
80007950: 2a f0        	sd	a0, 32(sp)
80007952: 09 a0        	j	2 <.LBB2_21>

0000000080007954 <.LBB2_21>:
80007954: 17 85 00 00  	auipc	a0, 8
80007958: 13 05 d5 a0  	addi	a0, a0, -1523
8000795c: 97 a0 ff ff  	auipc	ra, 1048570
80007960: e7 80 e0 d9  	jalr	-610(ra)
80007964: 2a ec        	sd	a0, 24(sp)
80007966: 09 a0        	j	2 <.LBB2_22>

0000000080007968 <.LBB2_22>:
80007968: 97 85 00 00  	auipc	a1, 8
8000796c: 93 85 95 9f  	addi	a1, a1, -1543
80007970: 13 06 40 03  	addi	a2, zero, 52
80007974: 02 75        	ld	a0, 32(sp)
80007976: e2 66        	ld	a3, 24(sp)
80007978: 97 10 00 00  	auipc	ra, 1
8000797c: e7 80 60 27  	jalr	630(ra)
80007980: 09 a0        	j	2 <.LBB2_22+0x1a>
80007982: 05 65        	lui	a0, 1
80007984: e2 75        	ld	a1, 56(sp)
80007986: 88 e5        	sd	a0, 8(a1)
80007988: 90 6d        	ld	a2, 24(a1)
8000798a: 32 f9        	sd	a2, 176(sp)
8000798c: 81 46        	mv	a3, zero
8000798e: 14 ee        	sd	a3, 24(a2)
80007990: 08 fa        	sd	a0, 48(a2)

0000000080007992 <.LBB2_23>:
80007992: 97 65 00 00  	auipc	a1, 6
80007996: 93 85 65 e1  	addi	a1, a1, -490
8000799a: 21 46        	addi	a2, zero, 8
8000799c: 62 75        	ld	a0, 56(sp)
8000799e: 97 00 00 00  	auipc	ra, 0
800079a2: e7 80 60 6a  	jalr	1702(ra)
800079a6: 09 a0        	j	2 <.LBB2_23+0x16>
800079a8: 06 65        	ld	a0, 64(sp)
800079aa: 97 a0 ff ff  	auipc	ra, 1048570
800079ae: e7 80 60 19  	jalr	406(ra)
800079b2: 2a e5        	sd	a0, 136(sp)
800079b4: 09 a0        	j	2 <.LBB2_23+0x24>
800079b6: 28 01        	addi	a0, sp, 136
800079b8: 97 b0 ff ff  	auipc	ra, 1048571
800079bc: e7 80 c0 c5  	jalr	-932(ra)
800079c0: 2a e8        	sd	a0, 16(sp)
800079c2: 09 a0        	j	2 <.LBB2_23+0x32>
800079c4: 0d 45        	addi	a0, zero, 3
800079c6: a3 0b a1 08  	sb	a0, 151(sp)
800079ca: c2 65        	ld	a1, 16(sp)
800079cc: 2a e4        	sd	a0, 8(sp)
800079ce: 2e 85        	add	a0, zero, a1
800079d0: a2 65        	ld	a1, 8(sp)
800079d2: 97 00 00 00  	auipc	ra, 0
800079d6: e7 80 00 66  	jalr	1632(ra)
800079da: 09 a0        	j	2 <.LBB2_23+0x4a>
800079dc: 2a 65        	ld	a0, 136(sp)
800079de: 97 a0 ff ff  	auipc	ra, 1048570
800079e2: e7 80 a0 d3  	jalr	-710(ra)
800079e6: 09 a0        	j	2 <.LBB2_23+0x56>
800079e8: ea 70        	ld	ra, 184(sp)
800079ea: 29 61        	addi	sp, sp, 192
800079ec: 82 80        	ret

Disassembly of section .text._ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E:

00000000800079ee <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E>:
800079ee: 69 71        	addi	sp, sp, -304
800079f0: 06 f6        	sd	ra, 296(sp)
800079f2: aa f5        	sd	a0, 232(sp)
800079f4: 81 45        	mv	a1, zero
800079f6: a3 03 b1 0e  	sb	a1, 231(sp)
800079fa: 93 05 00 04  	addi	a1, zero, 64
800079fe: 97 b0 ff ff  	auipc	ra, 1048571
80007a02: e7 80 a0 3d  	jalr	986(ra)
80007a06: 2a e5        	sd	a0, 136(sp)
80007a08: 2e e1        	sd	a1, 128(sp)
80007a0a: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x1e>
80007a0c: 2a 65        	ld	a0, 136(sp)
80007a0e: 8a 65        	ld	a1, 128(sp)
80007a10: 97 b0 ff ff  	auipc	ra, 1048571
80007a14: e7 80 40 5f  	jalr	1524(ra)
80007a18: aa fc        	sd	a0, 120(sp)
80007a1a: ae f8        	sd	a1, 112(sp)
80007a1c: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x30>
80007a1e: 66 75        	ld	a0, 120(sp)
80007a20: 2a ed        	sd	a0, 152(sp)
80007a22: c6 75        	ld	a1, 112(sp)
80007a24: 2e f1        	sd	a1, 160(sp)
80007a26: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x3a>
80007a28: 28 09        	addi	a0, sp, 152
80007a2a: 97 b0 ff ff  	auipc	ra, 1048571
80007a2e: e7 80 00 75  	jalr	1872(ra)
80007a32: 2a f5        	sd	a0, 168(sp)
80007a34: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x48>
80007a36: 2a 75        	ld	a0, 168(sp)
80007a38: b3 35 a0 00  	snez	a1, a0
80007a3c: 01 46        	mv	a2, zero
80007a3e: 63 04 c5 00  	beq	a0, a2, 8 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x58>
80007a42: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x56>
80007a44: 29 a0        	j	10 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x60>
80007a46: 01 45        	mv	a0, zero
80007a48: 2a e9        	sd	a0, 144(sp)
80007a4a: 49 aa        	j	402 <.LBB3_43+0x164>
80007a4c: 00 00        	unimp	
80007a4e: 2a 75        	ld	a0, 168(sp)
80007a50: aa f9        	sd	a0, 240(sp)
80007a52: aa fd        	sd	a0, 248(sp)
80007a54: 2a e2        	sd	a0, 256(sp)
80007a56: aa f4        	sd	a0, 104(sp)
80007a58: 97 a0 ff ff  	auipc	ra, 1048570
80007a5c: e7 80 80 0e  	jalr	232(ra)
80007a60: 2a f9        	sd	a0, 176(sp)
80007a62: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x76>
80007a64: 08 19        	addi	a0, sp, 176
80007a66: 97 b0 ff ff  	auipc	ra, 1048571
80007a6a: e7 80 e0 b4  	jalr	-1202(ra)
80007a6e: aa f0        	sd	a0, 96(sp)
80007a70: 09 a0        	j	2 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x84>
80007a72: 06 75        	ld	a0, 96(sp)
80007a74: 13 05 05 02  	addi	a0, a0, 32

0000000080007a78 <.LBB3_43>:
80007a78: 97 85 00 00  	auipc	a1, 8
80007a7c: 93 85 85 81  	addi	a1, a1, -2024
80007a80: 97 10 00 00  	auipc	ra, 1
80007a84: e7 80 c0 84  	jalr	-1972(ra)
80007a88: aa ec        	sd	a0, 88(sp)
80007a8a: 09 a0        	j	2 <.LBB3_43+0x14>
80007a8c: 01 45        	mv	a0, zero
80007a8e: e6 65        	ld	a1, 88(sp)
80007a90: 63 89 a5 00  	beq	a1, a0, 18 <.LBB3_43+0x2a>
80007a94: 09 a0        	j	2 <.LBB3_43+0x1e>
80007a96: 97 00 00 00  	auipc	ra, 0
80007a9a: e7 80 60 19  	jalr	406(ra)
80007a9e: aa e8        	sd	a0, 80(sp)
80007aa0: 39 a0        	j	14 <.LBB3_43+0x36>
80007aa2: 4a 75        	ld	a0, 176(sp)
80007aa4: 97 a0 ff ff  	auipc	ra, 1048570
80007aa8: e7 80 40 c7  	jalr	-908(ra)
80007aac: 35 a2        	j	300 <.LBB3_43+0x160>
80007aae: 08 19        	addi	a0, sp, 176
80007ab0: 97 b0 ff ff  	auipc	ra, 1048571
80007ab4: e7 80 40 b6  	jalr	-1180(ra)
80007ab8: aa e4        	sd	a0, 72(sp)
80007aba: 09 a0        	j	2 <.LBB3_43+0x44>
80007abc: 46 65        	ld	a0, 80(sp)
80007abe: a6 65        	ld	a1, 72(sp)
80007ac0: 88 ed        	sd	a0, 24(a1)
80007ac2: 08 19        	addi	a0, sp, 176
80007ac4: 97 b0 ff ff  	auipc	ra, 1048571
80007ac8: e7 80 00 b5  	jalr	-1200(ra)
80007acc: aa e0        	sd	a0, 64(sp)
80007ace: 09 a0        	j	2 <.LBB3_43+0x58>
80007ad0: 05 45        	addi	a0, zero, 1
80007ad2: a3 0f a1 0a  	sb	a0, 191(sp)
80007ad6: 86 65        	ld	a1, 64(sp)
80007ad8: 2a fc        	sd	a0, 56(sp)
80007ada: 2e 85        	add	a0, zero, a1
80007adc: e2 75        	ld	a1, 56(sp)
80007ade: 97 00 00 00  	auipc	ra, 0
80007ae2: e7 80 40 55  	jalr	1364(ra)
80007ae6: 09 a0        	j	2 <.LBB3_43+0x70>
80007ae8: 26 75        	ld	a0, 104(sp)
80007aea: 13 05 85 04  	addi	a0, a0, 72
80007aee: 97 b0 ff ff  	auipc	ra, 1048571
80007af2: e7 80 c0 cb  	jalr	-836(ra)
80007af6: aa 85        	add	a1, zero, a0
80007af8: 2a e6        	sd	a0, 264(sp)
80007afa: 2e f8        	sd	a1, 48(sp)
80007afc: 09 a0        	j	2 <.LBB3_43+0x86>
80007afe: 97 a0 ff ff  	auipc	ra, 1048570
80007b02: e7 80 80 a3  	jalr	-1480(ra)
80007b06: aa e1        	sd	a0, 192(sp)
80007b08: ae e5        	sd	a1, 200(sp)
80007b0a: 09 a0        	j	2 <.LBB3_43+0x94>
80007b0c: 0e 65        	ld	a0, 192(sp)
80007b0e: 81 45        	mv	a1, zero
80007b10: 63 04 b5 00  	beq	a0, a1, 8 <.LBB3_43+0xa0>
80007b14: 09 a0        	j	2 <.LBB3_43+0x9e>
80007b16: 01 a8        	j	16 <.LBB3_43+0xae>
80007b18: 4a 75        	ld	a0, 176(sp)
80007b1a: 97 a0 ff ff  	auipc	ra, 1048570
80007b1e: e7 80 e0 bf  	jalr	-1026(ra)
80007b22: 55 a8        	j	180 <.LBB3_43+0x15e>
80007b24: 00 00        	unimp	
80007b26: 2e 65        	ld	a0, 200(sp)
80007b28: 2a ea        	sd	a0, 272(sp)
80007b2a: c2 75        	ld	a1, 48(sp)
80007b2c: 2a f4        	sd	a0, 40(sp)
80007b2e: 2e 85        	add	a0, zero, a1
80007b30: a2 75        	ld	a1, 40(sp)
80007b32: 97 00 00 00  	auipc	ra, 0
80007b36: e7 80 e0 52  	jalr	1326(ra)
80007b3a: 09 a0        	j	2 <.LBB3_43+0xc4>
80007b3c: 05 45        	addi	a0, zero, 1
80007b3e: a3 03 a1 0e  	sb	a0, 231(sp)
80007b42: 42 75        	ld	a0, 48(sp)
80007b44: 97 00 00 00  	auipc	ra, 0
80007b48: e7 80 c0 55  	jalr	1372(ra)
80007b4c: aa e9        	sd	a0, 208(sp)
80007b4e: 09 a0        	j	2 <.LBB3_43+0xd8>
80007b50: 4e 65        	ld	a0, 208(sp)
80007b52: 81 45        	mv	a1, zero
80007b54: 63 19 b5 00  	bne	a0, a1, 18 <.LBB3_43+0xee>
80007b58: 09 a0        	j	2 <.LBB3_43+0xe2>
80007b5a: 4a 75        	ld	a0, 176(sp)
80007b5c: 97 a0 ff ff  	auipc	ra, 1048570
80007b60: e7 80 c0 bb  	jalr	-1092(ra)
80007b64: b5 a0        	j	108 <.LBB3_43+0x158>
80007b66: 01 45        	mv	a0, zero
80007b68: a3 03 a1 0e  	sb	a0, 231(sp)
80007b6c: 4e 65        	ld	a0, 208(sp)
80007b6e: 2a ee        	sd	a0, 280(sp)
80007b70: aa ed        	sd	a0, 216(sp)
80007b72: c2 75        	ld	a1, 48(sp)
80007b74: 2a f0        	sd	a0, 32(sp)
80007b76: 2e 85        	add	a0, zero, a1
80007b78: 82 75        	ld	a1, 32(sp)
80007b7a: 97 00 00 00  	auipc	ra, 0
80007b7e: e7 80 20 4f  	jalr	1266(ra)
80007b82: 09 a0        	j	2 <.LBB3_43+0x10c>
80007b84: 42 75        	ld	a0, 48(sp)
80007b86: 0c 61        	ld	a1, 0(a0)
80007b88: 2e f2        	sd	a1, 288(sp)
80007b8a: 13 05 05 02  	addi	a0, a0, 32
80007b8e: 2e ec        	sd	a1, 24(sp)
80007b90: 97 00 00 00  	auipc	ra, 0
80007b94: e7 80 00 47  	jalr	1136(ra)
80007b98: 09 a0        	j	2 <.LBB3_43+0x122>
80007b9a: 42 75        	ld	a0, 48(sp)
80007b9c: 13 05 05 02  	addi	a0, a0, 32
80007ba0: 85 65        	lui	a1, 1
80007ba2: 62 66        	ld	a2, 24(sp)
80007ba4: b2 95        	add	a1, a1, a2
80007ba6: 2a e8        	sd	a0, 16(sp)
80007ba8: 2e e4        	sd	a1, 8(sp)
80007baa: 63 e3 c5 06  	bltu	a1, a2, 102 <.LBB3_44>
80007bae: 09 a0        	j	2 <.LBB3_43+0x138>
80007bb0: 42 65        	ld	a0, 16(sp)
80007bb2: a2 65        	ld	a1, 8(sp)
80007bb4: 97 00 00 00  	auipc	ra, 0
80007bb8: e7 80 20 47  	jalr	1138(ra)
80007bbc: 09 a0        	j	2 <.LBB3_43+0x146>
80007bbe: 4a 75        	ld	a0, 176(sp)
80007bc0: 97 a0 ff ff  	auipc	ra, 1048570
80007bc4: e7 80 80 b5  	jalr	-1192(ra)
80007bc8: 09 a0        	j	2 <.LBB3_43+0x152>
80007bca: 26 75        	ld	a0, 104(sp)
80007bcc: 2a e9        	sd	a0, 144(sp)
80007bce: 25 a8        	j	56 <.LBB3_43+0x18e>
80007bd0: 01 45        	mv	a0, zero
80007bd2: 2a e9        	sd	a0, 144(sp)
80007bd4: 0d a8        	j	50 <.LBB3_43+0x18e>
80007bd6: 11 a0        	j	4 <.LBB3_43+0x162>
80007bd8: 09 a0        	j	2 <.LBB3_43+0x162>
80007bda: b9 b5        	j	-434 <_ZN6kernel7process9scheduler11ProcManager9allocproc17hc4e08c4b737a0843E+0x3a>
80007bdc: 4a 65        	ld	a0, 144(sp)
80007bde: b2 70        	ld	ra, 296(sp)
80007be0: 55 61        	addi	sp, sp, 304
80007be2: 82 80        	ret
80007be4: 01 45        	mv	a0, zero
80007be6: a3 03 a1 0e  	sb	a0, 231(sp)
80007bea: cd bf        	j	-14 <.LBB3_43+0x164>
80007bec: 03 45 71 0e  	lbu	a0, 231(sp)
80007bf0: 05 89        	andi	a0, a0, 1
80007bf2: 81 45        	mv	a1, zero
80007bf4: e3 08 b5 fe  	beq	a0, a1, -16 <.LBB3_43+0x16c>
80007bf8: 09 a0        	j	2 <.LBB3_43+0x182>
80007bfa: 88 09        	addi	a0, sp, 208
80007bfc: 97 a0 ff ff  	auipc	ra, 1048570
80007c00: e7 80 20 cb  	jalr	-846(ra)
80007c04: c5 b7        	j	-32 <.LBB3_43+0x16c>
80007c06: 4e 65        	ld	a0, 208(sp)
80007c08: 81 45        	mv	a1, zero
80007c0a: e3 11 b5 fe  	bne	a0, a1, -30 <.LBB3_43+0x174>
80007c0e: d9 bf        	j	-42 <.LBB3_43+0x16c>

0000000080007c10 <.LBB3_44>:
80007c10: 17 75 00 00  	auipc	a0, 7
80007c14: 13 05 05 6a  	addi	a0, a0, 1696

0000000080007c18 <.LBB3_45>:
80007c18: 17 76 00 00  	auipc	a2, 7
80007c1c: 13 06 06 68  	addi	a2, a2, 1664
80007c20: f1 45        	addi	a1, zero, 28
80007c22: 97 40 00 00  	auipc	ra, 4
80007c26: e7 80 80 b1  	jalr	-1256(ra)
80007c2a: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process9scheduler9alloc_pid17hf819b4b268df5b46E:

0000000080007c2c <_ZN6kernel7process9scheduler9alloc_pid17hf819b4b268df5b46E>:
80007c2c: 79 71        	addi	sp, sp, -48
80007c2e: 06 f4        	sd	ra, 40(sp)

0000000080007c30 <.LBB4_5>:
80007c30: 17 e5 01 00  	auipc	a0, 30
80007c34: 13 05 05 4a  	addi	a0, a0, 1184
80007c38: 97 a0 ff ff  	auipc	ra, 1048570
80007c3c: e7 80 80 27  	jalr	632(ra)
80007c40: aa 85        	add	a1, zero, a0
80007c42: 2a ec        	sd	a0, 24(sp)
80007c44: 2e e8        	sd	a1, 16(sp)
80007c46: 09 a0        	j	2 <.LBB4_6>

0000000080007c48 <.LBB4_6>:
80007c48: 17 15 02 00  	auipc	a0, 33
80007c4c: 13 05 05 3d  	addi	a0, a0, 976
80007c50: 08 61        	ld	a0, 0(a0)
80007c52: 2a f0        	sd	a0, 32(sp)
80007c54: 93 05 15 00  	addi	a1, a0, 1
80007c58: 2a e4        	sd	a0, 8(sp)
80007c5a: 2e e0        	sd	a1, 0(sp)
80007c5c: 63 e3 a5 02  	bltu	a1, a0, 38 <.LBB4_8>
80007c60: 09 a0        	j	2 <.LBB4_7>

0000000080007c62 <.LBB4_7>:
80007c62: 17 15 02 00  	auipc	a0, 33
80007c66: 13 05 65 3b  	addi	a0, a0, 950
80007c6a: 82 65        	ld	a1, 0(sp)
80007c6c: 0c e1        	sd	a1, 0(a0)
80007c6e: 42 65        	ld	a0, 16(sp)
80007c70: 97 a0 ff ff  	auipc	ra, 1048570
80007c74: e7 80 00 ac  	jalr	-1344(ra)
80007c78: 09 a0        	j	2 <.LBB4_7+0x18>
80007c7a: 22 65        	ld	a0, 8(sp)
80007c7c: a2 70        	ld	ra, 40(sp)
80007c7e: 45 61        	addi	sp, sp, 48
80007c80: 82 80        	ret

0000000080007c82 <.LBB4_8>:
80007c82: 17 75 00 00  	auipc	a0, 7
80007c86: 13 05 e5 62  	addi	a0, a0, 1582

0000000080007c8a <.LBB4_9>:
80007c8a: 17 76 00 00  	auipc	a2, 7
80007c8e: 13 06 66 64  	addi	a2, a2, 1606
80007c92: f1 45        	addi	a1, zero, 28
80007c94: 97 40 00 00  	auipc	ra, 4
80007c98: e7 80 60 aa  	jalr	-1370(ra)
80007c9c: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E:

0000000080007c9e <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E>:
80007c9e: 39 71        	addi	sp, sp, -64
80007ca0: 06 fc        	sd	ra, 56(sp)
80007ca2: 2a f8        	sd	a0, 48(sp)
80007ca4: b7 05 00 04  	lui	a1, 16384
80007ca8: fd 35        	addiw	a1, a1, -1
80007caa: b2 05        	slli	a1, a1, 12
80007cac: 2a f4        	sd	a0, 40(sp)
80007cae: 2e 85        	add	a0, zero, a1
80007cb0: 97 e0 ff ff  	auipc	ra, 1048574
80007cb4: e7 80 80 00  	jalr	8(ra)
80007cb8: 2a f0        	sd	a0, 32(sp)
80007cba: 09 a0        	j	2 <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E+0x1e>
80007cbc: 22 75        	ld	a0, 40(sp)
80007cbe: 93 05 15 00  	addi	a1, a0, 1
80007cc2: 2e ec        	sd	a1, 24(sp)
80007cc4: 63 e1 a5 04  	bltu	a1, a0, 66 <.LBB5_10>
80007cc8: 09 a0        	j	2 <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E+0x2c>
80007cca: 62 65        	ld	a0, 24(sp)
80007ccc: b3 05 a5 00  	add	a1, a0, a0
80007cd0: 2e e8        	sd	a1, 16(sp)
80007cd2: 63 e8 a5 04  	bltu	a1, a0, 80 <.LBB5_12>
80007cd6: 09 a0        	j	2 <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E+0x3a>
80007cd8: 05 45        	addi	a0, zero, 1
80007cda: 52 15        	slli	a0, a0, 52
80007cdc: 7d 15        	addi	a0, a0, -1
80007cde: c2 65        	ld	a1, 16(sp)
80007ce0: 6d 8d        	and	a0, a0, a1
80007ce2: 13 96 c5 00  	slli	a2, a1, 12
80007ce6: 32 e4        	sd	a2, 8(sp)
80007ce8: 63 1c b5 04  	bne	a0, a1, 88 <.LBB5_14>
80007cec: 09 a0        	j	2 <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E+0x50>
80007cee: 02 75        	ld	a0, 32(sp)
80007cf0: a2 65        	ld	a1, 8(sp)
80007cf2: 33 06 b5 40  	sub	a2, a0, a1
80007cf6: 32 e0        	sd	a2, 0(sp)
80007cf8: 63 63 c5 06  	bltu	a0, a2, 102 <.LBB5_16>
80007cfc: 09 a0        	j	2 <_ZN6kernel7process9scheduler6kstack17h4592b80673987fe6E+0x60>
80007cfe: 02 65        	ld	a0, 0(sp)
80007d00: e2 70        	ld	ra, 56(sp)
80007d02: 21 61        	addi	sp, sp, 64
80007d04: 82 80        	ret

0000000080007d06 <.LBB5_10>:
80007d06: 17 75 00 00  	auipc	a0, 7
80007d0a: 13 05 a5 5a  	addi	a0, a0, 1450

0000000080007d0e <.LBB5_11>:
80007d0e: 17 76 00 00  	auipc	a2, 7
80007d12: 13 06 a6 5d  	addi	a2, a2, 1498
80007d16: f1 45        	addi	a1, zero, 28
80007d18: 97 40 00 00  	auipc	ra, 4
80007d1c: e7 80 20 a2  	jalr	-1502(ra)
80007d20: 00 00        	unimp	

0000000080007d22 <.LBB5_12>:
80007d22: 17 75 00 00  	auipc	a0, 7
80007d26: 13 05 e5 5d  	addi	a0, a0, 1502

0000000080007d2a <.LBB5_13>:
80007d2a: 17 76 00 00  	auipc	a2, 7
80007d2e: 13 06 e6 5b  	addi	a2, a2, 1470
80007d32: 93 05 10 02  	addi	a1, zero, 33
80007d36: 97 40 00 00  	auipc	ra, 4
80007d3a: e7 80 40 a0  	jalr	-1532(ra)
80007d3e: 00 00        	unimp	

0000000080007d40 <.LBB5_14>:
80007d40: 17 75 00 00  	auipc	a0, 7
80007d44: 13 05 05 5c  	addi	a0, a0, 1472

0000000080007d48 <.LBB5_15>:
80007d48: 17 76 00 00  	auipc	a2, 7
80007d4c: 13 06 06 5a  	addi	a2, a2, 1440
80007d50: 93 05 10 02  	addi	a1, zero, 33
80007d54: 97 40 00 00  	auipc	ra, 4
80007d58: e7 80 60 9e  	jalr	-1562(ra)
80007d5c: 00 00        	unimp	

0000000080007d5e <.LBB5_16>:
80007d5e: 17 75 00 00  	auipc	a0, 7
80007d62: 13 05 25 5e  	addi	a0, a0, 1506

0000000080007d66 <.LBB5_17>:
80007d66: 17 76 00 00  	auipc	a2, 7
80007d6a: 13 06 26 5c  	addi	a2, a2, 1474
80007d6e: 93 05 10 02  	addi	a1, zero, 33
80007d72: 97 40 00 00  	auipc	ra, 4
80007d76: e7 80 80 9c  	jalr	-1592(ra)
80007d7a: 00 00        	unimp	

Disassembly of section .text._ZN6kernel8register10sfence_vma17h6825d7b888e1110fE:

0000000080007d7c <_ZN6kernel8register10sfence_vma17h6825d7b888e1110fE>:
80007d7c: 59 71        	addi	sp, sp, -112
80007d7e: 86 f4        	sd	ra, 104(sp)

0000000080007d80 <.LBB0_5>:
80007d80: 97 75 00 00  	auipc	a1, 7
80007d84: 93 85 85 62  	addi	a1, a1, 1576

0000000080007d88 <.LBB0_6>:
80007d88: 97 76 00 00  	auipc	a3, 7
80007d8c: 93 86 06 63  	addi	a3, a3, 1584
80007d90: 28 00        	addi	a0, sp, 8
80007d92: 05 46        	addi	a2, zero, 1
80007d94: 01 47        	mv	a4, zero
80007d96: 97 a0 ff ff  	auipc	ra, 1048570
80007d9a: e7 80 20 94  	jalr	-1726(ra)
80007d9e: 09 a0        	j	2 <.LBB0_6+0x18>
80007da0: 28 00        	addi	a0, sp, 8
80007da2: 97 d0 ff ff  	auipc	ra, 1048573
80007da6: e7 80 00 4c  	jalr	1216(ra)
80007daa: 09 a0        	j	2 <.LBB0_6+0x24>
80007dac: 73 00 00 12  	sfence.vma

0000000080007db0 <.LBB0_7>:
80007db0: 97 75 00 00  	auipc	a1, 7
80007db4: 93 85 05 62  	addi	a1, a1, 1568

0000000080007db8 <.LBB0_8>:
80007db8: 97 76 00 00  	auipc	a3, 7
80007dbc: 93 86 06 60  	addi	a3, a3, 1536
80007dc0: 28 18        	addi	a0, sp, 56
80007dc2: 05 46        	addi	a2, zero, 1
80007dc4: 01 47        	mv	a4, zero
80007dc6: 97 a0 ff ff  	auipc	ra, 1048570
80007dca: e7 80 20 91  	jalr	-1774(ra)
80007dce: 09 a0        	j	2 <.LBB0_8+0x18>
80007dd0: 28 18        	addi	a0, sp, 56
80007dd2: 97 d0 ff ff  	auipc	ra, 1048573
80007dd6: e7 80 00 49  	jalr	1168(ra)
80007dda: 09 a0        	j	2 <.LBB0_8+0x24>
80007ddc: a6 70        	ld	ra, 104(sp)
80007dde: 65 61        	addi	sp, sp, 112
80007de0: 82 80        	ret

Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hdbc7d1863a662c4cE:

0000000080007de2 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hdbc7d1863a662c4cE>:
80007de2: 01 11        	addi	sp, sp, -32
80007de4: 06 ec        	sd	ra, 24(sp)
80007de6: 2a e8        	sd	a0, 16(sp)
80007de8: 97 c0 ff ff  	auipc	ra, 1048572
80007dec: e7 80 a0 c4  	jalr	-950(ra)
80007df0: 2a e4        	sd	a0, 8(sp)
80007df2: 09 a0        	j	2 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hdbc7d1863a662c4cE+0x12>
80007df4: 22 65        	ld	a0, 8(sp)
80007df6: e2 60        	ld	ra, 24(sp)
80007df8: 05 61        	addi	sp, sp, 32
80007dfa: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address4Addr15is_page_aligned17hd62b9a2f9dfa351aE:

0000000080007dfc <_ZN6kernel6memory7address4Addr15is_page_aligned17hd62b9a2f9dfa351aE>:
80007dfc: 01 11        	addi	sp, sp, -32
80007dfe: 06 ec        	sd	ra, 24(sp)
80007e00: 2a e8        	sd	a0, 16(sp)
80007e02: 97 c0 ff ff  	auipc	ra, 1048572
80007e06: e7 80 80 c3  	jalr	-968(ra)
80007e0a: 2a e4        	sd	a0, 8(sp)
80007e0c: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr15is_page_aligned17hd62b9a2f9dfa351aE+0x12>
80007e0e: 05 65        	lui	a0, 1
80007e10: 7d 35        	addiw	a0, a0, -1
80007e12: a2 65        	ld	a1, 8(sp)
80007e14: 6d 8d        	and	a0, a0, a1
80007e16: 13 35 15 00  	seqz	a0, a0
80007e1a: e2 60        	ld	ra, 24(sp)
80007e1c: 05 61        	addi	sp, sp, 32
80007e1e: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E:

0000000080007e20 <_ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E>:
80007e20: 39 71        	addi	sp, sp, -64
80007e22: 06 fc        	sd	ra, 56(sp)
80007e24: 2a f8        	sd	a0, 48(sp)
80007e26: 2a f4        	sd	a0, 40(sp)
80007e28: 97 c0 ff ff  	auipc	ra, 1048572
80007e2c: e7 80 e0 c2  	jalr	-978(ra)
80007e30: 2a f0        	sd	a0, 32(sp)
80007e32: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E+0x14>
80007e34: 02 75        	ld	a0, 32(sp)
80007e36: 0c 61        	ld	a1, 0(a0)
80007e38: 05 66        	lui	a2, 1
80007e3a: 2e 96        	add	a2, a2, a1
80007e3c: 32 ec        	sd	a2, 24(sp)
80007e3e: 63 69 b6 02  	bltu	a2, a1, 50 <.LBB2_7>
80007e42: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E+0x24>
80007e44: 62 65        	ld	a0, 24(sp)
80007e46: 93 05 f5 ff  	addi	a1, a0, -1
80007e4a: 2e e8        	sd	a1, 16(sp)
80007e4c: 63 60 b5 04  	bltu	a0, a1, 64 <.LBB2_9>
80007e50: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E+0x32>
80007e52: 22 75        	ld	a0, 40(sp)
80007e54: 97 c0 ff ff  	auipc	ra, 1048572
80007e58: e7 80 20 c0  	jalr	-1022(ra)
80007e5c: 2a e4        	sd	a0, 8(sp)
80007e5e: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17h84041e18647cd748E+0x40>
80007e60: 7d 75        	lui	a0, 1048575
80007e62: c2 65        	ld	a1, 16(sp)
80007e64: 6d 8d        	and	a0, a0, a1
80007e66: 22 66        	ld	a2, 8(sp)
80007e68: 08 e2        	sd	a0, 0(a2)
80007e6a: e2 70        	ld	ra, 56(sp)
80007e6c: 21 61        	addi	sp, sp, 64
80007e6e: 82 80        	ret

0000000080007e70 <.LBB2_7>:
80007e70: 17 75 00 00  	auipc	a0, 7
80007e74: 13 05 05 5a  	addi	a0, a0, 1440

0000000080007e78 <.LBB2_8>:
80007e78: 17 76 00 00  	auipc	a2, 7
80007e7c: 13 06 06 58  	addi	a2, a2, 1408
80007e80: f1 45        	addi	a1, zero, 28
80007e82: 97 40 00 00  	auipc	ra, 4
80007e86: e7 80 80 8b  	jalr	-1864(ra)
80007e8a: 00 00        	unimp	

0000000080007e8c <.LBB2_9>:
80007e8c: 17 75 00 00  	auipc	a0, 7
80007e90: 13 05 45 5c  	addi	a0, a0, 1476

0000000080007e94 <.LBB2_10>:
80007e94: 17 76 00 00  	auipc	a2, 7
80007e98: 13 06 c6 59  	addi	a2, a2, 1436
80007e9c: 93 05 10 02  	addi	a1, zero, 33
80007ea0: 97 40 00 00  	auipc	ra, 4
80007ea4: e7 80 a0 89  	jalr	-1894(ra)
80007ea8: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE:

0000000080007eaa <_ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE>:
80007eaa: 39 71        	addi	sp, sp, -64
80007eac: 06 fc        	sd	ra, 56(sp)
80007eae: 2a f8        	sd	a0, 48(sp)
80007eb0: 2a f4        	sd	a0, 40(sp)
80007eb2: 97 c0 ff ff  	auipc	ra, 1048572
80007eb6: e7 80 20 b9  	jalr	-1134(ra)
80007eba: 2a f0        	sd	a0, 32(sp)
80007ebc: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE+0x14>
80007ebe: 02 75        	ld	a0, 32(sp)
80007ec0: 0c 61        	ld	a1, 0(a0)
80007ec2: 05 66        	lui	a2, 1
80007ec4: 2e 96        	add	a2, a2, a1
80007ec6: 32 ec        	sd	a2, 24(sp)
80007ec8: 63 69 b6 02  	bltu	a2, a1, 50 <.LBB3_7>
80007ecc: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE+0x24>
80007ece: 62 65        	ld	a0, 24(sp)
80007ed0: 93 05 f5 ff  	addi	a1, a0, -1
80007ed4: 2e e8        	sd	a1, 16(sp)
80007ed6: 63 60 b5 04  	bltu	a0, a1, 64 <.LBB3_9>
80007eda: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE+0x32>
80007edc: 22 75        	ld	a0, 40(sp)
80007ede: 97 c0 ff ff  	auipc	ra, 1048572
80007ee2: e7 80 60 b6  	jalr	-1178(ra)
80007ee6: 2a e4        	sd	a0, 8(sp)
80007ee8: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr11pg_round_up17hbf53daa1b029122eE+0x40>
80007eea: 7d 75        	lui	a0, 1048575
80007eec: c2 65        	ld	a1, 16(sp)
80007eee: 6d 8d        	and	a0, a0, a1
80007ef0: 22 66        	ld	a2, 8(sp)
80007ef2: 08 e2        	sd	a0, 0(a2)
80007ef4: e2 70        	ld	ra, 56(sp)
80007ef6: 21 61        	addi	sp, sp, 64
80007ef8: 82 80        	ret

0000000080007efa <.LBB3_7>:
80007efa: 17 75 00 00  	auipc	a0, 7
80007efe: 13 05 65 51  	addi	a0, a0, 1302

0000000080007f02 <.LBB3_8>:
80007f02: 17 76 00 00  	auipc	a2, 7
80007f06: 13 06 66 4f  	addi	a2, a2, 1270
80007f0a: f1 45        	addi	a1, zero, 28
80007f0c: 97 40 00 00  	auipc	ra, 4
80007f10: e7 80 e0 82  	jalr	-2002(ra)
80007f14: 00 00        	unimp	

0000000080007f16 <.LBB3_9>:
80007f16: 17 75 00 00  	auipc	a0, 7
80007f1a: 13 05 a5 53  	addi	a0, a0, 1338

0000000080007f1e <.LBB3_10>:
80007f1e: 17 76 00 00  	auipc	a2, 7
80007f22: 13 06 26 51  	addi	a2, a2, 1298
80007f26: 93 05 10 02  	addi	a1, zero, 33
80007f2a: 97 40 00 00  	auipc	ra, 4
80007f2e: e7 80 00 81  	jalr	-2032(ra)
80007f32: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7address4Addr13pg_round_down17hc45d2f09187fc6b8E:

0000000080007f34 <_ZN6kernel6memory7address4Addr13pg_round_down17hc45d2f09187fc6b8E>:
80007f34: 79 71        	addi	sp, sp, -48
80007f36: 06 f4        	sd	ra, 40(sp)
80007f38: 2a f0        	sd	a0, 32(sp)
80007f3a: 2a ec        	sd	a0, 24(sp)
80007f3c: 97 c0 ff ff  	auipc	ra, 1048572
80007f40: e7 80 80 b0  	jalr	-1272(ra)
80007f44: 2a e8        	sd	a0, 16(sp)
80007f46: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr13pg_round_down17hc45d2f09187fc6b8E+0x14>
80007f48: 42 65        	ld	a0, 16(sp)
80007f4a: 0c 61        	ld	a1, 0(a0)
80007f4c: 62 65        	ld	a0, 24(sp)
80007f4e: 2e e4        	sd	a1, 8(sp)
80007f50: 97 c0 ff ff  	auipc	ra, 1048572
80007f54: e7 80 40 af  	jalr	-1292(ra)
80007f58: 2a e0        	sd	a0, 0(sp)
80007f5a: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr13pg_round_down17hc45d2f09187fc6b8E+0x28>
80007f5c: 7d 75        	lui	a0, 1048575
80007f5e: a2 65        	ld	a1, 8(sp)
80007f60: 6d 8d        	and	a0, a0, a1
80007f62: 02 66        	ld	a2, 0(sp)
80007f64: 08 e2        	sd	a0, 0(a2)
80007f66: a2 70        	ld	ra, 40(sp)
80007f68: 45 61        	addi	sp, sp, 48
80007f6a: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7address4Addr8add_page17h37b2b88ee03f1389E:

0000000080007f6c <_ZN6kernel6memory7address4Addr8add_page17h37b2b88ee03f1389E>:
80007f6c: 01 11        	addi	sp, sp, -32
80007f6e: 06 ec        	sd	ra, 24(sp)
80007f70: 2a e8        	sd	a0, 16(sp)
80007f72: 97 c0 ff ff  	auipc	ra, 1048572
80007f76: e7 80 20 ad  	jalr	-1326(ra)
80007f7a: 2a e4        	sd	a0, 8(sp)
80007f7c: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr8add_page17h37b2b88ee03f1389E+0x12>
80007f7e: 22 65        	ld	a0, 8(sp)
80007f80: 0c 61        	ld	a1, 0(a0)
80007f82: 05 66        	lui	a2, 1
80007f84: 2e 96        	add	a2, a2, a1
80007f86: 32 e0        	sd	a2, 0(sp)
80007f88: 63 69 b6 00  	bltu	a2, a1, 18 <.LBB5_4>
80007f8c: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr8add_page17h37b2b88ee03f1389E+0x22>
80007f8e: 02 65        	ld	a0, 0(sp)
80007f90: a2 65        	ld	a1, 8(sp)
80007f92: 88 e1        	sd	a0, 0(a1)
80007f94: e2 60        	ld	ra, 24(sp)
80007f96: 05 61        	addi	sp, sp, 32
80007f98: 82 80        	ret

0000000080007f9a <.LBB5_4>:
80007f9a: 17 75 00 00  	auipc	a0, 7
80007f9e: 13 05 65 47  	addi	a0, a0, 1142

0000000080007fa2 <.LBB5_5>:
80007fa2: 17 76 00 00  	auipc	a2, 7
80007fa6: 13 06 66 4d  	addi	a2, a2, 1238
80007faa: f1 45        	addi	a1, zero, 28
80007fac: 97 30 00 00  	auipc	ra, 3
80007fb0: e7 80 e0 78  	jalr	1934(ra)
80007fb4: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7address4Addr8add_page17he713c961f0077c27E:

0000000080007fb6 <_ZN6kernel6memory7address4Addr8add_page17he713c961f0077c27E>:
80007fb6: 01 11        	addi	sp, sp, -32
80007fb8: 06 ec        	sd	ra, 24(sp)
80007fba: 2a e8        	sd	a0, 16(sp)
80007fbc: 97 c0 ff ff  	auipc	ra, 1048572
80007fc0: e7 80 a0 a9  	jalr	-1382(ra)
80007fc4: 2a e4        	sd	a0, 8(sp)
80007fc6: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr8add_page17he713c961f0077c27E+0x12>
80007fc8: 22 65        	ld	a0, 8(sp)
80007fca: 0c 61        	ld	a1, 0(a0)
80007fcc: 05 66        	lui	a2, 1
80007fce: 2e 96        	add	a2, a2, a1
80007fd0: 32 e0        	sd	a2, 0(sp)
80007fd2: 63 69 b6 00  	bltu	a2, a1, 18 <.LBB6_4>
80007fd6: 09 a0        	j	2 <_ZN6kernel6memory7address4Addr8add_page17he713c961f0077c27E+0x22>
80007fd8: 02 65        	ld	a0, 0(sp)
80007fda: a2 65        	ld	a1, 8(sp)
80007fdc: 88 e1        	sd	a0, 0(a1)
80007fde: e2 60        	ld	ra, 24(sp)
80007fe0: 05 61        	addi	sp, sp, 32
80007fe2: 82 80        	ret

0000000080007fe4 <.LBB6_4>:
80007fe4: 17 75 00 00  	auipc	a0, 7
80007fe8: 13 05 c5 42  	addi	a0, a0, 1068

0000000080007fec <.LBB6_5>:
80007fec: 17 76 00 00  	auipc	a2, 7
80007ff0: 13 06 c6 48  	addi	a2, a2, 1164
80007ff4: f1 45        	addi	a1, zero, 28
80007ff6: 97 30 00 00  	auipc	ra, 3
80007ffa: e7 80 40 74  	jalr	1860(ra)
80007ffe: 00 00        	unimp	

Disassembly of section .text._ZN6kernel7process7context7Context10write_zero17hbba8655889bd7812E:

0000000080008000 <_ZN6kernel7process7context7Context10write_zero17hbba8655889bd7812E>:
80008000: 41 11        	addi	sp, sp, -16
80008002: 2a e4        	sd	a0, 8(sp)
80008004: 81 45        	mv	a1, zero
80008006: 0c e1        	sd	a1, 0(a0)
80008008: 0c e5        	sd	a1, 8(a0)
8000800a: 0c e9        	sd	a1, 16(a0)
8000800c: 0c ed        	sd	a1, 24(a0)
8000800e: 0c f1        	sd	a1, 32(a0)
80008010: 0c f5        	sd	a1, 40(a0)
80008012: 0c f9        	sd	a1, 48(a0)
80008014: 0c fd        	sd	a1, 56(a0)
80008016: 2c e1        	sd	a1, 64(a0)
80008018: 2c e5        	sd	a1, 72(a0)
8000801a: 2c e9        	sd	a1, 80(a0)
8000801c: 2c ed        	sd	a1, 88(a0)
8000801e: 2c f1        	sd	a1, 96(a0)
80008020: 2c f5        	sd	a1, 104(a0)
80008022: 41 01        	addi	sp, sp, 16
80008024: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7context7Context8write_sp17h456e8925239e8589E:

0000000080008026 <_ZN6kernel7process7context7Context8write_sp17h456e8925239e8589E>:
80008026: 41 11        	addi	sp, sp, -16
80008028: 2a e0        	sd	a0, 0(sp)
8000802a: 2e e4        	sd	a1, 8(sp)
8000802c: 0c e5        	sd	a1, 8(a0)
8000802e: 41 01        	addi	sp, sp, 16
80008030: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process8ProcData9set_state17hd05f887d1c690330E:

0000000080008032 <_ZN6kernel7process7process8ProcData9set_state17hd05f887d1c690330E>:
80008032: 41 11        	addi	sp, sp, -16
80008034: 2e 86        	add	a2, zero, a1
80008036: 2a e0        	sd	a0, 0(sp)
80008038: a3 07 b1 00  	sb	a1, 15(sp)
8000803c: 23 00 b5 02  	sb	a1, 32(a0)
80008040: 41 01        	addi	sp, sp, 16
80008042: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern8set_name17heb46dd7758e30198E:

0000000080008044 <_ZN6kernel7process7process10ProcExtern8set_name17heb46dd7758e30198E>:
80008044: 01 11        	addi	sp, sp, -32
80008046: 2a e4        	sd	a0, 8(sp)
80008048: 2e e8        	sd	a1, 16(sp)
8000804a: 32 ec        	sd	a2, 24(sp)
8000804c: 4c e9        	sd	a1, 144(a0)
8000804e: 50 ed        	sd	a2, 152(a0)
80008050: 05 61        	addi	sp, sp, 32
80008052: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern10set_kstack17h518c06c0d13e9876E:

0000000080008054 <_ZN6kernel7process7process10ProcExtern10set_kstack17h518c06c0d13e9876E>:
80008054: 41 11        	addi	sp, sp, -16
80008056: 2a e0        	sd	a0, 0(sp)
80008058: 2e e4        	sd	a1, 8(sp)
8000805a: 0c e1        	sd	a1, 0(a0)
8000805c: 41 01        	addi	sp, sp, 16
8000805e: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern13set_trapframe17hfa0dfa5519161ac1E:

0000000080008060 <_ZN6kernel7process7process10ProcExtern13set_trapframe17hfa0dfa5519161ac1E>:
80008060: 41 11        	addi	sp, sp, -16
80008062: 2a e0        	sd	a0, 0(sp)
80008064: 2e e4        	sd	a1, 8(sp)
80008066: 0c ed        	sd	a1, 24(a0)
80008068: 41 01        	addi	sp, sp, 16
8000806a: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern13set_pagetable17h116207d27dbe61b8E:

000000008000806c <_ZN6kernel7process7process10ProcExtern13set_pagetable17h116207d27dbe61b8E>:
8000806c: 79 71        	addi	sp, sp, -48
8000806e: 06 f4        	sd	ra, 40(sp)
80008070: 2a ec        	sd	a0, 24(sp)
80008072: 2e f0        	sd	a1, 32(sp)
80008074: 13 06 05 01  	addi	a2, a0, 16
80008078: 2a e8        	sd	a0, 16(sp)
8000807a: 32 85        	add	a0, zero, a2
8000807c: 2e e4        	sd	a1, 8(sp)
8000807e: 97 a0 ff ff  	auipc	ra, 1048570
80008082: e7 80 60 84  	jalr	-1978(ra)
80008086: 09 a0        	j	2 <_ZN6kernel7process7process10ProcExtern13set_pagetable17h116207d27dbe61b8E+0x1c>
80008088: 22 65        	ld	a0, 8(sp)
8000808a: c2 65        	ld	a1, 16(sp)
8000808c: 88 e9        	sd	a0, 16(a1)
8000808e: a2 70        	ld	ra, 40(sp)
80008090: 45 61        	addi	sp, sp, 48
80008092: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern15get_context_mut17h28617295923eabccE:

0000000080008094 <_ZN6kernel7process7process10ProcExtern15get_context_mut17h28617295923eabccE>:
80008094: 41 11        	addi	sp, sp, -16
80008096: 2a e4        	sd	a0, 8(sp)
80008098: 13 05 05 02  	addi	a0, a0, 32
8000809c: 41 01        	addi	sp, sp, 16
8000809e: 82 80        	ret

Disassembly of section .text._ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E:

00000000800080a0 <_ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E>:
800080a0: 71 71        	addi	sp, sp, -176
800080a2: 06 f5        	sd	ra, 168(sp)
800080a4: 2a ed        	sd	a0, 152(sp)
800080a6: 81 45        	mv	a1, zero
800080a8: a3 0b b1 08  	sb	a1, 151(sp)
800080ac: aa f8        	sd	a0, 112(sp)
800080ae: 97 10 00 00  	auipc	ra, 1
800080b2: e7 80 c0 ae  	jalr	-1300(ra)
800080b6: 2a e1        	sd	a0, 128(sp)
800080b8: 09 a0        	j	2 <_ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E+0x1a>
800080ba: 0a 65        	ld	a0, 128(sp)
800080bc: 81 45        	mv	a1, zero
800080be: 63 19 b5 00  	bne	a0, a1, 18 <_ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E+0x30>
800080c2: 09 a0        	j	2 <_ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E+0x24>
800080c4: 08 01        	addi	a0, sp, 128
800080c6: 97 90 ff ff  	auipc	ra, 1048569
800080ca: e7 80 e0 7f  	jalr	2046(ra)
800080ce: 15 aa        	j	308 <.LBB6_28+0x106>
800080d0: 05 45        	addi	a0, zero, 1
800080d2: a3 0b a1 08  	sb	a0, 151(sp)
800080d6: 0a 65        	ld	a0, 128(sp)
800080d8: 2a e5        	sd	a0, 136(sp)
800080da: 28 01        	addi	a0, sp, 136
800080dc: 97 e0 ff ff  	auipc	ra, 1048574
800080e0: e7 80 60 40  	jalr	1030(ra)
800080e4: aa f4        	sd	a0, 104(sp)
800080e6: 09 a0        	j	2 <_ZN6kernel7process7process10ProcExtern14proc_pagetable17h5e084dc791ebad07E+0x48>
800080e8: 37 05 00 04  	lui	a0, 16384
800080ec: 7d 35        	addiw	a0, a0, -1
800080ee: 32 05        	slli	a0, a0, 12
800080f0: 97 c0 ff ff  	auipc	ra, 1048572
800080f4: e7 80 e0 96  	jalr	-1682(ra)
800080f8: aa f0        	sd	a0, 96(sp)
800080fa: 09 a0        	j	2 <.LBB6_28>

00000000800080fc <.LBB6_28>:
800080fc: 17 95 ff ff  	auipc	a0, 1048569
80008100: 13 05 45 f0  	addi	a0, a0, -252
80008104: 97 c0 ff ff  	auipc	ra, 1048572
80008108: e7 80 00 a4  	jalr	-1472(ra)
8000810c: aa ec        	sd	a0, 88(sp)
8000810e: 09 a0        	j	2 <.LBB6_28+0x14>
80008110: 09 45        	addi	a0, zero, 2
80008112: a1 45        	addi	a1, zero, 8
80008114: 97 c0 ff ff  	auipc	ra, 1048572
80008118: e7 80 00 88  	jalr	-1920(ra)
8000811c: aa e8        	sd	a0, 80(sp)
8000811e: 09 a0        	j	2 <.LBB6_28+0x24>
80008120: 85 66        	lui	a3, 1
80008122: 26 75        	ld	a0, 104(sp)
80008124: 86 75        	ld	a1, 96(sp)
80008126: 66 66        	ld	a2, 88(sp)
80008128: 46 67        	ld	a4, 80(sp)
8000812a: 97 00 00 00  	auipc	ra, 0
8000812e: e7 80 a0 76  	jalr	1898(ra)
80008132: aa 85        	add	a1, zero, a0
80008134: 23 03 a1 0a  	sb	a0, 166(sp)
80008138: ae e4        	sd	a1, 72(sp)
8000813a: 09 a0        	j	2 <.LBB6_28+0x40>
8000813c: 26 65        	ld	a0, 72(sp)
8000813e: 09 e9        	bnez	a0, 18 <.LBB6_28+0x54>
80008140: 09 a0        	j	2 <.LBB6_28+0x46>
80008142: 28 01        	addi	a0, sp, 136
80008144: 97 e0 ff ff  	auipc	ra, 1048574
80008148: e7 80 e0 39  	jalr	926(ra)
8000814c: aa e0        	sd	a0, 64(sp)
8000814e: 01 a8        	j	16 <.LBB6_28+0x62>
80008150: 28 01        	addi	a0, sp, 136
80008152: 97 e0 ff ff  	auipc	ra, 1048574
80008156: e7 80 00 39  	jalr	912(ra)
8000815a: 2a fc        	sd	a0, 56(sp)
8000815c: 31 a8        	j	28 <.LBB6_28+0x7c>
8000815e: 01 45        	mv	a0, zero
80008160: 86 65        	ld	a1, 64(sp)
80008162: 2a f8        	sd	a0, 48(sp)
80008164: 2e 85        	add	a0, zero, a1
80008166: c2 75        	ld	a1, 48(sp)
80008168: 97 10 00 00  	auipc	ra, 1
8000816c: e7 80 40 b7  	jalr	-1164(ra)
80008170: 09 a0        	j	2 <.LBB6_28+0x76>
80008172: 01 45        	mv	a0, zero
80008174: aa fc        	sd	a0, 120(sp)
80008176: 51 a8        	j	148 <.LBB6_28+0x10e>
80008178: 37 05 00 02  	lui	a0, 8192
8000817c: 7d 35        	addiw	a0, a0, -1
8000817e: 36 05        	slli	a0, a0, 13
80008180: 97 c0 ff ff  	auipc	ra, 1048572
80008184: e7 80 e0 8d  	jalr	-1826(ra)
80008188: 2a f4        	sd	a0, 40(sp)
8000818a: 09 a0        	j	2 <.LBB6_28+0x90>
8000818c: 46 75        	ld	a0, 112(sp)
8000818e: 08 6d        	ld	a0, 24(a0)
80008190: 97 c0 ff ff  	auipc	ra, 1048572
80008194: e7 80 40 9b  	jalr	-1612(ra)
80008198: 2a f0        	sd	a0, 32(sp)
8000819a: 09 a0        	j	2 <.LBB6_28+0xa0>
8000819c: 09 45        	addi	a0, zero, 2
8000819e: a1 45        	addi	a1, zero, 8
800081a0: 97 b0 ff ff  	auipc	ra, 1048571
800081a4: e7 80 40 7f  	jalr	2036(ra)
800081a8: 2a ec        	sd	a0, 24(sp)
800081aa: 09 a0        	j	2 <.LBB6_28+0xb0>
800081ac: 85 66        	lui	a3, 1
800081ae: 62 75        	ld	a0, 56(sp)
800081b0: a2 75        	ld	a1, 40(sp)
800081b2: 02 76        	ld	a2, 32(sp)
800081b4: 62 67        	ld	a4, 24(sp)
800081b6: 97 00 00 00  	auipc	ra, 0
800081ba: e7 80 e0 6d  	jalr	1758(ra)
800081be: aa 85        	add	a1, zero, a0
800081c0: a3 03 a1 0a  	sb	a0, 167(sp)
800081c4: 2e e8        	sd	a1, 16(sp)
800081c6: 09 a0        	j	2 <.LBB6_28+0xcc>
800081c8: 42 65        	ld	a0, 16(sp)
800081ca: 09 e9        	bnez	a0, 18 <.LBB6_28+0xe0>
800081cc: 09 a0        	j	2 <.LBB6_28+0xd2>
800081ce: 28 01        	addi	a0, sp, 136
800081d0: 97 e0 ff ff  	auipc	ra, 1048574
800081d4: e7 80 20 31  	jalr	786(ra)
800081d8: 2a e4        	sd	a0, 8(sp)
800081da: 39 a0        	j	14 <.LBB6_28+0xec>
800081dc: 01 45        	mv	a0, zero
800081de: a3 0b a1 08  	sb	a0, 151(sp)
800081e2: 2a 65        	ld	a0, 136(sp)
800081e4: aa fc        	sd	a0, 120(sp)
800081e6: 0d a0        	j	34 <.LBB6_28+0x10c>
800081e8: 01 45        	mv	a0, zero
800081ea: a2 65        	ld	a1, 8(sp)
800081ec: 2a e0        	sd	a0, 0(sp)
800081ee: 2e 85        	add	a0, zero, a1
800081f0: 82 65        	ld	a1, 0(sp)
800081f2: 97 10 00 00  	auipc	ra, 1
800081f6: e7 80 a0 ae  	jalr	-1302(ra)
800081fa: 09 a0        	j	2 <.LBB6_28+0x100>
800081fc: 01 45        	mv	a0, zero
800081fe: aa fc        	sd	a0, 120(sp)
80008200: 21 a0        	j	8 <.LBB6_28+0x10c>
80008202: 01 45        	mv	a0, zero
80008204: aa fc        	sd	a0, 120(sp)
80008206: 19 a8        	j	22 <.LBB6_28+0x120>
80008208: 09 a0        	j	2 <.LBB6_28+0x10e>
8000820a: 03 45 71 09  	lbu	a0, 151(sp)
8000820e: 05 89        	andi	a0, a0, 1
80008210: 11 e9        	bnez	a0, 20 <.LBB6_28+0x128>
80008212: 09 a0        	j	2 <.LBB6_28+0x118>
80008214: 01 45        	mv	a0, zero
80008216: a3 0b a1 08  	sb	a0, 151(sp)
8000821a: 09 a0        	j	2 <.LBB6_28+0x120>
8000821c: 66 75        	ld	a0, 120(sp)
8000821e: aa 70        	ld	ra, 168(sp)
80008220: 4d 61        	addi	sp, sp, 176
80008222: 82 80        	ret
80008224: 28 01        	addi	a0, sp, 136
80008226: 97 90 ff ff  	auipc	ra, 1048569
8000822a: e7 80 80 68  	jalr	1672(ra)
8000822e: dd b7        	j	-26 <.LBB6_28+0x118>

Disassembly of section .text._ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E:

0000000080008230 <_ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E>:
80008230: 59 71        	addi	sp, sp, -112
80008232: 86 f4        	sd	ra, 104(sp)
80008234: aa e8        	sd	a0, 80(sp)
80008236: 2a fc        	sd	a0, 56(sp)
80008238: 97 a0 ff ff  	auipc	ra, 1048570
8000823c: e7 80 80 90  	jalr	-1784(ra)
80008240: aa e0        	sd	a0, 64(sp)
80008242: 09 a0        	j	2 <_ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E+0x14>
80008244: 62 75        	ld	a0, 56(sp)
80008246: 13 05 85 04  	addi	a0, a0, 72
8000824a: 97 a0 ff ff  	auipc	ra, 1048570
8000824e: e7 80 00 56  	jalr	1376(ra)
80008252: 2a f8        	sd	a0, 48(sp)
80008254: 09 a0        	j	2 <_ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E+0x26>
80008256: 42 75        	ld	a0, 48(sp)
80008258: 97 00 00 00  	auipc	ra, 0
8000825c: e7 80 c0 e3  	jalr	-452(ra)
80008260: aa 85        	add	a1, zero, a0
80008262: aa ec        	sd	a0, 88(sp)
80008264: 2e f4        	sd	a1, 40(sp)
80008266: 09 a0        	j	2 <_ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E+0x38>
80008268: 88 00        	addi	a0, sp, 64
8000826a: 97 a0 ff ff  	auipc	ra, 1048570
8000826e: e7 80 a0 3a  	jalr	938(ra)
80008272: 2a f0        	sd	a0, 32(sp)
80008274: 09 a0        	j	2 <_ZN6kernel7process7process7Process8yielding17h2a84c0ee3c990715E+0x46>
80008276: 0d 45        	addi	a0, zero, 3
80008278: a3 07 a1 04  	sb	a0, 79(sp)
8000827c: 82 75        	ld	a1, 32(sp)
8000827e: 2a ec        	sd	a0, 24(sp)
80008280: 2e 85        	add	a0, zero, a1
80008282: e2 65        	ld	a1, 24(sp)
80008284: 97 00 00 00  	auipc	ra, 0
80008288: e7 80 e0 da  	jalr	-594(ra)
8000828c: 09 a0        	j	2 <.LBB7_9>

000000008000828e <.LBB7_9>:
8000828e: 17 f5 01 00  	auipc	a0, 31
80008292: 13 05 25 d7  	addi	a0, a0, -654
80008296: 97 a0 ff ff  	auipc	ra, 1048570
8000829a: e7 80 80 53  	jalr	1336(ra)
8000829e: aa 85        	add	a1, zero, a0
800082a0: aa f0        	sd	a0, 96(sp)
800082a2: 2e e8        	sd	a1, 16(sp)
800082a4: 09 a0        	j	2 <.LBB7_9+0x18>
800082a6: 86 65        	ld	a1, 64(sp)
800082a8: 42 65        	ld	a0, 16(sp)
800082aa: 22 76        	ld	a2, 40(sp)
800082ac: 97 a0 ff ff  	auipc	ra, 1048570
800082b0: e7 80 40 67  	jalr	1652(ra)
800082b4: 2a e4        	sd	a0, 8(sp)
800082b6: 09 a0        	j	2 <.LBB7_9+0x2a>
800082b8: 22 65        	ld	a0, 8(sp)
800082ba: aa e0        	sd	a0, 64(sp)
800082bc: 97 90 ff ff  	auipc	ra, 1048569
800082c0: e7 80 c0 45  	jalr	1116(ra)
800082c4: 09 a0        	j	2 <.LBB7_9+0x38>
800082c6: a6 70        	ld	ra, 104(sp)
800082c8: 65 61        	addi	sp, sp, 112
800082ca: 82 80        	ret

Disassembly of section .text._ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE:

00000000800082cc <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE>:
800082cc: 79 71        	addi	sp, sp, -48
800082ce: 2a e8        	sd	a0, 16(sp)
800082d0: 2e ec        	sd	a1, 24(sp)
800082d2: 03 45 05 00  	lbu	a0, 0(a0)
800082d6: 2a f0        	sd	a0, 32(sp)
800082d8: 83 c5 05 00  	lbu	a1, 0(a1)
800082dc: 2e f4        	sd	a1, 40(sp)
800082de: 63 17 b5 00  	bne	a0, a1, 14 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x20>
800082e2: 09 a0        	j	2 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x18>
800082e4: 05 45        	addi	a0, zero, 1
800082e6: a3 07 a1 00  	sb	a0, 15(sp)
800082ea: 29 a0        	j	10 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x28>
800082ec: 01 45        	mv	a0, zero
800082ee: a3 07 a1 00  	sb	a0, 15(sp)
800082f2: 09 a0        	j	2 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x28>
800082f4: 03 45 f1 00  	lbu	a0, 15(sp)
800082f8: 05 89        	andi	a0, a0, 1
800082fa: 81 45        	mv	a1, zero
800082fc: 63 07 b5 00  	beq	a0, a1, 14 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x3e>
80008300: 09 a0        	j	2 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x36>
80008302: 05 45        	addi	a0, zero, 1
80008304: 23 07 a1 00  	sb	a0, 14(sp)
80008308: 29 a0        	j	10 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x46>
8000830a: 01 45        	mv	a0, zero
8000830c: 23 07 a1 00  	sb	a0, 14(sp)
80008310: 09 a0        	j	2 <_ZN76_$LT$kernel..process..process..Procstate$u20$as$u20$core..cmp..PartialEq$GT$2eq17ha46ec2eaab50a47eE+0x46>
80008312: 03 45 e1 00  	lbu	a0, 14(sp)
80008316: 45 61        	addi	sp, sp, 48
80008318: 82 80        	ret

Disassembly of section .text._ZN4core4hint9spin_loop17h6062ec49613db637E:

000000008000831a <_ZN4core4hint9spin_loop17h6062ec49613db637E>:
8000831a: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7sstatus4read17hdb98c011a4c7cea8E:

000000008000831c <_ZN6kernel8register7sstatus4read17hdb98c011a4c7cea8E>:
8000831c: 41 11        	addi	sp, sp, -16
8000831e: 73 25 00 10  	csrr	a0, sstatus
80008322: 2a e4        	sd	a0, 8(sp)
80008324: 41 01        	addi	sp, sp, 16
80008326: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7sstatus5write17hd9697cbc093f6521E:

0000000080008328 <_ZN6kernel8register7sstatus5write17hd9697cbc093f6521E>:
80008328: 41 11        	addi	sp, sp, -16
8000832a: 2a e4        	sd	a0, 8(sp)
8000832c: 73 10 05 10  	csrw	sstatus, a0
80008330: 41 01        	addi	sp, sp, 16
80008332: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7sstatus7intr_on17h3d63982206733025E:

0000000080008334 <_ZN6kernel8register7sstatus7intr_on17h3d63982206733025E>:
80008334: 41 11        	addi	sp, sp, -16
80008336: 06 e4        	sd	ra, 8(sp)
80008338: 97 00 00 00  	auipc	ra, 0
8000833c: e7 80 40 fe  	jalr	-28(ra)
80008340: 2a e0        	sd	a0, 0(sp)
80008342: 09 a0        	j	2 <_ZN6kernel8register7sstatus7intr_on17h3d63982206733025E+0x10>
80008344: 02 65        	ld	a0, 0(sp)
80008346: 13 65 25 00  	ori	a0, a0, 2
8000834a: 97 00 00 00  	auipc	ra, 0
8000834e: e7 80 e0 fd  	jalr	-34(ra)
80008352: 09 a0        	j	2 <_ZN6kernel8register7sstatus7intr_on17h3d63982206733025E+0x20>
80008354: a2 60        	ld	ra, 8(sp)
80008356: 41 01        	addi	sp, sp, 16
80008358: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7sstatus8intr_off17h3689ababb832e1e7E:

000000008000835a <_ZN6kernel8register7sstatus8intr_off17h3689ababb832e1e7E>:
8000835a: 41 11        	addi	sp, sp, -16
8000835c: 06 e4        	sd	ra, 8(sp)
8000835e: 97 00 00 00  	auipc	ra, 0
80008362: e7 80 e0 fb  	jalr	-66(ra)
80008366: 2a e0        	sd	a0, 0(sp)
80008368: 09 a0        	j	2 <_ZN6kernel8register7sstatus8intr_off17h3689ababb832e1e7E+0x10>
8000836a: 02 65        	ld	a0, 0(sp)
8000836c: 09 89        	andi	a0, a0, 2
8000836e: 97 00 00 00  	auipc	ra, 0
80008372: e7 80 a0 fb  	jalr	-70(ra)
80008376: 09 a0        	j	2 <_ZN6kernel8register7sstatus8intr_off17h3689ababb832e1e7E+0x1e>
80008378: a2 60        	ld	ra, 8(sp)
8000837a: 41 01        	addi	sp, sp, 16
8000837c: 82 80        	ret

Disassembly of section .text._ZN6kernel8register7sstatus8intr_get17h4eb304edc706ff8eE:

000000008000837e <_ZN6kernel8register7sstatus8intr_get17h4eb304edc706ff8eE>:
8000837e: 01 11        	addi	sp, sp, -32
80008380: 06 ec        	sd	ra, 24(sp)
80008382: 97 00 00 00  	auipc	ra, 0
80008386: e7 80 a0 f9  	jalr	-102(ra)
8000838a: aa 85        	add	a1, zero, a0
8000838c: 2a e8        	sd	a0, 16(sp)
8000838e: 2e e4        	sd	a1, 8(sp)
80008390: 09 a0        	j	2 <_ZN6kernel8register7sstatus8intr_get17h4eb304edc706ff8eE+0x14>
80008392: 22 65        	ld	a0, 8(sp)
80008394: 93 75 25 00  	andi	a1, a0, 2
80008398: 13 d5 15 00  	srli	a0, a1, 1
8000839c: e2 60        	ld	ra, 24(sp)
8000839e: 05 61        	addi	sp, sp, 32
800083a0: 82 80        	ret

Disassembly of section .text._ZN6kernel8register5mtvec5write17ha465e1d617c7c04cE:

00000000800083a2 <_ZN6kernel8register5mtvec5write17ha465e1d617c7c04cE>:
800083a2: 41 11        	addi	sp, sp, -16
800083a4: 2a e4        	sd	a0, 8(sp)
800083a6: 73 10 55 30  	csrw	mtvec, a0
800083aa: 41 01        	addi	sp, sp, 16
800083ac: 82 80        	ret

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$5chars17h12a79a36ff9c2405E:

00000000800083ae <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h12a79a36ff9c2405E>:
800083ae: 59 71        	addi	sp, sp, -112
800083b0: 86 f4        	sd	ra, 104(sp)
800083b2: 2a fc        	sd	a0, 56(sp)
800083b4: ae e0        	sd	a1, 64(sp)
800083b6: aa e4        	sd	a0, 72(sp)
800083b8: ae e8        	sd	a1, 80(sp)
800083ba: aa ec        	sd	a0, 88(sp)
800083bc: ae f0        	sd	a1, 96(sp)
800083be: 2a f0        	sd	a0, 32(sp)
800083c0: 2e ec        	sd	a1, 24(sp)
800083c2: 09 a0        	j	2 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h12a79a36ff9c2405E+0x16>
800083c4: 02 75        	ld	a0, 32(sp)
800083c6: e2 65        	ld	a1, 24(sp)
800083c8: 97 c0 ff ff  	auipc	ra, 1048572
800083cc: e7 80 20 a7  	jalr	-1422(ra)
800083d0: 2a e8        	sd	a0, 16(sp)
800083d2: 2e e4        	sd	a1, 8(sp)
800083d4: 09 a0        	j	2 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h12a79a36ff9c2405E+0x28>
800083d6: 42 65        	ld	a0, 16(sp)
800083d8: 2a f4        	sd	a0, 40(sp)
800083da: a2 65        	ld	a1, 8(sp)
800083dc: 2e f8        	sd	a1, 48(sp)
800083de: a6 70        	ld	ra, 104(sp)
800083e0: 65 61        	addi	sp, sp, 112
800083e2: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable7as_addr17h3147afea3feb19e2E:

00000000800083e4 <_ZN6kernel6memory7mapping10page_table9PageTable7as_addr17h3147afea3feb19e2E>:
800083e4: 01 11        	addi	sp, sp, -32
800083e6: 06 ec        	sd	ra, 24(sp)
800083e8: 2a e8        	sd	a0, 16(sp)
800083ea: 93 05 00 20  	addi	a1, zero, 512
800083ee: 97 b0 ff ff  	auipc	ra, 1048571
800083f2: e7 80 60 3f  	jalr	1014(ra)
800083f6: 2a e4        	sd	a0, 8(sp)
800083f8: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7as_addr17h3147afea3feb19e2E+0x16>
800083fa: 22 65        	ld	a0, 8(sp)
800083fc: e2 60        	ld	ra, 24(sp)
800083fe: 05 61        	addi	sp, sp, 32
80008400: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable7as_satp17h2d28ebafafdf8847E:

0000000080008402 <_ZN6kernel6memory7mapping10page_table9PageTable7as_satp17h2d28ebafafdf8847E>:
80008402: 01 11        	addi	sp, sp, -32
80008404: 06 ec        	sd	ra, 24(sp)
80008406: 2a e8        	sd	a0, 16(sp)
80008408: 93 05 00 20  	addi	a1, zero, 512
8000840c: 97 b0 ff ff  	auipc	ra, 1048571
80008410: e7 80 80 3d  	jalr	984(ra)
80008414: 2a e4        	sd	a0, 8(sp)
80008416: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7as_satp17h2d28ebafafdf8847E+0x16>
80008418: 22 65        	ld	a0, 8(sp)
8000841a: 93 55 c5 00  	srli	a1, a0, 12
8000841e: 2e e0        	sd	a1, 0(sp)
80008420: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7as_satp17h2d28ebafafdf8847E+0x20>
80008422: 7d 55        	addi	a0, zero, -1
80008424: 7e 15        	slli	a0, a0, 63
80008426: 82 65        	ld	a1, 0(sp)
80008428: 4d 8d        	or	a0, a0, a1
8000842a: e2 60        	ld	ra, 24(sp)
8000842c: 05 61        	addi	sp, sp, 32
8000842e: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E:

0000000080008430 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E>:
80008430: 1d 71        	addi	sp, sp, -96
80008432: 86 ec        	sd	ra, 88(sp)
80008434: 2a fc        	sd	a0, 56(sp)
80008436: 93 05 00 20  	addi	a1, zero, 512
8000843a: 97 b0 ff ff  	auipc	ra, 1048571
8000843e: e7 80 40 3b  	jalr	948(ra)
80008442: 2a ec        	sd	a0, 24(sp)
80008444: 2e e8        	sd	a1, 16(sp)
80008446: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x18>
80008448: 62 65        	ld	a0, 24(sp)
8000844a: c2 65        	ld	a1, 16(sp)
8000844c: 97 b0 ff ff  	auipc	ra, 1048571
80008450: e7 80 40 ba  	jalr	-1116(ra)
80008454: 2a e4        	sd	a0, 8(sp)
80008456: 2e e0        	sd	a1, 0(sp)
80008458: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x2a>
8000845a: 22 65        	ld	a0, 8(sp)
8000845c: 2a f0        	sd	a0, 32(sp)
8000845e: 82 65        	ld	a1, 0(sp)
80008460: 2e f4        	sd	a1, 40(sp)
80008462: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x34>
80008464: 08 10        	addi	a0, sp, 32
80008466: 97 b0 ff ff  	auipc	ra, 1048571
8000846a: e7 80 e0 c5  	jalr	-930(ra)
8000846e: 2a f8        	sd	a0, 48(sp)
80008470: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x42>
80008472: 42 75        	ld	a0, 48(sp)
80008474: b3 35 a0 00  	snez	a1, a0
80008478: 01 46        	mv	a2, zero
8000847a: 63 04 c5 00  	beq	a0, a2, 8 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x52>
8000847e: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x50>
80008480: 29 a0        	j	10 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x5a>
80008482: e6 60        	ld	ra, 88(sp)
80008484: 25 61        	addi	sp, sp, 96
80008486: 82 80        	ret
80008488: 00 00        	unimp	
8000848a: 42 75        	ld	a0, 48(sp)
8000848c: aa e0        	sd	a0, 64(sp)
8000848e: aa e4        	sd	a0, 72(sp)
80008490: aa e8        	sd	a0, 80(sp)
80008492: 97 b0 ff ff  	auipc	ra, 1048571
80008496: e7 80 40 49  	jalr	1172(ra)
8000849a: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x6c>
8000849c: e1 b7        	j	-56 <_ZN6kernel6memory7mapping10page_table9PageTable5clear17h59043a94450a3b04E+0x34>

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E:

000000008000849e <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E>:
8000849e: 15 71        	addi	sp, sp, -224
800084a0: 86 ed        	sd	ra, 216(sp)
800084a2: 2a f9        	sd	a0, 176(sp)
800084a4: 81 45        	mv	a1, zero
800084a6: ae f8        	sd	a1, 112(sp)
800084a8: 13 06 00 20  	addi	a2, zero, 512
800084ac: b2 fc        	sd	a2, 120(sp)
800084ae: aa f4        	sd	a0, 104(sp)
800084b0: 2e 85        	add	a0, zero, a1
800084b2: b2 85        	add	a1, zero, a2
800084b4: 97 20 00 00  	auipc	ra, 2
800084b8: e7 80 c0 73  	jalr	1852(ra)
800084bc: aa f0        	sd	a0, 96(sp)
800084be: ae ec        	sd	a1, 88(sp)
800084c0: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x24>
800084c2: 06 75        	ld	a0, 96(sp)
800084c4: 2a e1        	sd	a0, 128(sp)
800084c6: e6 65        	ld	a1, 88(sp)
800084c8: 2e e5        	sd	a1, 136(sp)
800084ca: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x2e>
800084cc: 08 01        	addi	a0, sp, 128
800084ce: 97 20 00 00  	auipc	ra, 2
800084d2: e7 80 40 6b  	jalr	1716(ra)
800084d6: 2a e9        	sd	a0, 144(sp)
800084d8: 2e ed        	sd	a1, 152(sp)
800084da: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x3e>
800084dc: 4a 65        	ld	a0, 144(sp)
800084de: 81 45        	mv	a1, zero
800084e0: 63 04 b5 00  	beq	a0, a1, 8 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x4a>
800084e4: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x48>
800084e6: 19 a8        	j	22 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x5e>
800084e8: 93 05 00 20  	addi	a1, zero, 512
800084ec: 26 75        	ld	a0, 104(sp)
800084ee: 97 b0 ff ff  	auipc	ra, 1048571
800084f2: e7 80 60 2f  	jalr	758(ra)
800084f6: aa e8        	sd	a0, 80(sp)
800084f8: 89 a2        	j	322 <.LBB4_41+0x18>
800084fa: 00 00        	unimp	
800084fc: 6a 65        	ld	a0, 152(sp)
800084fe: 2a fd        	sd	a0, 184(sp)
80008500: aa e1        	sd	a0, 192(sp)
80008502: aa e5        	sd	a0, 200(sp)
80008504: 93 05 f0 1f  	addi	a1, zero, 511
80008508: aa e4        	sd	a0, 72(sp)
8000850a: 63 e8 a5 14  	bltu	a1, a0, 336 <.LBB4_42>
8000850e: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x72>
80008510: 26 65        	ld	a0, 72(sp)
80008512: 93 15 35 00  	slli	a1, a0, 3
80008516: 26 76        	ld	a2, 104(sp)
80008518: b2 95        	add	a1, a1, a2
8000851a: 8c 61        	ld	a1, 0(a1)
8000851c: 2e f1        	sd	a1, 160(sp)
8000851e: 08 11        	addi	a0, sp, 160
80008520: 97 b0 ff ff  	auipc	ra, 1048571
80008524: e7 80 20 30  	jalr	770(ra)
80008528: aa e0        	sd	a0, 64(sp)
8000852a: 2d a0        	j	42 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xb6>
8000852c: 05 45        	addi	a0, zero, 1
8000852e: a3 06 a1 0a  	sb	a0, 173(sp)
80008532: 21 a8        	j	24 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xac>
80008534: 01 45        	mv	a0, zero
80008536: a3 06 a1 0a  	sb	a0, 173(sp)
8000853a: 01 a8        	j	16 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xac>
8000853c: 08 11        	addi	a0, sp, 160
8000853e: 97 b0 ff ff  	auipc	ra, 1048571
80008542: e7 80 60 31  	jalr	790(ra)
80008546: 2a fc        	sd	a0, 56(sp)
80008548: 8d a0        	j	98 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x10c>
8000854a: 03 45 d1 0a  	lbu	a0, 173(sp)
8000854e: 05 89        	andi	a0, a0, 1
80008550: 35 e5        	bnez	a0, 108 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x11e>
80008552: a5 a8        	j	120 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x12c>
80008554: 06 65        	ld	a0, 64(sp)
80008556: 7d f1        	bnez	a0, -26 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x9e>
80008558: f1 bf        	j	-36 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x96>
8000855a: 05 45        	addi	a0, zero, 1
8000855c: 23 07 a1 0a  	sb	a0, 174(sp)
80008560: 21 a8        	j	24 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xda>
80008562: 01 45        	mv	a0, zero
80008564: 23 07 a1 0a  	sb	a0, 174(sp)
80008568: 01 a8        	j	16 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xda>
8000856a: 08 11        	addi	a0, sp, 160
8000856c: 97 b0 ff ff  	auipc	ra, 1048571
80008570: e7 80 c0 34  	jalr	844(ra)
80008574: 2a f8        	sd	a0, 48(sp)
80008576: 81 a0        	j	64 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x118>
80008578: 03 45 e1 0a  	lbu	a0, 174(sp)
8000857c: 05 89        	andi	a0, a0, 1
8000857e: 5d f5        	bnez	a0, -82 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x8e>
80008580: 55 bf        	j	-76 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x96>
80008582: 05 45        	addi	a0, zero, 1
80008584: a3 07 a1 0a  	sb	a0, 175(sp)
80008588: 21 a8        	j	24 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x102>
8000858a: 01 45        	mv	a0, zero
8000858c: a3 07 a1 0a  	sb	a0, 175(sp)
80008590: 01 a8        	j	16 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x102>
80008592: 08 11        	addi	a0, sp, 160
80008594: 97 b0 ff ff  	auipc	ra, 1048571
80008598: e7 80 20 2f  	jalr	754(ra)
8000859c: 2a f4        	sd	a0, 40(sp)
8000859e: 09 a8        	j	18 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x112>
800085a0: 03 45 f1 0a  	lbu	a0, 175(sp)
800085a4: 05 89        	andi	a0, a0, 1
800085a6: 55 f9        	bnez	a0, -76 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xbc>
800085a8: c9 b7        	j	-62 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xcc>
800085aa: 62 75        	ld	a0, 56(sp)
800085ac: 79 f9        	bnez	a0, -42 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xe4>
800085ae: d5 b7        	j	-28 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xf4>
800085b0: 22 75        	ld	a0, 40(sp)
800085b2: 61 f9        	bnez	a0, -48 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xe4>
800085b4: d9 bf        	j	-42 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xec>
800085b6: 42 75        	ld	a0, 48(sp)
800085b8: 4d f1        	bnez	a0, -94 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xbc>
800085ba: 65 b7        	j	-88 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0xc4>
800085bc: 08 11        	addi	a0, sp, 160
800085be: 97 b0 ff ff  	auipc	ra, 1048571
800085c2: e7 80 c0 32  	jalr	812(ra)
800085c6: 2a f0        	sd	a0, 32(sp)
800085c8: 01 a8        	j	16 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x13a>
800085ca: 08 11        	addi	a0, sp, 160
800085cc: 97 b0 ff ff  	auipc	ra, 1048571
800085d0: e7 80 60 25  	jalr	598(ra)
800085d4: 2a ec        	sd	a0, 24(sp)
800085d6: 2d a8        	j	58 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x172>
800085d8: 02 75        	ld	a0, 32(sp)
800085da: aa e9        	sd	a0, 208(sp)
800085dc: 97 00 00 00  	auipc	ra, 0
800085e0: e7 80 20 ec  	jalr	-318(ra)
800085e4: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x148>
800085e6: 01 45        	mv	a0, zero
800085e8: 97 b0 ff ff  	auipc	ra, 1048571
800085ec: e7 80 60 22  	jalr	550(ra)
800085f0: 2a e8        	sd	a0, 16(sp)
800085f2: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x156>
800085f4: 13 05 f0 1f  	addi	a0, zero, 511
800085f8: a6 65        	ld	a1, 72(sp)
800085fa: 63 6c b5 06  	bltu	a0, a1, 120 <.LBB4_43>
800085fe: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x162>
80008600: 26 65        	ld	a0, 72(sp)
80008602: 93 15 35 00  	slli	a1, a0, 3
80008606: 26 76        	ld	a2, 104(sp)
80008608: b2 95        	add	a1, a1, a2
8000860a: c2 66        	ld	a3, 16(sp)
8000860c: 94 e1        	sd	a3, 0(a1)
8000860e: 2d a0        	j	42 <.LBB4_41+0x16>
80008610: 01 45        	mv	a0, zero
80008612: e2 65        	ld	a1, 24(sp)
80008614: 63 81 a5 02  	beq	a1, a0, 34 <.LBB4_41+0x14>
80008618: 09 a0        	j	2 <.LBB4_40>

000000008000861a <.LBB4_40>:
8000861a: 17 75 00 00  	auipc	a0, 7
8000861e: 13 05 65 ea  	addi	a0, a0, -346

0000000080008622 <.LBB4_41>:
80008622: 17 76 00 00  	auipc	a2, 7
80008626: 13 06 e6 eb  	addi	a2, a2, -322
8000862a: fd 45        	addi	a1, zero, 31
8000862c: 97 30 00 00  	auipc	ra, 3
80008630: e7 80 e0 10  	jalr	270(ra)
80008634: 00 00        	unimp	
80008636: 09 a0        	j	2 <.LBB4_41+0x16>
80008638: 51 bd        	j	-364 <_ZN6kernel6memory7mapping10page_table9PageTable8freewalk17h3fef64d861214ca3E+0x2e>
8000863a: 46 65        	ld	a0, 80(sp)
8000863c: 97 b0 ff ff  	auipc	ra, 1048571
80008640: e7 80 80 50  	jalr	1288(ra)
80008644: 2a e4        	sd	a0, 8(sp)
80008646: 09 a0        	j	2 <.LBB4_41+0x26>
80008648: 22 65        	ld	a0, 8(sp)
8000864a: 97 90 ff ff  	auipc	ra, 1048569
8000864e: e7 80 80 db  	jalr	-584(ra)
80008652: 09 a0        	j	2 <.LBB4_41+0x32>
80008654: ee 60        	ld	ra, 216(sp)
80008656: 2d 61        	addi	sp, sp, 224
80008658: 82 80        	ret

000000008000865a <.LBB4_42>:
8000865a: 17 76 00 00  	auipc	a2, 7
8000865e: 13 06 66 e3  	addi	a2, a2, -458
80008662: 93 05 00 20  	addi	a1, zero, 512
80008666: 26 65        	ld	a0, 72(sp)
80008668: 97 30 00 00  	auipc	ra, 3
8000866c: e7 80 e0 0f  	jalr	254(ra)
80008670: 00 00        	unimp	

0000000080008672 <.LBB4_43>:
80008672: 17 76 00 00  	auipc	a2, 7
80008676: 13 06 66 e3  	addi	a2, a2, -458
8000867a: 93 05 00 20  	addi	a1, zero, 512
8000867e: 26 65        	ld	a0, 72(sp)
80008680: 97 30 00 00  	auipc	ra, 3
80008684: e7 80 60 0e  	jalr	230(ra)
80008688: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable4walk17h8c504c36aee32e16E:

000000008000868a <_ZN6kernel6memory7mapping10page_table9PageTable4walk17h8c504c36aee32e16E>:
8000868a: 29 71        	addi	sp, sp, -320
8000868c: 06 fe        	sd	ra, 312(sp)
8000868e: b2 86        	add	a3, zero, a2
80008690: ae f4        	sd	a1, 104(sp)
80008692: 2a e2        	sd	a0, 256(sp)
80008694: 23 26 c1 10  	sw	a2, 268(sp)
80008698: aa fc        	sd	a0, 120(sp)
8000869a: a8 10        	addi	a0, sp, 104
8000869c: b6 f0        	sd	a3, 96(sp)
8000869e: 97 b0 ff ff  	auipc	ra, 1048571
800086a2: e7 80 c0 39  	jalr	924(ra)
800086a6: aa 85        	add	a1, zero, a0
800086a8: 2a ea        	sd	a0, 272(sp)
800086aa: ae ec        	sd	a1, 88(sp)
800086ac: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable4walk17h8c504c36aee32e16E+0x24>
800086ae: 05 45        	addi	a0, zero, 1
800086b0: 1a 15        	slli	a0, a0, 38
800086b2: 05 05        	addi	a0, a0, 1
800086b4: e6 65        	ld	a1, 88(sp)
800086b6: 63 e1 a5 02  	bltu	a1, a0, 34 <.LBB5_40+0x14>
800086ba: 09 a0        	j	2 <.LBB5_39>

00000000800086bc <.LBB5_39>:
800086bc: 17 55 00 00  	auipc	a0, 5
800086c0: 13 05 c5 1e  	addi	a0, a0, 492

00000000800086c4 <.LBB5_40>:
800086c4: 17 76 00 00  	auipc	a2, 7
800086c8: 13 06 46 e3  	addi	a2, a2, -460
800086cc: 91 45        	addi	a1, zero, 4
800086ce: 97 30 00 00  	auipc	ra, 3
800086d2: e7 80 c0 06  	jalr	108(ra)
800086d6: 00 00        	unimp	
800086d8: 08 19        	addi	a0, sp, 176
800086da: 85 45        	addi	a1, zero, 1
800086dc: 09 46        	addi	a2, zero, 2
800086de: 97 b0 ff ff  	auipc	ra, 1048571
800086e2: e7 80 a0 5a  	jalr	1450(ra)
800086e6: 09 a0        	j	2 <.LBB5_40+0x24>
800086e8: 28 09        	addi	a0, sp, 152
800086ea: 0c 19        	addi	a1, sp, 176
800086ec: 97 b0 ff ff  	auipc	ra, 1048571
800086f0: e7 80 80 6a  	jalr	1704(ra)
800086f4: 09 a0        	j	2 <.LBB5_40+0x32>
800086f6: 08 01        	addi	a0, sp, 128
800086f8: 2c 09        	addi	a1, sp, 152
800086fa: 97 b0 ff ff  	auipc	ra, 1048571
800086fe: e7 80 a0 6f  	jalr	1786(ra)
80008702: 09 a0        	j	2 <.LBB5_40+0x40>
80008704: 4a 65        	ld	a0, 144(sp)
80008706: aa ed        	sd	a0, 216(sp)
80008708: 2a 65        	ld	a0, 136(sp)
8000870a: aa e9        	sd	a0, 208(sp)
8000870c: 0a 65        	ld	a0, 128(sp)
8000870e: aa e5        	sd	a0, 200(sp)
80008710: 09 a0        	j	2 <.LBB5_40+0x4e>
80008712: a8 01        	addi	a0, sp, 200
80008714: 97 b0 ff ff  	auipc	ra, 1048571
80008718: e7 80 e0 6e  	jalr	1774(ra)
8000871c: aa f1        	sd	a0, 224(sp)
8000871e: ae f5        	sd	a1, 232(sp)
80008720: 09 a0        	j	2 <.LBB5_40+0x5e>
80008722: 0e 75        	ld	a0, 224(sp)
80008724: 81 45        	mv	a1, zero
80008726: 63 04 b5 00  	beq	a0, a1, 8 <.LBB5_40+0x6a>
8000872a: 09 a0        	j	2 <.LBB5_40+0x68>
8000872c: 11 a8        	j	20 <.LBB5_40+0x7c>
8000872e: a8 10        	addi	a0, sp, 104
80008730: 81 45        	mv	a1, zero
80008732: 97 b0 ff ff  	auipc	ra, 1048571
80008736: e7 80 c0 36  	jalr	876(ra)
8000873a: aa e8        	sd	a0, 80(sp)
8000873c: 11 a2        	j	260 <.LBB5_41+0x24>
8000873e: 00 00        	unimp	
80008740: 2e 75        	ld	a0, 232(sp)
80008742: 2a ee        	sd	a0, 280(sp)
80008744: 2a f2        	sd	a0, 288(sp)
80008746: 2a f6        	sd	a0, 296(sp)
80008748: ac 10        	addi	a1, sp, 104
8000874a: aa e4        	sd	a0, 72(sp)
8000874c: 2e 85        	add	a0, zero, a1
8000874e: a6 65        	ld	a1, 72(sp)
80008750: 97 b0 ff ff  	auipc	ra, 1048571
80008754: e7 80 e0 34  	jalr	846(ra)
80008758: aa e0        	sd	a0, 64(sp)
8000875a: 09 a0        	j	2 <.LBB5_40+0x98>
8000875c: 13 05 f0 1f  	addi	a0, zero, 511
80008760: 86 65        	ld	a1, 64(sp)
80008762: 63 61 b5 10  	bltu	a0, a1, 258 <.LBB5_42>
80008766: 09 a0        	j	2 <.LBB5_40+0xa4>
80008768: 66 75        	ld	a0, 120(sp)
8000876a: 86 65        	ld	a1, 64(sp)
8000876c: 13 96 35 00  	slli	a2, a1, 3
80008770: 32 95        	add	a0, a0, a2
80008772: 2a fa        	sd	a0, 304(sp)
80008774: 2a fc        	sd	a0, 56(sp)
80008776: 97 b0 ff ff  	auipc	ra, 1048571
8000877a: e7 80 c0 0a  	jalr	172(ra)
8000877e: 2a f8        	sd	a0, 48(sp)
80008780: 09 a0        	j	2 <.LBB5_40+0xbe>
80008782: 01 45        	mv	a0, zero
80008784: c2 75        	ld	a1, 48(sp)
80008786: 63 8a a5 00  	beq	a1, a0, 20 <.LBB5_40+0xd6>
8000878a: 09 a0        	j	2 <.LBB5_40+0xc8>
8000878c: 62 75        	ld	a0, 56(sp)
8000878e: 97 b0 ff ff  	auipc	ra, 1048571
80008792: e7 80 c0 15  	jalr	348(ra)
80008796: 2a f4        	sd	a0, 40(sp)
80008798: 09 a8        	j	18 <.LBB5_40+0xe6>
8000879a: 06 75        	ld	a0, 96(sp)
8000879c: 93 15 05 02  	slli	a1, a0, 32
800087a0: 81 91        	srli	a1, a1, 32
800087a2: 01 46        	mv	a2, zero
800087a4: 63 86 c5 00  	beq	a1, a2, 12 <.LBB5_40+0xec>
800087a8: 39 a0        	j	14 <.LBB5_40+0xf2>
800087aa: 22 75        	ld	a0, 40(sp)
800087ac: aa fc        	sd	a0, 120(sp)
800087ae: 41 a8        	j	144 <.LBB5_41+0x22>
800087b0: 01 45        	mv	a0, zero
800087b2: aa f8        	sd	a0, 112(sp)
800087b4: 5d a0        	j	166 <.LBB5_41+0x3e>
800087b6: 97 e0 ff ff  	auipc	ra, 1048574
800087ba: e7 80 40 ca  	jalr	-860(ra)
800087be: aa f9        	sd	a0, 240(sp)
800087c0: 09 a0        	j	2 <.LBB5_40+0xfe>
800087c2: 4e 75        	ld	a0, 240(sp)
800087c4: b3 35 a0 00  	snez	a1, a0
800087c8: 01 46        	mv	a2, zero
800087ca: 63 04 c5 00  	beq	a0, a2, 8 <.LBB5_40+0x10e>
800087ce: 09 a0        	j	2 <.LBB5_40+0x10c>
800087d0: 29 a0        	j	10 <.LBB5_40+0x116>
800087d2: 01 45        	mv	a0, zero
800087d4: aa f8        	sd	a0, 112(sp)
800087d6: 51 a0        	j	132 <.LBB5_41+0x3e>
800087d8: 00 00        	unimp	
800087da: 4e 75        	ld	a0, 240(sp)
800087dc: aa fd        	sd	a0, 248(sp)
800087de: a8 19        	addi	a0, sp, 248
800087e0: 97 e0 ff ff  	auipc	ra, 1048574
800087e4: e7 80 20 d0  	jalr	-766(ra)
800087e8: 2a f0        	sd	a0, 32(sp)
800087ea: 09 a0        	j	2 <.LBB5_40+0x128>
800087ec: 02 75        	ld	a0, 32(sp)
800087ee: 97 00 00 00  	auipc	ra, 0
800087f2: e7 80 20 c4  	jalr	-958(ra)
800087f6: 09 a0        	j	2 <.LBB5_40+0x134>
800087f8: 6e 75        	ld	a0, 248(sp)
800087fa: 97 e0 ff ff  	auipc	ra, 1048574
800087fe: e7 80 c0 cb  	jalr	-836(ra)
80008802: 2a ec        	sd	a0, 24(sp)
80008804: 09 a0        	j	2 <.LBB5_40+0x142>
80008806: 62 65        	ld	a0, 24(sp)
80008808: aa fc        	sd	a0, 120(sp)
8000880a: 93 55 c5 00  	srli	a1, a0, 12
8000880e: 2e e8        	sd	a1, 16(sp)
80008810: 09 a0        	j	2 <.LBB5_40+0x14e>
80008812: 42 65        	ld	a0, 16(sp)
80008814: 93 15 a5 00  	slli	a1, a0, 10
80008818: 2e e4        	sd	a1, 8(sp)
8000881a: 09 a0        	j	2 <.LBB5_41>

000000008000881c <.LBB5_41>:
8000881c: 17 55 00 00  	auipc	a0, 5
80008820: 13 05 c5 f9  	addi	a0, a0, -100
80008824: 97 b0 ff ff  	auipc	ra, 1048571
80008828: e7 80 e0 17  	jalr	382(ra)
8000882c: 2a e0        	sd	a0, 0(sp)
8000882e: 09 a0        	j	2 <.LBB5_41+0x14>
80008830: 22 65        	ld	a0, 8(sp)
80008832: 82 65        	ld	a1, 0(sp)
80008834: 33 66 b5 00  	or	a2, a0, a1
80008838: e2 76        	ld	a3, 56(sp)
8000883a: 90 e2        	sd	a2, 0(a3)
8000883c: 09 a0        	j	2 <.LBB5_41+0x22>
8000883e: d1 bd        	j	-300 <.LBB5_40+0x4e>
80008840: 13 05 f0 1f  	addi	a0, zero, 511
80008844: c6 65        	ld	a1, 80(sp)
80008846: 63 6b b5 02  	bltu	a0, a1, 54 <.LBB5_43>
8000884a: 09 a0        	j	2 <.LBB5_41+0x30>
8000884c: 66 75        	ld	a0, 120(sp)
8000884e: c6 65        	ld	a1, 80(sp)
80008850: 13 96 35 00  	slli	a2, a1, 3
80008854: 32 95        	add	a0, a0, a2
80008856: aa f8        	sd	a0, 112(sp)
80008858: 11 a0        	j	4 <.LBB5_41+0x40>
8000885a: 09 a0        	j	2 <.LBB5_41+0x40>
8000885c: 46 75        	ld	a0, 112(sp)
8000885e: f2 70        	ld	ra, 312(sp)
80008860: 31 61        	addi	sp, sp, 320
80008862: 82 80        	ret

0000000080008864 <.LBB5_42>:
80008864: 17 76 00 00  	auipc	a2, 7
80008868: 13 06 c6 ca  	addi	a2, a2, -852
8000886c: 93 05 00 20  	addi	a1, zero, 512
80008870: 06 65        	ld	a0, 64(sp)
80008872: 97 30 00 00  	auipc	ra, 3
80008876: e7 80 40 ef  	jalr	-268(ra)
8000887a: 00 00        	unimp	

000000008000887c <.LBB5_43>:
8000887c: 17 76 00 00  	auipc	a2, 7
80008880: 13 06 c6 ca  	addi	a2, a2, -852
80008884: 93 05 00 20  	addi	a1, zero, 512
80008888: 46 65        	ld	a0, 80(sp)
8000888a: 97 30 00 00  	auipc	ra, 3
8000888e: e7 80 c0 ed  	jalr	-292(ra)
80008892: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E:

0000000080008894 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E>:
80008894: 49 71        	addi	sp, sp, -368
80008896: 86 f6        	sd	ra, 360(sp)
80008898: 2e e1        	sd	a1, 128(sp)
8000889a: 32 e5        	sd	a2, 136(sp)
8000889c: 2a fa        	sd	a0, 304(sp)
8000889e: 36 fe        	sd	a3, 312(sp)
800088a0: ba e2        	sd	a4, 320(sp)
800088a2: 0c 01        	addi	a1, sp, 128
800088a4: aa fc        	sd	a0, 120(sp)
800088a6: 2e 85        	add	a0, zero, a1
800088a8: ba f8        	sd	a4, 112(sp)
800088aa: b6 f4        	sd	a3, 104(sp)
800088ac: 97 b0 ff ff  	auipc	ra, 1048571
800088b0: e7 80 e0 18  	jalr	398(ra)
800088b4: aa f0        	sd	a0, 96(sp)
800088b6: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x24>
800088b8: 06 75        	ld	a0, 96(sp)
800088ba: a6 75        	ld	a1, 104(sp)
800088bc: 33 06 b5 00  	add	a2, a0, a1
800088c0: b2 ec        	sd	a2, 88(sp)
800088c2: 63 64 a6 1a  	bltu	a2, a0, 424 <.LBB6_37>
800088c6: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x34>
800088c8: 66 65        	ld	a0, 88(sp)
800088ca: 97 b0 ff ff  	auipc	ra, 1048571
800088ce: e7 80 40 19  	jalr	404(ra)
800088d2: 2a ed        	sd	a0, 152(sp)
800088d4: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x42>
800088d6: 08 01        	addi	a0, sp, 128
800088d8: 97 f0 ff ff  	auipc	ra, 1048575
800088dc: e7 80 c0 65  	jalr	1628(ra)
800088e0: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x4e>
800088e2: 28 09        	addi	a0, sp, 152
800088e4: 97 f0 ff ff  	auipc	ra, 1048575
800088e8: e7 80 60 5c  	jalr	1478(ra)
800088ec: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x5a>
800088ee: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x5c>
800088f0: 08 01        	addi	a0, sp, 128
800088f2: 2c 09        	addi	a1, sp, 152
800088f4: 97 b0 ff ff  	auipc	ra, 1048571
800088f8: e7 80 a0 25  	jalr	602(ra)
800088fc: aa e8        	sd	a0, 80(sp)
800088fe: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x6c>
80008900: 46 65        	ld	a0, 80(sp)
80008902: 11 e5        	bnez	a0, 12 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x7a>
80008904: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x72>
80008906: 05 45        	addi	a0, zero, 1
80008908: a3 0b a1 08  	sb	a0, 151(sp)
8000890c: 91 aa        	j	340 <.LBB6_36+0x2e>
8000890e: 8a 65        	ld	a1, 128(sp)
80008910: 05 46        	addi	a2, zero, 1
80008912: 66 75        	ld	a0, 120(sp)
80008914: 97 00 00 00  	auipc	ra, 0
80008918: e7 80 60 d7  	jalr	-650(ra)
8000891c: 2a f1        	sd	a0, 160(sp)
8000891e: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x8c>
80008920: 0a 75        	ld	a0, 160(sp)
80008922: b3 35 a0 00  	snez	a1, a0
80008926: 01 46        	mv	a2, zero
80008928: 63 04 c5 00  	beq	a0, a2, 8 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x9c>
8000892c: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x9a>
8000892e: 31 a0        	j	12 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xa6>
80008930: 01 45        	mv	a0, zero
80008932: a3 0b a1 08  	sb	a0, 151(sp)
80008936: 2d a2        	j	298 <.LBB6_36+0x2e>
80008938: 00 00        	unimp	
8000893a: 0a 75        	ld	a0, 160(sp)
8000893c: aa e6        	sd	a0, 328(sp)
8000893e: aa e4        	sd	a0, 72(sp)
80008940: 97 b0 ff ff  	auipc	ra, 1048571
80008944: e7 80 20 ee  	jalr	-286(ra)
80008948: aa e0        	sd	a0, 64(sp)
8000894a: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xb8>
8000894c: 01 45        	mv	a0, zero
8000894e: 86 65        	ld	a1, 64(sp)
80008950: 63 8a a5 00  	beq	a1, a0, 20 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xd0>
80008954: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xc2>
80008956: 08 01        	addi	a0, sp, 128
80008958: 97 b0 ff ff  	auipc	ra, 1048571
8000895c: e7 80 20 0e  	jalr	226(ra)
80008960: 2a f2        	sd	a0, 288(sp)
80008962: 09 a8        	j	18 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xe0>
80008964: aa 65        	ld	a1, 136(sp)
80008966: 26 65        	ld	a0, 72(sp)
80008968: 46 76        	ld	a2, 112(sp)
8000896a: 97 b0 ff ff  	auipc	ra, 1048571
8000896e: e7 80 80 fc  	jalr	-56(ra)
80008972: d1 a8        	j	212 <.LBB6_36+0x14>
80008974: 28 01        	addi	a0, sp, 136
80008976: 97 b0 ff ff  	auipc	ra, 1048571
8000897a: e7 80 60 0d  	jalr	214(ra)
8000897e: 2a f6        	sd	a0, 296(sp)
80008980: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0xee>
80008982: 08 12        	addi	a0, sp, 288
80008984: 2a e6        	sd	a0, 264(sp)
80008986: 2c 12        	addi	a1, sp, 296
80008988: 2e ea        	sd	a1, 272(sp)
8000898a: 26 66        	ld	a2, 72(sp)
8000898c: 32 ee        	sd	a2, 280(sp)
8000898e: aa ea        	sd	a0, 336(sp)
80008990: ae ee        	sd	a1, 344(sp)
80008992: a6 66        	ld	a3, 72(sp)
80008994: b6 f2        	sd	a3, 352(sp)

0000000080008996 <.LBB6_30>:
80008996: 17 47 00 00  	auipc	a4, 4
8000899a: 13 07 e7 54  	addi	a4, a4, 1358
8000899e: 2e fc        	sd	a1, 56(sp)
800089a0: ba 85        	add	a1, zero, a4
800089a2: 32 f8        	sd	a2, 48(sp)
800089a4: 97 20 00 00  	auipc	ra, 2
800089a8: e7 80 80 7e  	jalr	2024(ra)
800089ac: 2a f4        	sd	a0, 40(sp)
800089ae: 2e f0        	sd	a1, 32(sp)
800089b0: 09 a0        	j	2 <.LBB6_31>

00000000800089b2 <.LBB6_31>:
800089b2: 97 45 00 00  	auipc	a1, 4
800089b6: 93 85 25 53  	addi	a1, a1, 1330
800089ba: 62 75        	ld	a0, 56(sp)
800089bc: 97 20 00 00  	auipc	ra, 2
800089c0: e7 80 00 7d  	jalr	2000(ra)
800089c4: 2a ec        	sd	a0, 24(sp)
800089c6: 2e e8        	sd	a1, 16(sp)
800089c8: 09 a0        	j	2 <.LBB6_32>

00000000800089ca <.LBB6_32>:
800089ca: 97 45 00 00  	auipc	a1, 4
800089ce: 93 85 a5 51  	addi	a1, a1, 1306
800089d2: 42 75        	ld	a0, 48(sp)
800089d4: 97 20 00 00  	auipc	ra, 2
800089d8: e7 80 80 7b  	jalr	1976(ra)
800089dc: 2a e4        	sd	a0, 8(sp)
800089de: 2e e0        	sd	a1, 0(sp)
800089e0: 09 a0        	j	2 <.LBB6_32+0x18>
800089e2: 22 75        	ld	a0, 40(sp)
800089e4: aa ed        	sd	a0, 216(sp)
800089e6: 82 75        	ld	a1, 32(sp)
800089e8: ae f1        	sd	a1, 224(sp)
800089ea: 62 66        	ld	a2, 24(sp)
800089ec: b2 f5        	sd	a2, 232(sp)
800089ee: c2 66        	ld	a3, 16(sp)
800089f0: b6 f9        	sd	a3, 240(sp)
800089f2: 22 67        	ld	a4, 8(sp)
800089f4: ba fd        	sd	a4, 248(sp)
800089f6: 82 67        	ld	a5, 0(sp)
800089f8: 3e e2        	sd	a5, 256(sp)

00000000800089fa <.LBB6_33>:
800089fa: 97 75 00 00  	auipc	a1, 7
800089fe: 93 85 65 b9  	addi	a1, a1, -1130

0000000080008a02 <.LBB6_34>:
80008a02: 97 77 00 00  	auipc	a5, 7
80008a06: 93 87 e7 bc  	addi	a5, a5, -1074
80008a0a: 28 11        	addi	a0, sp, 168
80008a0c: 11 46        	addi	a2, zero, 4
80008a0e: b4 09        	addi	a3, sp, 216
80008a10: 0d 48        	addi	a6, zero, 3
80008a12: 42 87        	add	a4, zero, a6
80008a14: 97 90 ff ff  	auipc	ra, 1048569
80008a18: e7 80 e0 c9  	jalr	-866(ra)
80008a1c: 09 a0        	j	2 <.LBB6_34+0x1c>
80008a1e: 28 11        	addi	a0, sp, 168
80008a20: 97 d0 ff ff  	auipc	ra, 1048573
80008a24: e7 80 20 84  	jalr	-1982(ra)
80008a28: 09 a0        	j	2 <.LBB6_35>

0000000080008a2a <.LBB6_35>:
80008a2a: 17 75 00 00  	auipc	a0, 7
80008a2e: 13 05 e5 c4  	addi	a0, a0, -946

0000000080008a32 <.LBB6_36>:
80008a32: 17 76 00 00  	auipc	a2, 7
80008a36: 13 06 e6 c4  	addi	a2, a2, -946
80008a3a: 95 45        	addi	a1, zero, 5
80008a3c: 97 30 00 00  	auipc	ra, 3
80008a40: e7 80 e0 cf  	jalr	-770(ra)
80008a44: 00 00        	unimp	
80008a46: 08 01        	addi	a0, sp, 128
80008a48: 97 f0 ff ff  	auipc	ra, 1048575
80008a4c: e7 80 40 52  	jalr	1316(ra)
80008a50: 09 a0        	j	2 <.LBB6_36+0x20>
80008a52: 28 01        	addi	a0, sp, 136
80008a54: 97 f0 ff ff  	auipc	ra, 1048575
80008a58: e7 80 20 56  	jalr	1378(ra)
80008a5c: 09 a0        	j	2 <.LBB6_36+0x2c>
80008a5e: 49 bd        	j	-366 <_ZN6kernel6memory7mapping10page_table9PageTable8mappages17h61efcabc15e87f38E+0x5c>
80008a60: 03 45 71 09  	lbu	a0, 151(sp)
80008a64: b6 70        	ld	ra, 360(sp)
80008a66: 75 61        	addi	sp, sp, 368
80008a68: 82 80        	ret

0000000080008a6a <.LBB6_37>:
80008a6a: 17 75 00 00  	auipc	a0, 7
80008a6e: 13 05 65 af  	addi	a0, a0, -1290

0000000080008a72 <.LBB6_38>:
80008a72: 17 76 00 00  	auipc	a2, 7
80008a76: 13 06 e6 ac  	addi	a2, a2, -1330
80008a7a: f1 45        	addi	a1, zero, 28
80008a7c: 97 30 00 00  	auipc	ra, 3
80008a80: e7 80 e0 cb  	jalr	-834(ra)
80008a84: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable6kvmmap17hc79e639b34a10a2fE:

0000000080008a86 <_ZN6kernel6memory7mapping10page_table9PageTable6kvmmap17hc79e639b34a10a2fE>:
80008a86: 69 71        	addi	sp, sp, -304
80008a88: 06 f6        	sd	ra, 296(sp)
80008a8a: ae f0        	sd	a1, 96(sp)
80008a8c: b2 f4        	sd	a2, 104(sp)
80008a8e: b6 f8        	sd	a3, 112(sp)
80008a90: 2a e2        	sd	a0, 256(sp)
80008a92: 3a e6        	sd	a4, 264(sp)
80008a94: 8c 10        	addi	a1, sp, 96
80008a96: aa ec        	sd	a0, 88(sp)
80008a98: 2e 85        	add	a0, zero, a1
80008a9a: ba e8        	sd	a4, 80(sp)
80008a9c: 97 b0 ff ff  	auipc	ra, 1048571
80008aa0: e7 80 e0 f9  	jalr	-98(ra)
80008aa4: aa f9        	sd	a0, 240(sp)
80008aa6: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable6kvmmap17hc79e639b34a10a2fE+0x22>
80008aa8: a8 10        	addi	a0, sp, 104
80008aaa: 97 b0 ff ff  	auipc	ra, 1048571
80008aae: e7 80 20 fa  	jalr	-94(ra)
80008ab2: aa fd        	sd	a0, 248(sp)
80008ab4: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable6kvmmap17hc79e639b34a10a2fE+0x30>
80008ab6: 88 19        	addi	a0, sp, 240
80008ab8: aa ed        	sd	a0, 216(sp)
80008aba: ac 19        	addi	a1, sp, 248
80008abc: ae f1        	sd	a1, 224(sp)
80008abe: 90 18        	addi	a2, sp, 112
80008ac0: b2 f5        	sd	a2, 232(sp)
80008ac2: 2a ea        	sd	a0, 272(sp)
80008ac4: 2e ee        	sd	a1, 280(sp)
80008ac6: 32 f2        	sd	a2, 288(sp)

0000000080008ac8 <.LBB7_11>:
80008ac8: 97 46 00 00  	auipc	a3, 4
80008acc: 93 86 c6 41  	addi	a3, a3, 1052
80008ad0: ae e4        	sd	a1, 72(sp)
80008ad2: b6 85        	add	a1, zero, a3
80008ad4: b2 e0        	sd	a2, 64(sp)
80008ad6: 97 20 00 00  	auipc	ra, 2
80008ada: e7 80 60 6b  	jalr	1718(ra)
80008ade: 2a fc        	sd	a0, 56(sp)
80008ae0: 2e f8        	sd	a1, 48(sp)
80008ae2: 09 a0        	j	2 <.LBB7_12>

0000000080008ae4 <.LBB7_12>:
80008ae4: 97 45 00 00  	auipc	a1, 4
80008ae8: 93 85 05 40  	addi	a1, a1, 1024
80008aec: 26 65        	ld	a0, 72(sp)
80008aee: 97 20 00 00  	auipc	ra, 2
80008af2: e7 80 e0 69  	jalr	1694(ra)
80008af6: 2a f4        	sd	a0, 40(sp)
80008af8: 2e f0        	sd	a1, 32(sp)
80008afa: 09 a0        	j	2 <.LBB7_13>

0000000080008afc <.LBB7_13>:
80008afc: 97 45 00 00  	auipc	a1, 4
80008b00: 93 85 85 3e  	addi	a1, a1, 1000
80008b04: 06 65        	ld	a0, 64(sp)
80008b06: 97 20 00 00  	auipc	ra, 2
80008b0a: e7 80 60 68  	jalr	1670(ra)
80008b0e: 2a ec        	sd	a0, 24(sp)
80008b10: 2e e8        	sd	a1, 16(sp)
80008b12: 09 a0        	j	2 <.LBB7_13+0x18>
80008b14: 62 75        	ld	a0, 56(sp)
80008b16: 2a f5        	sd	a0, 168(sp)
80008b18: c2 75        	ld	a1, 48(sp)
80008b1a: 2e f9        	sd	a1, 176(sp)
80008b1c: 22 76        	ld	a2, 40(sp)
80008b1e: 32 fd        	sd	a2, 184(sp)
80008b20: 82 76        	ld	a3, 32(sp)
80008b22: b6 e1        	sd	a3, 192(sp)
80008b24: 62 67        	ld	a4, 24(sp)
80008b26: ba e5        	sd	a4, 200(sp)
80008b28: c2 67        	ld	a5, 16(sp)
80008b2a: be e9        	sd	a5, 208(sp)

0000000080008b2c <.LBB7_14>:
80008b2c: 97 75 00 00  	auipc	a1, 7
80008b30: 93 85 45 b8  	addi	a1, a1, -1148

0000000080008b34 <.LBB7_15>:
80008b34: 97 77 00 00  	auipc	a5, 7
80008b38: 93 87 c7 a9  	addi	a5, a5, -1380
80008b3c: a8 18        	addi	a0, sp, 120
80008b3e: 11 46        	addi	a2, zero, 4
80008b40: 34 11        	addi	a3, sp, 168
80008b42: 0d 48        	addi	a6, zero, 3
80008b44: 42 87        	add	a4, zero, a6
80008b46: 97 90 ff ff  	auipc	ra, 1048569
80008b4a: e7 80 c0 b6  	jalr	-1172(ra)
80008b4e: 09 a0        	j	2 <.LBB7_15+0x1c>
80008b50: a8 18        	addi	a0, sp, 120
80008b52: 97 c0 ff ff  	auipc	ra, 1048572
80008b56: e7 80 00 71  	jalr	1808(ra)
80008b5a: 09 a0        	j	2 <.LBB7_15+0x28>
80008b5c: 86 75        	ld	a1, 96(sp)
80008b5e: 26 76        	ld	a2, 104(sp)
80008b60: c6 76        	ld	a3, 112(sp)
80008b62: 66 65        	ld	a0, 88(sp)
80008b64: 46 67        	ld	a4, 80(sp)
80008b66: 97 00 00 00  	auipc	ra, 0
80008b6a: e7 80 e0 d2  	jalr	-722(ra)
80008b6e: 2a e4        	sd	a0, 8(sp)
80008b70: 09 a0        	j	2 <.LBB7_15+0x3e>
80008b72: 22 65        	ld	a0, 8(sp)
80008b74: 05 e1        	bnez	a0, 32 <.LBB7_17+0x14>
80008b76: 09 a0        	j	2 <.LBB7_16>

0000000080008b78 <.LBB7_16>:
80008b78: 17 75 00 00  	auipc	a0, 7
80008b7c: 13 05 85 b7  	addi	a0, a0, -1160

0000000080008b80 <.LBB7_17>:
80008b80: 17 76 00 00  	auipc	a2, 7
80008b84: 13 06 86 b7  	addi	a2, a2, -1160
80008b88: 99 45        	addi	a1, zero, 6
80008b8a: 97 30 00 00  	auipc	ra, 3
80008b8e: e7 80 00 bb  	jalr	-1104(ra)
80008b92: 00 00        	unimp	
80008b94: b2 70        	ld	ra, 296(sp)
80008b96: 55 61        	addi	sp, sp, 304
80008b98: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E:

0000000080008b9a <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E>:
80008b9a: 79 71        	addi	sp, sp, -48
80008b9c: 06 f4        	sd	ra, 40(sp)
80008b9e: 97 e0 ff ff  	auipc	ra, 1048574
80008ba2: e7 80 c0 8b  	jalr	-1860(ra)
80008ba6: 2a ec        	sd	a0, 24(sp)
80008ba8: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x10>
80008baa: 62 65        	ld	a0, 24(sp)
80008bac: b3 35 a0 00  	snez	a1, a0
80008bb0: 01 46        	mv	a2, zero
80008bb2: 63 04 c5 00  	beq	a0, a2, 8 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x20>
80008bb6: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x1e>
80008bb8: 29 a0        	j	10 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x28>
80008bba: 01 45        	mv	a0, zero
80008bbc: 2a e8        	sd	a0, 16(sp)
80008bbe: 25 a0        	j	40 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x4c>
80008bc0: 00 00        	unimp	
80008bc2: 62 65        	ld	a0, 24(sp)
80008bc4: 2a f0        	sd	a0, 32(sp)
80008bc6: 08 10        	addi	a0, sp, 32
80008bc8: 97 e0 ff ff  	auipc	ra, 1048574
80008bcc: e7 80 a0 91  	jalr	-1766(ra)
80008bd0: 2a e4        	sd	a0, 8(sp)
80008bd2: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x3a>
80008bd4: 22 65        	ld	a0, 8(sp)
80008bd6: 97 00 00 00  	auipc	ra, 0
80008bda: e7 80 a0 85  	jalr	-1958(ra)
80008bde: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x46>
80008be0: 02 75        	ld	a0, 32(sp)
80008be2: 2a e8        	sd	a0, 16(sp)
80008be4: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable9uvmcreate17h0e012e415ec7dbc7E+0x4c>
80008be6: 42 65        	ld	a0, 16(sp)
80008be8: a2 70        	ld	ra, 40(sp)
80008bea: 45 61        	addi	sp, sp, 48
80008bec: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable7uvminit17h56d784e0687d6055E:

0000000080008bee <_ZN6kernel6memory7mapping10page_table9PageTable7uvminit17h56d784e0687d6055E>:
80008bee: 35 71        	addi	sp, sp, -160
80008bf0: 06 ed        	sd	ra, 152(sp)
80008bf2: aa f8        	sd	a0, 112(sp)
80008bf4: ae fc        	sd	a1, 120(sp)
80008bf6: 32 e1        	sd	a2, 128(sp)
80008bf8: 36 e5        	sd	a3, 136(sp)
80008bfa: b1 82        	srli	a3, a3, 12
80008bfc: 01 47        	mv	a4, zero
80008bfe: b2 e8        	sd	a2, 80(sp)
80008c00: ae e4        	sd	a1, 72(sp)
80008c02: aa e0        	sd	a0, 64(sp)
80008c04: 63 81 e6 02  	beq	a3, a4, 34 <.LBB9_17+0x14>
80008c08: 09 a0        	j	2 <.LBB9_16>

0000000080008c0a <.LBB9_16>:
80008c0a: 17 75 00 00  	auipc	a0, 7
80008c0e: 13 05 65 b0  	addi	a0, a0, -1274

0000000080008c12 <.LBB9_17>:
80008c12: 17 76 00 00  	auipc	a2, 7
80008c16: 13 06 e6 b1  	addi	a2, a2, -1250
80008c1a: e5 45        	addi	a1, zero, 25
80008c1c: 97 30 00 00  	auipc	ra, 3
80008c20: e7 80 e0 b1  	jalr	-1250(ra)
80008c24: 00 00        	unimp	
80008c26: 97 90 ff ff  	auipc	ra, 1048569
80008c2a: e7 80 00 91  	jalr	-1776(ra)
80008c2e: aa f0        	sd	a0, 96(sp)
80008c30: ae f4        	sd	a1, 104(sp)
80008c32: 09 a0        	j	2 <.LBB9_17+0x22>
80008c34: 06 75        	ld	a0, 96(sp)
80008c36: 85 45        	addi	a1, zero, 1
80008c38: 63 04 b5 00  	beq	a0, a1, 8 <.LBB9_17+0x2e>
80008c3c: 09 a0        	j	2 <.LBB9_17+0x2c>
80008c3e: 61 a8        	j	152 <.LBB9_17+0xc4>
80008c40: 26 75        	ld	a0, 104(sp)
80008c42: 2a e9        	sd	a0, 144(sp)
80008c44: 81 45        	mv	a1, zero
80008c46: 05 66        	lui	a2, 1
80008c48: 2a fc        	sd	a0, 56(sp)
80008c4a: 97 30 00 00  	auipc	ra, 3
80008c4e: e7 80 e0 87  	jalr	-1922(ra)
80008c52: 09 a0        	j	2 <.LBB9_17+0x42>
80008c54: 01 45        	mv	a0, zero
80008c56: 97 b0 ff ff  	auipc	ra, 1048571
80008c5a: e7 80 80 e0  	jalr	-504(ra)
80008c5e: 2a f8        	sd	a0, 48(sp)
80008c60: 09 a0        	j	2 <.LBB9_17+0x50>
80008c62: 62 75        	ld	a0, 56(sp)
80008c64: 97 b0 ff ff  	auipc	ra, 1048571
80008c68: e7 80 00 ee  	jalr	-288(ra)
80008c6c: 2a f4        	sd	a0, 40(sp)
80008c6e: 09 a0        	j	2 <.LBB9_17+0x5e>
80008c70: 11 45        	addi	a0, zero, 4
80008c72: 89 45        	addi	a1, zero, 2
80008c74: 97 b0 ff ff  	auipc	ra, 1048571
80008c78: e7 80 00 d2  	jalr	-736(ra)
80008c7c: 2a f0        	sd	a0, 32(sp)
80008c7e: 09 a0        	j	2 <.LBB9_17+0x6e>
80008c80: a1 45        	addi	a1, zero, 8
80008c82: 02 75        	ld	a0, 32(sp)
80008c84: 97 b0 ff ff  	auipc	ra, 1048571
80008c88: e7 80 00 d1  	jalr	-752(ra)
80008c8c: 2a ec        	sd	a0, 24(sp)
80008c8e: 09 a0        	j	2 <.LBB9_17+0x7e>
80008c90: c1 45        	addi	a1, zero, 16
80008c92: 62 65        	ld	a0, 24(sp)
80008c94: 97 b0 ff ff  	auipc	ra, 1048571
80008c98: e7 80 00 d0  	jalr	-768(ra)
80008c9c: 2a e8        	sd	a0, 16(sp)
80008c9e: 09 a0        	j	2 <.LBB9_17+0x8e>
80008ca0: 85 66        	lui	a3, 1
80008ca2: 06 65        	ld	a0, 64(sp)
80008ca4: c2 75        	ld	a1, 48(sp)
80008ca6: 22 76        	ld	a2, 40(sp)
80008ca8: 42 67        	ld	a4, 16(sp)
80008caa: 97 00 00 00  	auipc	ra, 0
80008cae: e7 80 a0 be  	jalr	-1046(ra)
80008cb2: 09 a0        	j	2 <.LBB9_17+0xa2>
80008cb4: 26 65        	ld	a0, 72(sp)
80008cb6: c6 65        	ld	a1, 80(sp)
80008cb8: 97 b0 ff ff  	auipc	ra, 1048571
80008cbc: e7 80 c0 1a  	jalr	428(ra)
80008cc0: 2a e4        	sd	a0, 8(sp)
80008cc2: 09 a0        	j	2 <.LBB9_17+0xb2>
80008cc4: 05 66        	lui	a2, 1
80008cc6: 22 65        	ld	a0, 8(sp)
80008cc8: e2 75        	ld	a1, 56(sp)
80008cca: 97 30 00 00  	auipc	ra, 3
80008cce: e7 80 00 84  	jalr	-1984(ra)
80008cd2: 09 a0        	j	2 <.LBB9_17+0xc2>
80008cd4: 09 a0        	j	2 <.LBB9_17+0xc4>
80008cd6: ea 60        	ld	ra, 152(sp)
80008cd8: 0d 61        	addi	sp, sp, 160
80008cda: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE:

0000000080008cdc <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE>:
80008cdc: 39 71        	addi	sp, sp, -64
80008cde: 06 fc        	sd	ra, 56(sp)
80008ce0: 2a f4        	sd	a0, 40(sp)
80008ce2: 2e f8        	sd	a1, 48(sp)
80008ce4: 01 46        	mv	a2, zero
80008ce6: 2e ec        	sd	a1, 24(sp)
80008ce8: 2a e8        	sd	a0, 16(sp)
80008cea: 63 8a c5 00  	beq	a1, a2, 20 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x22>
80008cee: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x14>
80008cf0: 62 65        	ld	a0, 24(sp)
80008cf2: 97 b0 ff ff  	auipc	ra, 1048571
80008cf6: e7 80 20 e5  	jalr	-430(ra)
80008cfa: 2a f0        	sd	a0, 32(sp)
80008cfc: 11 a0        	j	4 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x24>
80008cfe: 3d a8        	j	62 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x60>
80008d00: 08 10        	addi	a0, sp, 32
80008d02: 97 f0 ff ff  	auipc	ra, 1048575
80008d06: e7 80 e0 11  	jalr	286(ra)
80008d0a: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x30>
80008d0c: 01 45        	mv	a0, zero
80008d0e: 97 b0 ff ff  	auipc	ra, 1048571
80008d12: e7 80 00 d5  	jalr	-688(ra)
80008d16: 2a e4        	sd	a0, 8(sp)
80008d18: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x3e>
80008d1a: 08 10        	addi	a0, sp, 32
80008d1c: 97 b0 ff ff  	auipc	ra, 1048571
80008d20: e7 80 00 d3  	jalr	-720(ra)
80008d24: 2a e0        	sd	a0, 0(sp)
80008d26: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x4c>
80008d28: 85 46        	addi	a3, zero, 1
80008d2a: 42 65        	ld	a0, 16(sp)
80008d2c: a2 65        	ld	a1, 8(sp)
80008d2e: 02 66        	ld	a2, 0(sp)
80008d30: 97 00 00 00  	auipc	ra, 0
80008d34: e7 80 e0 01  	jalr	30(ra)
80008d38: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x5e>
80008d3a: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x60>
80008d3c: 42 65        	ld	a0, 16(sp)
80008d3e: 97 f0 ff ff  	auipc	ra, 1048575
80008d42: e7 80 00 76  	jalr	1888(ra)
80008d46: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable7uvmfree17h4aab94407c5a261bE+0x6c>
80008d48: e2 70        	ld	ra, 56(sp)
80008d4a: 21 61        	addi	sp, sp, 64
80008d4c: 82 80        	ret

Disassembly of section .text._ZN6kernel6memory7mapping10page_table9PageTable8uvmunmap17heded23887d4bb31eE:

0000000080008d4e <_ZN6kernel6memory7mapping10page_table9PageTable8uvmunmap17heded23887d4bb31eE>:
80008d4e: 55 71        	addi	sp, sp, -208
80008d50: 86 e5        	sd	ra, 200(sp)
80008d52: 2e e1        	sd	a1, 128(sp)
80008d54: 2a f1        	sd	a0, 160(sp)
80008d56: 32 f5        	sd	a2, 168(sp)
80008d58: 36 f9        	sd	a3, 176(sp)
80008d5a: 0c 01        	addi	a1, sp, 128
80008d5c: aa fc        	sd	a0, 120(sp)
80008d5e: 2e 85        	add	a0, zero, a1
80008d60: b6 f8        	sd	a3, 112(sp)
80008d62: b2 f4        	sd	a2, 104(sp)
80008d64: 97 f0 ff ff  	auipc	ra, 1048575
80008d68: e7 80 80 09  	jalr	152(ra)
80008d6c: aa f0        	sd	a0, 96(sp)
80008d6e: 09 a0        	j	2 <_ZN6kernel6memory7mapping10page_table9PageTable8uvmunmap17heded23887d4bb31eE+0x22>
80008d70: 06 75        	ld	a0, 96(sp)
80008d72: 05 e1        	bnez	a0, 32 <.LBB11_35+0x14>
80008d74: 09 a0        	j	2 <.LBB11_34>

0000000080008d76 <.LBB11_34>:
80008d76: 17 75 00 00  	auipc	a0, 7
80008d7a: 13 05 25 9d  	addi	a0, a0, -1582

0000000080008d7e <.LBB11_35>:
80008d7e: 17 76 00 00  	auipc	a2, 7
80008d82: 13 06 26 9e  	addi	a2, a2, -1566
80008d86: d5 45        	addi	a1, zero, 21
80008d88: 97 30 00 00  	auipc	ra, 3
80008d8c: e7 80 20 9b  	jalr	-1614(ra)
80008d90: 00 00        	unimp	
80008d92: 08 01        	addi	a0, sp, 128
80008d94: 97 b0 ff ff  	auipc	ra, 1048571
80008d98: e7 80 20 dd  	jalr	-558(ra)
80008d9c: 2a e5        	sd	a0, 136(sp)
80008d9e: 09 a0        	j	2 <.LBB11_35+0x22>
80008da0: 09 a0        	j	2 <.LBB11_35+0x24>
80008da2: 05 45        	addi	a0, zero, 1
80008da4: 52 15        	slli	a0, a0, 52
80008da6: 7d 15        	addi	a0, a0, -1
80008da8: a6 75        	ld	a1, 104(sp)
80008daa: 6d 8d        	and	a0, a0, a1
80008dac: b2 05        	slli	a1, a1, 12
80008dae: 26 76        	ld	a2, 104(sp)
80008db0: ae ec        	sd	a1, 88(sp)
80008db2: 63 1a c5 16  	bne	a0, a2, 372 <.LBB11_44>
80008db6: 09 a0        	j	2 <.LBB11_35+0x3a>
80008db8: 08 01        	addi	a0, sp, 128
80008dba: e6 65        	ld	a1, 88(sp)
80008dbc: 97 b0 ff ff  	auipc	ra, 1048571
80008dc0: e7 80 c0 ca  	jalr	-852(ra)
80008dc4: 2a e9        	sd	a0, 144(sp)
80008dc6: 09 a0        	j	2 <.LBB11_35+0x4a>
80008dc8: 28 01        	addi	a0, sp, 136
80008dca: 0c 09        	addi	a1, sp, 144
80008dcc: 97 b0 ff ff  	auipc	ra, 1048571
80008dd0: e7 80 20 d8  	jalr	-638(ra)
80008dd4: aa e8        	sd	a0, 80(sp)
80008dd6: 09 a0        	j	2 <.LBB11_35+0x5a>
80008dd8: 46 65        	ld	a0, 80(sp)
80008dda: 09 e5        	bnez	a0, 10 <.LBB11_35+0x66>
80008ddc: 09 a0        	j	2 <.LBB11_35+0x60>
80008dde: ae 60        	ld	ra, 200(sp)
80008de0: 69 61        	addi	sp, sp, 208
80008de2: 82 80        	ret
80008de4: 8a 65        	ld	a1, 128(sp)
80008de6: 01 45        	mv	a0, zero
80008de8: 66 76        	ld	a2, 120(sp)
80008dea: aa e4        	sd	a0, 72(sp)
80008dec: 32 85        	add	a0, zero, a2
80008dee: 26 66        	ld	a2, 72(sp)
80008df0: 97 00 00 00  	auipc	ra, 0
80008df4: e7 80 a0 89  	jalr	-1894(ra)
80008df8: 2a ed        	sd	a0, 152(sp)
80008dfa: 09 a0        	j	2 <.LBB11_35+0x7e>
80008dfc: 6a 65        	ld	a0, 152(sp)
80008dfe: b3 35 a0 00  	snez	a1, a0
80008e02: 01 46        	mv	a2, zero
80008e04: 63 04 c5 00  	beq	a0, a2, 8 <.LBB11_36>
80008e08: 09 a0        	j	2 <.LBB11_35+0x8c>
80008e0a: 05 a0        	j	32 <.LBB11_37+0x16>

0000000080008e0c <.LBB11_36>:
80008e0c: 17 55 00 00  	auipc	a0, 5
80008e10: 13 05 05 f9  	addi	a0, a0, -112

0000000080008e14 <.LBB11_37>:
80008e14: 17 76 00 00  	auipc	a2, 7
80008e18: 13 06 c6 9f  	addi	a2, a2, -1540
80008e1c: c1 45        	addi	a1, zero, 16
80008e1e: 97 30 00 00  	auipc	ra, 3
80008e22: e7 80 c0 91  	jalr	-1764(ra)
80008e26: 00 00        	unimp	
80008e28: 00 00        	unimp	
80008e2a: 6a 65        	ld	a0, 152(sp)
80008e2c: 2a fd        	sd	a0, 184(sp)
80008e2e: aa e0        	sd	a0, 64(sp)
80008e30: 97 b0 ff ff  	auipc	ra, 1048571
80008e34: e7 80 80 9e  	jalr	-1560(ra)
80008e38: 2a fc        	sd	a0, 56(sp)
80008e3a: 09 a0        	j	2 <.LBB11_38>

0000000080008e3c <.LBB11_38>:
80008e3c: 17 55 00 00  	auipc	a0, 5
80008e40: 13 05 c5 97  	addi	a0, a0, -1668
80008e44: 97 b0 ff ff  	auipc	ra, 1048571
80008e48: e7 80 e0 b5  	jalr	-1186(ra)
80008e4c: 2a f8        	sd	a0, 48(sp)
80008e4e: 09 a0        	j	2 <.LBB11_38+0x14>
80008e50: 62 75        	ld	a0, 56(sp)
80008e52: c2 75        	ld	a1, 48(sp)
80008e54: 33 76 b5 00  	and	a2, a0, a1
80008e58: 81 46        	mv	a3, zero
80008e5a: 63 11 d6 02  	bne	a2, a3, 34 <.LBB11_40+0x14>
80008e5e: 09 a0        	j	2 <.LBB11_39>

0000000080008e60 <.LBB11_39>:
80008e60: 17 75 00 00  	auipc	a0, 7
80008e64: 13 05 05 98  	addi	a0, a0, -1664

0000000080008e68 <.LBB11_40>:
80008e68: 17 76 00 00  	auipc	a2, 7
80008e6c: 13 06 06 99  	addi	a2, a2, -1648
80008e70: d1 45        	addi	a1, zero, 20
80008e72: 97 30 00 00  	auipc	ra, 3
80008e76: e7 80 80 8c  	jalr	-1848(ra)
80008e7a: 00 00        	unimp	
80008e7c: 06 65        	ld	a0, 64(sp)
80008e7e: 97 b0 ff ff  	auipc	ra, 1048571
80008e82: e7 80 a0 a8  	jalr	-1398(ra)
80008e86: 2a f4        	sd	a0, 40(sp)
80008e88: 09 a0        	j	2 <.LBB11_41>

0000000080008e8a <.LBB11_41>:
80008e8a: 17 55 00 00  	auipc	a0, 5
80008e8e: 13 05 e5 92  	addi	a0, a0, -1746
80008e92: 97 b0 ff ff  	auipc	ra, 1048571
80008e96: e7 80 00 b1  	jalr	-1264(ra)
80008e9a: 2a f0        	sd	a0, 32(sp)
80008e9c: 09 a0        	j	2 <.LBB11_41+0x14>
80008e9e: 22 75        	ld	a0, 40(sp)
80008ea0: 82 75        	ld	a1, 32(sp)
80008ea2: 63 11 b5 02  	bne	a0, a1, 34 <.LBB11_43+0x14>
80008ea6: 09 a0        	j	2 <.LBB11_42>

0000000080008ea8 <.LBB11_42>:
80008ea8: 17 75 00 00  	auipc	a0, 7
80008eac: 13 05 95 90  	addi	a0, a0, -1783

0000000080008eb0 <.LBB11_43>:
80008eb0: 17 76 00 00  	auipc	a2, 7
80008eb4: 13 06 86 91  	addi	a2, a2, -1768
80008eb8: d1 45        	addi	a1, zero, 20
80008eba: 97 30 00 00  	auipc	ra, 3
80008ebe: e7 80 00 88  	jalr	-1920(ra)
80008ec2: 00 00        	unimp	
80008ec4: 01 45        	mv	a0, zero
80008ec6: c6 75        	ld	a1, 112(sp)
80008ec8: 63 8a a5 00  	beq	a1, a0, 20 <.LBB11_43+0x2c>
80008ecc: 09 a0        	j	2 <.LBB11_43+0x1e>
80008ece: 06 65        	ld	a0, 64(sp)
80008ed0: 97 b0 ff ff  	auipc	ra, 1048571
80008ed4: e7 80 a0 a1  	jalr	-1510(ra)
80008ed8: 2a ec        	sd	a0, 24(sp)
80008eda: 11 a0        	j	4 <.LBB11_43+0x2e>
80008edc: 05 a8        	j	48 <.LBB11_43+0x5c>
80008ede: 62 65        	ld	a0, 24(sp)
80008ee0: 97 f0 ff ff  	auipc	ra, 1048575
80008ee4: e7 80 40 50  	jalr	1284(ra)
80008ee8: aa 85        	add	a1, zero, a0
80008eea: aa e1        	sd	a0, 192(sp)
80008eec: 2e e8        	sd	a1, 16(sp)
80008eee: 09 a0        	j	2 <.LBB11_43+0x40>
80008ef0: 42 65        	ld	a0, 16(sp)
80008ef2: 97 b0 ff ff  	auipc	ra, 1048571
80008ef6: e7 80 20 c5  	jalr	-942(ra)
80008efa: 2a e4        	sd	a0, 8(sp)
80008efc: 09 a0        	j	2 <.LBB11_43+0x4e>
80008efe: 22 65        	ld	a0, 8(sp)
80008f00: 97 80 ff ff  	auipc	ra, 1048568
80008f04: e7 80 20 50  	jalr	1282(ra)
80008f08: 09 a0        	j	2 <.LBB11_43+0x5a>
80008f0a: 09 a0        	j	2 <.LBB11_43+0x5c>
80008f0c: 06 65        	ld	a0, 64(sp)
80008f0e: 97 b0 ff ff  	auipc	ra, 1048571
80008f12: e7 80 80 a1  	jalr	-1512(ra)
80008f16: 09 a0        	j	2 <.LBB11_43+0x68>
80008f18: 28 01        	addi	a0, sp, 136
80008f1a: 97 f0 ff ff  	auipc	ra, 1048575
80008f1e: e7 80 20 05  	jalr	82(ra)
80008f22: 09 a0        	j	2 <.LBB11_43+0x74>
80008f24: bd bd        	j	-386 <.LBB11_35+0x24>

0000000080008f26 <.LBB11_44>:
80008f26: 17 75 00 00  	auipc	a0, 7
80008f2a: 13 05 a5 86  	addi	a0, a0, -1942

0000000080008f2e <.LBB11_45>:
80008f2e: 17 76 00 00  	auipc	a2, 7
80008f32: 13 06 a6 84  	addi	a2, a2, -1974
80008f36: 93 05 10 02  	addi	a1, zero, 33
80008f3a: 97 30 00 00  	auipc	ra, 3
80008f3e: e7 80 00 80  	jalr	-2048(ra)
80008f42: 00 00        	unimp	

Disassembly of section .text._ZN4core4sync6atomic10AtomicBool4load17h049a6d562cc5e4edE:

0000000080008f44 <_ZN4core4sync6atomic10AtomicBool4load17h049a6d562cc5e4edE>:
80008f44: 79 71        	addi	sp, sp, -48
80008f46: 06 f4        	sd	ra, 40(sp)
80008f48: 2e 86        	add	a2, zero, a1
80008f4a: 2a ec        	sd	a0, 24(sp)
80008f4c: a3 03 b1 02  	sb	a1, 39(sp)
80008f50: 32 e8        	sd	a2, 16(sp)
80008f52: 97 a0 ff ff  	auipc	ra, 1048570
80008f56: e7 80 00 85  	jalr	-1968(ra)
80008f5a: 2a e4        	sd	a0, 8(sp)
80008f5c: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool4load17h049a6d562cc5e4edE+0x1a>
80008f5e: 22 65        	ld	a0, 8(sp)
80008f60: c2 65        	ld	a1, 16(sp)
80008f62: 97 00 00 00  	auipc	ra, 0
80008f66: e7 80 a0 10  	jalr	266(ra)
80008f6a: 2a e0        	sd	a0, 0(sp)
80008f6c: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool4load17h049a6d562cc5e4edE+0x2a>
80008f6e: 02 65        	ld	a0, 0(sp)
80008f70: 93 75 f5 0f  	andi	a1, a0, 255
80008f74: 33 35 b0 00  	snez	a0, a1
80008f78: a2 70        	ld	ra, 40(sp)
80008f7a: 45 61        	addi	sp, sp, 48
80008f7c: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic10AtomicBool4swap17hd6bfd33399b583bfE:

0000000080008f7e <_ZN4core4sync6atomic10AtomicBool4swap17hd6bfd33399b583bfE>:
80008f7e: 39 71        	addi	sp, sp, -64
80008f80: 06 fc        	sd	ra, 56(sp)
80008f82: b2 86        	add	a3, zero, a2
80008f84: 2e 87        	add	a4, zero, a1
80008f86: 2a f4        	sd	a0, 40(sp)
80008f88: 23 0b b1 02  	sb	a1, 54(sp)
80008f8c: a3 0b c1 02  	sb	a2, 55(sp)
80008f90: 36 f0        	sd	a3, 32(sp)
80008f92: 3a ec        	sd	a4, 24(sp)
80008f94: 97 a0 ff ff  	auipc	ra, 1048570
80008f98: e7 80 e0 80  	jalr	-2034(ra)
80008f9c: 2a e8        	sd	a0, 16(sp)
80008f9e: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool4swap17hd6bfd33399b583bfE+0x22>
80008fa0: 42 65        	ld	a0, 16(sp)
80008fa2: e2 65        	ld	a1, 24(sp)
80008fa4: 02 76        	ld	a2, 32(sp)
80008fa6: 97 00 00 00  	auipc	ra, 0
80008faa: e7 80 c0 17  	jalr	380(ra)
80008fae: 2a e4        	sd	a0, 8(sp)
80008fb0: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool4swap17hd6bfd33399b583bfE+0x34>
80008fb2: 22 65        	ld	a0, 8(sp)
80008fb4: 93 75 f5 0f  	andi	a1, a0, 255
80008fb8: 33 35 b0 00  	snez	a0, a1
80008fbc: e2 70        	ld	ra, 56(sp)
80008fbe: 21 61        	addi	sp, sp, 64
80008fc0: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic10AtomicBool5store17h714e5f9ca85cd5d7E:

0000000080008fc2 <_ZN4core4sync6atomic10AtomicBool5store17h714e5f9ca85cd5d7E>:
80008fc2: 79 71        	addi	sp, sp, -48
80008fc4: 06 f4        	sd	ra, 40(sp)
80008fc6: b2 86        	add	a3, zero, a2
80008fc8: 2e 87        	add	a4, zero, a1
80008fca: 2a ec        	sd	a0, 24(sp)
80008fcc: 23 03 b1 02  	sb	a1, 38(sp)
80008fd0: a3 03 c1 02  	sb	a2, 39(sp)
80008fd4: 36 e8        	sd	a3, 16(sp)
80008fd6: 3a e4        	sd	a4, 8(sp)
80008fd8: 97 90 ff ff  	auipc	ra, 1048569
80008fdc: e7 80 a0 7c  	jalr	1994(ra)
80008fe0: 2a e0        	sd	a0, 0(sp)
80008fe2: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool5store17h714e5f9ca85cd5d7E+0x22>
80008fe4: 02 65        	ld	a0, 0(sp)
80008fe6: a2 65        	ld	a1, 8(sp)
80008fe8: 42 66        	ld	a2, 16(sp)
80008fea: 97 00 00 00  	auipc	ra, 0
80008fee: e7 80 60 2d  	jalr	726(ra)
80008ff2: 09 a0        	j	2 <_ZN4core4sync6atomic10AtomicBool5store17h714e5f9ca85cd5d7E+0x32>
80008ff4: a2 70        	ld	ra, 40(sp)
80008ff6: 45 61        	addi	sp, sp, 48
80008ff8: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic5fence17h37713e10a24bfe7cE:

0000000080008ffa <_ZN4core4sync6atomic5fence17h37713e10a24bfe7cE>:
80008ffa: 01 11        	addi	sp, sp, -32
80008ffc: aa 85        	add	a1, zero, a0
80008ffe: a3 0b a1 00  	sb	a0, 23(sp)
80009002: 13 75 f5 0f  	andi	a0, a0, 255
80009006: 01 46        	mv	a2, zero
80009008: 2a e4        	sd	a0, 8(sp)
8000900a: 63 03 c5 02  	beq	a0, a2, 38 <.LBB3_12>
8000900e: 09 a0        	j	2 <_ZN4core4sync6atomic5fence17h37713e10a24bfe7cE+0x16>
80009010: 05 45        	addi	a0, zero, 1
80009012: a2 65        	ld	a1, 8(sp)
80009014: 63 81 a5 04  	beq	a1, a0, 66 <.LBB3_13+0x1e>
80009018: 09 a0        	j	2 <_ZN4core4sync6atomic5fence17h37713e10a24bfe7cE+0x20>
8000901a: 09 45        	addi	a0, zero, 2
8000901c: a2 65        	ld	a1, 8(sp)
8000901e: 63 89 a5 02  	beq	a1, a0, 50 <.LBB3_13+0x18>
80009022: 09 a0        	j	2 <_ZN4core4sync6atomic5fence17h37713e10a24bfe7cE+0x2a>
80009024: 0d 45        	addi	a0, zero, 3
80009026: a2 65        	ld	a1, 8(sp)
80009028: 63 8a a5 02  	beq	a1, a0, 52 <.LBB3_13+0x24>
8000902c: 09 a0        	j	2 <_ZN4core4sync6atomic5fence17h37713e10a24bfe7cE+0x34>
8000902e: 15 a8        	j	52 <.LBB3_13+0x2a>

0000000080009030 <.LBB3_12>:
80009030: 17 65 00 00  	auipc	a0, 6
80009034: 13 05 85 7f  	addi	a0, a0, 2040

0000000080009038 <.LBB3_13>:
80009038: 17 76 00 00  	auipc	a2, 7
8000903c: 13 06 06 89  	addi	a2, a2, -1904
80009040: 93 05 90 02  	addi	a1, zero, 41
80009044: 97 20 00 00  	auipc	ra, 2
80009048: e7 80 60 6f  	jalr	1782(ra)
8000904c: 00 00        	unimp	
8000904e: 00 00        	unimp	
80009050: 0f 00 30 02  	fence	r, rw
80009054: 11 a8        	j	20 <.LBB3_13+0x30>
80009056: 0f 00 10 03  	fence	rw, w
8000905a: 39 a0        	j	14 <.LBB3_13+0x30>
8000905c: 0f 00 30 83  	fence.tso	
80009060: 21 a0        	j	8 <.LBB3_13+0x30>
80009062: 0f 00 30 03  	fence	rw, rw
80009066: 09 a0        	j	2 <.LBB3_13+0x30>
80009068: 05 61        	addi	sp, sp, 32
8000906a: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E:

000000008000906c <_ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E>:
8000906c: 01 11        	addi	sp, sp, -32
8000906e: 2e 86        	add	a2, zero, a1
80009070: 23 0b b1 00  	sb	a1, 22(sp)
80009074: 2a ec        	sd	a0, 24(sp)
80009076: 93 f5 f5 0f  	andi	a1, a1, 255
8000907a: 81 46        	mv	a3, zero
8000907c: 2a e4        	sd	a0, 8(sp)
8000907e: 2e e0        	sd	a1, 0(sp)
80009080: 63 8c d5 04  	beq	a1, a3, 88 <.LBB0_16+0x2a>
80009084: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E+0x1a>
80009086: 05 45        	addi	a0, zero, 1
80009088: 82 65        	ld	a1, 0(sp)
8000908a: 63 89 a5 06  	beq	a1, a0, 114 <.LBB0_17>
8000908e: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E+0x24>
80009090: 09 45        	addi	a0, zero, 2
80009092: 82 65        	ld	a1, 0(sp)
80009094: 63 89 a5 02  	beq	a1, a0, 50 <.LBB0_16+0x18>
80009098: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E+0x2e>
8000909a: 0d 45        	addi	a0, zero, 3
8000909c: 82 65        	ld	a1, 0(sp)
8000909e: 63 84 a5 00  	beq	a1, a0, 8 <.LBB0_15>
800090a2: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_load17hfcb8dcbc95504b55E+0x38>
800090a4: 89 a0        	j	66 <.LBB0_16+0x38>

00000000800090a6 <.LBB0_15>:
800090a6: 17 75 00 00  	auipc	a0, 7
800090aa: 13 05 a5 83  	addi	a0, a0, -1990

00000000800090ae <.LBB0_16>:
800090ae: 17 76 00 00  	auipc	a2, 7
800090b2: 13 06 a6 8d  	addi	a2, a2, -1830
800090b6: 93 05 10 03  	addi	a1, zero, 49
800090ba: 97 20 00 00  	auipc	ra, 2
800090be: e7 80 00 68  	jalr	1664(ra)
800090c2: 00 00        	unimp	
800090c4: 00 00        	unimp	
800090c6: 22 65        	ld	a0, 8(sp)
800090c8: 83 05 05 00  	lb	a1, 0(a0)
800090cc: 0f 00 30 02  	fence	r, rw
800090d0: a3 0b b1 00  	sb	a1, 23(sp)
800090d4: 09 a0        	j	2 <.LBB0_16+0x28>
800090d6: 91 a0        	j	68 <.LBB0_18+0x16>
800090d8: 22 65        	ld	a0, 8(sp)
800090da: 83 05 05 00  	lb	a1, 0(a0)
800090de: a3 0b b1 00  	sb	a1, 23(sp)
800090e2: 09 a0        	j	2 <.LBB0_16+0x36>
800090e4: 1d a8        	j	54 <.LBB0_18+0x16>
800090e6: 0f 00 30 03  	fence	rw, rw
800090ea: 22 65        	ld	a0, 8(sp)
800090ec: 83 05 05 00  	lb	a1, 0(a0)
800090f0: 0f 00 30 02  	fence	r, rw
800090f4: a3 0b b1 00  	sb	a1, 23(sp)
800090f8: 09 a0        	j	2 <.LBB0_16+0x4c>
800090fa: 05 a0        	j	32 <.LBB0_18+0x16>

00000000800090fc <.LBB0_17>:
800090fc: 17 75 00 00  	auipc	a0, 7
80009100: 13 05 45 8a  	addi	a0, a0, -1884

0000000080009104 <.LBB0_18>:
80009104: 17 76 00 00  	auipc	a2, 7
80009108: 13 06 46 8c  	addi	a2, a2, -1852
8000910c: 93 05 80 02  	addi	a1, zero, 40
80009110: 97 20 00 00  	auipc	ra, 2
80009114: e7 80 a0 62  	jalr	1578(ra)
80009118: 00 00        	unimp	
8000911a: 03 05 71 01  	lb	a0, 23(sp)
8000911e: 05 61        	addi	sp, sp, 32
80009120: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE:

0000000080009122 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE>:
80009122: 79 71        	addi	sp, sp, -48
80009124: b2 86        	add	a3, zero, a2
80009126: 2e 87        	add	a4, zero, a1
80009128: 23 0f c1 00  	sb	a2, 30(sp)
8000912c: 2a f0        	sd	a0, 32(sp)
8000912e: a3 07 b1 02  	sb	a1, 47(sp)
80009132: 93 75 f6 0f  	andi	a1, a2, 255
80009136: 01 46        	mv	a2, zero
80009138: 2a e8        	sd	a0, 16(sp)
8000913a: 3a e4        	sd	a4, 8(sp)
8000913c: 2e e0        	sd	a1, 0(sp)
8000913e: 63 8a c5 12  	beq	a1, a2, 308 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x150>
80009142: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x22>
80009144: 05 45        	addi	a0, zero, 1
80009146: 82 65        	ld	a1, 0(sp)
80009148: 63 81 a5 0a  	beq	a1, a0, 162 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0xc8>
8000914c: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x2c>
8000914e: 09 45        	addi	a0, zero, 2
80009150: 82 65        	ld	a1, 0(sp)
80009152: 63 8a a5 04  	beq	a1, a0, 84 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x84>
80009156: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x36>
80009158: 0d 45        	addi	a0, zero, 3
8000915a: 82 65        	ld	a1, 0(sp)
8000915c: 63 89 a5 0c  	beq	a1, a0, 210 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x10c>
80009160: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x40>
80009162: 42 65        	ld	a0, 16(sp)
80009164: 93 75 c5 ff  	andi	a1, a0, -4
80009168: 13 16 35 00  	slli	a2, a0, 3
8000916c: 61 8a        	andi	a2, a2, 24
8000916e: 93 06 f0 0f  	addi	a3, zero, 255
80009172: bb 96 c6 00  	sllw	a3, a3, a2
80009176: 22 67        	ld	a4, 8(sp)
80009178: 93 77 f7 0f  	andi	a5, a4, 255
8000917c: bb 97 c7 00  	sllw	a5, a5, a2
80009180: 2f a8 05 16  	<unknown>
80009184: be 88        	add	a7, zero, a5
80009186: b3 48 18 01  	xor	a7, a6, a7
8000918a: b3 f8 d8 00  	and	a7, a7, a3
8000918e: b3 48 18 01  	xor	a7, a6, a7
80009192: af a8 15 1f  	<unknown>
80009196: e3 95 08 fe  	bnez	a7, -22 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x5e>
8000919a: bb 55 c8 00  	srlw	a1, a6, a2
8000919e: a3 0f b1 00  	sb	a1, 31(sp)
800091a2: 11 aa        	j	276 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x194>
800091a4: 00 00        	unimp	
800091a6: 42 65        	ld	a0, 16(sp)
800091a8: 93 75 c5 ff  	andi	a1, a0, -4
800091ac: 13 16 35 00  	slli	a2, a0, 3
800091b0: 61 8a        	andi	a2, a2, 24
800091b2: 93 06 f0 0f  	addi	a3, zero, 255
800091b6: bb 96 c6 00  	sllw	a3, a3, a2
800091ba: 22 67        	ld	a4, 8(sp)
800091bc: 93 77 f7 0f  	andi	a5, a4, 255
800091c0: bb 97 c7 00  	sllw	a5, a5, a2
800091c4: 2f a8 05 14  	<unknown>
800091c8: be 88        	add	a7, zero, a5
800091ca: b3 48 18 01  	xor	a7, a6, a7
800091ce: b3 f8 d8 00  	and	a7, a7, a3
800091d2: b3 48 18 01  	xor	a7, a6, a7
800091d6: af a8 15 19  	<unknown>
800091da: e3 95 08 fe  	bnez	a7, -22 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0xa2>
800091de: bb 55 c8 00  	srlw	a1, a6, a2
800091e2: a3 0f b1 00  	sb	a1, 31(sp)
800091e6: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0xc6>
800091e8: c1 a8        	j	208 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x196>
800091ea: 42 65        	ld	a0, 16(sp)
800091ec: 93 75 c5 ff  	andi	a1, a0, -4
800091f0: 13 16 35 00  	slli	a2, a0, 3
800091f4: 61 8a        	andi	a2, a2, 24
800091f6: 93 06 f0 0f  	addi	a3, zero, 255
800091fa: bb 96 c6 00  	sllw	a3, a3, a2
800091fe: 22 67        	ld	a4, 8(sp)
80009200: 93 77 f7 0f  	andi	a5, a4, 255
80009204: bb 97 c7 00  	sllw	a5, a5, a2
80009208: 2f a8 05 10  	<unknown>
8000920c: be 88        	add	a7, zero, a5
8000920e: b3 48 18 01  	xor	a7, a6, a7
80009212: b3 f8 d8 00  	and	a7, a7, a3
80009216: b3 48 18 01  	xor	a7, a6, a7
8000921a: af a8 15 1b  	<unknown>
8000921e: e3 95 08 fe  	bnez	a7, -22 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0xe6>
80009222: bb 55 c8 00  	srlw	a1, a6, a2
80009226: a3 0f b1 00  	sb	a1, 31(sp)
8000922a: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x10a>
8000922c: 71 a0        	j	140 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x196>
8000922e: 42 65        	ld	a0, 16(sp)
80009230: 93 75 c5 ff  	andi	a1, a0, -4
80009234: 13 16 35 00  	slli	a2, a0, 3
80009238: 61 8a        	andi	a2, a2, 24
8000923a: 93 06 f0 0f  	addi	a3, zero, 255
8000923e: bb 96 c6 00  	sllw	a3, a3, a2
80009242: 22 67        	ld	a4, 8(sp)
80009244: 93 77 f7 0f  	andi	a5, a4, 255
80009248: bb 97 c7 00  	sllw	a5, a5, a2
8000924c: 2f a8 05 14  	<unknown>
80009250: be 88        	add	a7, zero, a5
80009252: b3 48 18 01  	xor	a7, a6, a7
80009256: b3 f8 d8 00  	and	a7, a7, a3
8000925a: b3 48 18 01  	xor	a7, a6, a7
8000925e: af a8 15 1b  	<unknown>
80009262: e3 95 08 fe  	bnez	a7, -22 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x12a>
80009266: bb 55 c8 00  	srlw	a1, a6, a2
8000926a: a3 0f b1 00  	sb	a1, 31(sp)
8000926e: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x14e>
80009270: a1 a0        	j	72 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x196>
80009272: 42 65        	ld	a0, 16(sp)
80009274: 93 75 c5 ff  	andi	a1, a0, -4
80009278: 13 16 35 00  	slli	a2, a0, 3
8000927c: 61 8a        	andi	a2, a2, 24
8000927e: 93 06 f0 0f  	addi	a3, zero, 255
80009282: bb 96 c6 00  	sllw	a3, a3, a2
80009286: 22 67        	ld	a4, 8(sp)
80009288: 93 77 f7 0f  	andi	a5, a4, 255
8000928c: bb 97 c7 00  	sllw	a5, a5, a2
80009290: 2f a8 05 10  	<unknown>
80009294: be 88        	add	a7, zero, a5
80009296: b3 48 18 01  	xor	a7, a6, a7
8000929a: b3 f8 d8 00  	and	a7, a7, a3
8000929e: b3 48 18 01  	xor	a7, a6, a7
800092a2: af a8 15 19  	<unknown>
800092a6: e3 95 08 fe  	bnez	a7, -22 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x16e>
800092aa: bb 55 c8 00  	srlw	a1, a6, a2
800092ae: a3 0f b1 00  	sb	a1, 31(sp)
800092b2: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x192>
800092b4: 11 a0        	j	4 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x196>
800092b6: 09 a0        	j	2 <_ZN4core4sync6atomic11atomic_swap17hbbd060324111d4dbE+0x196>
800092b8: 03 05 f1 01  	lb	a0, 31(sp)
800092bc: 45 61        	addi	sp, sp, 48
800092be: 82 80        	ret

Disassembly of section .text._ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE:

00000000800092c0 <_ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE>:
800092c0: 39 71        	addi	sp, sp, -64
800092c2: b2 86        	add	a3, zero, a2
800092c4: 2e 87        	add	a4, zero, a1
800092c6: a3 03 c1 02  	sb	a2, 39(sp)
800092ca: 2a f8        	sd	a0, 48(sp)
800092cc: a3 0f b1 02  	sb	a1, 63(sp)
800092d0: 93 75 f6 0f  	andi	a1, a2, 255
800092d4: 01 46        	mv	a2, zero
800092d6: 2a ec        	sd	a0, 24(sp)
800092d8: 3a e8        	sd	a4, 16(sp)
800092da: 2e e4        	sd	a1, 8(sp)
800092dc: 63 8b c5 04  	beq	a1, a2, 86 <.LBB2_16+0x28>
800092e0: 09 a0        	j	2 <_ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE+0x22>
800092e2: 05 45        	addi	a0, zero, 1
800092e4: a2 65        	ld	a1, 8(sp)
800092e6: 63 8e a5 02  	beq	a1, a0, 60 <.LBB2_16+0x18>
800092ea: 09 a0        	j	2 <_ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE+0x2c>
800092ec: 09 45        	addi	a0, zero, 2
800092ee: a2 65        	ld	a1, 8(sp)
800092f0: 63 8f a5 04  	beq	a1, a0, 94 <.LBB2_17>
800092f4: 09 a0        	j	2 <_ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE+0x36>
800092f6: 0d 45        	addi	a0, zero, 3
800092f8: a2 65        	ld	a1, 8(sp)
800092fa: 63 84 a5 00  	beq	a1, a0, 8 <.LBB2_15>
800092fe: 09 a0        	j	2 <_ZN4core4sync6atomic12atomic_store17h8768a2e81fc9eb3aE+0x40>
80009300: 3d a8        	j	62 <.LBB2_16+0x34>

0000000080009302 <.LBB2_15>:
80009302: 17 65 00 00  	auipc	a0, 6
80009306: 13 05 e5 6d  	addi	a0, a0, 1758

000000008000930a <.LBB2_16>:
8000930a: 17 66 00 00  	auipc	a2, 6
8000930e: 13 06 e6 70  	addi	a2, a2, 1806
80009312: 93 05 20 03  	addi	a1, zero, 50
80009316: 97 20 00 00  	auipc	ra, 2
8000931a: e7 80 40 42  	jalr	1060(ra)
8000931e: 00 00        	unimp	
80009320: 00 00        	unimp	
80009322: 0f 00 10 03  	fence	rw, w
80009326: 42 65        	ld	a0, 16(sp)
80009328: e2 65        	ld	a1, 24(sp)
8000932a: 23 80 a5 00  	sb	a0, 0(a1)
8000932e: 09 a0        	j	2 <.LBB2_16+0x26>
80009330: 35 a8        	j	60 <.LBB2_18+0x16>
80009332: 42 65        	ld	a0, 16(sp)
80009334: e2 65        	ld	a1, 24(sp)
80009336: 23 80 a5 00  	sb	a0, 0(a1)
8000933a: 09 a0        	j	2 <.LBB2_16+0x32>
8000933c: 05 a8        	j	48 <.LBB2_18+0x16>
8000933e: 0f 00 10 03  	fence	rw, w
80009342: 42 65        	ld	a0, 16(sp)
80009344: e2 65        	ld	a1, 24(sp)
80009346: 23 80 a5 00  	sb	a0, 0(a1)
8000934a: 09 a0        	j	2 <.LBB2_16+0x42>
8000934c: 05 a0        	j	32 <.LBB2_18+0x16>

000000008000934e <.LBB2_17>:
8000934e: 17 65 00 00  	auipc	a0, 6
80009352: 13 05 25 6e  	addi	a0, a0, 1762

0000000080009356 <.LBB2_18>:
80009356: 17 66 00 00  	auipc	a2, 6
8000935a: 13 06 a6 70  	addi	a2, a2, 1802
8000935e: 93 05 a0 02  	addi	a1, zero, 42
80009362: 97 20 00 00  	auipc	ra, 2
80009366: e7 80 80 3d  	jalr	984(ra)
8000936a: 00 00        	unimp	
8000936c: 21 61        	addi	sp, sp, 64
8000936e: 82 80        	ret

Disassembly of section .text._ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hae51d4d18b1a0cb8E:

0000000080009370 <_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hae51d4d18b1a0cb8E>:
80009370: 79 71        	addi	sp, sp, -48
80009372: 06 f4        	sd	ra, 40(sp)
80009374: 2a e8        	sd	a0, 16(sp)
80009376: 2e ec        	sd	a1, 24(sp)
80009378: 97 b0 ff ff  	auipc	ra, 1048571
8000937c: e7 80 e0 a3  	jalr	-1474(ra)
80009380: 2a e4        	sd	a0, 8(sp)
80009382: 2e e0        	sd	a1, 0(sp)
80009384: 09 a0        	j	2 <_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hae51d4d18b1a0cb8E+0x16>
80009386: 22 65        	ld	a0, 8(sp)
80009388: 82 65        	ld	a1, 0(sp)
8000938a: a2 70        	ld	ra, 40(sp)
8000938c: 45 61        	addi	sp, sp, 48
8000938e: 82 80        	ret

Disassembly of section .text._ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hbe6f695f9d9ffed9E:

0000000080009390 <_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hbe6f695f9d9ffed9E>:
80009390: 39 71        	addi	sp, sp, -64
80009392: 06 fc        	sd	ra, 56(sp)
80009394: 2a f0        	sd	a0, 32(sp)
80009396: 2e f4        	sd	a1, 40(sp)
80009398: 32 f8        	sd	a2, 48(sp)
8000939a: 2a ec        	sd	a0, 24(sp)
8000939c: 32 85        	add	a0, zero, a2
8000939e: 62 66        	ld	a2, 24(sp)
800093a0: 2e e8        	sd	a1, 16(sp)
800093a2: b2 85        	add	a1, zero, a2
800093a4: 42 66        	ld	a2, 16(sp)
800093a6: 97 b0 ff ff  	auipc	ra, 1048571
800093aa: e7 80 20 8a  	jalr	-1886(ra)
800093ae: 2a e4        	sd	a0, 8(sp)
800093b0: 2e e0        	sd	a1, 0(sp)
800093b2: 09 a0        	j	2 <_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17hbe6f695f9d9ffed9E+0x24>
800093b4: 22 65        	ld	a0, 8(sp)
800093b6: 82 65        	ld	a1, 0(sp)
800093b8: e2 70        	ld	ra, 56(sp)
800093ba: 21 61        	addi	sp, sp, 64
800093bc: 82 80        	ret

Disassembly of section .text._ZN73_$LT$kernel..define..Address$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17h7253c30b61a2f48fE:

00000000800093be <_ZN73_$LT$kernel..define..Address$u20$as$u20$kernel..memory..address..Addr$GT$8as_usize17h7253c30b61a2f48fE>:
800093be: 41 11        	addi	sp, sp, -16
800093c0: 2a e4        	sd	a0, 8(sp)
800093c2: 08 61        	ld	a0, 0(a0)
800093c4: 41 01        	addi	sp, sp, 16
800093c6: 82 80        	ret

Disassembly of section .text._ZN6kernel6define7Address8add_addr17h6fd35e2404e3444eE:

00000000800093c8 <_ZN6kernel6define7Address8add_addr17h6fd35e2404e3444eE>:
800093c8: 01 11        	addi	sp, sp, -32
800093ca: 2a e8        	sd	a0, 16(sp)
800093cc: 2e ec        	sd	a1, 24(sp)
800093ce: 08 61        	ld	a0, 0(a0)
800093d0: aa 95        	add	a1, a1, a0
800093d2: 2e e0        	sd	a1, 0(sp)
800093d4: 63 e7 a5 00  	bltu	a1, a0, 14 <.LBB1_3>
800093d8: 09 a0        	j	2 <_ZN6kernel6define7Address8add_addr17h6fd35e2404e3444eE+0x12>
800093da: 02 65        	ld	a0, 0(sp)
800093dc: 2a e4        	sd	a0, 8(sp)
800093de: 05 61        	addi	sp, sp, 32
800093e0: 82 80        	ret

00000000800093e2 <.LBB1_3>:
800093e2: 17 65 00 00  	auipc	a0, 6
800093e6: 13 05 e5 6c  	addi	a0, a0, 1742

00000000800093ea <.LBB1_4>:
800093ea: 17 66 00 00  	auipc	a2, 6
800093ee: 13 06 66 6a  	addi	a2, a2, 1702
800093f2: f1 45        	addi	a1, zero, 28
800093f4: 97 20 00 00  	auipc	ra, 2
800093f8: e7 80 60 34  	jalr	838(ra)
800093fc: 00 00        	unimp	

Disassembly of section .text._ZN6kernel6define86_$LT$impl$u20$core..convert..From$LT$kernel..define..Address$GT$$u20$for$u20$usize$GT$4from17h565daee6a6ec6270E:

00000000800093fe <_ZN6kernel6define86_$LT$impl$u20$core..convert..From$LT$kernel..define..Address$GT$$u20$for$u20$usize$GT$4from17h565daee6a6ec6270E>:
800093fe: 41 11        	addi	sp, sp, -16
80009400: 2a e4        	sd	a0, 8(sp)
80009402: 2a e0        	sd	a0, 0(sp)
80009404: 41 01        	addi	sp, sp, 16
80009406: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h4f36a2b55945e684E:

0000000080009408 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h4f36a2b55945e684E>:
80009408: 01 11        	addi	sp, sp, -32
8000940a: 06 ec        	sd	ra, 24(sp)
8000940c: 2a e4        	sd	a0, 8(sp)
8000940e: 2e e8        	sd	a1, 16(sp)
80009410: 97 00 00 00  	auipc	ra, 0
80009414: e7 80 00 06  	jalr	96(ra)
80009418: 2a e0        	sd	a0, 0(sp)
8000941a: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h4f36a2b55945e684E+0x14>
8000941c: 02 65        	ld	a0, 0(sp)
8000941e: e2 60        	ld	ra, 24(sp)
80009420: 05 61        	addi	sp, sp, 32
80009422: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h967551d4dbc9de58E:

0000000080009424 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h967551d4dbc9de58E>:
80009424: 01 11        	addi	sp, sp, -32
80009426: 06 ec        	sd	ra, 24(sp)
80009428: 2a e0        	sd	a0, 0(sp)
8000942a: 2e e4        	sd	a1, 8(sp)
8000942c: 32 e8        	sd	a2, 16(sp)
8000942e: 97 10 00 00  	auipc	ra, 1
80009432: e7 80 20 74  	jalr	1858(ra)
80009436: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h967551d4dbc9de58E+0x14>
80009438: e2 60        	ld	ra, 24(sp)
8000943a: 05 61        	addi	sp, sp, 32
8000943c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E:

000000008000943e <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E>:
8000943e: 79 71        	addi	sp, sp, -48
80009440: 06 f4        	sd	ra, 40(sp)
80009442: 2a f0        	sd	a0, 32(sp)
80009444: 2a e8        	sd	a0, 16(sp)
80009446: 97 00 00 00  	auipc	ra, 0
8000944a: e7 80 60 04  	jalr	70(ra)
8000944e: 2a e4        	sd	a0, 8(sp)
80009450: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E+0x14>
80009452: 01 45        	mv	a0, zero
80009454: a2 65        	ld	a1, 8(sp)
80009456: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E+0x24>
8000945a: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E+0x1e>
8000945c: 01 45        	mv	a0, zero
8000945e: 2a ec        	sd	a0, 24(sp)
80009460: 21 a0        	j	8 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E+0x2a>
80009462: 42 65        	ld	a0, 16(sp)
80009464: 2a ec        	sd	a0, 24(sp)
80009466: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17hb7365b8a7db6e5a3E+0x2a>
80009468: 62 65        	ld	a0, 24(sp)
8000946a: a2 70        	ld	ra, 40(sp)
8000946c: 45 61        	addi	sp, sp, 48
8000946e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h9658772a24dd5e1aE:

0000000080009470 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h9658772a24dd5e1aE>:
80009470: 01 11        	addi	sp, sp, -32
80009472: 2a e4        	sd	a0, 8(sp)
80009474: 2e e8        	sd	a1, 16(sp)
80009476: 13 06 00 03  	addi	a2, zero, 48
8000947a: b3 85 c5 02  	<unknown>
8000947e: 2e 95        	add	a0, a0, a1
80009480: 2a ec        	sd	a0, 24(sp)
80009482: 2a e0        	sd	a0, 0(sp)
80009484: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17h9658772a24dd5e1aE+0x16>
80009486: 02 65        	ld	a0, 0(sp)
80009488: 05 61        	addi	sp, sp, 32
8000948a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h40dd715e5b8a8007E:

000000008000948c <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h40dd715e5b8a8007E>:
8000948c: 79 71        	addi	sp, sp, -48
8000948e: 06 f4        	sd	ra, 40(sp)
80009490: 2a f0        	sd	a0, 32(sp)
80009492: 2a ec        	sd	a0, 24(sp)
80009494: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h40dd715e5b8a8007E+0xa>
80009496: 01 45        	mv	a0, zero
80009498: e2 65        	ld	a1, 24(sp)
8000949a: 2a e8        	sd	a0, 16(sp)
8000949c: 2e 85        	add	a0, zero, a1
8000949e: c2 65        	ld	a1, 16(sp)
800094a0: 97 20 00 00  	auipc	ra, 2
800094a4: e7 80 e0 a5  	jalr	-1442(ra)
800094a8: 2a e4        	sd	a0, 8(sp)
800094aa: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h40dd715e5b8a8007E+0x20>
800094ac: 22 65        	ld	a0, 8(sp)
800094ae: a2 70        	ld	ra, 40(sp)
800094b0: 45 61        	addi	sp, sp, 48
800094b2: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$10as_mut_ptr17hc807e4bd1553e294E:

00000000800094b4 <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$10as_mut_ptr17hc807e4bd1553e294E>:
800094b4: 41 11        	addi	sp, sp, -16
800094b6: 2a e0        	sd	a0, 0(sp)
800094b8: 2e e4        	sd	a1, 8(sp)
800094ba: 41 01        	addi	sp, sp, 16
800094bc: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h9bc5938c814cdf42E:

00000000800094be <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h9bc5938c814cdf42E>:
800094be: 39 71        	addi	sp, sp, -64
800094c0: 06 fc        	sd	ra, 56(sp)
800094c2: 2a f0        	sd	a0, 32(sp)
800094c4: 2e f4        	sd	a1, 40(sp)
800094c6: 32 f8        	sd	a2, 48(sp)
800094c8: 2a ec        	sd	a0, 24(sp)
800094ca: 32 85        	add	a0, zero, a2
800094cc: 62 66        	ld	a2, 24(sp)
800094ce: 2e e8        	sd	a1, 16(sp)
800094d0: b2 85        	add	a1, zero, a2
800094d2: 42 66        	ld	a2, 16(sp)
800094d4: 97 10 00 00  	auipc	ra, 1
800094d8: e7 80 60 7e  	jalr	2022(ra)
800094dc: 2a e4        	sd	a0, 8(sp)
800094de: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h9bc5938c814cdf42E+0x22>
800094e0: 22 65        	ld	a0, 8(sp)
800094e2: e2 70        	ld	ra, 56(sp)
800094e4: 21 61        	addi	sp, sp, 64
800094e6: 82 80        	ret

Disassembly of section .text._ZN9allocator11BuddySystem4init17he503fccf0216b709E:

00000000800094e8 <_ZN9allocator11BuddySystem4init17he503fccf0216b709E>:
800094e8: 13 01 01 d1  	addi	sp, sp, -752
800094ec: 23 34 11 2e  	sd	ra, 744(sp)
800094f0: 23 30 a1 20  	sd	a0, 512(sp)
800094f4: 23 34 b1 20  	sd	a1, 520(sp)
800094f8: 23 38 c1 20  	sd	a2, 528(sp)
800094fc: 23 3c d1 20  	sd	a3, 536(sp)
80009500: 23 30 e1 22  	sd	a4, 544(sp)
80009504: 83 47 85 03  	lbu	a5, 56(a0)
80009508: 85 8b        	andi	a5, a5, 1
8000950a: 01 48        	mv	a6, zero
8000950c: ba fe        	sd	a4, 376(sp)
8000950e: b6 fa        	sd	a3, 368(sp)
80009510: b2 f6        	sd	a2, 360(sp)
80009512: ae f2        	sd	a1, 352(sp)
80009514: aa ee        	sd	a0, 344(sp)
80009516: 63 8b 07 01  	beq	a5, a6, 22 <.LBB8_78+0x10>
8000951a: 09 a0        	j	2 <.LBB8_78>

000000008000951c <.LBB8_78>:
8000951c: 17 65 00 00  	auipc	a0, 6
80009520: 13 05 05 5b  	addi	a0, a0, 1456
80009524: 2a e3        	sd	a0, 384(sp)
80009526: 29 45        	addi	a0, zero, 10
80009528: 2a e7        	sd	a0, 392(sp)
8000952a: 05 a1        	j	1056 <.LBB8_81+0x20>
8000952c: 36 75        	ld	a0, 360(sp)
8000952e: 96 75        	ld	a1, 352(sp)
80009530: 33 06 b5 40  	sub	a2, a0, a1
80009534: b2 ea        	sd	a2, 336(sp)
80009536: 63 61 c5 42  	bltu	a0, a2, 1058 <.LBB8_82>
8000953a: 09 a0        	j	2 <.LBB8_78+0x20>
8000953c: 56 65        	ld	a0, 336(sp)
8000953e: d6 75        	ld	a1, 368(sp)
80009540: 63 7b b5 00  	bgeu	a0, a1, 22 <.LBB8_79+0x10>
80009544: 09 a0        	j	2 <.LBB8_79>

0000000080009546 <.LBB8_79>:
80009546: 17 65 00 00  	auipc	a0, 6
8000954a: 13 05 b5 61  	addi	a0, a0, 1563
8000954e: 2a e3        	sd	a0, 384(sp)
80009550: 3d 45        	addi	a0, zero, 15
80009552: 2a e7        	sd	a0, 392(sp)
80009554: dd ae        	j	1014 <.LBB8_81+0x20>
80009556: 56 75        	ld	a0, 368(sp)
80009558: 97 20 00 00  	auipc	ra, 2
8000955c: e7 80 20 da  	jalr	-606(ra)
80009560: aa e6        	sd	a0, 328(sp)
80009562: 2d a0        	j	42 <.LBB8_79+0x46>
80009564: 05 45        	addi	a0, zero, 1
80009566: a3 0b a1 18  	sb	a0, 407(sp)
8000956a: 21 a8        	j	24 <.LBB8_79+0x3c>
8000956c: 01 45        	mv	a0, zero
8000956e: a3 0b a1 18  	sb	a0, 407(sp)
80009572: 01 a8        	j	16 <.LBB8_79+0x3c>
80009574: 76 75        	ld	a0, 376(sp)
80009576: 97 20 00 00  	auipc	ra, 2
8000957a: e7 80 40 d8  	jalr	-636(ra)
8000957e: aa e2        	sd	a0, 320(sp)
80009580: 19 a8        	j	22 <.LBB8_79+0x50>
80009582: 03 45 71 19  	lbu	a0, 407(sp)
80009586: 05 89        	andi	a0, a0, 1
80009588: 01 ed        	bnez	a0, 24 <.LBB8_80>
8000958a: 25 a0        	j	40 <.LBB8_80+0x12>
8000958c: 01 45        	mv	a0, zero
8000958e: b6 65        	ld	a1, 328(sp)
80009590: e3 8a a5 fc  	beq	a1, a0, -44 <.LBB8_79+0x1e>
80009594: c5 b7        	j	-32 <.LBB8_79+0x2e>
80009596: 01 45        	mv	a0, zero
80009598: 96 65        	ld	a1, 320(sp)
8000959a: e3 85 a5 fc  	beq	a1, a0, -54 <.LBB8_79+0x1e>
8000959e: f9 b7        	j	-50 <.LBB8_79+0x26>

00000000800095a0 <.LBB8_80>:
800095a0: 17 65 00 00  	auipc	a0, 6
800095a4: 13 05 05 5d  	addi	a0, a0, 1488
800095a8: 2a e3        	sd	a0, 384(sp)
800095aa: 13 05 20 02  	addi	a0, zero, 34
800095ae: 2a e7        	sd	a0, 392(sp)
800095b0: 69 ae        	j	922 <.LBB8_81+0x20>
800095b2: 56 75        	ld	a0, 368(sp)
800095b4: f6 65        	ld	a1, 344(sp)
800095b6: 88 ed        	sd	a0, 24(a1)
800095b8: 76 76        	ld	a2, 376(sp)
800095ba: 90 f1        	sd	a2, 32(a1)
800095bc: b2 85        	add	a1, zero, a2
800095be: 97 20 00 00  	auipc	ra, 2
800095c2: e7 80 60 e5  	jalr	-426(ra)
800095c6: 2a fe        	sd	a0, 312(sp)
800095c8: 09 a0        	j	2 <.LBB8_80+0x2a>
800095ca: 16 75        	ld	a0, 352(sp)
800095cc: f2 75        	ld	a1, 312(sp)
800095ce: 97 10 00 00  	auipc	ra, 1
800095d2: e7 80 80 1b  	jalr	440(ra)
800095d6: 2a ef        	sd	a0, 408(sp)
800095d8: 09 a0        	j	2 <.LBB8_80+0x3a>
800095da: 7a 65        	ld	a0, 408(sp)
800095dc: f6 65        	ld	a1, 344(sp)
800095de: 88 e1        	sd	a0, 0(a1)
800095e0: 56 75        	ld	a0, 368(sp)
800095e2: f6 75        	ld	a1, 376(sp)
800095e4: 97 20 00 00  	auipc	ra, 2
800095e8: e7 80 00 e3  	jalr	-464(ra)
800095ec: 2a fa        	sd	a0, 304(sp)
800095ee: 09 a0        	j	2 <.LBB8_80+0x50>
800095f0: 36 75        	ld	a0, 360(sp)
800095f2: d2 75        	ld	a1, 304(sp)
800095f4: 97 10 00 00  	auipc	ra, 1
800095f8: e7 80 60 25  	jalr	598(ra)
800095fc: 2a f6        	sd	a0, 296(sp)
800095fe: 09 a0        	j	2 <.LBB8_80+0x60>
80009600: 32 75        	ld	a0, 296(sp)
80009602: f6 65        	ld	a1, 344(sp)
80009604: 88 e5        	sd	a0, 8(a1)
80009606: 7a 66        	ld	a2, 408(sp)
80009608: 33 06 c5 40  	sub	a2, a0, a2
8000960c: 32 f2        	sd	a2, 288(sp)
8000960e: 63 64 c5 36  	bltu	a0, a2, 872 <.LBB8_84>
80009612: 09 a0        	j	2 <.LBB8_80+0x74>
80009614: 01 45        	mv	a0, zero
80009616: d6 75        	ld	a1, 368(sp)
80009618: 63 8e a5 36  	beq	a1, a0, 892 <.LBB8_86>
8000961c: 09 a0        	j	2 <.LBB8_80+0x7e>
8000961e: 12 75        	ld	a0, 288(sp)
80009620: d6 75        	ld	a1, 368(sp)
80009622: 33 55 b5 02  	<unknown>
80009626: 97 10 00 00  	auipc	ra, 1
8000962a: e7 80 00 29  	jalr	656(ra)
8000962e: 2a ee        	sd	a0, 280(sp)
80009630: 09 a0        	j	2 <.LBB8_80+0x92>
80009632: 72 65        	ld	a0, 280(sp)
80009634: 93 05 15 00  	addi	a1, a0, 1
80009638: 2e ea        	sd	a1, 272(sp)
8000963a: 63 eb a5 36  	bltu	a1, a0, 886 <.LBB8_88>
8000963e: 09 a0        	j	2 <.LBB8_80+0xa0>
80009640: 52 65        	ld	a0, 272(sp)
80009642: f6 65        	ld	a1, 344(sp)
80009644: 88 e9        	sd	a0, 16(a1)
80009646: 90 65        	ld	a2, 8(a1)
80009648: fa 66        	ld	a3, 408(sp)
8000964a: b3 06 d6 40  	sub	a3, a2, a3
8000964e: 36 e6        	sd	a3, 264(sp)
80009650: 63 6e d6 36  	bltu	a2, a3, 892 <.LBB8_90>
80009654: 09 a0        	j	2 <.LBB8_80+0xb6>
80009656: 76 65        	ld	a0, 344(sp)
80009658: 97 10 00 00  	auipc	ra, 1
8000965c: e7 80 c0 ac  	jalr	-1332(ra)
80009660: 2a e2        	sd	a0, 256(sp)
80009662: 09 a0        	j	2 <.LBB8_80+0xc4>
80009664: 76 65        	ld	a0, 344(sp)
80009666: 92 65        	ld	a1, 256(sp)
80009668: 97 10 00 00  	auipc	ra, 1
8000966c: e7 80 40 d9  	jalr	-620(ra)
80009670: aa fd        	sd	a0, 248(sp)
80009672: 09 a0        	j	2 <.LBB8_80+0xd4>
80009674: 6e 75        	ld	a0, 248(sp)
80009676: b2 65        	ld	a1, 264(sp)
80009678: 63 7b b5 00  	bgeu	a0, a1, 22 <.LBB8_80+0xee>
8000967c: 09 a0        	j	2 <.LBB8_80+0xde>
8000967e: 76 65        	ld	a0, 344(sp)
80009680: 0c 69        	ld	a1, 16(a0)
80009682: 13 86 15 00  	addi	a2, a1, 1
80009686: b2 f9        	sd	a2, 240(sp)
80009688: 63 61 b6 36  	bltu	a2, a1, 866 <.LBB8_92>
8000968c: 11 a0        	j	4 <.LBB8_80+0xf0>
8000968e: 29 a0        	j	10 <.LBB8_80+0xf8>
80009690: 4e 75        	ld	a0, 240(sp)
80009692: f6 65        	ld	a1, 344(sp)
80009694: 88 e9        	sd	a0, 16(a1)
80009696: 09 a0        	j	2 <.LBB8_80+0xf8>
80009698: 76 65        	ld	a0, 344(sp)
8000969a: 0c 69        	ld	a1, 16(a0)
8000969c: 28 0b        	addi	a0, sp, 408
8000969e: 97 10 00 00  	auipc	ra, 1
800096a2: e7 80 e0 f9  	jalr	-98(ra)
800096a6: 2a 86        	add	a2, zero, a0
800096a8: ae 86        	add	a3, zero, a1
800096aa: 23 34 a1 22  	sd	a0, 552(sp)
800096ae: 23 38 b1 22  	sd	a1, 560(sp)
800096b2: b2 f5        	sd	a2, 232(sp)
800096b4: b6 f1        	sd	a3, 224(sp)
800096b6: 09 a0        	j	2 <.LBB8_80+0x118>
800096b8: 76 65        	ld	a0, 344(sp)
800096ba: 93 05 85 02  	addi	a1, a0, 40
800096be: 23 38 b1 2c  	sd	a1, 720(sp)
800096c2: ae ed        	sd	a1, 216(sp)
800096c4: 09 a0        	j	2 <.LBB8_80+0x126>
800096c6: 6e 65        	ld	a0, 216(sp)
800096c8: ae 75        	ld	a1, 232(sp)
800096ca: 0e 76        	ld	a2, 224(sp)
800096cc: 97 00 00 00  	auipc	ra, 0
800096d0: e7 80 80 d5  	jalr	-680(ra)
800096d4: 09 a0        	j	2 <.LBB8_80+0x136>
800096d6: 76 65        	ld	a0, 344(sp)
800096d8: 0c 69        	ld	a1, 16(a0)
800096da: 01 46        	mv	a2, zero
800096dc: 32 f3        	sd	a2, 416(sp)
800096de: 2e f7        	sd	a1, 424(sp)
800096e0: 32 85        	add	a0, zero, a2
800096e2: 97 10 00 00  	auipc	ra, 1
800096e6: e7 80 e0 50  	jalr	1294(ra)
800096ea: aa e9        	sd	a0, 208(sp)
800096ec: ae e5        	sd	a1, 200(sp)
800096ee: 09 a0        	j	2 <.LBB8_80+0x150>
800096f0: 4e 65        	ld	a0, 208(sp)
800096f2: 2a fb        	sd	a0, 432(sp)
800096f4: ae 65        	ld	a1, 200(sp)
800096f6: 2e ff        	sd	a1, 440(sp)
800096f8: 09 a0        	j	2 <.LBB8_80+0x15a>
800096fa: 08 1b        	addi	a0, sp, 432
800096fc: 97 10 00 00  	auipc	ra, 1
80009700: e7 80 60 48  	jalr	1158(ra)
80009704: aa e3        	sd	a0, 448(sp)
80009706: ae e7        	sd	a1, 456(sp)
80009708: 09 a0        	j	2 <.LBB8_80+0x16a>
8000970a: 1e 65        	ld	a0, 448(sp)
8000970c: 81 45        	mv	a1, zero
8000970e: 63 04 b5 00  	beq	a0, a1, 8 <.LBB8_80+0x176>
80009712: 09 a0        	j	2 <.LBB8_80+0x174>
80009714: 39 a8        	j	30 <.LBB8_80+0x192>
80009716: 76 65        	ld	a0, 344(sp)
80009718: 0c 69        	ld	a1, 16(a0)
8000971a: 05 46        	addi	a2, zero, 1
8000971c: b2 eb        	sd	a2, 464(sp)
8000971e: ae ef        	sd	a1, 472(sp)
80009720: 32 85        	add	a0, zero, a2
80009722: 97 10 00 00  	auipc	ra, 1
80009726: e7 80 e0 4c  	jalr	1230(ra)
8000972a: aa e1        	sd	a0, 192(sp)
8000972c: 2e fd        	sd	a1, 184(sp)
8000972e: 55 a0        	j	164 <.LBB8_80+0x232>
80009730: 00 00        	unimp	
80009732: 3e 65        	ld	a0, 456(sp)
80009734: 23 3c a1 22  	sd	a0, 568(sp)
80009738: 23 30 a1 24  	sd	a0, 576(sp)
8000973c: 23 34 a1 24  	sd	a0, 584(sp)
80009740: f6 65        	ld	a1, 344(sp)
80009742: 2a f9        	sd	a0, 176(sp)
80009744: 2e 85        	add	a0, zero, a1
80009746: ca 75        	ld	a1, 176(sp)
80009748: 97 10 00 00  	auipc	ra, 1
8000974c: e7 80 20 a1  	jalr	-1518(ra)
80009750: aa 85        	add	a1, zero, a0
80009752: 23 38 a1 24  	sd	a0, 592(sp)
80009756: 2e f5        	sd	a1, 168(sp)
80009758: 09 a0        	j	2 <.LBB8_80+0x1ba>
8000975a: 76 65        	ld	a0, 344(sp)
8000975c: ca 75        	ld	a1, 176(sp)
8000975e: 97 10 00 00  	auipc	ra, 1
80009762: e7 80 a0 96  	jalr	-1686(ra)
80009766: aa 85        	add	a1, zero, a0
80009768: 23 3c a1 24  	sd	a0, 600(sp)
8000976c: 2e f1        	sd	a1, 160(sp)
8000976e: 09 a0        	j	2 <.LBB8_80+0x1d0>
80009770: 0a 75        	ld	a0, 160(sp)
80009772: 97 10 00 00  	auipc	ra, 1
80009776: e7 80 40 72  	jalr	1828(ra)
8000977a: 09 a0        	j	2 <.LBB8_80+0x1dc>
8000977c: a1 45        	addi	a1, zero, 8
8000977e: 2a 75        	ld	a0, 168(sp)
80009780: 97 10 00 00  	auipc	ra, 1
80009784: e7 80 60 00  	jalr	6(ra)
80009788: 2a ed        	sd	a0, 152(sp)
8000978a: 09 a0        	j	2 <.LBB8_80+0x1ec>
8000978c: 6a 65        	ld	a0, 152(sp)
8000978e: 93 55 35 00  	srli	a1, a0, 3
80009792: 23 30 b1 26  	sd	a1, 608(sp)
80009796: 28 0b        	addi	a0, sp, 408
80009798: 97 10 00 00  	auipc	ra, 1
8000979c: e7 80 00 f5  	jalr	-176(ra)
800097a0: 2a 86        	add	a2, zero, a0
800097a2: ae 86        	add	a3, zero, a1
800097a4: 23 34 a1 26  	sd	a0, 616(sp)
800097a8: 23 38 b1 26  	sd	a1, 624(sp)
800097ac: 32 e9        	sd	a2, 144(sp)
800097ae: 36 e5        	sd	a3, 136(sp)
800097b0: 09 a0        	j	2 <.LBB8_80+0x212>
800097b2: 0a 75        	ld	a0, 160(sp)
800097b4: 93 05 05 01  	addi	a1, a0, 16
800097b8: 23 3c b1 2c  	sd	a1, 728(sp)
800097bc: 2e e1        	sd	a1, 128(sp)
800097be: 09 a0        	j	2 <.LBB8_80+0x220>
800097c0: 0a 65        	ld	a0, 128(sp)
800097c2: ca 65        	ld	a1, 144(sp)
800097c4: 2a 66        	ld	a2, 136(sp)
800097c6: 97 10 00 00  	auipc	ra, 1
800097ca: e7 80 e0 76  	jalr	1902(ra)
800097ce: 09 a0        	j	2 <.LBB8_80+0x230>
800097d0: 2d b7        	j	-214 <.LBB8_80+0x15a>
800097d2: 0e 65        	ld	a0, 192(sp)
800097d4: aa f3        	sd	a0, 480(sp)
800097d6: ea 75        	ld	a1, 184(sp)
800097d8: ae f7        	sd	a1, 488(sp)
800097da: 09 a0        	j	2 <.LBB8_80+0x23c>
800097dc: 88 13        	addi	a0, sp, 480
800097de: 97 10 00 00  	auipc	ra, 1
800097e2: e7 80 40 3a  	jalr	932(ra)
800097e6: aa fb        	sd	a0, 496(sp)
800097e8: ae ff        	sd	a1, 504(sp)
800097ea: 09 a0        	j	2 <.LBB8_80+0x24c>
800097ec: 5e 75        	ld	a0, 496(sp)
800097ee: 81 45        	mv	a1, zero
800097f0: 63 04 b5 00  	beq	a0, a1, 8 <.LBB8_80+0x258>
800097f4: 09 a0        	j	2 <.LBB8_80+0x256>
800097f6: 11 a8        	j	20 <.LBB8_80+0x26a>
800097f8: 7a 65        	ld	a0, 408(sp)
800097fa: d6 75        	ld	a1, 368(sp)
800097fc: 97 10 00 00  	auipc	ra, 1
80009800: e7 80 a0 f8  	jalr	-118(ra)
80009804: aa fc        	sd	a0, 120(sp)
80009806: 61 a8        	j	152 <.LBB8_80+0x2fe>
80009808: 00 00        	unimp	
8000980a: 7e 75        	ld	a0, 504(sp)
8000980c: 23 3c a1 26  	sd	a0, 632(sp)
80009810: 23 30 a1 28  	sd	a0, 640(sp)
80009814: 23 34 a1 28  	sd	a0, 648(sp)
80009818: f6 65        	ld	a1, 344(sp)
8000981a: aa f8        	sd	a0, 112(sp)
8000981c: 2e 85        	add	a0, zero, a1
8000981e: c6 75        	ld	a1, 112(sp)
80009820: 97 10 00 00  	auipc	ra, 1
80009824: e7 80 a0 93  	jalr	-1734(ra)
80009828: aa 85        	add	a1, zero, a0
8000982a: 23 38 a1 28  	sd	a0, 656(sp)
8000982e: ae f4        	sd	a1, 104(sp)
80009830: 09 a0        	j	2 <.LBB8_80+0x292>
80009832: 76 65        	ld	a0, 344(sp)
80009834: c6 75        	ld	a1, 112(sp)
80009836: 97 10 00 00  	auipc	ra, 1
8000983a: e7 80 20 89  	jalr	-1902(ra)
8000983e: aa 85        	add	a1, zero, a0
80009840: 23 3c a1 28  	sd	a0, 664(sp)
80009844: ae f0        	sd	a1, 96(sp)
80009846: 09 a0        	j	2 <.LBB8_80+0x2a8>
80009848: a1 45        	addi	a1, zero, 8
8000984a: 26 75        	ld	a0, 104(sp)
8000984c: 97 10 00 00  	auipc	ra, 1
80009850: e7 80 a0 f3  	jalr	-198(ra)
80009854: aa ec        	sd	a0, 88(sp)
80009856: 09 a0        	j	2 <.LBB8_80+0x2b8>
80009858: 66 65        	ld	a0, 88(sp)
8000985a: 93 55 35 00  	srli	a1, a0, 3
8000985e: 23 30 b1 2a  	sd	a1, 672(sp)
80009862: 28 0b        	addi	a0, sp, 408
80009864: 97 10 00 00  	auipc	ra, 1
80009868: e7 80 40 e8  	jalr	-380(ra)
8000986c: 2a 86        	add	a2, zero, a0
8000986e: ae 86        	add	a3, zero, a1
80009870: 23 34 a1 2a  	sd	a0, 680(sp)
80009874: 23 38 b1 2a  	sd	a1, 688(sp)
80009878: b2 e8        	sd	a2, 80(sp)
8000987a: b6 e4        	sd	a3, 72(sp)
8000987c: 09 a0        	j	2 <.LBB8_80+0x2de>
8000987e: 06 75        	ld	a0, 96(sp)
80009880: 93 05 05 02  	addi	a1, a0, 32
80009884: 23 30 b1 2e  	sd	a1, 736(sp)
80009888: ae e0        	sd	a1, 64(sp)
8000988a: 09 a0        	j	2 <.LBB8_80+0x2ec>
8000988c: 06 65        	ld	a0, 64(sp)
8000988e: c6 65        	ld	a1, 80(sp)
80009890: 26 66        	ld	a2, 72(sp)
80009892: 97 10 00 00  	auipc	ra, 1
80009896: e7 80 20 6a  	jalr	1698(ra)
8000989a: 09 a0        	j	2 <.LBB8_80+0x2fc>
8000989c: 81 b7        	j	-192 <.LBB8_80+0x23c>
8000989e: 66 75        	ld	a0, 120(sp)
800098a0: 2a ef        	sd	a0, 408(sp)
800098a2: 76 65        	ld	a0, 344(sp)
800098a4: e6 75        	ld	a1, 120(sp)
800098a6: 97 00 00 00  	auipc	ra, 0
800098aa: e7 80 c0 19  	jalr	412(ra)
800098ae: aa 85        	add	a1, zero, a0
800098b0: 23 3c a1 2a  	sd	a0, 696(sp)
800098b4: 2e fc        	sd	a1, 56(sp)
800098b6: 09 a0        	j	2 <.LBB8_80+0x318>
800098b8: 76 65        	ld	a0, 344(sp)
800098ba: 97 00 00 00  	auipc	ra, 0
800098be: e7 80 e0 1d  	jalr	478(ra)
800098c2: aa 85        	add	a1, zero, a0
800098c4: 23 30 a1 2c  	sd	a0, 704(sp)
800098c8: 2e f8        	sd	a1, 48(sp)
800098ca: 09 a0        	j	2 <.LBB8_80+0x32c>
800098cc: fa 65        	ld	a1, 408(sp)
800098ce: 76 65        	ld	a0, 344(sp)
800098d0: 97 00 00 00  	auipc	ra, 0
800098d4: e7 80 80 58  	jalr	1416(ra)
800098d8: aa 85        	add	a1, zero, a0
800098da: 23 34 a1 2c  	sd	a0, 712(sp)
800098de: 2e f4        	sd	a1, 40(sp)
800098e0: 09 a0        	j	2 <.LBB8_80+0x342>
800098e2: 76 65        	ld	a0, 344(sp)
800098e4: 97 10 00 00  	auipc	ra, 1
800098e8: e7 80 00 84  	jalr	-1984(ra)
800098ec: 2a f0        	sd	a0, 32(sp)
800098ee: 09 a0        	j	2 <.LBB8_80+0x350>
800098f0: 76 65        	ld	a0, 344(sp)
800098f2: 82 75        	ld	a1, 32(sp)
800098f4: 97 10 00 00  	auipc	ra, 1
800098f8: e7 80 80 b0  	jalr	-1272(ra)
800098fc: 2a ec        	sd	a0, 24(sp)
800098fe: 09 a0        	j	2 <.LBB8_80+0x360>
80009900: 62 65        	ld	a0, 24(sp)
80009902: e2 75        	ld	a1, 56(sp)
80009904: 33 06 b5 40  	sub	a2, a0, a1
80009908: 32 e8        	sd	a2, 16(sp)
8000990a: 63 6e c5 0e  	bltu	a0, a2, 252 <.LBB8_94>
8000990e: 09 a0        	j	2 <.LBB8_80+0x370>
80009910: 42 65        	ld	a0, 16(sp)
80009912: c2 75        	ld	a1, 48(sp)
80009914: 33 06 b5 40  	sub	a2, a0, a1
80009918: 32 e4        	sd	a2, 8(sp)
8000991a: 63 65 c5 10  	bltu	a0, a2, 266 <.LBB8_96>
8000991e: 09 a0        	j	2 <.LBB8_80+0x380>
80009920: 22 75        	ld	a0, 40(sp)
80009922: a2 65        	ld	a1, 8(sp)
80009924: 63 0c b5 00  	beq	a0, a1, 24 <.LBB8_81+0x12>
80009928: 09 a0        	j	2 <.LBB8_81>

000000008000992a <.LBB8_81>:
8000992a: 17 65 00 00  	auipc	a0, 6
8000992e: 13 05 e5 32  	addi	a0, a0, 814
80009932: 2a e3        	sd	a0, 384(sp)
80009934: 13 05 b0 02  	addi	a0, zero, 43
80009938: 2a e7        	sd	a0, 392(sp)
8000993a: 01 a8        	j	16 <.LBB8_81+0x20>
8000993c: 05 45        	addi	a0, zero, 1
8000993e: f6 65        	ld	a1, 344(sp)
80009940: 23 8c a5 02  	sb	a0, 56(a1)
80009944: 01 45        	mv	a0, zero
80009946: 2a e3        	sd	a0, 384(sp)
80009948: 09 a0        	j	2 <.LBB8_81+0x20>
8000994a: 1a 65        	ld	a0, 384(sp)
8000994c: ba 65        	ld	a1, 392(sp)
8000994e: 83 30 81 2e  	ld	ra, 744(sp)
80009952: 13 01 01 2f  	addi	sp, sp, 752
80009956: 82 80        	ret

0000000080009958 <.LBB8_82>:
80009958: 17 65 00 00  	auipc	a0, 6
8000995c: 13 05 85 1e  	addi	a0, a0, 488

0000000080009960 <.LBB8_83>:
80009960: 17 66 00 00  	auipc	a2, 6
80009964: 13 06 86 1c  	addi	a2, a2, 456
80009968: 93 05 10 02  	addi	a1, zero, 33
8000996c: 97 20 00 00  	auipc	ra, 2
80009970: e7 80 e0 dc  	jalr	-562(ra)
80009974: 00 00        	unimp	

0000000080009976 <.LBB8_84>:
80009976: 17 65 00 00  	auipc	a0, 6
8000997a: 13 05 a5 1c  	addi	a0, a0, 458

000000008000997e <.LBB8_85>:
8000997e: 17 66 00 00  	auipc	a2, 6
80009982: 13 06 a6 21  	addi	a2, a2, 538
80009986: 93 05 10 02  	addi	a1, zero, 33
8000998a: 97 20 00 00  	auipc	ra, 2
8000998e: e7 80 00 db  	jalr	-592(ra)
80009992: 00 00        	unimp	

0000000080009994 <.LBB8_86>:
80009994: 17 65 00 00  	auipc	a0, 6
80009998: 13 05 c5 21  	addi	a0, a0, 540

000000008000999c <.LBB8_87>:
8000999c: 17 66 00 00  	auipc	a2, 6
800099a0: 13 06 c6 1f  	addi	a2, a2, 508
800099a4: e5 45        	addi	a1, zero, 25
800099a6: 97 20 00 00  	auipc	ra, 2
800099aa: e7 80 40 d9  	jalr	-620(ra)
800099ae: 00 00        	unimp	

00000000800099b0 <.LBB8_88>:
800099b0: 17 65 00 00  	auipc	a0, 6
800099b4: 13 05 05 24  	addi	a0, a0, 576

00000000800099b8 <.LBB8_89>:
800099b8: 17 66 00 00  	auipc	a2, 6
800099bc: 13 06 86 21  	addi	a2, a2, 536
800099c0: f1 45        	addi	a1, zero, 28
800099c2: 97 20 00 00  	auipc	ra, 2
800099c6: e7 80 80 d7  	jalr	-648(ra)
800099ca: 00 00        	unimp	

00000000800099cc <.LBB8_90>:
800099cc: 17 65 00 00  	auipc	a0, 6
800099d0: 13 05 45 17  	addi	a0, a0, 372

00000000800099d4 <.LBB8_91>:
800099d4: 17 66 00 00  	auipc	a2, 6
800099d8: 13 06 c6 23  	addi	a2, a2, 572
800099dc: 93 05 10 02  	addi	a1, zero, 33
800099e0: 97 20 00 00  	auipc	ra, 2
800099e4: e7 80 a0 d5  	jalr	-678(ra)
800099e8: 00 00        	unimp	

00000000800099ea <.LBB8_92>:
800099ea: 17 65 00 00  	auipc	a0, 6
800099ee: 13 05 65 20  	addi	a0, a0, 518

00000000800099f2 <.LBB8_93>:
800099f2: 17 66 00 00  	auipc	a2, 6
800099f6: 13 06 66 23  	addi	a2, a2, 566
800099fa: f1 45        	addi	a1, zero, 28
800099fc: 97 20 00 00  	auipc	ra, 2
80009a00: e7 80 e0 d3  	jalr	-706(ra)
80009a04: 00 00        	unimp	

0000000080009a06 <.LBB8_94>:
80009a06: 17 65 00 00  	auipc	a0, 6
80009a0a: 13 05 a5 13  	addi	a0, a0, 314

0000000080009a0e <.LBB8_95>:
80009a0e: 17 66 00 00  	auipc	a2, 6
80009a12: 13 06 26 23  	addi	a2, a2, 562
80009a16: 93 05 10 02  	addi	a1, zero, 33
80009a1a: 97 20 00 00  	auipc	ra, 2
80009a1e: e7 80 00 d2  	jalr	-736(ra)
80009a22: 00 00        	unimp	

0000000080009a24 <.LBB8_96>:
80009a24: 17 65 00 00  	auipc	a0, 6
80009a28: 13 05 c5 11  	addi	a0, a0, 284

0000000080009a2c <.LBB8_97>:
80009a2c: 17 66 00 00  	auipc	a2, 6
80009a30: 13 06 46 21  	addi	a2, a2, 532
80009a34: 93 05 10 02  	addi	a1, zero, 33
80009a38: 97 20 00 00  	auipc	ra, 2
80009a3c: e7 80 20 d0  	jalr	-766(ra)
80009a40: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem9mark_meta17h702bb8934b0e8e65E:

0000000080009a42 <_ZN9allocator11BuddySystem9mark_meta17h702bb8934b0e8e65E>:
80009a42: 39 71        	addi	sp, sp, -64
80009a44: 06 fc        	sd	ra, 56(sp)
80009a46: 2a f0        	sd	a0, 32(sp)
80009a48: 2e f4        	sd	a1, 40(sp)
80009a4a: 10 61        	ld	a2, 0(a0)
80009a4c: 33 86 c5 40  	sub	a2, a1, a2
80009a50: 2e ec        	sd	a1, 24(sp)
80009a52: 2a e8        	sd	a0, 16(sp)
80009a54: 32 e4        	sd	a2, 8(sp)
80009a56: 63 e2 c5 02  	bltu	a1, a2, 36 <.LBB12_4>
80009a5a: 09 a0        	j	2 <_ZN9allocator11BuddySystem9mark_meta17h702bb8934b0e8e65E+0x1a>
80009a5c: 22 65        	ld	a0, 8(sp)
80009a5e: 2a f8        	sd	a0, 48(sp)
80009a60: c2 65        	ld	a1, 16(sp)
80009a62: 8c 61        	ld	a1, 0(a1)
80009a64: 42 65        	ld	a0, 16(sp)
80009a66: 62 66        	ld	a2, 24(sp)
80009a68: 97 00 00 00  	auipc	ra, 0
80009a6c: e7 80 c0 0f  	jalr	252(ra)
80009a70: 09 a0        	j	2 <_ZN9allocator11BuddySystem9mark_meta17h702bb8934b0e8e65E+0x30>
80009a72: 22 65        	ld	a0, 8(sp)
80009a74: e2 70        	ld	ra, 56(sp)
80009a76: 21 61        	addi	sp, sp, 64
80009a78: 82 80        	ret

0000000080009a7a <.LBB12_4>:
80009a7a: 17 65 00 00  	auipc	a0, 6
80009a7e: 13 05 65 0c  	addi	a0, a0, 198

0000000080009a82 <.LBB12_5>:
80009a82: 17 66 00 00  	auipc	a2, 6
80009a86: 13 06 66 20  	addi	a2, a2, 518
80009a8a: 93 05 10 02  	addi	a1, zero, 33
80009a8e: 97 20 00 00  	auipc	ra, 2
80009a92: e7 80 c0 ca  	jalr	-852(ra)
80009a96: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E:

0000000080009a98 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E>:
80009a98: 5d 71        	addi	sp, sp, -80
80009a9a: 86 e4        	sd	ra, 72(sp)
80009a9c: 2a fc        	sd	a0, 56(sp)
80009a9e: 2a f8        	sd	a0, 48(sp)
80009aa0: 97 00 00 00  	auipc	ra, 0
80009aa4: e7 80 40 68  	jalr	1668(ra)
80009aa8: 2a f4        	sd	a0, 40(sp)
80009aaa: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x14>
80009aac: 42 75        	ld	a0, 48(sp)
80009aae: a2 75        	ld	a1, 40(sp)
80009ab0: 97 10 00 00  	auipc	ra, 1
80009ab4: e7 80 c0 94  	jalr	-1716(ra)
80009ab8: 2a f0        	sd	a0, 32(sp)
80009aba: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x24>
80009abc: 42 75        	ld	a0, 48(sp)
80009abe: 0c 65        	ld	a1, 8(a0)
80009ac0: 10 61        	ld	a2, 0(a0)
80009ac2: 33 86 c5 40  	sub	a2, a1, a2
80009ac6: 32 ec        	sd	a2, 24(sp)
80009ac8: 63 e2 c5 04  	bltu	a1, a2, 68 <.LBB13_10>
80009acc: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x36>
80009ace: 02 75        	ld	a0, 32(sp)
80009ad0: e2 65        	ld	a1, 24(sp)
80009ad2: 33 06 b5 40  	sub	a2, a0, a1
80009ad6: 32 e8        	sd	a2, 16(sp)
80009ad8: 63 69 c5 04  	bltu	a0, a2, 82 <.LBB13_12>
80009adc: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x46>
80009ade: 42 65        	ld	a0, 16(sp)
80009ae0: aa e0        	sd	a0, 64(sp)
80009ae2: c2 75        	ld	a1, 48(sp)
80009ae4: 90 65        	ld	a2, 8(a1)
80009ae6: b3 06 a6 00  	add	a3, a2, a0
80009aea: 32 e4        	sd	a2, 8(sp)
80009aec: 36 e0        	sd	a3, 0(sp)
80009aee: 63 ed c6 04  	bltu	a3, a2, 90 <.LBB13_14>
80009af2: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x5c>
80009af4: 42 75        	ld	a0, 48(sp)
80009af6: a2 65        	ld	a1, 8(sp)
80009af8: 02 66        	ld	a2, 0(sp)
80009afa: 97 00 00 00  	auipc	ra, 0
80009afe: e7 80 a0 06  	jalr	106(ra)
80009b02: 09 a0        	j	2 <_ZN9allocator11BuddySystem12mark_unavail17h64849a21077d3bd6E+0x6c>
80009b04: 42 65        	ld	a0, 16(sp)
80009b06: a6 60        	ld	ra, 72(sp)
80009b08: 61 61        	addi	sp, sp, 80
80009b0a: 82 80        	ret

0000000080009b0c <.LBB13_10>:
80009b0c: 17 65 00 00  	auipc	a0, 6
80009b10: 13 05 45 03  	addi	a0, a0, 52

0000000080009b14 <.LBB13_11>:
80009b14: 17 66 00 00  	auipc	a2, 6
80009b18: 13 06 c6 18  	addi	a2, a2, 396
80009b1c: 93 05 10 02  	addi	a1, zero, 33
80009b20: 97 20 00 00  	auipc	ra, 2
80009b24: e7 80 a0 c1  	jalr	-998(ra)
80009b28: 00 00        	unimp	

0000000080009b2a <.LBB13_12>:
80009b2a: 17 65 00 00  	auipc	a0, 6
80009b2e: 13 05 65 01  	addi	a0, a0, 22

0000000080009b32 <.LBB13_13>:
80009b32: 17 66 00 00  	auipc	a2, 6
80009b36: 13 06 66 18  	addi	a2, a2, 390
80009b3a: 93 05 10 02  	addi	a1, zero, 33
80009b3e: 97 20 00 00  	auipc	ra, 2
80009b42: e7 80 c0 bf  	jalr	-1028(ra)
80009b46: 00 00        	unimp	

0000000080009b48 <.LBB13_14>:
80009b48: 17 65 00 00  	auipc	a0, 6
80009b4c: 13 05 85 0a  	addi	a0, a0, 168

0000000080009b50 <.LBB13_15>:
80009b50: 17 66 00 00  	auipc	a2, 6
80009b54: 13 06 06 18  	addi	a2, a2, 384
80009b58: f1 45        	addi	a1, zero, 28
80009b5a: 97 20 00 00  	auipc	ra, 2
80009b5e: e7 80 00 be  	jalr	-1056(ra)
80009b62: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem4mark17he3786124ee97e41bE:

0000000080009b64 <_ZN9allocator11BuddySystem4mark17he3786124ee97e41bE>:
80009b64: 13 01 01 d6  	addi	sp, sp, -672
80009b68: 23 3c 11 28  	sd	ra, 664(sp)
80009b6c: 23 3c a1 20  	sd	a0, 536(sp)
80009b70: 23 30 b1 22  	sd	a1, 544(sp)
80009b74: 23 34 c1 22  	sd	a2, 552(sp)
80009b78: 14 6d        	ld	a3, 24(a0)
80009b7a: 01 47        	mv	a4, zero
80009b7c: b2 e5        	sd	a2, 200(sp)
80009b7e: ae e1        	sd	a1, 192(sp)
80009b80: 2a fd        	sd	a0, 184(sp)
80009b82: 36 f9        	sd	a3, 176(sp)
80009b84: 63 8e e6 26  	beq	a3, a4, 636 <.LBB14_45>
80009b88: 09 a0        	j	2 <_ZN9allocator11BuddySystem4mark17he3786124ee97e41bE+0x26>
80009b8a: 0e 65        	ld	a0, 192(sp)
80009b8c: ca 75        	ld	a1, 176(sp)
80009b8e: 33 76 b5 02  	<unknown>
80009b92: b2 f1        	sd	a2, 224(sp)
80009b94: 94 11        	addi	a3, sp, 224
80009b96: b6 e9        	sd	a3, 208(sp)

0000000080009b98 <.LBB14_35>:
80009b98: 17 47 00 00  	auipc	a4, 4
80009b9c: 13 07 07 c4  	addi	a4, a4, -960
80009ba0: ba ed        	sd	a4, 216(sp)
80009ba2: 23 38 d1 22  	sd	a3, 560(sp)
80009ba6: 23 3c e1 22  	sd	a4, 568(sp)
80009baa: 81 47        	mv	a5, zero
80009bac: 36 f5        	sd	a3, 168(sp)
80009bae: 3a f1        	sd	a4, 160(sp)
80009bb0: 63 0c f6 02  	beq	a2, a5, 56 <.LBB14_36+0x1a>
80009bb4: 09 a0        	j	2 <.LBB14_35+0x1e>
80009bb6: 2a 75        	ld	a0, 168(sp)
80009bb8: aa e6        	sd	a0, 328(sp)
80009bba: 8a 75        	ld	a1, 160(sp)
80009bbc: ae ea        	sd	a1, 336(sp)
80009bbe: b0 02        	addi	a2, sp, 328
80009bc0: 32 fe        	sd	a2, 312(sp)
80009bc2: 94 0a        	addi	a3, sp, 336
80009bc4: b6 e2        	sd	a3, 320(sp)
80009bc6: 23 30 c1 24  	sd	a2, 576(sp)
80009bca: 23 34 d1 24  	sd	a3, 584(sp)

0000000080009bce <.LBB14_36>:
80009bce: 97 15 00 00  	auipc	a1, 1
80009bd2: 93 85 e5 57  	addi	a1, a1, 1406
80009bd6: 32 85        	add	a0, zero, a2
80009bd8: 36 ed        	sd	a3, 152(sp)
80009bda: 97 10 00 00  	auipc	ra, 1
80009bde: e7 80 00 59  	jalr	1424(ra)
80009be2: 2a e9        	sd	a0, 144(sp)
80009be4: 2e e5        	sd	a1, 136(sp)
80009be6: 01 a8        	j	16 <.LBB14_37>
80009be8: 6a 75        	ld	a0, 184(sp)
80009bea: 0c 6d        	ld	a1, 24(a0)
80009bec: 01 46        	mv	a2, zero
80009bee: 2e e1        	sd	a1, 128(sp)
80009bf0: 63 87 c5 22  	beq	a1, a2, 558 <.LBB14_47>
80009bf4: a1 a8        	j	88 <.LBB14_39+0x14>

0000000080009bf6 <.LBB14_37>:
80009bf6: 97 15 00 00  	auipc	a1, 1
80009bfa: 93 85 65 55  	addi	a1, a1, 1366
80009bfe: 6a 65        	ld	a0, 152(sp)
80009c00: 97 10 00 00  	auipc	ra, 1
80009c04: e7 80 a0 56  	jalr	1386(ra)
80009c08: aa fc        	sd	a0, 120(sp)
80009c0a: ae f8        	sd	a1, 112(sp)
80009c0c: 09 a0        	j	2 <.LBB14_37+0x18>
80009c0e: 4a 65        	ld	a0, 144(sp)
80009c10: 2a ee        	sd	a0, 280(sp)
80009c12: aa 65        	ld	a1, 136(sp)
80009c14: 2e f2        	sd	a1, 288(sp)
80009c16: 66 76        	ld	a2, 120(sp)
80009c18: 32 f6        	sd	a2, 296(sp)
80009c1a: c6 76        	ld	a3, 112(sp)
80009c1c: 36 fa        	sd	a3, 304(sp)

0000000080009c1e <.LBB14_38>:
80009c1e: 97 65 00 00  	auipc	a1, 6
80009c22: 93 85 a5 15  	addi	a1, a1, 346
80009c26: a8 11        	addi	a0, sp, 232
80009c28: 0d 46        	addi	a2, zero, 3
80009c2a: 34 0a        	addi	a3, sp, 280
80009c2c: 09 47        	addi	a4, zero, 2
80009c2e: 97 10 00 00  	auipc	ra, 1
80009c32: e7 80 00 58  	jalr	1408(ra)
80009c36: 09 a0        	j	2 <.LBB14_39>

0000000080009c38 <.LBB14_39>:
80009c38: 97 65 00 00  	auipc	a1, 6
80009c3c: 93 85 05 17  	addi	a1, a1, 368
80009c40: a8 11        	addi	a0, sp, 232
80009c42: 97 20 00 00  	auipc	ra, 2
80009c46: e7 80 40 b6  	jalr	-1180(ra)
80009c4a: 00 00        	unimp	
80009c4c: 2e 65        	ld	a0, 200(sp)
80009c4e: 8a 65        	ld	a1, 128(sp)
80009c50: 33 76 b5 02  	<unknown>
80009c54: b2 f6        	sd	a2, 360(sp)
80009c56: b4 12        	addi	a3, sp, 360
80009c58: b6 ee        	sd	a3, 344(sp)

0000000080009c5a <.LBB14_40>:
80009c5a: 17 47 00 00  	auipc	a4, 4
80009c5e: 13 07 e7 b7  	addi	a4, a4, -1154
80009c62: ba f2        	sd	a4, 352(sp)
80009c64: 23 38 d1 24  	sd	a3, 592(sp)
80009c68: 23 3c e1 24  	sd	a4, 600(sp)
80009c6c: 81 47        	mv	a5, zero
80009c6e: b6 f4        	sd	a3, 104(sp)
80009c70: ba f0        	sd	a4, 96(sp)
80009c72: 63 0c f6 02  	beq	a2, a5, 56 <.LBB14_41+0x1a>
80009c76: 09 a0        	j	2 <.LBB14_40+0x1e>
80009c78: 26 75        	ld	a0, 104(sp)
80009c7a: aa eb        	sd	a0, 464(sp)
80009c7c: 86 75        	ld	a1, 96(sp)
80009c7e: ae ef        	sd	a1, 472(sp)
80009c80: 90 0b        	addi	a2, sp, 464
80009c82: b2 e3        	sd	a2, 448(sp)
80009c84: b4 0b        	addi	a3, sp, 472
80009c86: b6 e7        	sd	a3, 456(sp)
80009c88: 23 30 c1 26  	sd	a2, 608(sp)
80009c8c: 23 34 d1 26  	sd	a3, 616(sp)

0000000080009c90 <.LBB14_41>:
80009c90: 97 15 00 00  	auipc	a1, 1
80009c94: 93 85 c5 4b  	addi	a1, a1, 1212
80009c98: 32 85        	add	a0, zero, a2
80009c9a: b6 ec        	sd	a3, 88(sp)
80009c9c: 97 10 00 00  	auipc	ra, 1
80009ca0: e7 80 e0 4c  	jalr	1230(ra)
80009ca4: aa e8        	sd	a0, 80(sp)
80009ca6: ae e4        	sd	a1, 72(sp)
80009ca8: 31 a8        	j	28 <.LBB14_42>
80009caa: 6a 75        	ld	a0, 184(sp)
80009cac: 0c 69        	ld	a1, 16(a0)
80009cae: 01 46        	mv	a2, zero
80009cb0: b2 f3        	sd	a2, 480(sp)
80009cb2: ae f7        	sd	a1, 488(sp)
80009cb4: 32 85        	add	a0, zero, a2
80009cb6: 97 10 00 00  	auipc	ra, 1
80009cba: e7 80 a0 f3  	jalr	-198(ra)
80009cbe: aa e0        	sd	a0, 64(sp)
80009cc0: 2e fc        	sd	a1, 56(sp)
80009cc2: a1 a8        	j	88 <.LBB14_44+0x14>

0000000080009cc4 <.LBB14_42>:
80009cc4: 97 15 00 00  	auipc	a1, 1
80009cc8: 93 85 85 48  	addi	a1, a1, 1160
80009ccc: 66 65        	ld	a0, 88(sp)
80009cce: 97 10 00 00  	auipc	ra, 1
80009cd2: e7 80 c0 49  	jalr	1180(ra)
80009cd6: 2a f8        	sd	a0, 48(sp)
80009cd8: 2e f4        	sd	a1, 40(sp)
80009cda: 09 a0        	j	2 <.LBB14_42+0x18>
80009cdc: 46 65        	ld	a0, 80(sp)
80009cde: 2a f3        	sd	a0, 416(sp)
80009ce0: a6 65        	ld	a1, 72(sp)
80009ce2: 2e f7        	sd	a1, 424(sp)
80009ce4: 42 76        	ld	a2, 48(sp)
80009ce6: 32 fb        	sd	a2, 432(sp)
80009ce8: a2 76        	ld	a3, 40(sp)
80009cea: 36 ff        	sd	a3, 440(sp)

0000000080009cec <.LBB14_43>:
80009cec: 97 65 00 00  	auipc	a1, 6
80009cf0: 93 85 c5 08  	addi	a1, a1, 140
80009cf4: 88 1a        	addi	a0, sp, 368
80009cf6: 0d 46        	addi	a2, zero, 3
80009cf8: 14 13        	addi	a3, sp, 416
80009cfa: 09 47        	addi	a4, zero, 2
80009cfc: 97 10 00 00  	auipc	ra, 1
80009d00: e7 80 20 4b  	jalr	1202(ra)
80009d04: 09 a0        	j	2 <.LBB14_44>

0000000080009d06 <.LBB14_44>:
80009d06: 97 65 00 00  	auipc	a1, 6
80009d0a: 93 85 25 0d  	addi	a1, a1, 210
80009d0e: 88 1a        	addi	a0, sp, 368
80009d10: 97 20 00 00  	auipc	ra, 2
80009d14: e7 80 60 a9  	jalr	-1386(ra)
80009d18: 00 00        	unimp	
80009d1a: 06 65        	ld	a0, 64(sp)
80009d1c: aa fb        	sd	a0, 496(sp)
80009d1e: e2 75        	ld	a1, 56(sp)
80009d20: ae ff        	sd	a1, 504(sp)
80009d22: 09 a0        	j	2 <.LBB14_44+0x1e>
80009d24: 88 1b        	addi	a0, sp, 496
80009d26: 97 10 00 00  	auipc	ra, 1
80009d2a: e7 80 c0 e5  	jalr	-420(ra)
80009d2e: 23 30 a1 20  	sd	a0, 512(sp)
80009d32: 23 34 b1 20  	sd	a1, 520(sp)
80009d36: 09 a0        	j	2 <.LBB14_44+0x32>
80009d38: 03 35 01 20  	ld	a0, 512(sp)
80009d3c: 81 45        	mv	a1, zero
80009d3e: 63 04 b5 00  	beq	a0, a1, 8 <.LBB14_44+0x40>
80009d42: 09 a0        	j	2 <.LBB14_44+0x3e>
80009d44: 39 a0        	j	14 <.LBB14_44+0x4c>
80009d46: 83 30 81 29  	ld	ra, 664(sp)
80009d4a: 13 01 01 2a  	addi	sp, sp, 672
80009d4e: 82 80        	ret
80009d50: 00 00        	unimp	
80009d52: 03 35 81 20  	ld	a0, 520(sp)
80009d56: 23 38 a1 26  	sd	a0, 624(sp)
80009d5a: 23 3c a1 26  	sd	a0, 632(sp)
80009d5e: 23 30 a1 28  	sd	a0, 640(sp)
80009d62: ea 75        	ld	a1, 184(sp)
80009d64: 2a f0        	sd	a0, 32(sp)
80009d66: 2e 85        	add	a0, zero, a1
80009d68: 82 75        	ld	a1, 32(sp)
80009d6a: 0e 66        	ld	a2, 192(sp)
80009d6c: 97 00 00 00  	auipc	ra, 0
80009d70: e7 80 e0 46  	jalr	1134(ra)
80009d74: 23 38 a1 20  	sd	a0, 528(sp)
80009d78: 09 a0        	j	2 <.LBB14_44+0x74>
80009d7a: 6a 75        	ld	a0, 184(sp)
80009d7c: 82 75        	ld	a1, 32(sp)
80009d7e: 2e 66        	ld	a2, 200(sp)
80009d80: 97 00 00 00  	auipc	ra, 0
80009d84: e7 80 80 4d  	jalr	1240(ra)
80009d88: aa 85        	add	a1, zero, a0
80009d8a: 23 34 a1 28  	sd	a0, 648(sp)
80009d8e: 2e ec        	sd	a1, 24(sp)
80009d90: 09 a0        	j	2 <.LBB14_44+0x8c>
80009d92: 09 a0        	j	2 <.LBB14_44+0x8e>
80009d94: 03 35 01 21  	ld	a0, 528(sp)
80009d98: e2 65        	ld	a1, 24(sp)
80009d9a: 63 64 b5 00  	bltu	a0, a1, 8 <.LBB14_44+0x9c>
80009d9e: 09 a0        	j	2 <.LBB14_44+0x9a>
80009da0: 51 b7        	j	-124 <.LBB14_44+0x1e>
80009da2: 6a 75        	ld	a0, 184(sp)
80009da4: 82 75        	ld	a1, 32(sp)
80009da6: 97 00 00 00  	auipc	ra, 0
80009daa: e7 80 20 32  	jalr	802(ra)
80009dae: 2a e8        	sd	a0, 16(sp)
80009db0: 09 a0        	j	2 <.LBB14_44+0xac>
80009db2: 42 65        	ld	a0, 16(sp)
80009db4: 23 38 a1 28  	sd	a0, 656(sp)
80009db8: 83 35 01 21  	ld	a1, 528(sp)
80009dbc: 05 46        	addi	a2, zero, 1
80009dbe: 97 00 00 00  	auipc	ra, 0
80009dc2: e7 80 40 7c  	jalr	1988(ra)
80009dc6: 09 a0        	j	2 <.LBB14_44+0xc2>
80009dc8: 01 45        	mv	a0, zero
80009dca: 82 75        	ld	a1, 32(sp)
80009dcc: 63 8c a5 00  	beq	a1, a0, 24 <.LBB14_44+0xde>
80009dd0: 09 a0        	j	2 <.LBB14_44+0xcc>
80009dd2: 83 35 01 21  	ld	a1, 528(sp)
80009dd6: 05 46        	addi	a2, zero, 1
80009dd8: 42 65        	ld	a0, 16(sp)
80009dda: 97 00 00 00  	auipc	ra, 0
80009dde: e7 80 80 7e  	jalr	2024(ra)
80009de2: 11 a0        	j	4 <.LBB14_44+0xe0>
80009de4: 11 a0        	j	4 <.LBB14_44+0xe2>
80009de6: 09 a0        	j	2 <.LBB14_44+0xe2>
80009de8: 03 35 01 21  	ld	a0, 528(sp)
80009dec: 93 05 15 00  	addi	a1, a0, 1
80009df0: 2e e4        	sd	a1, 8(sp)
80009df2: 63 e5 a5 04  	bltu	a1, a0, 74 <.LBB14_49>
80009df6: 09 a0        	j	2 <.LBB14_44+0xf2>
80009df8: 22 65        	ld	a0, 8(sp)
80009dfa: 23 38 a1 20  	sd	a0, 528(sp)
80009dfe: 59 bf        	j	-106 <.LBB14_44+0x8e>

0000000080009e00 <.LBB14_45>:
80009e00: 17 65 00 00  	auipc	a0, 6
80009e04: 13 05 05 f0  	addi	a0, a0, -256

0000000080009e08 <.LBB14_46>:
80009e08: 17 66 00 00  	auipc	a2, 6
80009e0c: 13 06 06 ee  	addi	a2, a2, -288
80009e10: 93 05 90 03  	addi	a1, zero, 57
80009e14: 97 20 00 00  	auipc	ra, 2
80009e18: e7 80 60 92  	jalr	-1754(ra)
80009e1c: 00 00        	unimp	

0000000080009e1e <.LBB14_47>:
80009e1e: 17 65 00 00  	auipc	a0, 6
80009e22: 13 05 25 ee  	addi	a0, a0, -286

0000000080009e26 <.LBB14_48>:
80009e26: 17 66 00 00  	auipc	a2, 6
80009e2a: 13 06 a6 f9  	addi	a2, a2, -102
80009e2e: 93 05 90 03  	addi	a1, zero, 57
80009e32: 97 20 00 00  	auipc	ra, 2
80009e36: e7 80 80 90  	jalr	-1784(ra)
80009e3a: 00 00        	unimp	

0000000080009e3c <.LBB14_49>:
80009e3c: 17 65 00 00  	auipc	a0, 6
80009e40: 13 05 45 db  	addi	a0, a0, -588

0000000080009e44 <.LBB14_50>:
80009e44: 17 66 00 00  	auipc	a2, 6
80009e48: 13 06 c6 fa  	addi	a2, a2, -84
80009e4c: f1 45        	addi	a1, zero, 28
80009e4e: 97 20 00 00  	auipc	ra, 2
80009e52: e7 80 c0 8e  	jalr	-1812(ra)
80009e56: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E:

0000000080009e58 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E>:
80009e58: 51 71        	addi	sp, sp, -240
80009e5a: 86 f5        	sd	ra, 232(sp)
80009e5c: 2a f5        	sd	a0, 168(sp)
80009e5e: 2e f9        	sd	a1, 176(sp)
80009e60: 10 65        	ld	a2, 8(a0)
80009e62: 32 fd        	sd	a2, 184(sp)
80009e64: 81 46        	mv	a3, zero
80009e66: b6 f8        	sd	a3, 112(sp)
80009e68: aa f4        	sd	a0, 104(sp)
80009e6a: ae f0        	sd	a1, 96(sp)
80009e6c: b2 ec        	sd	a2, 88(sp)
80009e6e: 97 00 00 00  	auipc	ra, 0
80009e72: e7 80 60 2b  	jalr	694(ra)
80009e76: aa e8        	sd	a0, 80(sp)
80009e78: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x22>
80009e7a: 01 45        	mv	a0, zero
80009e7c: aa fc        	sd	a0, 120(sp)
80009e7e: c6 65        	ld	a1, 80(sp)
80009e80: 2e e1        	sd	a1, 128(sp)
80009e82: 97 10 00 00  	auipc	ra, 1
80009e86: e7 80 e0 d6  	jalr	-658(ra)
80009e8a: aa e4        	sd	a0, 72(sp)
80009e8c: ae e0        	sd	a1, 64(sp)
80009e8e: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x38>
80009e90: 26 65        	ld	a0, 72(sp)
80009e92: 2a e5        	sd	a0, 136(sp)
80009e94: 86 65        	ld	a1, 64(sp)
80009e96: 2e e9        	sd	a1, 144(sp)
80009e98: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x42>
80009e9a: 28 01        	addi	a0, sp, 136
80009e9c: 97 10 00 00  	auipc	ra, 1
80009ea0: e7 80 60 ce  	jalr	-794(ra)
80009ea4: 2a ed        	sd	a0, 152(sp)
80009ea6: 2e f1        	sd	a1, 160(sp)
80009ea8: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x52>
80009eaa: 6a 65        	ld	a0, 152(sp)
80009eac: 81 45        	mv	a1, zero
80009eae: 63 04 b5 00  	beq	a0, a1, 8 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x5e>
80009eb2: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x5c>
80009eb4: 31 a0        	j	12 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x68>
80009eb6: 46 75        	ld	a0, 112(sp)
80009eb8: ae 70        	ld	ra, 232(sp)
80009eba: 6d 61        	addi	sp, sp, 240
80009ebc: 82 80        	ret
80009ebe: 00 00        	unimp	
80009ec0: 0a 75        	ld	a0, 160(sp)
80009ec2: aa e1        	sd	a0, 192(sp)
80009ec4: aa e5        	sd	a0, 200(sp)
80009ec6: aa e9        	sd	a0, 208(sp)
80009ec8: a6 75        	ld	a1, 104(sp)
80009eca: 2a fc        	sd	a0, 56(sp)
80009ecc: 2e 85        	add	a0, zero, a1
80009ece: e2 75        	ld	a1, 56(sp)
80009ed0: 06 76        	ld	a2, 96(sp)
80009ed2: 97 00 00 00  	auipc	ra, 0
80009ed6: e7 80 60 38  	jalr	902(ra)
80009eda: aa 85        	add	a1, zero, a0
80009edc: aa ed        	sd	a0, 216(sp)
80009ede: 2e f8        	sd	a1, 48(sp)
80009ee0: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x8a>
80009ee2: 26 75        	ld	a0, 104(sp)
80009ee4: e2 75        	ld	a1, 56(sp)
80009ee6: 66 66        	ld	a2, 88(sp)
80009ee8: 97 00 00 00  	auipc	ra, 0
80009eec: e7 80 20 2f  	jalr	754(ra)
80009ef0: aa 85        	add	a1, zero, a0
80009ef2: aa f1        	sd	a0, 224(sp)
80009ef4: 2e f4        	sd	a1, 40(sp)
80009ef6: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xa0>
80009ef8: 26 75        	ld	a0, 104(sp)
80009efa: e2 75        	ld	a1, 56(sp)
80009efc: 42 76        	ld	a2, 48(sp)
80009efe: 97 00 00 00  	auipc	ra, 0
80009f02: e7 80 e0 08  	jalr	142(ra)
80009f06: 2a f0        	sd	a0, 32(sp)
80009f08: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xb2>
80009f0a: 46 75        	ld	a0, 112(sp)
80009f0c: 82 75        	ld	a1, 32(sp)
80009f0e: 33 06 b5 00  	add	a2, a0, a1
80009f12: 32 ec        	sd	a2, 24(sp)
80009f14: 63 60 a6 04  	bltu	a2, a0, 64 <.LBB15_20>
80009f18: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xc2>
80009f1a: 62 65        	ld	a0, 24(sp)
80009f1c: aa f8        	sd	a0, 112(sp)
80009f1e: 86 75        	ld	a1, 96(sp)
80009f20: 66 66        	ld	a2, 88(sp)
80009f22: 63 fc c5 00  	bgeu	a1, a2, 24 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xe2>
80009f26: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xd0>
80009f28: 26 75        	ld	a0, 104(sp)
80009f2a: e2 75        	ld	a1, 56(sp)
80009f2c: 22 76        	ld	a2, 40(sp)
80009f2e: 97 00 00 00  	auipc	ra, 0
80009f32: e7 80 e0 05  	jalr	94(ra)
80009f36: 2a e8        	sd	a0, 16(sp)
80009f38: 11 a0        	j	4 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xe4>
80009f3a: 21 a8        	j	24 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xfa>
80009f3c: 46 75        	ld	a0, 112(sp)
80009f3e: c2 65        	ld	a1, 16(sp)
80009f40: 33 06 b5 00  	add	a2, a0, a1
80009f44: 32 e4        	sd	a2, 8(sp)
80009f46: 63 65 a6 02  	bltu	a2, a0, 42 <.LBB15_22>
80009f4a: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xf4>
80009f4c: 22 65        	ld	a0, 8(sp)
80009f4e: aa f8        	sd	a0, 112(sp)
80009f50: 09 a0        	j	2 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0xfa>
80009f52: a1 b7        	j	-184 <_ZN9allocator11BuddySystem9init_free17hdfb1434974162e91E+0x42>

0000000080009f54 <.LBB15_20>:
80009f54: 17 65 00 00  	auipc	a0, 6
80009f58: 13 05 c5 c9  	addi	a0, a0, -868

0000000080009f5c <.LBB15_21>:
80009f5c: 17 66 00 00  	auipc	a2, 6
80009f60: 13 06 c6 ea  	addi	a2, a2, -340
80009f64: f1 45        	addi	a1, zero, 28
80009f66: 97 10 00 00  	auipc	ra, 1
80009f6a: e7 80 40 7d  	jalr	2004(ra)
80009f6e: 00 00        	unimp	

0000000080009f70 <.LBB15_22>:
80009f70: 17 65 00 00  	auipc	a0, 6
80009f74: 13 05 05 c8  	addi	a0, a0, -896

0000000080009f78 <.LBB15_23>:
80009f78: 17 66 00 00  	auipc	a2, 6
80009f7c: 13 06 86 ea  	addi	a2, a2, -344
80009f80: f1 45        	addi	a1, zero, 28
80009f82: 97 10 00 00  	auipc	ra, 1
80009f86: e7 80 80 7b  	jalr	1976(ra)
80009f8a: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E:

0000000080009f8c <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E>:
80009f8c: 35 71        	addi	sp, sp, -160
80009f8e: 06 ed        	sd	ra, 152(sp)
80009f90: aa f4        	sd	a0, 104(sp)
80009f92: ae f8        	sd	a1, 112(sp)
80009f94: b2 fc        	sd	a2, 120(sp)
80009f96: 93 76 16 00  	andi	a3, a2, 1
80009f9a: b2 e8        	sd	a2, 80(sp)
80009f9c: ae e4        	sd	a1, 72(sp)
80009f9e: aa e0        	sd	a0, 64(sp)
80009fa0: 89 ea        	bnez	a3, 18 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x26>
80009fa2: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x18>
80009fa4: 46 65        	ld	a0, 80(sp)
80009fa6: 93 05 15 00  	addi	a1, a0, 1
80009faa: 2e fc        	sd	a1, 56(sp)
80009fac: 63 e0 a5 10  	bltu	a1, a0, 256 <.LBB16_25>
80009fb0: 01 a8        	j	16 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x34>
80009fb2: 46 65        	ld	a0, 80(sp)
80009fb4: 93 05 f5 ff  	addi	a1, a0, -1
80009fb8: 2e f8        	sd	a1, 48(sp)
80009fba: 63 6a b5 0c  	bltu	a0, a1, 212 <.LBB16_23>
80009fbe: 21 a0        	j	8 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x3a>
80009fc0: 62 75        	ld	a0, 56(sp)
80009fc2: aa f0        	sd	a0, 96(sp)
80009fc4: 21 a0        	j	8 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x40>
80009fc6: 42 75        	ld	a0, 48(sp)
80009fc8: aa f0        	sd	a0, 96(sp)
80009fca: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x40>
80009fcc: 06 65        	ld	a0, 64(sp)
80009fce: a6 65        	ld	a1, 72(sp)
80009fd0: 46 66        	ld	a2, 80(sp)
80009fd2: 97 00 00 00  	auipc	ra, 0
80009fd6: e7 80 60 3a  	jalr	934(ra)
80009fda: aa 85        	add	a1, zero, a0
80009fdc: 2a e1        	sd	a0, 128(sp)
80009fde: 2e f4        	sd	a1, 40(sp)
80009fe0: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x56>
80009fe2: 06 76        	ld	a2, 96(sp)
80009fe4: 06 65        	ld	a0, 64(sp)
80009fe6: a6 65        	ld	a1, 72(sp)
80009fe8: 97 00 00 00  	auipc	ra, 0
80009fec: e7 80 00 39  	jalr	912(ra)
80009ff0: aa 85        	add	a1, zero, a0
80009ff2: 2a e5        	sd	a0, 136(sp)
80009ff4: 2e f0        	sd	a1, 32(sp)
80009ff6: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x6c>
80009ff8: 06 65        	ld	a0, 64(sp)
80009ffa: a6 65        	ld	a1, 72(sp)
80009ffc: 97 00 00 00  	auipc	ra, 0
8000a000: e7 80 c0 0c  	jalr	204(ra)
8000a004: 2a ec        	sd	a0, 24(sp)
8000a006: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x7c>
8000a008: 62 65        	ld	a0, 24(sp)
8000a00a: 2a e9        	sd	a0, 144(sp)
8000a00c: c6 65        	ld	a1, 80(sp)
8000a00e: 97 00 00 00  	auipc	ra, 0
8000a012: e7 80 40 5f  	jalr	1524(ra)
8000a016: 2a e8        	sd	a0, 16(sp)
8000a018: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x8e>
8000a01a: 86 75        	ld	a1, 96(sp)
8000a01c: 62 65        	ld	a0, 24(sp)
8000a01e: 97 00 00 00  	auipc	ra, 0
8000a022: e7 80 40 5e  	jalr	1508(ra)
8000a026: 2a e4        	sd	a0, 8(sp)
8000a028: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0x9e>
8000a02a: 42 65        	ld	a0, 16(sp)
8000a02c: a2 65        	ld	a1, 8(sp)
8000a02e: 63 0b b5 00  	beq	a0, a1, 22 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xb8>
8000a032: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xa8>
8000a034: 62 65        	ld	a0, 24(sp)
8000a036: c6 65        	ld	a1, 80(sp)
8000a038: 97 00 00 00  	auipc	ra, 0
8000a03c: e7 80 a0 5c  	jalr	1482(ra)
8000a040: 2a e0        	sd	a0, 0(sp)
8000a042: 21 a0        	j	8 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xbe>
8000a044: 01 45        	mv	a0, zero
8000a046: aa ec        	sd	a0, 88(sp)
8000a048: 3d a8        	j	62 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xfa>
8000a04a: 01 45        	mv	a0, zero
8000a04c: 82 65        	ld	a1, 0(sp)
8000a04e: 63 8a a5 00  	beq	a1, a0, 20 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xd6>
8000a052: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xc8>
8000a054: 62 65        	ld	a0, 24(sp)
8000a056: 82 75        	ld	a1, 32(sp)
8000a058: 97 10 00 00  	auipc	ra, 1
8000a05c: e7 80 a0 e4  	jalr	-438(ra)
8000a060: 01 a8        	j	16 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xe4>
8000a062: 62 65        	ld	a0, 24(sp)
8000a064: a2 75        	ld	a1, 40(sp)
8000a066: 97 10 00 00  	auipc	ra, 1
8000a06a: e7 80 c0 e3  	jalr	-452(ra)
8000a06e: 11 a0        	j	4 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xe6>
8000a070: 11 a0        	j	4 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xe8>
8000a072: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xe8>
8000a074: 06 65        	ld	a0, 64(sp)
8000a076: a6 65        	ld	a1, 72(sp)
8000a078: 97 00 00 00  	auipc	ra, 0
8000a07c: e7 80 40 38  	jalr	900(ra)
8000a080: aa ec        	sd	a0, 88(sp)
8000a082: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xf8>
8000a084: 09 a0        	j	2 <_ZN9allocator11BuddySystem14init_free_pair17h3cb89569cccf6c88E+0xfa>
8000a086: 66 65        	ld	a0, 88(sp)
8000a088: ea 60        	ld	ra, 152(sp)
8000a08a: 0d 61        	addi	sp, sp, 160
8000a08c: 82 80        	ret

000000008000a08e <.LBB16_23>:
8000a08e: 17 65 00 00  	auipc	a0, 6
8000a092: 13 05 25 ab  	addi	a0, a0, -1358

000000008000a096 <.LBB16_24>:
8000a096: 17 66 00 00  	auipc	a2, 6
8000a09a: 13 06 26 da  	addi	a2, a2, -606
8000a09e: 93 05 10 02  	addi	a1, zero, 33
8000a0a2: 97 10 00 00  	auipc	ra, 1
8000a0a6: e7 80 80 69  	jalr	1688(ra)
8000a0aa: 00 00        	unimp	

000000008000a0ac <.LBB16_25>:
8000a0ac: 17 65 00 00  	auipc	a0, 6
8000a0b0: 13 05 45 b4  	addi	a0, a0, -1212

000000008000a0b4 <.LBB16_26>:
8000a0b4: 17 66 00 00  	auipc	a2, 6
8000a0b8: 13 06 c6 d9  	addi	a2, a2, -612
8000a0bc: f1 45        	addi	a1, zero, 28
8000a0be: 97 10 00 00  	auipc	ra, 1
8000a0c2: e7 80 c0 67  	jalr	1660(ra)
8000a0c6: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem12get_info_mut17hff34daddc20f5a28E:

000000008000a0c8 <_ZN9allocator11BuddySystem12get_info_mut17hff34daddc20f5a28E>:
8000a0c8: 1d 71        	addi	sp, sp, -96
8000a0ca: 86 ec        	sd	ra, 88(sp)
8000a0cc: 2a f8        	sd	a0, 48(sp)
8000a0ce: 2e fc        	sd	a1, 56(sp)
8000a0d0: 13 05 85 02  	addi	a0, a0, 40
8000a0d4: aa e8        	sd	a0, 80(sp)
8000a0d6: 2e f4        	sd	a1, 40(sp)
8000a0d8: 2a f0        	sd	a0, 32(sp)
8000a0da: 09 a0        	j	2 <_ZN9allocator11BuddySystem12get_info_mut17hff34daddc20f5a28E+0x14>
8000a0dc: 02 75        	ld	a0, 32(sp)
8000a0de: 0c 61        	ld	a1, 0(a0)
8000a0e0: 10 65        	ld	a2, 8(a0)
8000a0e2: ae e0        	sd	a1, 64(sp)
8000a0e4: b2 e4        	sd	a2, 72(sp)
8000a0e6: 2e 85        	add	a0, zero, a1
8000a0e8: b2 85        	add	a1, zero, a2
8000a0ea: 22 76        	ld	a2, 40(sp)
8000a0ec: 97 f0 ff ff  	auipc	ra, 1048575
8000a0f0: e7 80 20 3d  	jalr	978(ra)
8000a0f4: 2a ec        	sd	a0, 24(sp)
8000a0f6: 09 a0        	j	2 <_ZN9allocator11BuddySystem12get_info_mut17hff34daddc20f5a28E+0x30>
8000a0f8: 62 65        	ld	a0, 24(sp)
8000a0fa: 97 f0 ff ff  	auipc	ra, 1048575
8000a0fe: e7 80 40 34  	jalr	836(ra)
8000a102: 2a e8        	sd	a0, 16(sp)
8000a104: 09 a0        	j	2 <.LBB17_5>

000000008000a106 <.LBB17_5>:
8000a106: 97 65 00 00  	auipc	a1, 6
8000a10a: 93 85 25 d6  	addi	a1, a1, -670
8000a10e: 42 65        	ld	a0, 16(sp)
8000a110: 97 10 00 00  	auipc	ra, 1
8000a114: e7 80 60 cf  	jalr	-778(ra)
8000a118: 2a e4        	sd	a0, 8(sp)
8000a11a: 09 a0        	j	2 <.LBB17_5+0x16>
8000a11c: 22 65        	ld	a0, 8(sp)
8000a11e: e6 60        	ld	ra, 88(sp)
8000a120: 25 61        	addi	sp, sp, 96
8000a122: 82 80        	ret

Disassembly of section .text._ZN9allocator11BuddySystem8max_size17hb0cde1116455ab6dE:

000000008000a124 <_ZN9allocator11BuddySystem8max_size17hb0cde1116455ab6dE>:
8000a124: 41 11        	addi	sp, sp, -16
8000a126: 2a e4        	sd	a0, 8(sp)
8000a128: 08 69        	ld	a0, 16(a0)
8000a12a: 93 05 f5 ff  	addi	a1, a0, -1
8000a12e: 2e e0        	sd	a1, 0(sp)
8000a130: 63 66 b5 00  	bltu	a0, a1, 12 <.LBB18_3>
8000a134: 09 a0        	j	2 <_ZN9allocator11BuddySystem8max_size17hb0cde1116455ab6dE+0x12>
8000a136: 02 65        	ld	a0, 0(sp)
8000a138: 41 01        	addi	sp, sp, 16
8000a13a: 82 80        	ret

000000008000a13c <.LBB18_3>:
8000a13c: 17 65 00 00  	auipc	a0, 6
8000a140: 13 05 45 a0  	addi	a0, a0, -1532

000000008000a144 <.LBB18_4>:
8000a144: 17 66 00 00  	auipc	a2, 6
8000a148: 13 06 c6 d3  	addi	a2, a2, -708
8000a14c: 93 05 10 02  	addi	a1, zero, 33
8000a150: 97 10 00 00  	auipc	ra, 1
8000a154: e7 80 a0 5e  	jalr	1514(ra)
8000a158: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem5n_blk17h1890893c71d8692bE:

000000008000a15a <_ZN9allocator11BuddySystem5n_blk17h1890893c71d8692bE>:
8000a15a: 39 71        	addi	sp, sp, -64
8000a15c: 06 fc        	sd	ra, 56(sp)
8000a15e: 2a f4        	sd	a0, 40(sp)
8000a160: 2e f8        	sd	a1, 48(sp)
8000a162: 2e f0        	sd	a1, 32(sp)
8000a164: 97 00 00 00  	auipc	ra, 0
8000a168: e7 80 00 fc  	jalr	-64(ra)
8000a16c: 2a ec        	sd	a0, 24(sp)
8000a16e: 09 a0        	j	2 <_ZN9allocator11BuddySystem5n_blk17h1890893c71d8692bE+0x16>
8000a170: 62 65        	ld	a0, 24(sp)
8000a172: 82 75        	ld	a1, 32(sp)
8000a174: 33 06 b5 40  	sub	a2, a0, a1
8000a178: 32 e8        	sd	a2, 16(sp)
8000a17a: 63 62 c5 02  	bltu	a0, a2, 36 <.LBB19_6>
8000a17e: 09 a0        	j	2 <_ZN9allocator11BuddySystem5n_blk17h1890893c71d8692bE+0x26>
8000a180: 42 65        	ld	a0, 16(sp)
8000a182: 93 75 05 fc  	andi	a1, a0, -64
8000a186: 05 46        	addi	a2, zero, 1
8000a188: 33 15 a6 00  	sll	a0, a2, a0
8000a18c: 01 46        	mv	a2, zero
8000a18e: 2a e4        	sd	a0, 8(sp)
8000a190: 63 96 c5 02  	bne	a1, a2, 44 <.LBB19_8>
8000a194: 09 a0        	j	2 <_ZN9allocator11BuddySystem5n_blk17h1890893c71d8692bE+0x3c>
8000a196: 22 65        	ld	a0, 8(sp)
8000a198: e2 70        	ld	ra, 56(sp)
8000a19a: 21 61        	addi	sp, sp, 64
8000a19c: 82 80        	ret

000000008000a19e <.LBB19_6>:
8000a19e: 17 65 00 00  	auipc	a0, 6
8000a1a2: 13 05 25 9a  	addi	a0, a0, -1630

000000008000a1a6 <.LBB19_7>:
8000a1a6: 17 66 00 00  	auipc	a2, 6
8000a1aa: 13 06 26 cf  	addi	a2, a2, -782
8000a1ae: 93 05 10 02  	addi	a1, zero, 33
8000a1b2: 97 10 00 00  	auipc	ra, 1
8000a1b6: e7 80 80 58  	jalr	1416(ra)
8000a1ba: 00 00        	unimp	

000000008000a1bc <.LBB19_8>:
8000a1bc: 17 65 00 00  	auipc	a0, 6
8000a1c0: 13 05 45 d1  	addi	a0, a0, -748

000000008000a1c4 <.LBB19_9>:
8000a1c4: 17 66 00 00  	auipc	a2, 6
8000a1c8: 13 06 c6 ce  	addi	a2, a2, -788
8000a1cc: 93 05 30 02  	addi	a1, zero, 35
8000a1d0: 97 10 00 00  	auipc	ra, 1
8000a1d4: e7 80 a0 56  	jalr	1386(ra)
8000a1d8: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem9blk_index17he8bd85104e8c2d75E:

000000008000a1da <_ZN9allocator11BuddySystem9blk_index17he8bd85104e8c2d75E>:
8000a1da: 39 71        	addi	sp, sp, -64
8000a1dc: 06 fc        	sd	ra, 56(sp)
8000a1de: 2a f0        	sd	a0, 32(sp)
8000a1e0: 2e f4        	sd	a1, 40(sp)
8000a1e2: 32 f8        	sd	a2, 48(sp)
8000a1e4: 14 61        	ld	a3, 0(a0)
8000a1e6: b3 06 d6 40  	sub	a3, a2, a3
8000a1ea: 2e ec        	sd	a1, 24(sp)
8000a1ec: 2a e8        	sd	a0, 16(sp)
8000a1ee: 36 e4        	sd	a3, 8(sp)
8000a1f0: 63 67 d6 02  	bltu	a2, a3, 46 <.LBB20_6>
8000a1f4: 09 a0        	j	2 <_ZN9allocator11BuddySystem9blk_index17he8bd85104e8c2d75E+0x1c>
8000a1f6: 42 65        	ld	a0, 16(sp)
8000a1f8: e2 65        	ld	a1, 24(sp)
8000a1fa: 97 00 00 00  	auipc	ra, 0
8000a1fe: e7 80 20 20  	jalr	514(ra)
8000a202: 2a e0        	sd	a0, 0(sp)
8000a204: 09 a0        	j	2 <_ZN9allocator11BuddySystem9blk_index17he8bd85104e8c2d75E+0x2c>
8000a206: 01 45        	mv	a0, zero
8000a208: 82 65        	ld	a1, 0(sp)
8000a20a: 63 89 a5 02  	beq	a1, a0, 50 <.LBB20_8>
8000a20e: 09 a0        	j	2 <_ZN9allocator11BuddySystem9blk_index17he8bd85104e8c2d75E+0x36>
8000a210: 22 65        	ld	a0, 8(sp)
8000a212: 82 65        	ld	a1, 0(sp)
8000a214: 33 55 b5 02  	<unknown>
8000a218: e2 70        	ld	ra, 56(sp)
8000a21a: 21 61        	addi	sp, sp, 64
8000a21c: 82 80        	ret

000000008000a21e <.LBB20_6>:
8000a21e: 17 65 00 00  	auipc	a0, 6
8000a222: 13 05 25 92  	addi	a0, a0, -1758

000000008000a226 <.LBB20_7>:
8000a226: 17 66 00 00  	auipc	a2, 6
8000a22a: 13 06 26 cd  	addi	a2, a2, -814
8000a22e: 93 05 10 02  	addi	a1, zero, 33
8000a232: 97 10 00 00  	auipc	ra, 1
8000a236: e7 80 80 50  	jalr	1288(ra)
8000a23a: 00 00        	unimp	

000000008000a23c <.LBB20_8>:
8000a23c: 17 65 00 00  	auipc	a0, 6
8000a240: 13 05 45 97  	addi	a0, a0, -1676

000000008000a244 <.LBB20_9>:
8000a244: 17 66 00 00  	auipc	a2, 6
8000a248: 13 06 46 cb  	addi	a2, a2, -844
8000a24c: e5 45        	addi	a1, zero, 25
8000a24e: 97 10 00 00  	auipc	ra, 1
8000a252: e7 80 c0 4e  	jalr	1260(ra)
8000a256: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE:

000000008000a258 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE>:
8000a258: 1d 71        	addi	sp, sp, -96
8000a25a: 86 ec        	sd	ra, 88(sp)
8000a25c: 2a fc        	sd	a0, 56(sp)
8000a25e: ae e0        	sd	a1, 64(sp)
8000a260: b2 e4        	sd	a2, 72(sp)
8000a262: 2a f4        	sd	a0, 40(sp)
8000a264: 32 f0        	sd	a2, 32(sp)
8000a266: 97 00 00 00  	auipc	ra, 0
8000a26a: e7 80 60 19  	jalr	406(ra)
8000a26e: aa 85        	add	a1, zero, a0
8000a270: aa e8        	sd	a0, 80(sp)
8000a272: 2e ec        	sd	a1, 24(sp)
8000a274: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x1e>
8000a276: 22 75        	ld	a0, 40(sp)
8000a278: 0c 61        	ld	a1, 0(a0)
8000a27a: 02 76        	ld	a2, 32(sp)
8000a27c: b3 05 b6 40  	sub	a1, a2, a1
8000a280: 2e e8        	sd	a1, 16(sp)
8000a282: 63 62 b6 06  	bltu	a2, a1, 100 <.LBB21_15>
8000a286: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x30>
8000a288: 01 45        	mv	a0, zero
8000a28a: e2 65        	ld	a1, 24(sp)
8000a28c: 63 8c a5 06  	beq	a1, a0, 120 <.LBB21_17>
8000a290: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x3a>
8000a292: 42 65        	ld	a0, 16(sp)
8000a294: e2 65        	ld	a1, 24(sp)
8000a296: 33 56 b5 02  	<unknown>
8000a29a: 32 f8        	sd	a2, 48(sp)
8000a29c: 22 76        	ld	a2, 40(sp)
8000a29e: 14 62        	ld	a3, 0(a2)
8000a2a0: 02 77        	ld	a4, 32(sp)
8000a2a2: b3 06 d7 40  	sub	a3, a4, a3
8000a2a6: 36 e4        	sd	a3, 8(sp)
8000a2a8: 63 6c d7 06  	bltu	a4, a3, 120 <.LBB21_19>
8000a2ac: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x56>
8000a2ae: 01 45        	mv	a0, zero
8000a2b0: e2 65        	ld	a1, 24(sp)
8000a2b2: 63 86 a5 08  	beq	a1, a0, 140 <.LBB21_21>
8000a2b6: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x60>
8000a2b8: 22 65        	ld	a0, 8(sp)
8000a2ba: e2 65        	ld	a1, 24(sp)
8000a2bc: 33 76 b5 02  	<unknown>
8000a2c0: 81 46        	mv	a3, zero
8000a2c2: 63 0a d6 00  	beq	a2, a3, 20 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x7e>
8000a2c6: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x70>
8000a2c8: 42 75        	ld	a0, 48(sp)
8000a2ca: 93 05 15 00  	addi	a1, a0, 1
8000a2ce: 2e e0        	sd	a1, 0(sp)
8000a2d0: 63 e6 a5 08  	bltu	a1, a0, 140 <.LBB21_23>
8000a2d4: 11 a0        	j	4 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x80>
8000a2d6: 21 a0        	j	8 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x86>
8000a2d8: 02 65        	ld	a0, 0(sp)
8000a2da: 2a f8        	sd	a0, 48(sp)
8000a2dc: 09 a0        	j	2 <_ZN9allocator11BuddySystem14blk_index_next17hc2235708f8f2139dE+0x86>
8000a2de: 42 75        	ld	a0, 48(sp)
8000a2e0: e6 60        	ld	ra, 88(sp)
8000a2e2: 25 61        	addi	sp, sp, 96
8000a2e4: 82 80        	ret

000000008000a2e6 <.LBB21_15>:
8000a2e6: 17 65 00 00  	auipc	a0, 6
8000a2ea: 13 05 a5 85  	addi	a0, a0, -1958

000000008000a2ee <.LBB21_16>:
8000a2ee: 17 66 00 00  	auipc	a2, 6
8000a2f2: 13 06 26 c2  	addi	a2, a2, -990
8000a2f6: 93 05 10 02  	addi	a1, zero, 33
8000a2fa: 97 10 00 00  	auipc	ra, 1
8000a2fe: e7 80 00 44  	jalr	1088(ra)
8000a302: 00 00        	unimp	

000000008000a304 <.LBB21_17>:
8000a304: 17 65 00 00  	auipc	a0, 6
8000a308: 13 05 c5 8a  	addi	a0, a0, -1876

000000008000a30c <.LBB21_18>:
8000a30c: 17 66 00 00  	auipc	a2, 6
8000a310: 13 06 46 c0  	addi	a2, a2, -1020
8000a314: e5 45        	addi	a1, zero, 25
8000a316: 97 10 00 00  	auipc	ra, 1
8000a31a: e7 80 40 42  	jalr	1060(ra)
8000a31e: 00 00        	unimp	

000000008000a320 <.LBB21_19>:
8000a320: 17 65 00 00  	auipc	a0, 6
8000a324: 13 05 05 82  	addi	a0, a0, -2016

000000008000a328 <.LBB21_20>:
8000a328: 17 66 00 00  	auipc	a2, 6
8000a32c: 13 06 06 c0  	addi	a2, a2, -1024
8000a330: 93 05 10 02  	addi	a1, zero, 33
8000a334: 97 10 00 00  	auipc	ra, 1
8000a338: e7 80 60 40  	jalr	1030(ra)
8000a33c: 00 00        	unimp	

000000008000a33e <.LBB21_21>:
8000a33e: 17 65 00 00  	auipc	a0, 6
8000a342: 13 05 25 9c  	addi	a0, a0, -1598

000000008000a346 <.LBB21_22>:
8000a346: 17 66 00 00  	auipc	a2, 6
8000a34a: 13 06 26 be  	addi	a2, a2, -1054
8000a34e: 93 05 90 03  	addi	a1, zero, 57
8000a352: 97 10 00 00  	auipc	ra, 1
8000a356: e7 80 80 3e  	jalr	1000(ra)
8000a35a: 00 00        	unimp	

000000008000a35c <.LBB21_23>:
8000a35c: 17 65 00 00  	auipc	a0, 6
8000a360: 13 05 45 89  	addi	a0, a0, -1900

000000008000a364 <.LBB21_24>:
8000a364: 17 66 00 00  	auipc	a2, 6
8000a368: 13 06 c6 bd  	addi	a2, a2, -1060
8000a36c: f1 45        	addi	a1, zero, 28
8000a36e: 97 10 00 00  	auipc	ra, 1
8000a372: e7 80 c0 3c  	jalr	972(ra)
8000a376: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem8blk_addr17hbb3800004b67fe32E:

000000008000a378 <_ZN9allocator11BuddySystem8blk_addr17hbb3800004b67fe32E>:
8000a378: 5d 71        	addi	sp, sp, -80
8000a37a: 86 e4        	sd	ra, 72(sp)
8000a37c: 2a f8        	sd	a0, 48(sp)
8000a37e: 2e fc        	sd	a1, 56(sp)
8000a380: b2 e0        	sd	a2, 64(sp)
8000a382: 14 61        	ld	a3, 0(a0)
8000a384: 32 f4        	sd	a2, 40(sp)
8000a386: 36 f0        	sd	a3, 32(sp)
8000a388: 97 00 00 00  	auipc	ra, 0
8000a38c: e7 80 40 07  	jalr	116(ra)
8000a390: 2a ec        	sd	a0, 24(sp)
8000a392: 09 a0        	j	2 <_ZN9allocator11BuddySystem8blk_addr17hbb3800004b67fe32E+0x1c>
8000a394: 22 75        	ld	a0, 40(sp)
8000a396: e2 65        	ld	a1, 24(sp)
8000a398: 33 06 b5 02  	<unknown>
8000a39c: b3 36 b5 02  	<unknown>
8000a3a0: 01 47        	mv	a4, zero
8000a3a2: 32 e8        	sd	a2, 16(sp)
8000a3a4: 63 9f e6 00  	bne	a3, a4, 30 <.LBB22_6>
8000a3a8: 09 a0        	j	2 <_ZN9allocator11BuddySystem8blk_addr17hbb3800004b67fe32E+0x32>
8000a3aa: 02 75        	ld	a0, 32(sp)
8000a3ac: c2 65        	ld	a1, 16(sp)
8000a3ae: 33 06 b5 00  	add	a2, a0, a1
8000a3b2: 32 e4        	sd	a2, 8(sp)
8000a3b4: 63 66 a6 02  	bltu	a2, a0, 44 <.LBB22_8>
8000a3b8: 09 a0        	j	2 <_ZN9allocator11BuddySystem8blk_addr17hbb3800004b67fe32E+0x42>
8000a3ba: 22 65        	ld	a0, 8(sp)
8000a3bc: a6 60        	ld	ra, 72(sp)
8000a3be: 61 61        	addi	sp, sp, 80
8000a3c0: 82 80        	ret

000000008000a3c2 <.LBB22_6>:
8000a3c2: 17 65 00 00  	auipc	a0, 6
8000a3c6: 13 05 e5 ba  	addi	a0, a0, -1106

000000008000a3ca <.LBB22_7>:
8000a3ca: 17 66 00 00  	auipc	a2, 6
8000a3ce: 13 06 e6 b8  	addi	a2, a2, -1138
8000a3d2: 93 05 10 02  	addi	a1, zero, 33
8000a3d6: 97 10 00 00  	auipc	ra, 1
8000a3da: e7 80 40 36  	jalr	868(ra)
8000a3de: 00 00        	unimp	

000000008000a3e0 <.LBB22_8>:
8000a3e0: 17 65 00 00  	auipc	a0, 6
8000a3e4: 13 05 05 81  	addi	a0, a0, -2032

000000008000a3e8 <.LBB22_9>:
8000a3e8: 17 66 00 00  	auipc	a2, 6
8000a3ec: 13 06 06 bb  	addi	a2, a2, -1104
8000a3f0: f1 45        	addi	a1, zero, 28
8000a3f2: 97 10 00 00  	auipc	ra, 1
8000a3f6: e7 80 80 34  	jalr	840(ra)
8000a3fa: 00 00        	unimp	

Disassembly of section .text._ZN9allocator11BuddySystem8blk_size17h71833f0113d295e7E:

000000008000a3fc <_ZN9allocator11BuddySystem8blk_size17h71833f0113d295e7E>:
8000a3fc: 79 71        	addi	sp, sp, -48
8000a3fe: 2a f0        	sd	a0, 32(sp)
8000a400: 2e f4        	sd	a1, 40(sp)
8000a402: 13 f6 05 fc  	andi	a2, a1, -64
8000a406: 85 46        	addi	a3, zero, 1
8000a408: b3 95 b6 00  	sll	a1, a3, a1
8000a40c: 81 46        	mv	a3, zero
8000a40e: 2a ec        	sd	a0, 24(sp)
8000a410: 2e e8        	sd	a1, 16(sp)
8000a412: 63 12 d6 02  	bne	a2, a3, 36 <.LBB23_5>
8000a416: 09 a0        	j	2 <_ZN9allocator11BuddySystem8blk_size17h71833f0113d295e7E+0x1c>
8000a418: 62 65        	ld	a0, 24(sp)
8000a41a: 0c 6d        	ld	a1, 24(a0)
8000a41c: 42 66        	ld	a2, 16(sp)
8000a41e: 33 05 b6 02  	<unknown>
8000a422: b3 35 b6 02  	<unknown>
8000a426: 81 46        	mv	a3, zero
8000a428: 2a e4        	sd	a0, 8(sp)
8000a42a: 63 95 d5 02  	bne	a1, a3, 42 <.LBB23_7>
8000a42e: 09 a0        	j	2 <_ZN9allocator11BuddySystem8blk_size17h71833f0113d295e7E+0x34>
8000a430: 22 65        	ld	a0, 8(sp)
8000a432: 45 61        	addi	sp, sp, 48
8000a434: 82 80        	ret

000000008000a436 <.LBB23_5>:
8000a436: 17 65 00 00  	auipc	a0, 6
8000a43a: 13 05 a5 a9  	addi	a0, a0, -1382

000000008000a43e <.LBB23_6>:
8000a43e: 17 66 00 00  	auipc	a2, 6
8000a442: 13 06 26 b7  	addi	a2, a2, -1166
8000a446: 93 05 30 02  	addi	a1, zero, 35
8000a44a: 97 10 00 00  	auipc	ra, 1
8000a44e: e7 80 00 2f  	jalr	752(ra)
8000a452: 00 00        	unimp	

000000008000a454 <.LBB23_7>:
8000a454: 17 65 00 00  	auipc	a0, 6
8000a458: 13 05 c5 b1  	addi	a0, a0, -1252

000000008000a45c <.LBB23_8>:
8000a45c: 17 66 00 00  	auipc	a2, 6
8000a460: 13 06 46 b5  	addi	a2, a2, -1196
8000a464: 93 05 10 02  	addi	a1, zero, 33
8000a468: 97 10 00 00  	auipc	ra, 1
8000a46c: e7 80 20 2d  	jalr	722(ra)
8000a470: 00 00        	unimp	

Disassembly of section .text._ZN9allocator9BuddyInfo9get_alloc17h43853811fbb59b44E:

000000008000a472 <_ZN9allocator9BuddyInfo9get_alloc17h43853811fbb59b44E>:
8000a472: 1d 71        	addi	sp, sp, -96
8000a474: 86 ec        	sd	ra, 88(sp)
8000a476: 2a f8        	sd	a0, 48(sp)
8000a478: 2e fc        	sd	a1, 56(sp)
8000a47a: 41 05        	addi	a0, a0, 16
8000a47c: aa e8        	sd	a0, 80(sp)
8000a47e: 2e f4        	sd	a1, 40(sp)
8000a480: 2a f0        	sd	a0, 32(sp)
8000a482: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9get_alloc17h43853811fbb59b44E+0x12>
8000a484: 02 75        	ld	a0, 32(sp)
8000a486: 0c 61        	ld	a1, 0(a0)
8000a488: 10 65        	ld	a2, 8(a0)
8000a48a: ae e0        	sd	a1, 64(sp)
8000a48c: b2 e4        	sd	a2, 72(sp)
8000a48e: 2e 85        	add	a0, zero, a1
8000a490: b2 85        	add	a1, zero, a2
8000a492: 22 76        	ld	a2, 40(sp)
8000a494: 97 10 00 00  	auipc	ra, 1
8000a498: e7 80 00 f3  	jalr	-208(ra)
8000a49c: 2a ec        	sd	a0, 24(sp)
8000a49e: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9get_alloc17h43853811fbb59b44E+0x2e>
8000a4a0: 62 65        	ld	a0, 24(sp)
8000a4a2: 97 10 00 00  	auipc	ra, 1
8000a4a6: e7 80 40 eb  	jalr	-332(ra)
8000a4aa: 2a e8        	sd	a0, 16(sp)
8000a4ac: 09 a0        	j	2 <.LBB24_5>

000000008000a4ae <.LBB24_5>:
8000a4ae: 97 65 00 00  	auipc	a1, 6
8000a4b2: 93 85 a5 b1  	addi	a1, a1, -1254
8000a4b6: 42 65        	ld	a0, 16(sp)
8000a4b8: 97 10 00 00  	auipc	ra, 1
8000a4bc: e7 80 20 8e  	jalr	-1822(ra)
8000a4c0: 2a e4        	sd	a0, 8(sp)
8000a4c2: 09 a0        	j	2 <.LBB24_5+0x16>
8000a4c4: 22 65        	ld	a0, 8(sp)
8000a4c6: e6 60        	ld	ra, 88(sp)
8000a4c8: 25 61        	addi	sp, sp, 96
8000a4ca: 82 80        	ret

Disassembly of section .text._ZN9allocator9BuddyInfo13get_alloc_mut17h063f69bfa7e95d0cE:

000000008000a4cc <_ZN9allocator9BuddyInfo13get_alloc_mut17h063f69bfa7e95d0cE>:
8000a4cc: 1d 71        	addi	sp, sp, -96
8000a4ce: 86 ec        	sd	ra, 88(sp)
8000a4d0: 2a f8        	sd	a0, 48(sp)
8000a4d2: 2e fc        	sd	a1, 56(sp)
8000a4d4: 41 05        	addi	a0, a0, 16
8000a4d6: aa e8        	sd	a0, 80(sp)
8000a4d8: 2e f4        	sd	a1, 40(sp)
8000a4da: 2a f0        	sd	a0, 32(sp)
8000a4dc: 09 a0        	j	2 <_ZN9allocator9BuddyInfo13get_alloc_mut17h063f69bfa7e95d0cE+0x12>
8000a4de: 02 75        	ld	a0, 32(sp)
8000a4e0: 0c 61        	ld	a1, 0(a0)
8000a4e2: 10 65        	ld	a2, 8(a0)
8000a4e4: ae e0        	sd	a1, 64(sp)
8000a4e6: b2 e4        	sd	a2, 72(sp)
8000a4e8: 2e 85        	add	a0, zero, a1
8000a4ea: b2 85        	add	a1, zero, a2
8000a4ec: 22 76        	ld	a2, 40(sp)
8000a4ee: 97 10 00 00  	auipc	ra, 1
8000a4f2: e7 80 80 ad  	jalr	-1320(ra)
8000a4f6: 2a ec        	sd	a0, 24(sp)
8000a4f8: 09 a0        	j	2 <_ZN9allocator9BuddyInfo13get_alloc_mut17h063f69bfa7e95d0cE+0x2e>
8000a4fa: 62 65        	ld	a0, 24(sp)
8000a4fc: 97 10 00 00  	auipc	ra, 1
8000a500: e7 80 20 a5  	jalr	-1454(ra)
8000a504: 2a e8        	sd	a0, 16(sp)
8000a506: 09 a0        	j	2 <.LBB25_5>

000000008000a508 <.LBB25_5>:
8000a508: 97 65 00 00  	auipc	a1, 6
8000a50c: 93 85 85 ad  	addi	a1, a1, -1320
8000a510: 42 65        	ld	a0, 16(sp)
8000a512: 97 10 00 00  	auipc	ra, 1
8000a516: e7 80 e0 8b  	jalr	-1858(ra)
8000a51a: 2a e4        	sd	a0, 8(sp)
8000a51c: 09 a0        	j	2 <.LBB25_5+0x16>
8000a51e: 22 65        	ld	a0, 8(sp)
8000a520: e6 60        	ld	ra, 88(sp)
8000a522: 25 61        	addi	sp, sp, 96
8000a524: 82 80        	ret

Disassembly of section .text._ZN9allocator9BuddyInfo13get_split_mut17ha28aba05c6e9810aE:

000000008000a526 <_ZN9allocator9BuddyInfo13get_split_mut17ha28aba05c6e9810aE>:
8000a526: 1d 71        	addi	sp, sp, -96
8000a528: 86 ec        	sd	ra, 88(sp)
8000a52a: 2a f8        	sd	a0, 48(sp)
8000a52c: 2e fc        	sd	a1, 56(sp)
8000a52e: 13 05 05 02  	addi	a0, a0, 32
8000a532: aa e8        	sd	a0, 80(sp)
8000a534: 2e f4        	sd	a1, 40(sp)
8000a536: 2a f0        	sd	a0, 32(sp)
8000a538: 09 a0        	j	2 <_ZN9allocator9BuddyInfo13get_split_mut17ha28aba05c6e9810aE+0x14>
8000a53a: 02 75        	ld	a0, 32(sp)
8000a53c: 0c 61        	ld	a1, 0(a0)
8000a53e: 10 65        	ld	a2, 8(a0)
8000a540: ae e0        	sd	a1, 64(sp)
8000a542: b2 e4        	sd	a2, 72(sp)
8000a544: 2e 85        	add	a0, zero, a1
8000a546: b2 85        	add	a1, zero, a2
8000a548: 22 76        	ld	a2, 40(sp)
8000a54a: 97 10 00 00  	auipc	ra, 1
8000a54e: e7 80 c0 a7  	jalr	-1412(ra)
8000a552: 2a ec        	sd	a0, 24(sp)
8000a554: 09 a0        	j	2 <_ZN9allocator9BuddyInfo13get_split_mut17ha28aba05c6e9810aE+0x30>
8000a556: 62 65        	ld	a0, 24(sp)
8000a558: 97 10 00 00  	auipc	ra, 1
8000a55c: e7 80 60 9f  	jalr	-1546(ra)
8000a560: 2a e8        	sd	a0, 16(sp)
8000a562: 09 a0        	j	2 <.LBB27_5>

000000008000a564 <.LBB27_5>:
8000a564: 97 65 00 00  	auipc	a1, 6
8000a568: 93 85 45 a9  	addi	a1, a1, -1388
8000a56c: 42 65        	ld	a0, 16(sp)
8000a56e: 97 10 00 00  	auipc	ra, 1
8000a572: e7 80 20 86  	jalr	-1950(ra)
8000a576: 2a e4        	sd	a0, 8(sp)
8000a578: 09 a0        	j	2 <.LBB27_5+0x16>
8000a57a: 22 65        	ld	a0, 8(sp)
8000a57c: e6 60        	ld	ra, 88(sp)
8000a57e: 25 61        	addi	sp, sp, 96
8000a580: 82 80        	ret

Disassembly of section .text._ZN9allocator9BuddyInfo9alloc_set17hcd034ef7e14880afE:

000000008000a582 <_ZN9allocator9BuddyInfo9alloc_set17hcd034ef7e14880afE>:
8000a582: 5d 71        	addi	sp, sp, -80
8000a584: 86 e4        	sd	ra, 72(sp)
8000a586: b2 86        	add	a3, zero, a2
8000a588: 2a f0        	sd	a0, 32(sp)
8000a58a: 2e f4        	sd	a1, 40(sp)
8000a58c: a3 0b c1 02  	sb	a2, 55(sp)
8000a590: 13 d6 35 00  	srli	a2, a1, 3
8000a594: 32 fc        	sd	a2, 56(sp)
8000a596: 9d 89        	andi	a1, a1, 7
8000a598: ae e0        	sd	a1, 64(sp)
8000a59a: 2e ec        	sd	a1, 24(sp)
8000a59c: b2 85        	add	a1, zero, a2
8000a59e: 36 e8        	sd	a3, 16(sp)
8000a5a0: 97 00 00 00  	auipc	ra, 0
8000a5a4: e7 80 c0 f2  	jalr	-212(ra)
8000a5a8: 2a e4        	sd	a0, 8(sp)
8000a5aa: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9alloc_set17hcd034ef7e14880afE+0x2a>
8000a5ac: 22 65        	ld	a0, 8(sp)
8000a5ae: e2 65        	ld	a1, 24(sp)
8000a5b0: 42 66        	ld	a2, 16(sp)
8000a5b2: 97 10 00 00  	auipc	ra, 1
8000a5b6: e7 80 e0 ab  	jalr	-1346(ra)
8000a5ba: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9alloc_set17hcd034ef7e14880afE+0x3a>
8000a5bc: a6 60        	ld	ra, 72(sp)
8000a5be: 61 61        	addi	sp, sp, 80
8000a5c0: 82 80        	ret

Disassembly of section .text._ZN9allocator9BuddyInfo9split_set17hbdcd02bdf63b3a15E:

000000008000a5c2 <_ZN9allocator9BuddyInfo9split_set17hbdcd02bdf63b3a15E>:
8000a5c2: 5d 71        	addi	sp, sp, -80
8000a5c4: 86 e4        	sd	ra, 72(sp)
8000a5c6: b2 86        	add	a3, zero, a2
8000a5c8: 2a f0        	sd	a0, 32(sp)
8000a5ca: 2e f4        	sd	a1, 40(sp)
8000a5cc: a3 0b c1 02  	sb	a2, 55(sp)
8000a5d0: 13 d6 35 00  	srli	a2, a1, 3
8000a5d4: 32 fc        	sd	a2, 56(sp)
8000a5d6: 9d 89        	andi	a1, a1, 7
8000a5d8: ae e0        	sd	a1, 64(sp)
8000a5da: 2e ec        	sd	a1, 24(sp)
8000a5dc: b2 85        	add	a1, zero, a2
8000a5de: 36 e8        	sd	a3, 16(sp)
8000a5e0: 97 00 00 00  	auipc	ra, 0
8000a5e4: e7 80 60 f4  	jalr	-186(ra)
8000a5e8: 2a e4        	sd	a0, 8(sp)
8000a5ea: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9split_set17hbdcd02bdf63b3a15E+0x2a>
8000a5ec: 22 65        	ld	a0, 8(sp)
8000a5ee: e2 65        	ld	a1, 24(sp)
8000a5f0: 42 66        	ld	a2, 16(sp)
8000a5f2: 97 10 00 00  	auipc	ra, 1
8000a5f6: e7 80 e0 a7  	jalr	-1410(ra)
8000a5fa: 09 a0        	j	2 <_ZN9allocator9BuddyInfo9split_set17hbdcd02bdf63b3a15E+0x3a>
8000a5fc: a6 60        	ld	ra, 72(sp)
8000a5fe: 61 61        	addi	sp, sp, 80
8000a600: 82 80        	ret

Disassembly of section .text._ZN9allocator9BuddyInfo12is_alloc_set17h00639ec5e7be1999E:

000000008000a602 <_ZN9allocator9BuddyInfo12is_alloc_set17h00639ec5e7be1999E>:
8000a602: 39 71        	addi	sp, sp, -64
8000a604: 06 fc        	sd	ra, 56(sp)
8000a606: 2a ec        	sd	a0, 24(sp)
8000a608: 2e f0        	sd	a1, 32(sp)
8000a60a: 13 d6 35 00  	srli	a2, a1, 3
8000a60e: 32 f4        	sd	a2, 40(sp)
8000a610: 9d 89        	andi	a1, a1, 7
8000a612: 2e f8        	sd	a1, 48(sp)
8000a614: 2e e8        	sd	a1, 16(sp)
8000a616: b2 85        	add	a1, zero, a2
8000a618: 97 00 00 00  	auipc	ra, 0
8000a61c: e7 80 a0 e5  	jalr	-422(ra)
8000a620: 2a e4        	sd	a0, 8(sp)
8000a622: 09 a0        	j	2 <_ZN9allocator9BuddyInfo12is_alloc_set17h00639ec5e7be1999E+0x22>
8000a624: 22 65        	ld	a0, 8(sp)
8000a626: c2 65        	ld	a1, 16(sp)
8000a628: 97 10 00 00  	auipc	ra, 1
8000a62c: e7 80 80 9c  	jalr	-1592(ra)
8000a630: 2a e0        	sd	a0, 0(sp)
8000a632: 09 a0        	j	2 <_ZN9allocator9BuddyInfo12is_alloc_set17h00639ec5e7be1999E+0x32>
8000a634: 02 65        	ld	a0, 0(sp)
8000a636: e2 70        	ld	ra, 56(sp)
8000a638: 21 61        	addi	sp, sp, 64
8000a63a: 82 80        	ret

Disassembly of section .text._ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE:

000000008000a63c <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE>:
8000a63c: 1d 71        	addi	sp, sp, -96
8000a63e: 86 ec        	sd	ra, 88(sp)
8000a640: aa e0        	sd	a0, 64(sp)
8000a642: ae e4        	sd	a1, 72(sp)
8000a644: 10 61        	ld	a2, 0(a0)
8000a646: b2 e8        	sd	a2, 80(sp)
8000a648: 2e fc        	sd	a1, 56(sp)
8000a64a: 2a f8        	sd	a0, 48(sp)
8000a64c: 32 f4        	sd	a2, 40(sp)
8000a64e: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE+0x14>
8000a650: 13 05 00 03  	addi	a0, zero, 48
8000a654: e2 75        	ld	a1, 56(sp)
8000a656: 33 86 a5 02  	<unknown>
8000a65a: 33 b5 a5 02  	<unknown>
8000a65e: 81 46        	mv	a3, zero
8000a660: 32 f0        	sd	a2, 32(sp)
8000a662: 63 16 d5 04  	bne	a0, a3, 76 <.LBB32_8>
8000a666: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE+0x2c>
8000a668: 42 75        	ld	a0, 48(sp)
8000a66a: 0c 61        	ld	a1, 0(a0)
8000a66c: 02 76        	ld	a2, 32(sp)
8000a66e: b3 86 c5 00  	add	a3, a1, a2
8000a672: 36 ec        	sd	a3, 24(sp)
8000a674: 63 ec b6 04  	bltu	a3, a1, 88 <.LBB32_10>
8000a678: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE+0x3e>
8000a67a: 62 65        	ld	a0, 24(sp)
8000a67c: c2 75        	ld	a1, 48(sp)
8000a67e: 88 e1        	sd	a0, 0(a1)
8000a680: 01 46        	mv	a2, zero
8000a682: 22 75        	ld	a0, 40(sp)
8000a684: b2 85        	add	a1, zero, a2
8000a686: 62 76        	ld	a2, 56(sp)
8000a688: 97 10 00 00  	auipc	ra, 1
8000a68c: e7 80 80 e1  	jalr	-488(ra)
8000a690: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE+0x56>
8000a692: 22 75        	ld	a0, 40(sp)
8000a694: e2 75        	ld	a1, 56(sp)
8000a696: 97 00 00 00  	auipc	ra, 0
8000a69a: e7 80 00 31  	jalr	784(ra)
8000a69e: 2a e8        	sd	a0, 16(sp)
8000a6a0: 2e e4        	sd	a1, 8(sp)
8000a6a2: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17h56ea02ceabb6dc6cE+0x68>
8000a6a4: 42 65        	ld	a0, 16(sp)
8000a6a6: a2 65        	ld	a1, 8(sp)
8000a6a8: e6 60        	ld	ra, 88(sp)
8000a6aa: 25 61        	addi	sp, sp, 96
8000a6ac: 82 80        	ret

000000008000a6ae <.LBB32_8>:
8000a6ae: 17 65 00 00  	auipc	a0, 6
8000a6b2: 13 05 25 8c  	addi	a0, a0, -1854

000000008000a6b6 <.LBB32_9>:
8000a6b6: 17 66 00 00  	auipc	a2, 6
8000a6ba: 13 06 a6 95  	addi	a2, a2, -1702
8000a6be: 93 05 10 02  	addi	a1, zero, 33
8000a6c2: 97 10 00 00  	auipc	ra, 1
8000a6c6: e7 80 80 07  	jalr	120(ra)
8000a6ca: 00 00        	unimp	

000000008000a6cc <.LBB32_10>:
8000a6cc: 17 55 00 00  	auipc	a0, 5
8000a6d0: 13 05 45 52  	addi	a0, a0, 1316

000000008000a6d4 <.LBB32_11>:
8000a6d4: 17 66 00 00  	auipc	a2, 6
8000a6d8: 13 06 46 95  	addi	a2, a2, -1708
8000a6dc: f1 45        	addi	a1, zero, 28
8000a6de: 97 10 00 00  	auipc	ra, 1
8000a6e2: e7 80 c0 05  	jalr	92(ra)
8000a6e6: 00 00        	unimp	

Disassembly of section .text._ZN9allocator16init_slice_empty17hc70d49849b9368c5E:

000000008000a6e8 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E>:
8000a6e8: 1d 71        	addi	sp, sp, -96
8000a6ea: 86 ec        	sd	ra, 88(sp)
8000a6ec: aa e0        	sd	a0, 64(sp)
8000a6ee: ae e4        	sd	a1, 72(sp)
8000a6f0: 10 61        	ld	a2, 0(a0)
8000a6f2: b2 e8        	sd	a2, 80(sp)
8000a6f4: 2e fc        	sd	a1, 56(sp)
8000a6f6: 2a f8        	sd	a0, 48(sp)
8000a6f8: 32 f4        	sd	a2, 40(sp)
8000a6fa: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E+0x14>
8000a6fc: 62 75        	ld	a0, 56(sp)
8000a6fe: 81 45        	mv	a1, zero
8000a700: 2a f0        	sd	a0, 32(sp)
8000a702: a9 e5        	bnez	a1, 74 <.LBB33_8>
8000a704: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E+0x1e>
8000a706: 42 75        	ld	a0, 48(sp)
8000a708: 0c 61        	ld	a1, 0(a0)
8000a70a: 02 76        	ld	a2, 32(sp)
8000a70c: b3 86 c5 00  	add	a3, a1, a2
8000a710: 36 ec        	sd	a3, 24(sp)
8000a712: 63 ec b6 04  	bltu	a3, a1, 88 <.LBB33_10>
8000a716: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E+0x30>
8000a718: 62 65        	ld	a0, 24(sp)
8000a71a: c2 75        	ld	a1, 48(sp)
8000a71c: 88 e1        	sd	a0, 0(a1)
8000a71e: 01 46        	mv	a2, zero
8000a720: 22 75        	ld	a0, 40(sp)
8000a722: b2 85        	add	a1, zero, a2
8000a724: 62 76        	ld	a2, 56(sp)
8000a726: 97 10 00 00  	auipc	ra, 1
8000a72a: e7 80 20 da  	jalr	-606(ra)
8000a72e: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E+0x48>
8000a730: 22 75        	ld	a0, 40(sp)
8000a732: e2 75        	ld	a1, 56(sp)
8000a734: 97 00 00 00  	auipc	ra, 0
8000a738: e7 80 40 28  	jalr	644(ra)
8000a73c: 2a e8        	sd	a0, 16(sp)
8000a73e: 2e e4        	sd	a1, 8(sp)
8000a740: 09 a0        	j	2 <_ZN9allocator16init_slice_empty17hc70d49849b9368c5E+0x5a>
8000a742: 42 65        	ld	a0, 16(sp)
8000a744: a2 65        	ld	a1, 8(sp)
8000a746: e6 60        	ld	ra, 88(sp)
8000a748: 25 61        	addi	sp, sp, 96
8000a74a: 82 80        	ret

000000008000a74c <.LBB33_8>:
8000a74c: 17 65 00 00  	auipc	a0, 6
8000a750: 13 05 45 82  	addi	a0, a0, -2012

000000008000a754 <.LBB33_9>:
8000a754: 17 66 00 00  	auipc	a2, 6
8000a758: 13 06 c6 8b  	addi	a2, a2, -1860
8000a75c: 93 05 10 02  	addi	a1, zero, 33
8000a760: 97 10 00 00  	auipc	ra, 1
8000a764: e7 80 a0 fd  	jalr	-38(ra)
8000a768: 00 00        	unimp	

000000008000a76a <.LBB33_10>:
8000a76a: 17 55 00 00  	auipc	a0, 5
8000a76e: 13 05 65 48  	addi	a0, a0, 1158

000000008000a772 <.LBB33_11>:
8000a772: 17 66 00 00  	auipc	a2, 6
8000a776: 13 06 66 8b  	addi	a2, a2, -1866
8000a77a: f1 45        	addi	a1, zero, 28
8000a77c: 97 10 00 00  	auipc	ra, 1
8000a780: e7 80 e0 fb  	jalr	-66(ra)
8000a784: 00 00        	unimp	

Disassembly of section .text._ZN9allocator8round_up17hdfea249ca99f2a6bE:

000000008000a786 <_ZN9allocator8round_up17hdfea249ca99f2a6bE>:
8000a786: 79 71        	addi	sp, sp, -48
8000a788: 2a f0        	sd	a0, 32(sp)
8000a78a: 2e f4        	sd	a1, 40(sp)
8000a78c: 13 06 f5 ff  	addi	a2, a0, -1
8000a790: 2e ec        	sd	a1, 24(sp)
8000a792: 32 e8        	sd	a2, 16(sp)
8000a794: 63 61 c5 04  	bltu	a0, a2, 66 <.LBB34_9>
8000a798: 09 a0        	j	2 <_ZN9allocator8round_up17hdfea249ca99f2a6bE+0x14>
8000a79a: 01 45        	mv	a0, zero
8000a79c: e2 65        	ld	a1, 24(sp)
8000a79e: 63 8b a5 04  	beq	a1, a0, 86 <.LBB34_11>
8000a7a2: 09 a0        	j	2 <_ZN9allocator8round_up17hdfea249ca99f2a6bE+0x1e>
8000a7a4: 42 65        	ld	a0, 16(sp)
8000a7a6: e2 65        	ld	a1, 24(sp)
8000a7a8: 33 56 b5 02  	<unknown>
8000a7ac: 93 06 16 00  	addi	a3, a2, 1
8000a7b0: 36 e4        	sd	a3, 8(sp)
8000a7b2: 63 ef c6 04  	bltu	a3, a2, 94 <.LBB34_13>
8000a7b6: 09 a0        	j	2 <_ZN9allocator8round_up17hdfea249ca99f2a6bE+0x32>
8000a7b8: 22 65        	ld	a0, 8(sp)
8000a7ba: e2 65        	ld	a1, 24(sp)
8000a7bc: 33 05 b5 02  	<unknown>
8000a7c0: 22 66        	ld	a2, 8(sp)
8000a7c2: b3 36 b6 02  	<unknown>
8000a7c6: 01 47        	mv	a4, zero
8000a7c8: 2a e0        	sd	a0, 0(sp)
8000a7ca: 63 91 e6 06  	bne	a3, a4, 98 <.LBB34_15>
8000a7ce: 09 a0        	j	2 <_ZN9allocator8round_up17hdfea249ca99f2a6bE+0x4a>
8000a7d0: 02 65        	ld	a0, 0(sp)
8000a7d2: 45 61        	addi	sp, sp, 48
8000a7d4: 82 80        	ret

000000008000a7d6 <.LBB34_9>:
8000a7d6: 17 55 00 00  	auipc	a0, 5
8000a7da: 13 05 a5 36  	addi	a0, a0, 874

000000008000a7de <.LBB34_10>:
8000a7de: 17 66 00 00  	auipc	a2, 6
8000a7e2: 13 06 26 86  	addi	a2, a2, -1950
8000a7e6: 93 05 10 02  	addi	a1, zero, 33
8000a7ea: 97 10 00 00  	auipc	ra, 1
8000a7ee: e7 80 00 f5  	jalr	-176(ra)
8000a7f2: 00 00        	unimp	

000000008000a7f4 <.LBB34_11>:
8000a7f4: 17 55 00 00  	auipc	a0, 5
8000a7f8: 13 05 c5 3b  	addi	a0, a0, 956

000000008000a7fc <.LBB34_12>:
8000a7fc: 17 66 00 00  	auipc	a2, 6
8000a800: 13 06 c6 85  	addi	a2, a2, -1956
8000a804: e5 45        	addi	a1, zero, 25
8000a806: 97 10 00 00  	auipc	ra, 1
8000a80a: e7 80 40 f3  	jalr	-204(ra)
8000a80e: 00 00        	unimp	

000000008000a810 <.LBB34_13>:
8000a810: 17 55 00 00  	auipc	a0, 5
8000a814: 13 05 05 3e  	addi	a0, a0, 992

000000008000a818 <.LBB34_14>:
8000a818: 17 66 00 00  	auipc	a2, 6
8000a81c: 13 06 86 85  	addi	a2, a2, -1960
8000a820: f1 45        	addi	a1, zero, 28
8000a822: 97 10 00 00  	auipc	ra, 1
8000a826: e7 80 80 f1  	jalr	-232(ra)
8000a82a: 00 00        	unimp	

000000008000a82c <.LBB34_15>:
8000a82c: 17 55 00 00  	auipc	a0, 5
8000a830: 13 05 45 74  	addi	a0, a0, 1860

000000008000a834 <.LBB34_16>:
8000a834: 17 66 00 00  	auipc	a2, 6
8000a838: 13 06 c6 83  	addi	a2, a2, -1988
8000a83c: 93 05 10 02  	addi	a1, zero, 33
8000a840: 97 10 00 00  	auipc	ra, 1
8000a844: e7 80 a0 ef  	jalr	-262(ra)
8000a848: 00 00        	unimp	

Disassembly of section .text._ZN9allocator10round_down17h74c5df558da98199E:

000000008000a84a <_ZN9allocator10round_down17h74c5df558da98199E>:
8000a84a: 79 71        	addi	sp, sp, -48
8000a84c: 2a f0        	sd	a0, 32(sp)
8000a84e: 2e f4        	sd	a1, 40(sp)
8000a850: 01 46        	mv	a2, zero
8000a852: 2e ec        	sd	a1, 24(sp)
8000a854: 2a e8        	sd	a0, 16(sp)
8000a856: 63 83 c5 02  	beq	a1, a2, 38 <.LBB35_5>
8000a85a: 09 a0        	j	2 <_ZN9allocator10round_down17h74c5df558da98199E+0x12>
8000a85c: 42 65        	ld	a0, 16(sp)
8000a85e: e2 65        	ld	a1, 24(sp)
8000a860: 33 56 b5 02  	<unknown>
8000a864: 33 05 b6 02  	<unknown>
8000a868: 33 36 b6 02  	<unknown>
8000a86c: 81 46        	mv	a3, zero
8000a86e: 2a e4        	sd	a0, 8(sp)
8000a870: 63 14 d6 02  	bne	a2, a3, 40 <.LBB35_7>
8000a874: 09 a0        	j	2 <_ZN9allocator10round_down17h74c5df558da98199E+0x2c>
8000a876: 22 65        	ld	a0, 8(sp)
8000a878: 45 61        	addi	sp, sp, 48
8000a87a: 82 80        	ret

000000008000a87c <.LBB35_5>:
8000a87c: 17 55 00 00  	auipc	a0, 5
8000a880: 13 05 45 33  	addi	a0, a0, 820

000000008000a884 <.LBB35_6>:
8000a884: 17 66 00 00  	auipc	a2, 6
8000a888: 13 06 46 80  	addi	a2, a2, -2044
8000a88c: e5 45        	addi	a1, zero, 25
8000a88e: 97 10 00 00  	auipc	ra, 1
8000a892: e7 80 c0 ea  	jalr	-340(ra)
8000a896: 00 00        	unimp	

000000008000a898 <.LBB35_7>:
8000a898: 17 55 00 00  	auipc	a0, 5
8000a89c: 13 05 85 6d  	addi	a0, a0, 1752

000000008000a8a0 <.LBB35_8>:
8000a8a0: 17 56 00 00  	auipc	a2, 5
8000a8a4: 13 06 86 7e  	addi	a2, a2, 2024
8000a8a8: 93 05 10 02  	addi	a1, zero, 33
8000a8ac: 97 10 00 00  	auipc	ra, 1
8000a8b0: e7 80 e0 e8  	jalr	-370(ra)
8000a8b4: 00 00        	unimp	

Disassembly of section .text._ZN9allocator4log217hedc5f0f68f15cc06E:

000000008000a8b6 <_ZN9allocator4log217hedc5f0f68f15cc06E>:
8000a8b6: 01 11        	addi	sp, sp, -32
8000a8b8: 2a e8        	sd	a0, 16(sp)
8000a8ba: 01 45        	mv	a0, zero
8000a8bc: 2a ec        	sd	a0, 24(sp)
8000a8be: 09 a0        	j	2 <_ZN9allocator4log217hedc5f0f68f15cc06E+0xa>
8000a8c0: 42 65        	ld	a0, 16(sp)
8000a8c2: 85 45        	addi	a1, zero, 1
8000a8c4: 63 e6 a5 00  	bltu	a1, a0, 12 <_ZN9allocator4log217hedc5f0f68f15cc06E+0x1a>
8000a8c8: 09 a0        	j	2 <_ZN9allocator4log217hedc5f0f68f15cc06E+0x14>
8000a8ca: 62 65        	ld	a0, 24(sp)
8000a8cc: 05 61        	addi	sp, sp, 32
8000a8ce: 82 80        	ret
8000a8d0: 62 65        	ld	a0, 24(sp)
8000a8d2: 93 05 15 00  	addi	a1, a0, 1
8000a8d6: 2e e4        	sd	a1, 8(sp)
8000a8d8: 63 ec a5 00  	bltu	a1, a0, 24 <.LBB36_7>
8000a8dc: 09 a0        	j	2 <_ZN9allocator4log217hedc5f0f68f15cc06E+0x28>
8000a8de: 22 65        	ld	a0, 8(sp)
8000a8e0: 2a ec        	sd	a0, 24(sp)
8000a8e2: c2 65        	ld	a1, 16(sp)
8000a8e4: 85 81        	srli	a1, a1, 1
8000a8e6: 2e e0        	sd	a1, 0(sp)
8000a8e8: 09 a0        	j	2 <_ZN9allocator4log217hedc5f0f68f15cc06E+0x34>
8000a8ea: 02 65        	ld	a0, 0(sp)
8000a8ec: 2a e8        	sd	a0, 16(sp)
8000a8ee: c9 bf        	j	-46 <_ZN9allocator4log217hedc5f0f68f15cc06E+0xa>

000000008000a8f0 <.LBB36_7>:
8000a8f0: 17 55 00 00  	auipc	a0, 5
8000a8f4: 13 05 05 30  	addi	a0, a0, 768

000000008000a8f8 <.LBB36_8>:
8000a8f8: 17 56 00 00  	auipc	a2, 5
8000a8fc: 13 06 86 7a  	addi	a2, a2, 1960
8000a900: f1 45        	addi	a1, zero, 28
8000a902: 97 10 00 00  	auipc	ra, 1
8000a906: e7 80 80 e3  	jalr	-456(ra)
8000a90a: 00 00        	unimp	

Disassembly of section .text._ZN4core3ptr19swap_nonoverlapping17he22a44c4b7741addE:

000000008000a90c <_ZN4core3ptr19swap_nonoverlapping17he22a44c4b7741addE>:
8000a90c: 1d 71        	addi	sp, sp, -96
8000a90e: 86 ec        	sd	ra, 88(sp)
8000a910: 2a f4        	sd	a0, 40(sp)
8000a912: 2e f8        	sd	a1, 48(sp)
8000a914: 32 fc        	sd	a2, 56(sp)
8000a916: aa 86        	add	a3, zero, a0
8000a918: aa e0        	sd	a0, 64(sp)
8000a91a: 2e 85        	add	a0, zero, a1
8000a91c: ae e4        	sd	a1, 72(sp)
8000a91e: 32 f0        	sd	a2, 32(sp)
8000a920: 36 ec        	sd	a3, 24(sp)
8000a922: 2a e8        	sd	a0, 16(sp)
8000a924: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17he22a44c4b7741addE+0x1a>
8000a926: 02 75        	ld	a0, 32(sp)
8000a928: 93 15 35 00  	slli	a1, a0, 3
8000a92c: ae e8        	sd	a1, 80(sp)
8000a92e: 62 65        	ld	a0, 24(sp)
8000a930: 42 66        	ld	a2, 16(sp)
8000a932: 2e e4        	sd	a1, 8(sp)
8000a934: b2 85        	add	a1, zero, a2
8000a936: 22 66        	ld	a2, 8(sp)
8000a938: 97 00 00 00  	auipc	ra, 0
8000a93c: e7 80 20 09  	jalr	146(ra)
8000a940: 09 a0        	j	2 <_ZN4core3ptr19swap_nonoverlapping17he22a44c4b7741addE+0x36>
8000a942: e6 60        	ld	ra, 88(sp)
8000a944: 25 61        	addi	sp, sp, 96
8000a946: 82 80        	ret

Disassembly of section .text._ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E:

000000008000a948 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E>:
8000a948: 39 71        	addi	sp, sp, -64
8000a94a: 06 fc        	sd	ra, 56(sp)
8000a94c: 2a f0        	sd	a0, 32(sp)
8000a94e: 2e f4        	sd	a1, 40(sp)
8000a950: 2e e8        	sd	a1, 16(sp)
8000a952: 2a e4        	sd	a0, 8(sp)
8000a954: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0xe>
8000a956: 01 45        	mv	a0, zero
8000a958: 19 e9        	bnez	a0, 22 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x26>
8000a95a: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x14>
8000a95c: 22 65        	ld	a0, 8(sp)
8000a95e: 97 00 00 00  	auipc	ra, 0
8000a962: e7 80 a0 1a  	jalr	426(ra)
8000a966: aa 85        	add	a1, zero, a0
8000a968: 2a f8        	sd	a0, 48(sp)
8000a96a: 2e e0        	sd	a1, 0(sp)
8000a96c: 09 a8        	j	18 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x36>
8000a96e: 05 46        	addi	a2, zero, 1
8000a970: 22 65        	ld	a0, 8(sp)
8000a972: c2 65        	ld	a1, 16(sp)
8000a974: 97 00 00 00  	auipc	ra, 0
8000a978: e7 80 80 f9  	jalr	-104(ra)
8000a97c: 0d a0        	j	34 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x56>
8000a97e: 05 46        	addi	a2, zero, 1
8000a980: 42 65        	ld	a0, 16(sp)
8000a982: a2 65        	ld	a1, 8(sp)
8000a984: 97 10 00 00  	auipc	ra, 1
8000a988: e7 80 40 b6  	jalr	-1180(ra)
8000a98c: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x46>
8000a98e: 42 65        	ld	a0, 16(sp)
8000a990: 82 65        	ld	a1, 0(sp)
8000a992: 97 00 00 00  	auipc	ra, 0
8000a996: e7 80 00 1d  	jalr	464(ra)
8000a99a: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x54>
8000a99c: 11 a0        	j	4 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x58>
8000a99e: 09 a0        	j	2 <_ZN4core3ptr23swap_nonoverlapping_one17h8945f984183d3e26E+0x58>
8000a9a0: e2 70        	ld	ra, 56(sp)
8000a9a2: 21 61        	addi	sp, sp, 64
8000a9a4: 82 80        	ret

Disassembly of section .text._ZN4core3ptr24slice_from_raw_parts_mut17h3df5120505e1c3edE:

000000008000a9a6 <_ZN4core3ptr24slice_from_raw_parts_mut17h3df5120505e1c3edE>:
8000a9a6: 79 71        	addi	sp, sp, -48
8000a9a8: 2a f0        	sd	a0, 32(sp)
8000a9aa: 2e f4        	sd	a1, 40(sp)
8000a9ac: 2a e8        	sd	a0, 16(sp)
8000a9ae: 2e ec        	sd	a1, 24(sp)
8000a9b0: 2a e0        	sd	a0, 0(sp)
8000a9b2: 2e e4        	sd	a1, 8(sp)
8000a9b4: 45 61        	addi	sp, sp, 48
8000a9b6: 82 80        	ret

Disassembly of section .text._ZN4core3ptr24slice_from_raw_parts_mut17hf5cbf587838b906bE:

000000008000a9b8 <_ZN4core3ptr24slice_from_raw_parts_mut17hf5cbf587838b906bE>:
8000a9b8: 79 71        	addi	sp, sp, -48
8000a9ba: 2a f0        	sd	a0, 32(sp)
8000a9bc: 2e f4        	sd	a1, 40(sp)
8000a9be: 2a e8        	sd	a0, 16(sp)
8000a9c0: 2e ec        	sd	a1, 24(sp)
8000a9c2: 2a e0        	sd	a0, 0(sp)
8000a9c4: 2e e4        	sd	a1, 8(sp)
8000a9c6: 45 61        	addi	sp, sp, 48
8000a9c8: 82 80        	ret

Disassembly of section .text._ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E:

000000008000a9ca <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E>:
8000a9ca: 0d 71        	addi	sp, sp, -352
8000a9cc: 86 ee        	sd	ra, 344(sp)
8000a9ce: a2 ea        	sd	s0, 336(sp)
8000a9d0: 80 12        	addi	s0, sp, 352
8000a9d2: 13 71 01 fe  	andi	sp, sp, -32
8000a9d6: aa f5        	sd	a0, 232(sp)
8000a9d8: ae f9        	sd	a1, 240(sp)
8000a9da: b2 fd        	sd	a2, 248(sp)
8000a9dc: 93 06 00 02  	addi	a3, zero, 32
8000a9e0: 36 e2        	sd	a3, 256(sp)
8000a9e2: 32 e5        	sd	a2, 136(sp)
8000a9e4: 2e e1        	sd	a1, 128(sp)
8000a9e6: aa fc        	sd	a0, 120(sp)
8000a9e8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x20>
8000a9ea: 01 45        	mv	a0, zero
8000a9ec: 2a ed        	sd	a0, 152(sp)
8000a9ee: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x26>
8000a9f0: 6a 65        	ld	a0, 152(sp)
8000a9f2: 13 05 05 02  	addi	a0, a0, 32
8000a9f6: aa 65        	ld	a1, 136(sp)
8000a9f8: 63 f8 a5 00  	bgeu	a1, a0, 16 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x3e>
8000a9fc: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x34>
8000a9fe: 6a 65        	ld	a0, 152(sp)
8000aa00: aa 65        	ld	a1, 136(sp)
8000aa02: 63 6f b5 06  	bltu	a0, a1, 126 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xb6>
8000aa06: b5 a8        	j	124 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xb8>
8000aa08: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x40>
8000aa0a: 08 11        	addi	a0, sp, 160
8000aa0c: aa e6        	sd	a0, 328(sp)
8000aa0e: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x46>
8000aa10: 08 11        	addi	a0, sp, 160
8000aa12: 2a e6        	sd	a0, 264(sp)
8000aa14: ea 65        	ld	a1, 152(sp)
8000aa16: 66 76        	ld	a2, 120(sp)
8000aa18: aa f8        	sd	a0, 112(sp)
8000aa1a: 32 85        	add	a0, zero, a2
8000aa1c: 97 00 00 00  	auipc	ra, 0
8000aa20: e7 80 c0 4f  	jalr	1276(ra)
8000aa24: aa 85        	add	a1, zero, a0
8000aa26: 2a ea        	sd	a0, 272(sp)
8000aa28: ae f4        	sd	a1, 104(sp)
8000aa2a: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x62>
8000aa2c: ea 65        	ld	a1, 152(sp)
8000aa2e: 0a 65        	ld	a0, 128(sp)
8000aa30: 97 00 00 00  	auipc	ra, 0
8000aa34: e7 80 80 4e  	jalr	1256(ra)
8000aa38: aa 85        	add	a1, zero, a0
8000aa3a: 2a ee        	sd	a0, 280(sp)
8000aa3c: ae f0        	sd	a1, 96(sp)
8000aa3e: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x76>
8000aa40: 13 06 00 02  	addi	a2, zero, 32
8000aa44: 26 75        	ld	a0, 104(sp)
8000aa46: c6 75        	ld	a1, 112(sp)
8000aa48: 97 10 00 00  	auipc	ra, 1
8000aa4c: e7 80 20 ac  	jalr	-1342(ra)
8000aa50: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x88>
8000aa52: 13 06 00 02  	addi	a2, zero, 32
8000aa56: 06 75        	ld	a0, 96(sp)
8000aa58: a6 75        	ld	a1, 104(sp)
8000aa5a: 97 10 00 00  	auipc	ra, 1
8000aa5e: e7 80 00 ab  	jalr	-1360(ra)
8000aa62: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x9a>
8000aa64: 13 06 00 02  	addi	a2, zero, 32
8000aa68: 46 75        	ld	a0, 112(sp)
8000aa6a: 86 75        	ld	a1, 96(sp)
8000aa6c: 97 10 00 00  	auipc	ra, 1
8000aa70: e7 80 e0 a9  	jalr	-1378(ra)
8000aa74: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xac>
8000aa76: 6a 65        	ld	a0, 152(sp)
8000aa78: 13 05 05 02  	addi	a0, a0, 32
8000aa7c: 2a ed        	sd	a0, 152(sp)
8000aa7e: 8d bf        	j	-142 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x26>
8000aa80: 11 a0        	j	4 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xba>
8000aa82: ad a8        	j	122 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x132>
8000aa84: 6a 65        	ld	a0, 152(sp)
8000aa86: aa 65        	ld	a1, 136(sp)
8000aa88: 33 85 a5 40  	sub	a0, a1, a0
8000aa8c: 2a f2        	sd	a0, 288(sp)
8000aa8e: b0 01        	addi	a2, sp, 200
8000aa90: b2 e2        	sd	a2, 320(sp)
8000aa92: aa ec        	sd	a0, 88(sp)
8000aa94: b2 e8        	sd	a2, 80(sp)
8000aa96: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xce>
8000aa98: 46 65        	ld	a0, 80(sp)
8000aa9a: c6 65        	ld	a1, 80(sp)
8000aa9c: 2e f6        	sd	a1, 296(sp)
8000aa9e: ea 65        	ld	a1, 152(sp)
8000aaa0: 66 76        	ld	a2, 120(sp)
8000aaa2: aa e4        	sd	a0, 72(sp)
8000aaa4: 32 85        	add	a0, zero, a2
8000aaa6: 97 00 00 00  	auipc	ra, 0
8000aaaa: e7 80 20 47  	jalr	1138(ra)
8000aaae: aa 85        	add	a1, zero, a0
8000aab0: 2a fa        	sd	a0, 304(sp)
8000aab2: ae e0        	sd	a1, 64(sp)
8000aab4: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0xec>
8000aab6: ea 65        	ld	a1, 152(sp)
8000aab8: 0a 65        	ld	a0, 128(sp)
8000aaba: 97 00 00 00  	auipc	ra, 0
8000aabe: e7 80 e0 45  	jalr	1118(ra)
8000aac2: aa 85        	add	a1, zero, a0
8000aac4: 2a fe        	sd	a0, 312(sp)
8000aac6: 2e fc        	sd	a1, 56(sp)
8000aac8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x100>
8000aaca: 06 65        	ld	a0, 64(sp)
8000aacc: a6 65        	ld	a1, 72(sp)
8000aace: 66 66        	ld	a2, 88(sp)
8000aad0: 97 10 00 00  	auipc	ra, 1
8000aad4: e7 80 a0 a3  	jalr	-1478(ra)
8000aad8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x110>
8000aada: 62 75        	ld	a0, 56(sp)
8000aadc: 86 65        	ld	a1, 64(sp)
8000aade: 66 66        	ld	a2, 88(sp)
8000aae0: 97 10 00 00  	auipc	ra, 1
8000aae4: e7 80 a0 a2  	jalr	-1494(ra)
8000aae8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x120>
8000aaea: 26 65        	ld	a0, 72(sp)
8000aaec: e2 75        	ld	a1, 56(sp)
8000aaee: 66 66        	ld	a2, 88(sp)
8000aaf0: 97 10 00 00  	auipc	ra, 1
8000aaf4: e7 80 a0 a1  	jalr	-1510(ra)
8000aaf8: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x130>
8000aafa: 09 a0        	j	2 <_ZN4core3ptr25swap_nonoverlapping_bytes17h4ecd117fbbb41a89E+0x132>
8000aafc: 13 01 04 ea  	addi	sp, s0, -352
8000ab00: 56 64        	ld	s0, 336(sp)
8000ab02: f6 60        	ld	ra, 344(sp)
8000ab04: 35 61        	addi	sp, sp, 352
8000ab06: 82 80        	ret

Disassembly of section .text._ZN4core3ptr4read17h359454c3d4ff4923E:

000000008000ab08 <_ZN4core3ptr4read17h359454c3d4ff4923E>:
8000ab08: 5d 71        	addi	sp, sp, -80
8000ab0a: 86 e4        	sd	ra, 72(sp)
8000ab0c: 2a f0        	sd	a0, 32(sp)
8000ab0e: a2 75        	ld	a1, 40(sp)
8000ab10: 2e ec        	sd	a1, 24(sp)
8000ab12: 2a e8        	sd	a0, 16(sp)
8000ab14: 09 a0        	j	2 <_ZN4core3ptr4read17h359454c3d4ff4923E+0xe>
8000ab16: 28 08        	addi	a0, sp, 24
8000ab18: aa e0        	sd	a0, 64(sp)
8000ab1a: 09 a0        	j	2 <_ZN4core3ptr4read17h359454c3d4ff4923E+0x14>
8000ab1c: 2c 08        	addi	a1, sp, 24
8000ab1e: 05 46        	addi	a2, zero, 1
8000ab20: 42 65        	ld	a0, 16(sp)
8000ab22: 97 10 00 00  	auipc	ra, 1
8000ab26: e7 80 60 9c  	jalr	-1594(ra)
8000ab2a: 09 a0        	j	2 <_ZN4core3ptr4read17h359454c3d4ff4923E+0x24>
8000ab2c: 62 65        	ld	a0, 24(sp)
8000ab2e: 2a f8        	sd	a0, 48(sp)
8000ab30: 2a fc        	sd	a0, 56(sp)
8000ab32: 2a e4        	sd	a0, 8(sp)
8000ab34: 09 a0        	j	2 <_ZN4core3ptr4read17h359454c3d4ff4923E+0x2e>
8000ab36: 22 65        	ld	a0, 8(sp)
8000ab38: a6 60        	ld	ra, 72(sp)
8000ab3a: 61 61        	addi	sp, sp, 80
8000ab3c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17h991edaa6d014770bE:

000000008000ab3e <_ZN4core3ptr5write17h991edaa6d014770bE>:
8000ab3e: 01 11        	addi	sp, sp, -32
8000ab40: 2e e4        	sd	a1, 8(sp)
8000ab42: 32 e8        	sd	a2, 16(sp)
8000ab44: 2a ec        	sd	a0, 24(sp)
8000ab46: 10 e5        	sd	a2, 8(a0)
8000ab48: 0c e1        	sd	a1, 0(a0)
8000ab4a: 09 a0        	j	2 <_ZN4core3ptr5write17h991edaa6d014770bE+0xe>
8000ab4c: 05 61        	addi	sp, sp, 32
8000ab4e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17hb0f5853e4dac0bb8E:

000000008000ab50 <_ZN4core3ptr5write17hb0f5853e4dac0bb8E>:
8000ab50: 01 11        	addi	sp, sp, -32
8000ab52: 2e e4        	sd	a1, 8(sp)
8000ab54: 32 e8        	sd	a2, 16(sp)
8000ab56: 2a ec        	sd	a0, 24(sp)
8000ab58: 10 e5        	sd	a2, 8(a0)
8000ab5a: 0c e1        	sd	a1, 0(a0)
8000ab5c: 09 a0        	j	2 <_ZN4core3ptr5write17hb0f5853e4dac0bb8E+0xe>
8000ab5e: 05 61        	addi	sp, sp, 32
8000ab60: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17hd04c510589debc4dE:

000000008000ab62 <_ZN4core3ptr5write17hd04c510589debc4dE>:
8000ab62: 41 11        	addi	sp, sp, -16
8000ab64: 2e e0        	sd	a1, 0(sp)
8000ab66: 2a e4        	sd	a0, 8(sp)
8000ab68: 0c e1        	sd	a1, 0(a0)
8000ab6a: 09 a0        	j	2 <_ZN4core3ptr5write17hd04c510589debc4dE+0xa>
8000ab6c: 41 01        	addi	sp, sp, 16
8000ab6e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr5write17hfd7e83681b651e61E:

000000008000ab70 <_ZN4core3ptr5write17hfd7e83681b651e61E>:
8000ab70: 01 11        	addi	sp, sp, -32
8000ab72: 2e e4        	sd	a1, 8(sp)
8000ab74: 32 e8        	sd	a2, 16(sp)
8000ab76: 2a ec        	sd	a0, 24(sp)
8000ab78: 10 e5        	sd	a2, 8(a0)
8000ab7a: 0c e1        	sd	a1, 0(a0)
8000ab7c: 09 a0        	j	2 <_ZN4core3ptr5write17hfd7e83681b651e61E+0xe>
8000ab7e: 05 61        	addi	sp, sp, 32
8000ab80: 82 80        	ret

Disassembly of section .text._ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E:

000000008000ab82 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E>:
8000ab82: 5d 71        	addi	sp, sp, -80
8000ab84: 86 e4        	sd	ra, 72(sp)
8000ab86: 2a fc        	sd	a0, 56(sp)
8000ab88: 93 05 85 00  	addi	a1, a0, 8
8000ab8c: 2a f0        	sd	a0, 32(sp)
8000ab8e: 97 00 00 00  	auipc	ra, 0
8000ab92: e7 80 20 0b  	jalr	178(ra)
8000ab96: 2a ec        	sd	a0, 24(sp)
8000ab98: 09 a0        	j	2 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x18>
8000ab9a: 01 45        	mv	a0, zero
8000ab9c: e2 65        	ld	a1, 24(sp)
8000ab9e: 63 8a a5 00  	beq	a1, a0, 20 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x30>
8000aba2: 09 a0        	j	2 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x22>
8000aba4: 02 75        	ld	a0, 32(sp)
8000aba6: 97 00 00 00  	auipc	ra, 0
8000abaa: e7 80 40 1b  	jalr	436(ra)
8000abae: 2a e8        	sd	a0, 16(sp)
8000abb0: 21 a0        	j	8 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x36>
8000abb2: 01 45        	mv	a0, zero
8000abb4: 2a f4        	sd	a0, 40(sp)
8000abb6: 05 a8        	j	48 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x64>
8000abb8: 85 45        	addi	a1, zero, 1
8000abba: 42 65        	ld	a0, 16(sp)
8000abbc: 97 00 00 00  	auipc	ra, 0
8000abc0: e7 80 60 16  	jalr	358(ra)
8000abc4: aa 85        	add	a1, zero, a0
8000abc6: aa e0        	sd	a0, 64(sp)
8000abc8: 2e e4        	sd	a1, 8(sp)
8000abca: 09 a0        	j	2 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x4a>
8000abcc: 02 75        	ld	a0, 32(sp)
8000abce: a2 65        	ld	a1, 8(sp)
8000abd0: 97 00 00 00  	auipc	ra, 0
8000abd4: e7 80 60 13  	jalr	310(ra)
8000abd8: 2a e0        	sd	a0, 0(sp)
8000abda: 09 a0        	j	2 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x5a>
8000abdc: 02 65        	ld	a0, 0(sp)
8000abde: 2a f8        	sd	a0, 48(sp)
8000abe0: 85 45        	addi	a1, zero, 1
8000abe2: 2e f4        	sd	a1, 40(sp)
8000abe4: 09 a0        	j	2 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf30d98d3971c07a6E+0x64>
8000abe6: 22 75        	ld	a0, 40(sp)
8000abe8: c2 75        	ld	a1, 48(sp)
8000abea: a6 60        	ld	ra, 72(sp)
8000abec: 61 61        	addi	sp, sp, 80
8000abee: 82 80        	ret

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h2c0befe7d58c76a1E:

000000008000abf0 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h2c0befe7d58c76a1E>:
8000abf0: 41 11        	addi	sp, sp, -16
8000abf2: 2a e0        	sd	a0, 0(sp)
8000abf4: 2e e4        	sd	a1, 8(sp)
8000abf6: 41 01        	addi	sp, sp, 16
8000abf8: 82 80        	ret

Disassembly of section .text._ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E:

000000008000abfa <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E>:
8000abfa: 79 71        	addi	sp, sp, -48
8000abfc: 2a f0        	sd	a0, 32(sp)
8000abfe: 2e f4        	sd	a1, 40(sp)
8000ac00: 10 61        	ld	a2, 0(a0)
8000ac02: 94 61        	ld	a3, 0(a1)
8000ac04: 2e e8        	sd	a1, 16(sp)
8000ac06: 2a e4        	sd	a0, 8(sp)
8000ac08: 63 78 d6 00  	bgeu	a2, a3, 16 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x1e>
8000ac0c: 09 a0        	j	2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x14>
8000ac0e: 13 05 f0 0f  	addi	a0, zero, 255
8000ac12: a3 0f a1 00  	sb	a0, 31(sp)
8000ac16: 0d a0        	j	34 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x3e>
8000ac18: 22 65        	ld	a0, 8(sp)
8000ac1a: 0c 61        	ld	a1, 0(a0)
8000ac1c: 42 66        	ld	a2, 16(sp)
8000ac1e: 14 62        	ld	a3, 0(a2)
8000ac20: 63 97 d5 00  	bne	a1, a3, 14 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x34>
8000ac24: 09 a0        	j	2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x2c>
8000ac26: 01 45        	mv	a0, zero
8000ac28: a3 0f a1 00  	sb	a0, 31(sp)
8000ac2c: 29 a0        	j	10 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x3c>
8000ac2e: 05 45        	addi	a0, zero, 1
8000ac30: a3 0f a1 00  	sb	a0, 31(sp)
8000ac34: 09 a0        	j	2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x3c>
8000ac36: 09 a0        	j	2 <_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h44907412f83a5a86E+0x3e>
8000ac38: 03 05 f1 01  	lb	a0, 31(sp)
8000ac3c: 45 61        	addi	sp, sp, 48
8000ac3e: 82 80        	ret

Disassembly of section .text._ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2lt17hf5970381324bb6caE:

000000008000ac40 <_ZN4core3cmp5impls57_$LT$impl$u20$core..cmp..PartialOrd$u20$for$u20$usize$GT$2lt17hf5970381324bb6caE>:
8000ac40: 41 11        	addi	sp, sp, -16
8000ac42: 2a e0        	sd	a0, 0(sp)
8000ac44: 2e e4        	sd	a1, 8(sp)
8000ac46: 08 61        	ld	a0, 0(a0)
8000ac48: 8c 61        	ld	a1, 0(a1)
8000ac4a: 33 35 b5 00  	sltu	a0, a0, a1
8000ac4e: 41 01        	addi	sp, sp, 16
8000ac50: 82 80        	ret

Disassembly of section .text._ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$13get_unchecked17h7a38f73511edebbaE:

000000008000ac52 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$13get_unchecked17h7a38f73511edebbaE>:
8000ac52: 39 71        	addi	sp, sp, -64
8000ac54: 06 fc        	sd	ra, 56(sp)
8000ac56: 2a f0        	sd	a0, 32(sp)
8000ac58: 2e f4        	sd	a1, 40(sp)
8000ac5a: 32 f8        	sd	a2, 48(sp)
8000ac5c: 2a ec        	sd	a0, 24(sp)
8000ac5e: 2e 85        	add	a0, zero, a1
8000ac60: b2 85        	add	a1, zero, a2
8000ac62: 97 00 00 00  	auipc	ra, 0
8000ac66: e7 80 c0 78  	jalr	1932(ra)
8000ac6a: 2a e8        	sd	a0, 16(sp)
8000ac6c: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$13get_unchecked17h7a38f73511edebbaE+0x1c>
8000ac6e: 42 65        	ld	a0, 16(sp)
8000ac70: e2 65        	ld	a1, 24(sp)
8000ac72: 97 00 00 00  	auipc	ra, 0
8000ac76: e7 80 80 6c  	jalr	1736(ra)
8000ac7a: 2a e4        	sd	a0, 8(sp)
8000ac7c: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$13get_unchecked17h7a38f73511edebbaE+0x2c>
8000ac7e: 22 65        	ld	a0, 8(sp)
8000ac80: e2 70        	ld	ra, 56(sp)
8000ac82: 21 61        	addi	sp, sp, 64
8000ac84: 82 80        	ret

Disassembly of section .text._ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h66375014f2a0f563E:

000000008000ac86 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h66375014f2a0f563E>:
8000ac86: 39 71        	addi	sp, sp, -64
8000ac88: 06 fc        	sd	ra, 56(sp)
8000ac8a: 2a f0        	sd	a0, 32(sp)
8000ac8c: 2e f4        	sd	a1, 40(sp)
8000ac8e: 32 f8        	sd	a2, 48(sp)
8000ac90: 2a ec        	sd	a0, 24(sp)
8000ac92: 2e 85        	add	a0, zero, a1
8000ac94: b2 85        	add	a1, zero, a2
8000ac96: 97 00 00 00  	auipc	ra, 0
8000ac9a: e7 80 60 32  	jalr	806(ra)
8000ac9e: 2a e8        	sd	a0, 16(sp)
8000aca0: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h66375014f2a0f563E+0x1c>
8000aca2: 42 65        	ld	a0, 16(sp)
8000aca4: e2 65        	ld	a1, 24(sp)
8000aca6: 97 00 00 00  	auipc	ra, 0
8000acaa: e7 80 20 27  	jalr	626(ra)
8000acae: 2a e4        	sd	a0, 8(sp)
8000acb0: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h66375014f2a0f563E+0x2c>
8000acb2: 22 65        	ld	a0, 8(sp)
8000acb4: e2 70        	ld	ra, 56(sp)
8000acb6: 21 61        	addi	sp, sp, 64
8000acb8: 82 80        	ret

Disassembly of section .text._ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h6cbee8cba08ffec4E:

000000008000acba <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h6cbee8cba08ffec4E>:
8000acba: 39 71        	addi	sp, sp, -64
8000acbc: 06 fc        	sd	ra, 56(sp)
8000acbe: 2a f0        	sd	a0, 32(sp)
8000acc0: 2e f4        	sd	a1, 40(sp)
8000acc2: 32 f8        	sd	a2, 48(sp)
8000acc4: 2a ec        	sd	a0, 24(sp)
8000acc6: 2e 85        	add	a0, zero, a1
8000acc8: b2 85        	add	a1, zero, a2
8000acca: 97 e0 ff ff  	auipc	ra, 1048574
8000acce: e7 80 a0 7e  	jalr	2026(ra)
8000acd2: 2a e8        	sd	a0, 16(sp)
8000acd4: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h6cbee8cba08ffec4E+0x1c>
8000acd6: 42 65        	ld	a0, 16(sp)
8000acd8: e2 65        	ld	a1, 24(sp)
8000acda: 97 e0 ff ff  	auipc	ra, 1048574
8000acde: e7 80 e0 72  	jalr	1838(ra)
8000ace2: 2a e4        	sd	a0, 8(sp)
8000ace4: 09 a0        	j	2 <_ZN75_$LT$usize$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$17get_unchecked_mut17h6cbee8cba08ffec4E+0x2c>
8000ace6: 22 65        	ld	a0, 8(sp)
8000ace8: e2 70        	ld	ra, 56(sp)
8000acea: 21 61        	addi	sp, sp, 64
8000acec: 82 80        	ret

Disassembly of section .text._ZN4core3mem4swap17h9c385627a051bf80E:

000000008000acee <_ZN4core3mem4swap17h9c385627a051bf80E>:
8000acee: 01 11        	addi	sp, sp, -32
8000acf0: 06 ec        	sd	ra, 24(sp)
8000acf2: 2a e4        	sd	a0, 8(sp)
8000acf4: 2e e8        	sd	a1, 16(sp)
8000acf6: 97 00 00 00  	auipc	ra, 0
8000acfa: e7 80 20 c5  	jalr	-942(ra)
8000acfe: 09 a0        	j	2 <_ZN4core3mem4swap17h9c385627a051bf80E+0x12>
8000ad00: e2 60        	ld	ra, 24(sp)
8000ad02: 05 61        	addi	sp, sp, 32
8000ad04: 82 80        	ret

Disassembly of section .text._ZN4core3mem7replace17hfab5a14b963110ccE:

000000008000ad06 <_ZN4core3mem7replace17hfab5a14b963110ccE>:
8000ad06: 01 11        	addi	sp, sp, -32
8000ad08: 06 ec        	sd	ra, 24(sp)
8000ad0a: 2e e4        	sd	a1, 8(sp)
8000ad0c: 2a e8        	sd	a0, 16(sp)
8000ad0e: 2c 00        	addi	a1, sp, 8
8000ad10: 97 00 00 00  	auipc	ra, 0
8000ad14: e7 80 e0 fd  	jalr	-34(ra)
8000ad18: 09 a0        	j	2 <_ZN4core3mem7replace17hfab5a14b963110ccE+0x14>
8000ad1a: 22 65        	ld	a0, 8(sp)
8000ad1c: e2 60        	ld	ra, 24(sp)
8000ad1e: 05 61        	addi	sp, sp, 32
8000ad20: 82 80        	ret

Disassembly of section .text._ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h361794288f7060d2E:

000000008000ad22 <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h361794288f7060d2E>:
8000ad22: 01 11        	addi	sp, sp, -32
8000ad24: 06 ec        	sd	ra, 24(sp)
8000ad26: 2a e4        	sd	a0, 8(sp)
8000ad28: 2e e8        	sd	a1, 16(sp)
8000ad2a: 97 00 00 00  	auipc	ra, 0
8000ad2e: e7 80 c0 5b  	jalr	1468(ra)
8000ad32: 2a e0        	sd	a0, 0(sp)
8000ad34: 09 a0        	j	2 <_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h361794288f7060d2E+0x14>
8000ad36: 02 65        	ld	a0, 0(sp)
8000ad38: e2 60        	ld	ra, 24(sp)
8000ad3a: 05 61        	addi	sp, sp, 32
8000ad3c: 82 80        	ret

Disassembly of section .text._ZN4core3ops8function6FnOnce9call_once17h7697af0aa8700802E:

000000008000ad3e <_ZN4core3ops8function6FnOnce9call_once17h7697af0aa8700802E>:
8000ad3e: 79 71        	addi	sp, sp, -48
8000ad40: 06 f4        	sd	ra, 40(sp)
8000ad42: 2a e8        	sd	a0, 16(sp)
8000ad44: 2e ec        	sd	a1, 24(sp)
8000ad46: 97 00 00 00  	auipc	ra, 0
8000ad4a: e7 80 40 eb  	jalr	-332(ra)
8000ad4e: 2a e4        	sd	a0, 8(sp)
8000ad50: 09 a0        	j	2 <_ZN4core3ops8function6FnOnce9call_once17h7697af0aa8700802E+0x14>
8000ad52: 22 65        	ld	a0, 8(sp)
8000ad54: a2 70        	ld	ra, 40(sp)
8000ad56: 45 61        	addi	sp, sp, 48
8000ad58: 82 80        	ret

Disassembly of section .text._ZN4core5clone5impls54_$LT$impl$u20$core..clone..Clone$u20$for$u20$usize$GT$5clone17h24bdf43e5c8ac6f8E:

000000008000ad5a <_ZN4core5clone5impls54_$LT$impl$u20$core..clone..Clone$u20$for$u20$usize$GT$5clone17h24bdf43e5c8ac6f8E>:
8000ad5a: 41 11        	addi	sp, sp, -16
8000ad5c: 2a e4        	sd	a0, 8(sp)
8000ad5e: 08 61        	ld	a0, 0(a0)
8000ad60: 41 01        	addi	sp, sp, 16
8000ad62: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17h40158d75cc55c3acE:

000000008000ad64 <_ZN4core6option15Option$LT$T$GT$6unwrap17h40158d75cc55c3acE>:
8000ad64: 01 11        	addi	sp, sp, -32
8000ad66: 2a e8        	sd	a0, 16(sp)
8000ad68: 33 36 a0 00  	snez	a2, a0
8000ad6c: 81 46        	mv	a3, zero
8000ad6e: 2e e4        	sd	a1, 8(sp)
8000ad70: 63 04 d5 00  	beq	a0, a3, 8 <.LBB6_5>
8000ad74: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17h40158d75cc55c3acE+0x12>
8000ad76: 31 a8        	j	28 <.LBB6_5+0x1a>

000000008000ad78 <.LBB6_5>:
8000ad78: 17 55 00 00  	auipc	a0, 5
8000ad7c: 13 05 05 34  	addi	a0, a0, 832
8000ad80: 93 05 b0 02  	addi	a1, zero, 43
8000ad84: 22 66        	ld	a2, 8(sp)
8000ad86: 97 10 00 00  	auipc	ra, 1
8000ad8a: e7 80 40 9b  	jalr	-1612(ra)
8000ad8e: 00 00        	unimp	
8000ad90: 00 00        	unimp	
8000ad92: 42 65        	ld	a0, 16(sp)
8000ad94: 2a ec        	sd	a0, 24(sp)
8000ad96: 05 61        	addi	sp, sp, 32
8000ad98: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hb2d1768a9c1ba1e4E:

000000008000ad9a <_ZN4core6option15Option$LT$T$GT$6unwrap17hb2d1768a9c1ba1e4E>:
8000ad9a: 01 11        	addi	sp, sp, -32
8000ad9c: 2a e8        	sd	a0, 16(sp)
8000ad9e: 33 36 a0 00  	snez	a2, a0
8000ada2: 81 46        	mv	a3, zero
8000ada4: 2e e4        	sd	a1, 8(sp)
8000ada6: 63 04 d5 00  	beq	a0, a3, 8 <.LBB7_5>
8000adaa: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17hb2d1768a9c1ba1e4E+0x12>
8000adac: 31 a8        	j	28 <.LBB7_5+0x1a>

000000008000adae <.LBB7_5>:
8000adae: 17 55 00 00  	auipc	a0, 5
8000adb2: 13 05 a5 30  	addi	a0, a0, 778
8000adb6: 93 05 b0 02  	addi	a1, zero, 43
8000adba: 22 66        	ld	a2, 8(sp)
8000adbc: 97 10 00 00  	auipc	ra, 1
8000adc0: e7 80 e0 97  	jalr	-1666(ra)
8000adc4: 00 00        	unimp	
8000adc6: 00 00        	unimp	
8000adc8: 42 65        	ld	a0, 16(sp)
8000adca: 2a ec        	sd	a0, 24(sp)
8000adcc: 05 61        	addi	sp, sp, 32
8000adce: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hb81a1b8b573dc670E:

000000008000add0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hb81a1b8b573dc670E>:
8000add0: 01 11        	addi	sp, sp, -32
8000add2: 2a e8        	sd	a0, 16(sp)
8000add4: 33 36 a0 00  	snez	a2, a0
8000add8: 81 46        	mv	a3, zero
8000adda: 2e e4        	sd	a1, 8(sp)
8000addc: 63 04 d5 00  	beq	a0, a3, 8 <.LBB8_5>
8000ade0: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17hb81a1b8b573dc670E+0x12>
8000ade2: 31 a8        	j	28 <.LBB8_5+0x1a>

000000008000ade4 <.LBB8_5>:
8000ade4: 17 55 00 00  	auipc	a0, 5
8000ade8: 13 05 45 2d  	addi	a0, a0, 724
8000adec: 93 05 b0 02  	addi	a1, zero, 43
8000adf0: 22 66        	ld	a2, 8(sp)
8000adf2: 97 10 00 00  	auipc	ra, 1
8000adf6: e7 80 80 94  	jalr	-1720(ra)
8000adfa: 00 00        	unimp	
8000adfc: 00 00        	unimp	
8000adfe: 42 65        	ld	a0, 16(sp)
8000ae00: 2a ec        	sd	a0, 24(sp)
8000ae02: 05 61        	addi	sp, sp, 32
8000ae04: 82 80        	ret

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hfb4229c1dd4af600E:

000000008000ae06 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfb4229c1dd4af600E>:
8000ae06: 01 11        	addi	sp, sp, -32
8000ae08: 2a e8        	sd	a0, 16(sp)
8000ae0a: 33 36 a0 00  	snez	a2, a0
8000ae0e: 81 46        	mv	a3, zero
8000ae10: 2e e4        	sd	a1, 8(sp)
8000ae12: 63 04 d5 00  	beq	a0, a3, 8 <.LBB9_5>
8000ae16: 09 a0        	j	2 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfb4229c1dd4af600E+0x12>
8000ae18: 31 a8        	j	28 <.LBB9_5+0x1a>

000000008000ae1a <.LBB9_5>:
8000ae1a: 17 55 00 00  	auipc	a0, 5
8000ae1e: 13 05 e5 29  	addi	a0, a0, 670
8000ae22: 93 05 b0 02  	addi	a1, zero, 43
8000ae26: 22 66        	ld	a2, 8(sp)
8000ae28: 97 10 00 00  	auipc	ra, 1
8000ae2c: e7 80 20 91  	jalr	-1774(ra)
8000ae30: 00 00        	unimp	
8000ae32: 00 00        	unimp	
8000ae34: 42 65        	ld	a0, 16(sp)
8000ae36: 2a ec        	sd	a0, 24(sp)
8000ae38: 05 61        	addi	sp, sp, 32
8000ae3a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE:

000000008000ae3c <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE>:
8000ae3c: 79 71        	addi	sp, sp, -48
8000ae3e: 06 f4        	sd	ra, 40(sp)
8000ae40: 2a f0        	sd	a0, 32(sp)
8000ae42: 2a e8        	sd	a0, 16(sp)
8000ae44: 97 00 00 00  	auipc	ra, 0
8000ae48: e7 80 a0 02  	jalr	42(ra)
8000ae4c: 2a e4        	sd	a0, 8(sp)
8000ae4e: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE+0x14>
8000ae50: 01 45        	mv	a0, zero
8000ae52: a2 65        	ld	a1, 8(sp)
8000ae54: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE+0x24>
8000ae58: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE+0x1e>
8000ae5a: 01 45        	mv	a0, zero
8000ae5c: 2a ec        	sd	a0, 24(sp)
8000ae5e: 21 a0        	j	8 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE+0x2a>
8000ae60: 42 65        	ld	a0, 16(sp)
8000ae62: 2a ec        	sd	a0, 24(sp)
8000ae64: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h531eef97abe04bbfE+0x2a>
8000ae66: 62 65        	ld	a0, 24(sp)
8000ae68: a2 70        	ld	ra, 40(sp)
8000ae6a: 45 61        	addi	sp, sp, 48
8000ae6c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hd21e4d40d02ad2f9E:

000000008000ae6e <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hd21e4d40d02ad2f9E>:
8000ae6e: 79 71        	addi	sp, sp, -48
8000ae70: 06 f4        	sd	ra, 40(sp)
8000ae72: 2a f0        	sd	a0, 32(sp)
8000ae74: 2a ec        	sd	a0, 24(sp)
8000ae76: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hd21e4d40d02ad2f9E+0xa>
8000ae78: 01 45        	mv	a0, zero
8000ae7a: e2 65        	ld	a1, 24(sp)
8000ae7c: 2a e8        	sd	a0, 16(sp)
8000ae7e: 2e 85        	add	a0, zero, a1
8000ae80: c2 65        	ld	a1, 16(sp)
8000ae82: 97 00 00 00  	auipc	ra, 0
8000ae86: e7 80 c0 07  	jalr	124(ra)
8000ae8a: 2a e4        	sd	a0, 8(sp)
8000ae8c: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hd21e4d40d02ad2f9E+0x20>
8000ae8e: 22 65        	ld	a0, 8(sp)
8000ae90: a2 70        	ld	ra, 40(sp)
8000ae92: 45 61        	addi	sp, sp, 48
8000ae94: 82 80        	ret

Disassembly of section .text._ZN9allocator4list4List4init17h66cc5cea63689cccE:

000000008000ae96 <_ZN9allocator4list4List4init17h66cc5cea63689cccE>:
8000ae96: 41 11        	addi	sp, sp, -16
8000ae98: 2a e4        	sd	a0, 8(sp)
8000ae9a: 08 e1        	sd	a0, 0(a0)
8000ae9c: 08 e5        	sd	a0, 8(a0)
8000ae9e: 41 01        	addi	sp, sp, 16
8000aea0: 82 80        	ret

Disassembly of section .text._ZN9allocator4list4List4push17h9f182e5708992305E:

000000008000aea2 <_ZN9allocator4list4List4push17h9f182e5708992305E>:
8000aea2: 5d 71        	addi	sp, sp, -80
8000aea4: 86 e4        	sd	ra, 72(sp)
8000aea6: 2a f8        	sd	a0, 48(sp)
8000aea8: 2e fc        	sd	a1, 56(sp)
8000aeaa: 2e 86        	add	a2, zero, a1
8000aeac: ae e0        	sd	a1, 64(sp)
8000aeae: 14 65        	ld	a3, 8(a0)
8000aeb0: 2a f0        	sd	a0, 32(sp)
8000aeb2: 36 f4        	sd	a3, 40(sp)
8000aeb4: 2a ec        	sd	a0, 24(sp)
8000aeb6: 2e 85        	add	a0, zero, a1
8000aeb8: e2 65        	ld	a1, 24(sp)
8000aeba: 32 e8        	sd	a2, 16(sp)
8000aebc: 36 86        	add	a2, zero, a3
8000aebe: 97 00 00 00  	auipc	ra, 0
8000aec2: e7 80 00 c8  	jalr	-896(ra)
8000aec6: 09 a0        	j	2 <_ZN9allocator4list4List4push17h9f182e5708992305E+0x26>
8000aec8: 62 65        	ld	a0, 24(sp)
8000aeca: 08 65        	ld	a0, 8(a0)
8000aecc: 97 00 00 00  	auipc	ra, 0
8000aed0: e7 80 00 f7  	jalr	-144(ra)
8000aed4: 2a e4        	sd	a0, 8(sp)
8000aed6: 09 a0        	j	2 <.LBB3_4>

000000008000aed8 <.LBB3_4>:
8000aed8: 97 55 00 00  	auipc	a1, 5
8000aedc: 93 85 05 26  	addi	a1, a1, 608
8000aee0: 22 65        	ld	a0, 8(sp)
8000aee2: 97 00 00 00  	auipc	ra, 0
8000aee6: e7 80 20 e8  	jalr	-382(ra)
8000aeea: 2a e0        	sd	a0, 0(sp)
8000aeec: 09 a0        	j	2 <.LBB3_4+0x16>
8000aeee: 42 65        	ld	a0, 16(sp)
8000aef0: 82 65        	ld	a1, 0(sp)
8000aef2: 88 e1        	sd	a0, 0(a1)
8000aef4: 62 66        	ld	a2, 24(sp)
8000aef6: 08 e6        	sd	a0, 8(a2)
8000aef8: a6 60        	ld	ra, 72(sp)
8000aefa: 61 61        	addi	sp, sp, 80
8000aefc: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h70725e9c55995a7cE:

000000008000aefe <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h70725e9c55995a7cE>:
8000aefe: 01 11        	addi	sp, sp, -32
8000af00: 2a e4        	sd	a0, 8(sp)
8000af02: 2e e8        	sd	a1, 16(sp)
8000af04: 2d 8d        	xor	a0, a0, a1
8000af06: 13 35 15 00  	seqz	a0, a0
8000af0a: a3 0f a1 00  	sb	a0, 31(sp)
8000af0e: 2a e0        	sd	a0, 0(sp)
8000af10: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h70725e9c55995a7cE+0x14>
8000af12: 02 65        	ld	a0, 0(sp)
8000af14: 05 61        	addi	sp, sp, 32
8000af16: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h7d7277fde5a86f62E:

000000008000af18 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h7d7277fde5a86f62E>:
8000af18: 01 11        	addi	sp, sp, -32
8000af1a: 06 ec        	sd	ra, 24(sp)
8000af1c: 2a e4        	sd	a0, 8(sp)
8000af1e: 2e e8        	sd	a1, 16(sp)
8000af20: 97 00 00 00  	auipc	ra, 0
8000af24: e7 80 00 06  	jalr	96(ra)
8000af28: 2a e0        	sd	a0, 0(sp)
8000af2a: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h7d7277fde5a86f62E+0x14>
8000af2c: 02 65        	ld	a0, 0(sp)
8000af2e: e2 60        	ld	ra, 24(sp)
8000af30: 05 61        	addi	sp, sp, 32
8000af32: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h615ca6eeaa211f33E:

000000008000af34 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h615ca6eeaa211f33E>:
8000af34: 01 11        	addi	sp, sp, -32
8000af36: 06 ec        	sd	ra, 24(sp)
8000af38: 2a e0        	sd	a0, 0(sp)
8000af3a: 2e e4        	sd	a1, 8(sp)
8000af3c: 32 e8        	sd	a2, 16(sp)
8000af3e: 97 00 00 00  	auipc	ra, 0
8000af42: e7 80 20 c1  	jalr	-1006(ra)
8000af46: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$5write17h615ca6eeaa211f33E+0x14>
8000af48: e2 60        	ld	ra, 24(sp)
8000af4a: 05 61        	addi	sp, sp, 32
8000af4c: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE:

000000008000af4e <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE>:
8000af4e: 79 71        	addi	sp, sp, -48
8000af50: 06 f4        	sd	ra, 40(sp)
8000af52: 2a f0        	sd	a0, 32(sp)
8000af54: 2a e8        	sd	a0, 16(sp)
8000af56: 97 00 00 00  	auipc	ra, 0
8000af5a: e7 80 e0 03  	jalr	62(ra)
8000af5e: 2a e4        	sd	a0, 8(sp)
8000af60: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE+0x14>
8000af62: 01 45        	mv	a0, zero
8000af64: a2 65        	ld	a1, 8(sp)
8000af66: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE+0x24>
8000af6a: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE+0x1e>
8000af6c: 01 45        	mv	a0, zero
8000af6e: 2a ec        	sd	a0, 24(sp)
8000af70: 21 a0        	j	8 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE+0x2a>
8000af72: 42 65        	ld	a0, 16(sp)
8000af74: 2a ec        	sd	a0, 24(sp)
8000af76: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6as_mut17h0c720b2767734cbdE+0x2a>
8000af78: 62 65        	ld	a0, 24(sp)
8000af7a: a2 70        	ld	ra, 40(sp)
8000af7c: 45 61        	addi	sp, sp, 48
8000af7e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hbba9e6930440a7f4E:

000000008000af80 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hbba9e6930440a7f4E>:
8000af80: 01 11        	addi	sp, sp, -32
8000af82: 2a e4        	sd	a0, 8(sp)
8000af84: 2e e8        	sd	a1, 16(sp)
8000af86: 2e 95        	add	a0, a0, a1
8000af88: 2a ec        	sd	a0, 24(sp)
8000af8a: 2a e0        	sd	a0, 0(sp)
8000af8c: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hbba9e6930440a7f4E+0xe>
8000af8e: 02 65        	ld	a0, 0(sp)
8000af90: 05 61        	addi	sp, sp, 32
8000af92: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h7081e4a45df724d4E:

000000008000af94 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h7081e4a45df724d4E>:
8000af94: 79 71        	addi	sp, sp, -48
8000af96: 06 f4        	sd	ra, 40(sp)
8000af98: 2a f0        	sd	a0, 32(sp)
8000af9a: 2a ec        	sd	a0, 24(sp)
8000af9c: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h7081e4a45df724d4E+0xa>
8000af9e: 01 45        	mv	a0, zero
8000afa0: e2 65        	ld	a1, 24(sp)
8000afa2: 2a e8        	sd	a0, 16(sp)
8000afa4: 2e 85        	add	a0, zero, a1
8000afa6: c2 65        	ld	a1, 16(sp)
8000afa8: 97 00 00 00  	auipc	ra, 0
8000afac: e7 80 60 f5  	jalr	-170(ra)
8000afb0: 2a e4        	sd	a0, 8(sp)
8000afb2: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h7081e4a45df724d4E+0x20>
8000afb4: 22 65        	ld	a0, 8(sp)
8000afb6: a2 70        	ld	ra, 40(sp)
8000afb8: 45 61        	addi	sp, sp, 48
8000afba: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h7246748fd353dbddE:

000000008000afbc <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$10as_mut_ptr17h7246748fd353dbddE>:
8000afbc: 41 11        	addi	sp, sp, -16
8000afbe: 2a e0        	sd	a0, 0(sp)
8000afc0: 2e e4        	sd	a1, 8(sp)
8000afc2: 41 01        	addi	sp, sp, 16
8000afc4: 82 80        	ret

Disassembly of section .text._ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h627d6ed17b6a8531E:

000000008000afc6 <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h627d6ed17b6a8531E>:
8000afc6: 39 71        	addi	sp, sp, -64
8000afc8: 06 fc        	sd	ra, 56(sp)
8000afca: 2a f0        	sd	a0, 32(sp)
8000afcc: 2e f4        	sd	a1, 40(sp)
8000afce: 32 f8        	sd	a2, 48(sp)
8000afd0: 2a ec        	sd	a0, 24(sp)
8000afd2: 32 85        	add	a0, zero, a2
8000afd4: 62 66        	ld	a2, 24(sp)
8000afd6: 2e e8        	sd	a1, 16(sp)
8000afd8: b2 85        	add	a1, zero, a2
8000afda: 42 66        	ld	a2, 16(sp)
8000afdc: 97 00 00 00  	auipc	ra, 0
8000afe0: e7 80 a0 ca  	jalr	-854(ra)
8000afe4: 2a e4        	sd	a0, 8(sp)
8000afe6: 09 a0        	j	2 <_ZN4core3ptr7mut_ptr41_$LT$impl$u20$$BP$mut$u20$$u5b$T$u5d$$GT$17get_unchecked_mut17h627d6ed17b6a8531E+0x22>
8000afe8: 22 65        	ld	a0, 8(sp)
8000afea: e2 70        	ld	ra, 56(sp)
8000afec: 21 61        	addi	sp, sp, 64
8000afee: 82 80        	ret

Disassembly of section .text._ZN42_$LT$u8$u20$as$u20$bit_field..BitField$GT$7get_bit17h926da3b99f857fd0E:

000000008000aff0 <_ZN42_$LT$u8$u20$as$u20$bit_field..BitField$GT$7get_bit17h926da3b99f857fd0E>:
8000aff0: 79 71        	addi	sp, sp, -48
8000aff2: 2a f0        	sd	a0, 32(sp)
8000aff4: 2e f4        	sd	a1, 40(sp)
8000aff6: 21 46        	addi	a2, zero, 8
8000aff8: 2e ec        	sd	a1, 24(sp)
8000affa: 2a e8        	sd	a0, 16(sp)
8000affc: 63 e2 c5 02  	bltu	a1, a2, 36 <.LBB0_6+0x16>
8000b000: 09 a0        	j	2 <.LBB0_5>

000000008000b002 <.LBB0_5>:
8000b002: 17 55 00 00  	auipc	a0, 5
8000b006: 13 05 e5 14  	addi	a0, a0, 334

000000008000b00a <.LBB0_6>:
8000b00a: 17 56 00 00  	auipc	a2, 5
8000b00e: 13 06 e6 1c  	addi	a2, a2, 462
8000b012: 93 05 80 02  	addi	a1, zero, 40
8000b016: 97 00 00 00  	auipc	ra, 0
8000b01a: e7 80 40 72  	jalr	1828(ra)
8000b01e: 00 00        	unimp	
8000b020: 42 65        	ld	a0, 16(sp)
8000b022: 83 45 05 00  	lbu	a1, 0(a0)
8000b026: 62 66        	ld	a2, 24(sp)
8000b028: 93 76 86 ff  	andi	a3, a2, -8
8000b02c: 13 77 76 00  	andi	a4, a2, 7
8000b030: 85 47        	addi	a5, zero, 1
8000b032: 33 97 e7 00  	sll	a4, a5, a4
8000b036: 81 47        	mv	a5, zero
8000b038: 2e e4        	sd	a1, 8(sp)
8000b03a: 3a e0        	sd	a4, 0(sp)
8000b03c: 63 9b f6 00  	bne	a3, a5, 22 <.LBB0_7>
8000b040: 09 a0        	j	2 <.LBB0_6+0x38>
8000b042: 22 65        	ld	a0, 8(sp)
8000b044: 82 65        	ld	a1, 0(sp)
8000b046: 33 76 b5 00  	and	a2, a0, a1
8000b04a: 33 35 c0 00  	snez	a0, a2
8000b04e: 45 61        	addi	sp, sp, 48
8000b050: 82 80        	ret

000000008000b052 <.LBB0_7>:
8000b052: 17 55 00 00  	auipc	a0, 5
8000b056: 13 05 e5 19  	addi	a0, a0, 414

000000008000b05a <.LBB0_8>:
8000b05a: 17 56 00 00  	auipc	a2, 5
8000b05e: 13 06 e6 17  	addi	a2, a2, 382
8000b062: 93 05 30 02  	addi	a1, zero, 35
8000b066: 97 00 00 00  	auipc	ra, 0
8000b06a: e7 80 40 6d  	jalr	1748(ra)
8000b06e: 00 00        	unimp	

Disassembly of section .text._ZN42_$LT$u8$u20$as$u20$bit_field..BitField$GT$7set_bit17h1550f790f93573e1E:

000000008000b070 <_ZN42_$LT$u8$u20$as$u20$bit_field..BitField$GT$7set_bit17h1550f790f93573e1E>:
8000b070: 39 71        	addi	sp, sp, -64
8000b072: b2 86        	add	a3, zero, a2
8000b074: 2a f4        	sd	a0, 40(sp)
8000b076: 2e f8        	sd	a1, 48(sp)
8000b078: a3 0f c1 02  	sb	a2, 63(sp)
8000b07c: 21 46        	addi	a2, zero, 8
8000b07e: 2e f0        	sd	a1, 32(sp)
8000b080: 2a ec        	sd	a0, 24(sp)
8000b082: 36 e8        	sd	a3, 16(sp)
8000b084: 63 e2 c5 02  	bltu	a1, a2, 36 <.LBB1_11+0x16>
8000b088: 09 a0        	j	2 <.LBB1_10>

000000008000b08a <.LBB1_10>:
8000b08a: 17 55 00 00  	auipc	a0, 5
8000b08e: 13 05 65 0c  	addi	a0, a0, 198

000000008000b092 <.LBB1_11>:
8000b092: 17 56 00 00  	auipc	a2, 5
8000b096: 13 06 66 14  	addi	a2, a2, 326
8000b09a: 93 05 80 02  	addi	a1, zero, 40
8000b09e: 97 00 00 00  	auipc	ra, 0
8000b0a2: e7 80 c0 69  	jalr	1692(ra)
8000b0a6: 00 00        	unimp	
8000b0a8: 01 45        	mv	a0, zero
8000b0aa: c2 65        	ld	a1, 16(sp)
8000b0ac: 63 80 a5 02  	beq	a1, a0, 32 <.LBB1_11+0x3a>
8000b0b0: 09 a0        	j	2 <.LBB1_11+0x20>
8000b0b2: 02 75        	ld	a0, 32(sp)
8000b0b4: 93 75 85 ff  	andi	a1, a0, -8
8000b0b8: 13 76 75 00  	andi	a2, a0, 7
8000b0bc: 85 46        	addi	a3, zero, 1
8000b0be: 33 96 c6 00  	sll	a2, a3, a2
8000b0c2: 81 46        	mv	a3, zero
8000b0c4: 32 e4        	sd	a2, 8(sp)
8000b0c6: 63 95 d5 04  	bne	a1, a3, 74 <.LBB1_12>
8000b0ca: 31 a8        	j	28 <.LBB1_11+0x54>
8000b0cc: 02 75        	ld	a0, 32(sp)
8000b0ce: 93 75 85 ff  	andi	a1, a0, -8
8000b0d2: 13 76 75 00  	andi	a2, a0, 7
8000b0d6: 85 46        	addi	a3, zero, 1
8000b0d8: 33 96 c6 00  	sll	a2, a3, a2
8000b0dc: 81 46        	mv	a3, zero
8000b0de: 32 e0        	sd	a2, 0(sp)
8000b0e0: 63 97 d5 04  	bne	a1, a3, 78 <.LBB1_14>
8000b0e4: 09 a8        	j	18 <.LBB1_11+0x64>
8000b0e6: 62 65        	ld	a0, 24(sp)
8000b0e8: 83 05 05 00  	lb	a1, 0(a0)
8000b0ec: 22 66        	ld	a2, 8(sp)
8000b0ee: d1 8d        	or	a1, a1, a2
8000b0f0: 23 00 b5 00  	sb	a1, 0(a0)
8000b0f4: 19 a8        	j	22 <.LBB1_11+0x78>
8000b0f6: 02 65        	ld	a0, 0(sp)
8000b0f8: 93 45 f5 ff  	not	a1, a0
8000b0fc: 62 66        	ld	a2, 24(sp)
8000b0fe: 83 06 06 00  	lb	a3, 0(a2)
8000b102: f5 8d        	and	a1, a1, a3
8000b104: 23 00 b6 00  	sb	a1, 0(a2)
8000b108: 09 a0        	j	2 <.LBB1_11+0x78>
8000b10a: 62 65        	ld	a0, 24(sp)
8000b10c: 21 61        	addi	sp, sp, 64
8000b10e: 82 80        	ret

000000008000b110 <.LBB1_12>:
8000b110: 17 55 00 00  	auipc	a0, 5
8000b114: 13 05 05 0e  	addi	a0, a0, 224

000000008000b118 <.LBB1_13>:
8000b118: 17 56 00 00  	auipc	a2, 5
8000b11c: 13 06 06 0c  	addi	a2, a2, 192
8000b120: 93 05 30 02  	addi	a1, zero, 35
8000b124: 97 00 00 00  	auipc	ra, 0
8000b128: e7 80 60 61  	jalr	1558(ra)
8000b12c: 00 00        	unimp	

000000008000b12e <.LBB1_14>:
8000b12e: 17 55 00 00  	auipc	a0, 5
8000b132: 13 05 25 0c  	addi	a0, a0, 194

000000008000b136 <.LBB1_15>:
8000b136: 17 56 00 00  	auipc	a2, 5
8000b13a: 13 06 26 0a  	addi	a2, a2, 162
8000b13e: 93 05 30 02  	addi	a1, zero, 35
8000b142: 97 00 00 00  	auipc	ra, 0
8000b146: e7 80 80 5f  	jalr	1528(ra)
8000b14a: 00 00        	unimp	

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5bb26a96c3e0166cE:

000000008000b14c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5bb26a96c3e0166cE>:
8000b14c: 01 11        	addi	sp, sp, -32
8000b14e: 06 ec        	sd	ra, 24(sp)
8000b150: 2a e4        	sd	a0, 8(sp)
8000b152: 2e e8        	sd	a1, 16(sp)
8000b154: 08 61        	ld	a0, 0(a0)
8000b156: 97 00 00 00  	auipc	ra, 0
8000b15a: e7 80 a0 07  	jalr	122(ra)
8000b15e: 2a e0        	sd	a0, 0(sp)
8000b160: 09 a0        	j	2 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5bb26a96c3e0166cE+0x16>
8000b162: 02 65        	ld	a0, 0(sp)
8000b164: e2 60        	ld	ra, 24(sp)
8000b166: 05 61        	addi	sp, sp, 32
8000b168: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h297d725d8124f232E:

000000008000b16a <_ZN4core3fmt10ArgumentV13new17h297d725d8124f232E>:
8000b16a: 5d 71        	addi	sp, sp, -80
8000b16c: 2a f8        	sd	a0, 48(sp)
8000b16e: 2e fc        	sd	a1, 56(sp)
8000b170: ae e0        	sd	a1, 64(sp)
8000b172: 2a ec        	sd	a0, 24(sp)
8000b174: 2e e8        	sd	a1, 16(sp)
8000b176: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h297d725d8124f232E+0xe>
8000b178: 62 65        	ld	a0, 24(sp)
8000b17a: aa e4        	sd	a0, 72(sp)
8000b17c: 2a e4        	sd	a0, 8(sp)
8000b17e: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17h297d725d8124f232E+0x16>
8000b180: 22 65        	ld	a0, 8(sp)
8000b182: 2a f0        	sd	a0, 32(sp)
8000b184: c2 65        	ld	a1, 16(sp)
8000b186: 2e f4        	sd	a1, 40(sp)
8000b188: 61 61        	addi	sp, sp, 80
8000b18a: 82 80        	ret

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17hdb65e4f79bbcbaa9E:

000000008000b18c <_ZN4core3fmt10ArgumentV13new17hdb65e4f79bbcbaa9E>:
8000b18c: 5d 71        	addi	sp, sp, -80
8000b18e: 2a f8        	sd	a0, 48(sp)
8000b190: 2e fc        	sd	a1, 56(sp)
8000b192: ae e0        	sd	a1, 64(sp)
8000b194: 2a ec        	sd	a0, 24(sp)
8000b196: 2e e8        	sd	a1, 16(sp)
8000b198: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17hdb65e4f79bbcbaa9E+0xe>
8000b19a: 62 65        	ld	a0, 24(sp)
8000b19c: aa e4        	sd	a0, 72(sp)
8000b19e: 2a e4        	sd	a0, 8(sp)
8000b1a0: 09 a0        	j	2 <_ZN4core3fmt10ArgumentV13new17hdb65e4f79bbcbaa9E+0x16>
8000b1a2: 22 65        	ld	a0, 8(sp)
8000b1a4: 2a f0        	sd	a0, 32(sp)
8000b1a6: c2 65        	ld	a1, 16(sp)
8000b1a8: 2e f4        	sd	a1, 40(sp)
8000b1aa: 61 61        	addi	sp, sp, 80
8000b1ac: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Arguments6new_v117hb198f2620aa22809E:

000000008000b1ae <_ZN4core3fmt9Arguments6new_v117hb198f2620aa22809E>:
8000b1ae: 79 71        	addi	sp, sp, -48
8000b1b0: 2e e8        	sd	a1, 16(sp)
8000b1b2: 32 ec        	sd	a2, 24(sp)
8000b1b4: 36 f0        	sd	a3, 32(sp)
8000b1b6: 3a f4        	sd	a4, 40(sp)
8000b1b8: 81 47        	mv	a5, zero
8000b1ba: 3e e0        	sd	a5, 0(sp)
8000b1bc: 0c e1        	sd	a1, 0(a0)
8000b1be: 10 e5        	sd	a2, 8(a0)
8000b1c0: 82 65        	ld	a1, 0(sp)
8000b1c2: 22 66        	ld	a2, 8(sp)
8000b1c4: 0c e9        	sd	a1, 16(a0)
8000b1c6: 10 ed        	sd	a2, 24(a0)
8000b1c8: 14 f1        	sd	a3, 32(a0)
8000b1ca: 18 f5        	sd	a4, 40(a0)
8000b1cc: 45 61        	addi	sp, sp, 48
8000b1ce: 82 80        	ret

Disassembly of section .text._ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E:

000000008000b1d0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E>:
8000b1d0: 39 71        	addi	sp, sp, -64
8000b1d2: 06 fc        	sd	ra, 56(sp)
8000b1d4: 2a f4        	sd	a0, 40(sp)
8000b1d6: 2e f8        	sd	a1, 48(sp)
8000b1d8: 2a ec        	sd	a0, 24(sp)
8000b1da: 2e 85        	add	a0, zero, a1
8000b1dc: 2e e8        	sd	a1, 16(sp)
8000b1de: 97 10 00 00  	auipc	ra, 1
8000b1e2: e7 80 00 1c  	jalr	448(ra)
8000b1e6: 2a e4        	sd	a0, 8(sp)
8000b1e8: 09 a0        	j	2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x1a>
8000b1ea: 01 45        	mv	a0, zero
8000b1ec: a2 65        	ld	a1, 8(sp)
8000b1ee: 63 8c a5 00  	beq	a1, a0, 24 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x36>
8000b1f2: 09 a0        	j	2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x24>
8000b1f4: 62 65        	ld	a0, 24(sp)
8000b1f6: c2 65        	ld	a1, 16(sp)
8000b1f8: 97 20 00 00  	auipc	ra, 2
8000b1fc: e7 80 c0 ce  	jalr	-788(ra)
8000b200: a3 03 a1 02  	sb	a0, 39(sp)
8000b204: 01 a8        	j	16 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x44>
8000b206: 42 65        	ld	a0, 16(sp)
8000b208: 97 10 00 00  	auipc	ra, 1
8000b20c: e7 80 00 1a  	jalr	416(ra)
8000b210: 2a e0        	sd	a0, 0(sp)
8000b212: 11 a0        	j	4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x46>
8000b214: 1d a8        	j	54 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x7a>
8000b216: 01 45        	mv	a0, zero
8000b218: 82 65        	ld	a1, 0(sp)
8000b21a: 63 8c a5 00  	beq	a1, a0, 24 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x62>
8000b21e: 09 a0        	j	2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x50>
8000b220: 62 65        	ld	a0, 24(sp)
8000b222: c2 65        	ld	a1, 16(sp)
8000b224: 97 20 00 00  	auipc	ra, 2
8000b228: e7 80 00 d4  	jalr	-704(ra)
8000b22c: a3 03 a1 02  	sb	a0, 39(sp)
8000b230: 11 a8        	j	20 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x74>
8000b232: 62 65        	ld	a0, 24(sp)
8000b234: c2 65        	ld	a1, 16(sp)
8000b236: 97 20 00 00  	auipc	ra, 2
8000b23a: e7 80 a0 03  	jalr	58(ra)
8000b23e: a3 03 a1 02  	sb	a0, 39(sp)
8000b242: 11 a0        	j	4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x76>
8000b244: 11 a0        	j	4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x78>
8000b246: 09 a0        	j	2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x78>
8000b248: 09 a0        	j	2 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1849a411855c7af0E+0x7a>
8000b24a: 03 45 71 02  	lbu	a0, 39(sp)
8000b24e: e2 70        	ld	ra, 56(sp)
8000b250: 21 61        	addi	sp, sp, 64
8000b252: 82 80        	ret

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$10count_ones17h1789b0cd481909dbE:

000000008000b254 <_ZN4core3num23_$LT$impl$u20$usize$GT$10count_ones17h1789b0cd481909dbE>:
8000b254: 01 11        	addi	sp, sp, -32
8000b256: 2a e8        	sd	a0, 16(sp)
8000b258: 93 55 15 00  	srli	a1, a0, 1
8000b25c: 37 56 55 05  	lui	a2, 21845
8000b260: 1b 06 56 55  	addiw	a2, a2, 1365
8000b264: 32 06        	slli	a2, a2, 12
8000b266: 13 06 56 55  	addi	a2, a2, 1365
8000b26a: 32 06        	slli	a2, a2, 12
8000b26c: 13 06 56 55  	addi	a2, a2, 1365
8000b270: 32 06        	slli	a2, a2, 12
8000b272: 13 06 56 55  	addi	a2, a2, 1365
8000b276: f1 8d        	and	a1, a1, a2
8000b278: 0d 8d        	sub	a0, a0, a1
8000b27a: b7 35 33 03  	lui	a1, 13107
8000b27e: 9b 85 35 33  	addiw	a1, a1, 819
8000b282: b2 05        	slli	a1, a1, 12
8000b284: 93 85 35 33  	addi	a1, a1, 819
8000b288: b2 05        	slli	a1, a1, 12
8000b28a: 93 85 35 33  	addi	a1, a1, 819
8000b28e: b2 05        	slli	a1, a1, 12
8000b290: 93 85 35 33  	addi	a1, a1, 819
8000b294: 33 76 b5 00  	and	a2, a0, a1
8000b298: 09 81        	srli	a0, a0, 2
8000b29a: 6d 8d        	and	a0, a0, a1
8000b29c: 32 95        	add	a0, a0, a2
8000b29e: 93 55 45 00  	srli	a1, a0, 4
8000b2a2: 2e 95        	add	a0, a0, a1
8000b2a4: b7 f5 f0 00  	lui	a1, 3855
8000b2a8: 9b 85 15 0f  	addiw	a1, a1, 241
8000b2ac: b2 05        	slli	a1, a1, 12
8000b2ae: 93 85 f5 f0  	addi	a1, a1, -241
8000b2b2: b2 05        	slli	a1, a1, 12
8000b2b4: 93 85 15 0f  	addi	a1, a1, 241
8000b2b8: b2 05        	slli	a1, a1, 12
8000b2ba: 93 85 f5 f0  	addi	a1, a1, -241
8000b2be: 6d 8d        	and	a0, a0, a1
8000b2c0: b7 05 01 01  	lui	a1, 4112
8000b2c4: 9b 85 15 10  	addiw	a1, a1, 257
8000b2c8: c2 05        	slli	a1, a1, 16
8000b2ca: 93 85 15 10  	addi	a1, a1, 257
8000b2ce: c2 05        	slli	a1, a1, 16
8000b2d0: 93 85 15 10  	addi	a1, a1, 257
8000b2d4: 33 05 b5 02  	<unknown>
8000b2d8: 61 91        	srli	a0, a0, 56
8000b2da: 2a ec        	sd	a0, 24(sp)
8000b2dc: 2a e4        	sd	a0, 8(sp)
8000b2de: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$10count_ones17h1789b0cd481909dbE+0x8c>
8000b2e0: 22 65        	ld	a0, 8(sp)
8000b2e2: 05 61        	addi	sp, sp, 32
8000b2e4: 82 80        	ret

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_add17h8e00fe58cddb6dd5E:

000000008000b2e6 <_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_add17h8e00fe58cddb6dd5E>:
8000b2e6: 01 11        	addi	sp, sp, -32
8000b2e8: 2a e4        	sd	a0, 8(sp)
8000b2ea: 2e e8        	sd	a1, 16(sp)
8000b2ec: 2e 95        	add	a0, a0, a1
8000b2ee: 2a ec        	sd	a0, 24(sp)
8000b2f0: 2a e0        	sd	a0, 0(sp)
8000b2f2: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_add17h8e00fe58cddb6dd5E+0xe>
8000b2f4: 02 65        	ld	a0, 0(sp)
8000b2f6: 05 61        	addi	sp, sp, 32
8000b2f8: 82 80        	ret

Disassembly of section .text._ZN4core3num23_$LT$impl$u20$usize$GT$15is_power_of_two17h161dde3c3ced14acE:

000000008000b2fa <_ZN4core3num23_$LT$impl$u20$usize$GT$15is_power_of_two17h161dde3c3ced14acE>:
8000b2fa: 01 11        	addi	sp, sp, -32
8000b2fc: 06 ec        	sd	ra, 24(sp)
8000b2fe: 2a e8        	sd	a0, 16(sp)
8000b300: 97 00 00 00  	auipc	ra, 0
8000b304: e7 80 40 f5  	jalr	-172(ra)
8000b308: 2a e4        	sd	a0, 8(sp)
8000b30a: 09 a0        	j	2 <_ZN4core3num23_$LT$impl$u20$usize$GT$15is_power_of_two17h161dde3c3ced14acE+0x12>
8000b30c: 22 65        	ld	a0, 8(sp)
8000b30e: 93 15 05 02  	slli	a1, a0, 32
8000b312: 81 91        	srli	a1, a1, 32
8000b314: fd 15        	addi	a1, a1, -1
8000b316: 13 b5 15 00  	seqz	a0, a1
8000b31a: e2 60        	ld	ra, 24(sp)
8000b31c: 05 61        	addi	sp, sp, 32
8000b31e: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$13guaranteed_eq17h96bb5591ad72d10cE:

000000008000b320 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$13guaranteed_eq17h96bb5591ad72d10cE>:
8000b320: 01 11        	addi	sp, sp, -32
8000b322: 2a e4        	sd	a0, 8(sp)
8000b324: 2e e8        	sd	a1, 16(sp)
8000b326: 2d 8d        	xor	a0, a0, a1
8000b328: 13 35 15 00  	seqz	a0, a0
8000b32c: a3 0f a1 00  	sb	a0, 31(sp)
8000b330: 2a e0        	sd	a0, 0(sp)
8000b332: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$13guaranteed_eq17h96bb5591ad72d10cE+0x14>
8000b334: 02 65        	ld	a0, 0(sp)
8000b336: 05 61        	addi	sp, sp, 32
8000b338: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$3add17hff4dd2e18e24099dE:

000000008000b33a <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$3add17hff4dd2e18e24099dE>:
8000b33a: 01 11        	addi	sp, sp, -32
8000b33c: 06 ec        	sd	ra, 24(sp)
8000b33e: 2a e4        	sd	a0, 8(sp)
8000b340: 2e e8        	sd	a1, 16(sp)
8000b342: 97 00 00 00  	auipc	ra, 0
8000b346: e7 80 60 04  	jalr	70(ra)
8000b34a: 2a e0        	sd	a0, 0(sp)
8000b34c: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$3add17hff4dd2e18e24099dE+0x14>
8000b34e: 02 65        	ld	a0, 0(sp)
8000b350: e2 60        	ld	ra, 24(sp)
8000b352: 05 61        	addi	sp, sp, 32
8000b354: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE:

000000008000b356 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE>:
8000b356: 79 71        	addi	sp, sp, -48
8000b358: 06 f4        	sd	ra, 40(sp)
8000b35a: 2a f0        	sd	a0, 32(sp)
8000b35c: 2a e8        	sd	a0, 16(sp)
8000b35e: 97 00 00 00  	auipc	ra, 0
8000b362: e7 80 e0 03  	jalr	62(ra)
8000b366: 2a e4        	sd	a0, 8(sp)
8000b368: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE+0x14>
8000b36a: 01 45        	mv	a0, zero
8000b36c: a2 65        	ld	a1, 8(sp)
8000b36e: 63 86 a5 00  	beq	a1, a0, 12 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE+0x24>
8000b372: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE+0x1e>
8000b374: 01 45        	mv	a0, zero
8000b376: 2a ec        	sd	a0, 24(sp)
8000b378: 21 a0        	j	8 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE+0x2a>
8000b37a: 42 65        	ld	a0, 16(sp)
8000b37c: 2a ec        	sd	a0, 24(sp)
8000b37e: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6as_ref17h783239bf12dcb79fE+0x2a>
8000b380: 62 65        	ld	a0, 24(sp)
8000b382: a2 70        	ld	ra, 40(sp)
8000b384: 45 61        	addi	sp, sp, 48
8000b386: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17he7ec2b9af6fb5606E:

000000008000b388 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17he7ec2b9af6fb5606E>:
8000b388: 01 11        	addi	sp, sp, -32
8000b38a: 2a e4        	sd	a0, 8(sp)
8000b38c: 2e e8        	sd	a1, 16(sp)
8000b38e: 2e 95        	add	a0, a0, a1
8000b390: 2a ec        	sd	a0, 24(sp)
8000b392: 2a e0        	sd	a0, 0(sp)
8000b394: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17he7ec2b9af6fb5606E+0xe>
8000b396: 02 65        	ld	a0, 0(sp)
8000b398: 05 61        	addi	sp, sp, 32
8000b39a: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$7is_null17h369596dd44e9abf0E:

000000008000b39c <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$7is_null17h369596dd44e9abf0E>:
8000b39c: 79 71        	addi	sp, sp, -48
8000b39e: 06 f4        	sd	ra, 40(sp)
8000b3a0: 2a f0        	sd	a0, 32(sp)
8000b3a2: 2a ec        	sd	a0, 24(sp)
8000b3a4: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$7is_null17h369596dd44e9abf0E+0xa>
8000b3a6: 01 45        	mv	a0, zero
8000b3a8: e2 65        	ld	a1, 24(sp)
8000b3aa: 2a e8        	sd	a0, 16(sp)
8000b3ac: 2e 85        	add	a0, zero, a1
8000b3ae: c2 65        	ld	a1, 16(sp)
8000b3b0: 97 00 00 00  	auipc	ra, 0
8000b3b4: e7 80 00 f7  	jalr	-144(ra)
8000b3b8: 2a e4        	sd	a0, 8(sp)
8000b3ba: 09 a0        	j	2 <_ZN4core3ptr9const_ptr33_$LT$impl$u20$$BP$const$u20$T$GT$7is_null17h369596dd44e9abf0E+0x20>
8000b3bc: 22 65        	ld	a0, 8(sp)
8000b3be: a2 70        	ld	ra, 40(sp)
8000b3c0: 45 61        	addi	sp, sp, 48
8000b3c2: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr43_$LT$impl$u20$$BP$const$u20$$u5b$T$u5d$$GT$13get_unchecked17he8bba406ba03d49dE:

000000008000b3c4 <_ZN4core3ptr9const_ptr43_$LT$impl$u20$$BP$const$u20$$u5b$T$u5d$$GT$13get_unchecked17he8bba406ba03d49dE>:
8000b3c4: 39 71        	addi	sp, sp, -64
8000b3c6: 06 fc        	sd	ra, 56(sp)
8000b3c8: 2a f0        	sd	a0, 32(sp)
8000b3ca: 2e f4        	sd	a1, 40(sp)
8000b3cc: 32 f8        	sd	a2, 48(sp)
8000b3ce: 2a ec        	sd	a0, 24(sp)
8000b3d0: 32 85        	add	a0, zero, a2
8000b3d2: 62 66        	ld	a2, 24(sp)
8000b3d4: 2e e8        	sd	a1, 16(sp)
8000b3d6: b2 85        	add	a1, zero, a2
8000b3d8: 42 66        	ld	a2, 16(sp)
8000b3da: 97 00 00 00  	auipc	ra, 0
8000b3de: e7 80 80 87  	jalr	-1928(ra)
8000b3e2: 2a e4        	sd	a0, 8(sp)
8000b3e4: 09 a0        	j	2 <_ZN4core3ptr9const_ptr43_$LT$impl$u20$$BP$const$u20$$u5b$T$u5d$$GT$13get_unchecked17he8bba406ba03d49dE+0x22>
8000b3e6: 22 65        	ld	a0, 8(sp)
8000b3e8: e2 70        	ld	ra, 56(sp)
8000b3ea: 21 61        	addi	sp, sp, 64
8000b3ec: 82 80        	ret

Disassembly of section .text._ZN4core3ptr9const_ptr43_$LT$impl$u20$$BP$const$u20$$u5b$T$u5d$$GT$6as_ptr17h2d834f015d1f2504E:

000000008000b3ee <_ZN4core3ptr9const_ptr43_$LT$impl$u20$$BP$const$u20$$u5b$T$u5d$$GT$6as_ptr17h2d834f015d1f2504E>:
8000b3ee: 41 11        	addi	sp, sp, -16
8000b3f0: 2a e0        	sd	a0, 0(sp)
8000b3f2: 2e e4        	sd	a1, 8(sp)
8000b3f4: 41 01        	addi	sp, sp, 16
8000b3f6: 82 80        	ret

Disassembly of section .text._ZN4core3cmp3Ord3max17h964718f8a6998576E:

000000008000b3f8 <_ZN4core3cmp3Ord3max17h964718f8a6998576E>:
8000b3f8: 01 11        	addi	sp, sp, -32
8000b3fa: 06 ec        	sd	ra, 24(sp)
8000b3fc: 2a e4        	sd	a0, 8(sp)
8000b3fe: 2e e8        	sd	a1, 16(sp)
8000b400: 97 00 00 00  	auipc	ra, 0
8000b404: e7 80 00 03  	jalr	48(ra)
8000b408: 2a e0        	sd	a0, 0(sp)
8000b40a: 09 a0        	j	2 <_ZN4core3cmp3Ord3max17h964718f8a6998576E+0x14>
8000b40c: 02 65        	ld	a0, 0(sp)
8000b40e: e2 60        	ld	ra, 24(sp)
8000b410: 05 61        	addi	sp, sp, 32
8000b412: 82 80        	ret

Disassembly of section .text._ZN4core3cmp3max17h46e9197c2c991e44E:

000000008000b414 <_ZN4core3cmp3max17h46e9197c2c991e44E>:
8000b414: 01 11        	addi	sp, sp, -32
8000b416: 06 ec        	sd	ra, 24(sp)
8000b418: 2a e4        	sd	a0, 8(sp)
8000b41a: 2e e8        	sd	a1, 16(sp)
8000b41c: 97 00 00 00  	auipc	ra, 0
8000b420: e7 80 c0 fd  	jalr	-36(ra)
8000b424: 2a e0        	sd	a0, 0(sp)
8000b426: 09 a0        	j	2 <_ZN4core3cmp3max17h46e9197c2c991e44E+0x14>
8000b428: 02 65        	ld	a0, 0(sp)
8000b42a: e2 60        	ld	ra, 24(sp)
8000b42c: 05 61        	addi	sp, sp, 32
8000b42e: 82 80        	ret

Disassembly of section .text._ZN4core3cmp6max_by17hb44a938f4a3802a9E:

000000008000b430 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E>:
8000b430: 5d 71        	addi	sp, sp, -80
8000b432: 86 e4        	sd	ra, 72(sp)
8000b434: 2a e4        	sd	a0, 8(sp)
8000b436: 2e e8        	sd	a1, 16(sp)
8000b438: 05 45        	addi	a0, zero, 1
8000b43a: a3 0f a1 02  	sb	a0, 63(sp)
8000b43e: 23 0f a1 02  	sb	a0, 62(sp)
8000b442: 28 00        	addi	a0, sp, 8
8000b444: 2a f4        	sd	a0, 40(sp)
8000b446: 0c 08        	addi	a1, sp, 16
8000b448: 2e f8        	sd	a1, 48(sp)
8000b44a: 97 00 00 00  	auipc	ra, 0
8000b44e: e7 80 40 8f  	jalr	-1804(ra)
8000b452: a3 03 a1 02  	sb	a0, 39(sp)
8000b456: 09 a0        	j	2 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x28>
8000b458: 03 05 71 02  	lb	a0, 39(sp)
8000b45c: 05 05        	addi	a0, a0, 1
8000b45e: 89 45        	addi	a1, zero, 2
8000b460: 63 6a b5 00  	bltu	a0, a1, 20 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x44>
8000b464: 09 a0        	j	2 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x36>
8000b466: 01 45        	mv	a0, zero
8000b468: a3 0f a1 02  	sb	a0, 63(sp)
8000b46c: 22 65        	ld	a0, 8(sp)
8000b46e: 2a ec        	sd	a0, 24(sp)
8000b470: 01 a8        	j	16 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x50>
8000b472: 00 00        	unimp	
8000b474: 01 45        	mv	a0, zero
8000b476: 23 0f a1 02  	sb	a0, 62(sp)
8000b47a: 42 65        	ld	a0, 16(sp)
8000b47c: 2a ec        	sd	a0, 24(sp)
8000b47e: 09 a0        	j	2 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x50>
8000b480: 03 45 e1 03  	lbu	a0, 62(sp)
8000b484: 05 89        	andi	a0, a0, 1
8000b486: 19 e9        	bnez	a0, 22 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x6c>
8000b488: 09 a0        	j	2 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x5a>
8000b48a: 03 45 f1 03  	lbu	a0, 63(sp)
8000b48e: 05 89        	andi	a0, a0, 1
8000b490: 19 e5        	bnez	a0, 14 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x6e>
8000b492: 09 a0        	j	2 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x64>
8000b494: 62 65        	ld	a0, 24(sp)
8000b496: a6 60        	ld	ra, 72(sp)
8000b498: 61 61        	addi	sp, sp, 80
8000b49a: 82 80        	ret
8000b49c: fd b7        	j	-18 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x5a>
8000b49e: dd bf        	j	-10 <_ZN4core3cmp6max_by17hb44a938f4a3802a9E+0x64>

Disassembly of section .text._ZN4core10intrinsics11write_bytes17h19f1ef0e86df1807E:

000000008000b4a0 <_ZN4core10intrinsics11write_bytes17h19f1ef0e86df1807E>:
8000b4a0: 79 71        	addi	sp, sp, -48
8000b4a2: 06 f4        	sd	ra, 40(sp)
8000b4a4: ae 86        	add	a3, zero, a1
8000b4a6: 2a e8        	sd	a0, 16(sp)
8000b4a8: a3 0f b1 00  	sb	a1, 31(sp)
8000b4ac: 32 f0        	sd	a2, 32(sp)
8000b4ae: 13 07 00 03  	addi	a4, zero, 48
8000b4b2: 33 06 e6 02  	<unknown>
8000b4b6: 36 e4        	sd	a3, 8(sp)
8000b4b8: 97 20 00 00  	auipc	ra, 2
8000b4bc: e7 80 a0 17  	jalr	378(ra)
8000b4c0: 09 a0        	j	2 <_ZN4core10intrinsics11write_bytes17h19f1ef0e86df1807E+0x22>
8000b4c2: a2 70        	ld	ra, 40(sp)
8000b4c4: 45 61        	addi	sp, sp, 48
8000b4c6: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics11write_bytes17hdfca42f273956c81E:

000000008000b4c8 <_ZN4core10intrinsics11write_bytes17hdfca42f273956c81E>:
8000b4c8: 79 71        	addi	sp, sp, -48
8000b4ca: 06 f4        	sd	ra, 40(sp)
8000b4cc: ae 86        	add	a3, zero, a1
8000b4ce: 2a e8        	sd	a0, 16(sp)
8000b4d0: a3 0f b1 00  	sb	a1, 31(sp)
8000b4d4: 32 f0        	sd	a2, 32(sp)
8000b4d6: 36 e4        	sd	a3, 8(sp)
8000b4d8: 97 20 00 00  	auipc	ra, 2
8000b4dc: e7 80 a0 15  	jalr	346(ra)
8000b4e0: 09 a0        	j	2 <_ZN4core10intrinsics11write_bytes17hdfca42f273956c81E+0x1a>
8000b4e2: a2 70        	ld	ra, 40(sp)
8000b4e4: 45 61        	addi	sp, sp, 48
8000b4e6: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics19copy_nonoverlapping17h7aff39008edc4e19E:

000000008000b4e8 <_ZN4core10intrinsics19copy_nonoverlapping17h7aff39008edc4e19E>:
8000b4e8: 79 71        	addi	sp, sp, -48
8000b4ea: 06 f4        	sd	ra, 40(sp)
8000b4ec: 2a e8        	sd	a0, 16(sp)
8000b4ee: 2e ec        	sd	a1, 24(sp)
8000b4f0: 32 f0        	sd	a2, 32(sp)
8000b4f2: 0e 06        	slli	a2, a2, 3
8000b4f4: 2a e4        	sd	a0, 8(sp)
8000b4f6: 2e 85        	add	a0, zero, a1
8000b4f8: a2 65        	ld	a1, 8(sp)
8000b4fa: 97 20 00 00  	auipc	ra, 2
8000b4fe: e7 80 20 12  	jalr	290(ra)
8000b502: 09 a0        	j	2 <_ZN4core10intrinsics19copy_nonoverlapping17h7aff39008edc4e19E+0x1c>
8000b504: a2 70        	ld	ra, 40(sp)
8000b506: 45 61        	addi	sp, sp, 48
8000b508: 82 80        	ret

Disassembly of section .text._ZN4core10intrinsics19copy_nonoverlapping17he555f975dd236a79E:

000000008000b50a <_ZN4core10intrinsics19copy_nonoverlapping17he555f975dd236a79E>:
8000b50a: 79 71        	addi	sp, sp, -48
8000b50c: 06 f4        	sd	ra, 40(sp)
8000b50e: 2a e8        	sd	a0, 16(sp)
8000b510: 2e ec        	sd	a1, 24(sp)
8000b512: 32 f0        	sd	a2, 32(sp)
8000b514: 2a e4        	sd	a0, 8(sp)
8000b516: 2e 85        	add	a0, zero, a1
8000b518: a2 65        	ld	a1, 8(sp)
8000b51a: 97 20 00 00  	auipc	ra, 2
8000b51e: e7 80 20 10  	jalr	258(ra)
8000b522: 09 a0        	j	2 <_ZN4core10intrinsics19copy_nonoverlapping17he555f975dd236a79E+0x1a>
8000b524: a2 70        	ld	ra, 40(sp)
8000b526: 45 61        	addi	sp, sp, 48
8000b528: 82 80        	ret

Disassembly of section .text._ZN4core4cell19UnsafeCell$LT$T$GT$3get17h95cfec27c73dbf25E:

000000008000b52a <_ZN4core4cell19UnsafeCell$LT$T$GT$3get17h95cfec27c73dbf25E>:
8000b52a: 41 11        	addi	sp, sp, -16
8000b52c: 2a e4        	sd	a0, 8(sp)
8000b52e: 41 01        	addi	sp, sp, 16
8000b530: 82 80        	ret

Disassembly of section .text._ZN4core3ops8function6FnOnce9call_once17hbe6f1b732a2946a4E:

000000008000b532 <_ZN4core3ops8function6FnOnce9call_once17hbe6f1b732a2946a4E>:
8000b532: 08 61        	ld	a0, 0(a0)
8000b534: 01 a0        	j	0 <_ZN4core3ops8function6FnOnce9call_once17hbe6f1b732a2946a4E+0x2>

Disassembly of section .text._ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h2c14ec9a62b1a876E:

000000008000b536 <_ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h2c14ec9a62b1a876E>:
8000b536: 82 80        	ret

Disassembly of section .text._ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0c19ef341f8f601cE:

000000008000b538 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0c19ef341f8f601cE>:
8000b538: 5d 71        	addi	sp, sp, -80
8000b53a: 86 e4        	sd	ra, 72(sp)
8000b53c: a2 e0        	sd	s0, 64(sp)
8000b53e: 26 fc        	sd	s1, 56(sp)
8000b540: 2e 84        	add	s0, zero, a1
8000b542: aa 84        	add	s1, zero, a0
8000b544: 97 20 00 00  	auipc	ra, 2
8000b548: e7 80 00 aa  	jalr	-1376(ra)
8000b54c: 1d e5        	bnez	a0, 46 <.LBB76_5+0x18>
8000b54e: 08 70        	ld	a0, 32(s0)
8000b550: 0c 74        	ld	a1, 40(s0)

000000008000b552 <.LBB76_4>:
8000b552: 17 56 00 00  	auipc	a2, 5
8000b556: 13 06 e6 cc  	addi	a2, a2, -818
8000b55a: 32 e4        	sd	a2, 8(sp)
8000b55c: 05 46        	addi	a2, zero, 1
8000b55e: 32 e8        	sd	a2, 16(sp)
8000b560: 02 ec        	sd	zero, 24(sp)

000000008000b562 <.LBB76_5>:
8000b562: 17 56 00 00  	auipc	a2, 5
8000b566: 13 06 66 cb  	addi	a2, a2, -842
8000b56a: 32 f4        	sd	a2, 40(sp)
8000b56c: 02 f8        	sd	zero, 48(sp)
8000b56e: 30 00        	addi	a2, sp, 8
8000b570: 97 00 00 00  	auipc	ra, 0
8000b574: e7 80 00 74  	jalr	1856(ra)
8000b578: 19 c5        	beqz	a0, 14 <.LBB76_5+0x24>
8000b57a: 05 45        	addi	a0, zero, 1
8000b57c: e2 74        	ld	s1, 56(sp)
8000b57e: 06 64        	ld	s0, 64(sp)
8000b580: a6 60        	ld	ra, 72(sp)
8000b582: 61 61        	addi	sp, sp, 80
8000b584: 82 80        	ret
8000b586: 13 85 84 00  	addi	a0, s1, 8
8000b58a: a2 85        	add	a1, zero, s0
8000b58c: e2 74        	ld	s1, 56(sp)
8000b58e: 06 64        	ld	s0, 64(sp)
8000b590: a6 60        	ld	ra, 72(sp)
8000b592: 61 61        	addi	sp, sp, 80
8000b594: 17 23 00 00  	auipc	t1, 2
8000b598: 67 00 03 a5  	jr	-1456(t1)

Disassembly of section .text._ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7108e12ad9db6507E:

000000008000b59c <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7108e12ad9db6507E>:
8000b59c: 37 f5 60 01  	lui	a0, 5647
8000b5a0: 1b 05 75 62  	addiw	a0, a0, 1575
8000b5a4: 36 05        	slli	a0, a0, 13
8000b5a6: 13 05 75 3d  	addi	a0, a0, 983
8000b5aa: 32 05        	slli	a0, a0, 12
8000b5ac: 13 05 15 f8  	addi	a0, a0, -127
8000b5b0: 32 05        	slli	a0, a0, 12
8000b5b2: 13 05 25 f4  	addi	a0, a0, -190
8000b5b6: 82 80        	ret

Disassembly of section .text._ZN4core6option13expect_failed17h7584820e4d909684E:

000000008000b5b8 <_ZN4core6option13expect_failed17h7584820e4d909684E>:
8000b5b8: 1d 71        	addi	sp, sp, -96
8000b5ba: 86 ec        	sd	ra, 88(sp)
8000b5bc: 2a e4        	sd	a0, 8(sp)
8000b5be: 2e e8        	sd	a1, 16(sp)
8000b5c0: 28 00        	addi	a0, sp, 8
8000b5c2: aa e4        	sd	a0, 72(sp)

000000008000b5c4 <.LBB117_1>:
8000b5c4: 17 25 00 00  	auipc	a0, 2
8000b5c8: 13 05 85 e9  	addi	a0, a0, -360
8000b5cc: aa e8        	sd	a0, 80(sp)

000000008000b5ce <.LBB117_2>:
8000b5ce: 17 55 00 00  	auipc	a0, 5
8000b5d2: 13 05 25 c9  	addi	a0, a0, -878
8000b5d6: 2a ec        	sd	a0, 24(sp)
8000b5d8: 05 45        	addi	a0, zero, 1
8000b5da: 2a f0        	sd	a0, 32(sp)
8000b5dc: 02 f4        	sd	zero, 40(sp)
8000b5de: ac 00        	addi	a1, sp, 72
8000b5e0: 2e fc        	sd	a1, 56(sp)
8000b5e2: aa e0        	sd	a0, 64(sp)
8000b5e4: 28 08        	addi	a0, sp, 24
8000b5e6: b2 85        	add	a1, zero, a2
8000b5e8: 97 00 00 00  	auipc	ra, 0
8000b5ec: e7 80 e0 1b  	jalr	446(ra)
8000b5f0: 00 00        	unimp	

Disassembly of section .text._ZN4core6option18expect_none_failed17hf4b8b266798017eaE:

000000008000b5f2 <_ZN4core6result13unwrap_failed17h3a7e57da3fc4cd3aE>:
8000b5f2: 19 71        	addi	sp, sp, -128
8000b5f4: 86 fc        	sd	ra, 120(sp)
8000b5f6: 2a e4        	sd	a0, 8(sp)
8000b5f8: 2e e8        	sd	a1, 16(sp)
8000b5fa: 32 ec        	sd	a2, 24(sp)
8000b5fc: 36 f0        	sd	a3, 32(sp)
8000b5fe: 28 00        	addi	a0, sp, 8
8000b600: aa ec        	sd	a0, 88(sp)

000000008000b602 <.LBB118_1>:
8000b602: 17 25 00 00  	auipc	a0, 2
8000b606: 13 05 a5 e5  	addi	a0, a0, -422
8000b60a: aa f0        	sd	a0, 96(sp)
8000b60c: 28 08        	addi	a0, sp, 24
8000b60e: aa f4        	sd	a0, 104(sp)

000000008000b610 <.LBB118_2>:
8000b610: 17 25 00 00  	auipc	a0, 2
8000b614: 13 05 45 e4  	addi	a0, a0, -444
8000b618: aa f8        	sd	a0, 112(sp)

000000008000b61a <.LBB118_3>:
8000b61a: 17 55 00 00  	auipc	a0, 5
8000b61e: 13 05 e5 c5  	addi	a0, a0, -930
8000b622: 2a f4        	sd	a0, 40(sp)
8000b624: 09 45        	addi	a0, zero, 2
8000b626: 2a f8        	sd	a0, 48(sp)
8000b628: 02 fc        	sd	zero, 56(sp)
8000b62a: ac 08        	addi	a1, sp, 88
8000b62c: ae e4        	sd	a1, 72(sp)
8000b62e: aa e8        	sd	a0, 80(sp)
8000b630: 28 10        	addi	a0, sp, 40
8000b632: ba 85        	add	a1, zero, a4
8000b634: 97 00 00 00  	auipc	ra, 0
8000b638: e7 80 20 17  	jalr	370(ra)
8000b63c: 00 00        	unimp	

Disassembly of section .text._ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hb4d6410e4677a5d3E:

000000008000b63e <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hb4d6410e4677a5d3E>:
8000b63e: 75 71        	addi	sp, sp, -144
8000b640: 06 e5        	sd	ra, 136(sp)
8000b642: 22 e1        	sd	s0, 128(sp)
8000b644: a6 fc        	sd	s1, 120(sp)
8000b646: ca f8        	sd	s2, 112(sp)
8000b648: 2e 84        	add	s0, zero, a1
8000b64a: 8c 75        	ld	a1, 40(a1)
8000b64c: 14 70        	ld	a3, 32(s0)
8000b64e: 98 6d        	ld	a4, 24(a1)
8000b650: 2a 89        	add	s2, zero, a0

000000008000b652 <.LBB122_8>:
8000b652: 97 55 00 00  	auipc	a1, 5
8000b656: 93 85 65 c6  	addi	a1, a1, -922
8000b65a: 31 46        	addi	a2, zero, 12
8000b65c: 36 85        	add	a0, zero, a3
8000b65e: 02 97        	jalr	a4
8000b660: 85 44        	addi	s1, zero, 1
8000b662: 69 e5        	bnez	a0, 202 <.LBB122_14+0x22>
8000b664: 03 35 09 01  	ld	a0, 16(s2)
8000b668: 09 c9        	beqz	a0, 18 <.LBB122_9+0xa>
8000b66a: 2a e4        	sd	a0, 8(sp)
8000b66c: 28 00        	addi	a0, sp, 8
8000b66e: 2a e8        	sd	a0, 16(sp)

000000008000b670 <.LBB122_9>:
8000b670: 17 25 00 00  	auipc	a0, 2
8000b674: 13 05 e5 e0  	addi	a0, a0, -498
8000b678: 35 a8        	j	60 <.LBB122_10+0x8>
8000b67a: 03 35 89 00  	ld	a0, 8(s2)
8000b67e: 83 34 09 00  	ld	s1, 0(s2)
8000b682: 0c 6d        	ld	a1, 24(a0)
8000b684: 26 85        	add	a0, zero, s1
8000b686: 82 95        	jalr	a1
8000b688: b7 f5 7e 00  	lui	a1, 2031
8000b68c: 9b 85 95 2a  	addiw	a1, a1, 681
8000b690: ba 05        	slli	a1, a1, 14
8000b692: 93 85 b5 7b  	addi	a1, a1, 1979
8000b696: b2 05        	slli	a1, a1, 12
8000b698: 93 85 f5 31  	addi	a1, a1, 799
8000b69c: ba 05        	slli	a1, a1, 14
8000b69e: 93 85 45 cf  	addi	a1, a1, -780
8000b6a2: 63 1e b5 02  	bne	a0, a1, 60 <.LBB122_11+0x24>
8000b6a6: 26 e4        	sd	s1, 8(sp)
8000b6a8: 28 00        	addi	a0, sp, 8
8000b6aa: 2a e8        	sd	a0, 16(sp)

000000008000b6ac <.LBB122_10>:
8000b6ac: 17 25 00 00  	auipc	a0, 2
8000b6b0: 13 05 05 dc  	addi	a0, a0, -576
8000b6b4: 2a ec        	sd	a0, 24(sp)
8000b6b6: 08 70        	ld	a0, 32(s0)
8000b6b8: 0c 74        	ld	a1, 40(s0)

000000008000b6ba <.LBB122_11>:
8000b6ba: 17 56 00 00  	auipc	a2, 5
8000b6be: 13 06 e6 c0  	addi	a2, a2, -1010
8000b6c2: b2 e0        	sd	a2, 64(sp)
8000b6c4: 09 46        	addi	a2, zero, 2
8000b6c6: b2 e4        	sd	a2, 72(sp)
8000b6c8: 82 e8        	sd	zero, 80(sp)
8000b6ca: 10 08        	addi	a2, sp, 16
8000b6cc: b2 f0        	sd	a2, 96(sp)
8000b6ce: 85 44        	addi	s1, zero, 1
8000b6d0: a6 f4        	sd	s1, 104(sp)
8000b6d2: 90 00        	addi	a2, sp, 64
8000b6d4: 97 00 00 00  	auipc	ra, 0
8000b6d8: e7 80 c0 5d  	jalr	1500(ra)
8000b6dc: 21 e9        	bnez	a0, 80 <.LBB122_14+0x22>
8000b6de: 03 35 89 01  	ld	a0, 24(s2)
8000b6e2: 93 05 05 01  	addi	a1, a0, 16
8000b6e6: 13 06 45 01  	addi	a2, a0, 20
8000b6ea: 2a e8        	sd	a0, 16(sp)

000000008000b6ec <.LBB122_12>:
8000b6ec: 17 25 00 00  	auipc	a0, 2
8000b6f0: 13 05 05 d7  	addi	a0, a0, -656
8000b6f4: 2a ec        	sd	a0, 24(sp)
8000b6f6: 2e f0        	sd	a1, 32(sp)

000000008000b6f8 <.LBB122_13>:
8000b6f8: 17 25 00 00  	auipc	a0, 2
8000b6fc: 13 05 c5 9b  	addi	a0, a0, -1604
8000b700: 2a f4        	sd	a0, 40(sp)
8000b702: 32 f8        	sd	a2, 48(sp)
8000b704: 2a fc        	sd	a0, 56(sp)
8000b706: 08 70        	ld	a0, 32(s0)
8000b708: 0c 74        	ld	a1, 40(s0)

000000008000b70a <.LBB122_14>:
8000b70a: 17 56 00 00  	auipc	a2, 5
8000b70e: 13 06 66 be  	addi	a2, a2, -1050
8000b712: b2 e0        	sd	a2, 64(sp)
8000b714: 0d 46        	addi	a2, zero, 3
8000b716: b2 e4        	sd	a2, 72(sp)
8000b718: 82 e8        	sd	zero, 80(sp)
8000b71a: 14 08        	addi	a3, sp, 16
8000b71c: b6 f0        	sd	a3, 96(sp)
8000b71e: b2 f4        	sd	a2, 104(sp)
8000b720: 90 00        	addi	a2, sp, 64
8000b722: 97 00 00 00  	auipc	ra, 0
8000b726: e7 80 e0 58  	jalr	1422(ra)
8000b72a: aa 84        	add	s1, zero, a0
8000b72c: 26 85        	add	a0, zero, s1
8000b72e: 46 79        	ld	s2, 112(sp)
8000b730: e6 74        	ld	s1, 120(sp)
8000b732: 0a 64        	ld	s0, 128(sp)
8000b734: aa 60        	ld	ra, 136(sp)
8000b736: 49 61        	addi	sp, sp, 144
8000b738: 82 80        	ret

Disassembly of section .text._ZN4core9panicking5panic17h4214b4eed8d3f37fE:

000000008000b73a <_ZN4core9panicking5panic17h4214b4eed8d3f37fE>:
8000b73a: 5d 71        	addi	sp, sp, -80
8000b73c: 86 e4        	sd	ra, 72(sp)
8000b73e: 2a fc        	sd	a0, 56(sp)
8000b740: ae e0        	sd	a1, 64(sp)
8000b742: 28 18        	addi	a0, sp, 56
8000b744: 2a e4        	sd	a0, 8(sp)
8000b746: 05 45        	addi	a0, zero, 1
8000b748: 2a e8        	sd	a0, 16(sp)
8000b74a: 02 ec        	sd	zero, 24(sp)

000000008000b74c <.LBB129_1>:
8000b74c: 17 55 00 00  	auipc	a0, 5
8000b750: 13 05 c5 ac  	addi	a0, a0, -1332
8000b754: 2a f4        	sd	a0, 40(sp)
8000b756: 02 f8        	sd	zero, 48(sp)
8000b758: 28 00        	addi	a0, sp, 8
8000b75a: b2 85        	add	a1, zero, a2
8000b75c: 97 00 00 00  	auipc	ra, 0
8000b760: e7 80 a0 04  	jalr	74(ra)
8000b764: 00 00        	unimp	

Disassembly of section .text._ZN4core9panicking18panic_bounds_check17ha760e6d8204f3836E:

000000008000b766 <_ZN4core9panicking18panic_bounds_check17ha760e6d8204f3836E>:
8000b766: 59 71        	addi	sp, sp, -112
8000b768: 86 f4        	sd	ra, 104(sp)
8000b76a: 2a e4        	sd	a0, 8(sp)
8000b76c: 2e e8        	sd	a1, 16(sp)
8000b76e: 08 08        	addi	a0, sp, 16
8000b770: aa e4        	sd	a0, 72(sp)

000000008000b772 <.LBB130_1>:
8000b772: 17 25 00 00  	auipc	a0, 2
8000b776: 13 05 e5 af  	addi	a0, a0, -1282
8000b77a: aa e8        	sd	a0, 80(sp)
8000b77c: 2c 00        	addi	a1, sp, 8
8000b77e: ae ec        	sd	a1, 88(sp)
8000b780: aa f0        	sd	a0, 96(sp)

000000008000b782 <.LBB130_2>:
8000b782: 17 55 00 00  	auipc	a0, 5
8000b786: 13 05 65 bb  	addi	a0, a0, -1098
8000b78a: 2a ec        	sd	a0, 24(sp)
8000b78c: 09 45        	addi	a0, zero, 2
8000b78e: 2a f0        	sd	a0, 32(sp)
8000b790: 02 f4        	sd	zero, 40(sp)
8000b792: ac 00        	addi	a1, sp, 72
8000b794: 2e fc        	sd	a1, 56(sp)
8000b796: aa e0        	sd	a0, 64(sp)
8000b798: 28 08        	addi	a0, sp, 24
8000b79a: b2 85        	add	a1, zero, a2
8000b79c: 97 00 00 00  	auipc	ra, 0
8000b7a0: e7 80 a0 00  	jalr	10(ra)
8000b7a4: 00 00        	unimp	

Disassembly of section .text._ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E:

000000008000b7a6 <_ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E>:
8000b7a6: 79 71        	addi	sp, sp, -48
8000b7a8: 06 f4        	sd	ra, 40(sp)

000000008000b7aa <.LBB131_1>:
8000b7aa: 17 56 00 00  	auipc	a2, 5
8000b7ae: 13 06 e6 a6  	addi	a2, a2, -1426
8000b7b2: 32 e4        	sd	a2, 8(sp)

000000008000b7b4 <.LBB131_2>:
8000b7b4: 17 56 00 00  	auipc	a2, 5
8000b7b8: 13 06 46 ae  	addi	a2, a2, -1308
8000b7bc: 32 e8        	sd	a2, 16(sp)
8000b7be: 2a ec        	sd	a0, 24(sp)
8000b7c0: 2e f0        	sd	a1, 32(sp)
8000b7c2: 28 00        	addi	a0, sp, 8
8000b7c4: 97 a0 ff ff  	auipc	ra, 1048570
8000b7c8: e7 80 80 b1  	jalr	-1256(ra)
8000b7cc: 00 00        	unimp	

Disassembly of section .text._ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hd6b2cc874e13c1a3E:

000000008000b7ce <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hd6b2cc874e13c1a3E>:
8000b7ce: 5d 71        	addi	sp, sp, -80
8000b7d0: 86 e4        	sd	ra, 72(sp)
8000b7d2: a2 e0        	sd	s0, 64(sp)
8000b7d4: 26 fc        	sd	s1, 56(sp)
8000b7d6: 4a f8        	sd	s2, 48(sp)
8000b7d8: 4e f4        	sd	s3, 40(sp)
8000b7da: 52 f0        	sd	s4, 32(sp)
8000b7dc: 56 ec        	sd	s5, 24(sp)
8000b7de: 5a e8        	sd	s6, 16(sp)
8000b7e0: 5e e4        	sd	s7, 8(sp)
8000b7e2: 62 e0        	sd	s8, 0(sp)
8000b7e4: 7d ca        	beqz	a2, 246 <.LBB133_30+0x1a>
8000b7e6: b2 84        	add	s1, zero, a2
8000b7e8: ae 89        	add	s3, zero, a1
8000b7ea: 2a 89        	add	s2, zero, a0
8000b7ec: 3d 4a        	addi	s4, zero, 15
8000b7ee: a9 4a        	addi	s5, zero, 10
8000b7f0: 13 0b f0 fb  	addi	s6, zero, -65
8000b7f4: 85 4b        	addi	s7, zero, 1
8000b7f6: 09 a8        	j	18 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hd6b2cc874e13c1a3E+0x3a>
8000b7f8: 94 6d        	ld	a3, 24(a1)
8000b7fa: ce 85        	add	a1, zero, s3
8000b7fc: 22 86        	add	a2, zero, s0
8000b7fe: 82 96        	jalr	a3
8000b800: 79 ed        	bnez	a0, 222 <.LBB133_30+0x1e>
8000b802: 81 8c        	sub	s1, s1, s0
8000b804: e2 89        	add	s3, zero, s8
8000b806: f1 c8        	beqz	s1, 212 <.LBB133_30+0x1a>
8000b808: 03 35 09 01  	ld	a0, 16(s2)
8000b80c: 03 45 05 00  	lbu	a0, 0(a0)
8000b810: 09 cd        	beqz	a0, 26 <.LBB133_29+0xe>
8000b812: 83 35 89 00  	ld	a1, 8(s2)
8000b816: 03 35 09 00  	ld	a0, 0(s2)
8000b81a: 94 6d        	ld	a3, 24(a1)

000000008000b81c <.LBB133_29>:
8000b81c: 97 25 00 00  	auipc	a1, 2
8000b820: 93 85 c5 07  	addi	a1, a1, 124
8000b824: 11 46        	addi	a2, zero, 4
8000b826: 82 96        	jalr	a3
8000b828: 5d e9        	bnez	a0, 182 <.LBB133_30+0x1e>
8000b82a: 01 44        	mv	s0, zero
8000b82c: 26 86        	add	a2, zero, s1
8000b82e: 29 a0        	j	10 <.LBB133_29+0x1c>
8000b830: 33 86 84 40  	sub	a2, s1, s0
8000b834: 63 e9 84 04  	bltu	s1, s0, 82 <.LBB133_29+0x6a>
8000b838: b3 85 89 00  	add	a1, s3, s0
8000b83c: 63 60 ca 02  	bltu	s4, a2, 32 <.LBB133_29+0x40>
8000b840: 39 c2        	beqz	a2, 70 <.LBB133_29+0x6a>
8000b842: 01 46        	mv	a2, zero
8000b844: 33 85 84 40  	sub	a0, s1, s0
8000b848: b3 86 c5 00  	add	a3, a1, a2
8000b84c: 83 c6 06 00  	lbu	a3, 0(a3)
8000b850: 63 8e 56 01  	beq	a3, s5, 28 <.LBB133_29+0x50>
8000b854: 05 06        	addi	a2, a2, 1
8000b856: e3 19 c5 fe  	bne	a0, a2, -14 <.LBB133_29+0x2c>
8000b85a: 35 a0        	j	44 <.LBB133_29+0x6a>
8000b85c: 29 45        	addi	a0, zero, 10
8000b85e: 97 10 00 00  	auipc	ra, 1
8000b862: e7 80 60 e1  	jalr	-490(ra)
8000b866: 63 10 75 03  	bne	a0, s7, 32 <.LBB133_29+0x6a>
8000b86a: 2e 86        	add	a2, zero, a1
8000b86c: 33 05 86 00  	add	a0, a2, s0
8000b870: 13 04 15 00  	addi	s0, a0, 1
8000b874: e3 7e 95 fa  	bgeu	a0, s1, -68 <.LBB133_29+0x14>
8000b878: 4e 95        	add	a0, a0, s3
8000b87a: 03 45 05 00  	lbu	a0, 0(a0)
8000b87e: e3 19 55 fb  	bne	a0, s5, -78 <.LBB133_29+0x14>
8000b882: 05 45        	addi	a0, zero, 1
8000b884: 19 a0        	j	6 <.LBB133_29+0x6e>
8000b886: 01 45        	mv	a0, zero
8000b888: 26 84        	add	s0, zero, s1
8000b88a: 83 35 09 01  	ld	a1, 16(s2)
8000b88e: 23 80 a5 00  	sb	a0, 0(a1)
8000b892: 03 35 09 00  	ld	a0, 0(s2)
8000b896: 83 35 89 00  	ld	a1, 8(s2)
8000b89a: 33 8c 89 00  	add	s8, s3, s0
8000b89e: e3 8d 84 f4  	beq	s1, s0, -166 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hd6b2cc874e13c1a3E+0x2a>
8000b8a2: 63 7b 94 04  	bgeu	s0, s1, 86 <.LBB133_31>
8000b8a6: 03 06 0c 00  	lb	a2, 0(s8)
8000b8aa: 63 57 cb 04  	bge	s6, a2, 78 <.LBB133_31>
8000b8ae: 94 6d        	ld	a3, 24(a1)
8000b8b0: ce 85        	add	a1, zero, s3
8000b8b2: 22 86        	add	a2, zero, s0
8000b8b4: 82 96        	jalr	a3
8000b8b6: 05 e5        	bnez	a0, 40 <.LBB133_30+0x1e>
8000b8b8: 03 05 0c 00  	lb	a0, 0(s8)
8000b8bc: e3 43 ab f4  	blt	s6, a0, -186 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17hd6b2cc874e13c1a3E+0x34>

000000008000b8c0 <.LBB133_30>:
8000b8c0: 17 57 00 00  	auipc	a4, 5
8000b8c4: 13 07 07 ae  	addi	a4, a4, -1312
8000b8c8: 4e 85        	add	a0, zero, s3
8000b8ca: a6 85        	add	a1, zero, s1
8000b8cc: 22 86        	add	a2, zero, s0
8000b8ce: a6 86        	add	a3, zero, s1
8000b8d0: 97 10 00 00  	auipc	ra, 1
8000b8d4: e7 80 c0 f6  	jalr	-148(ra)
8000b8d8: 00 00        	unimp	
8000b8da: 01 45        	mv	a0, zero
8000b8dc: 11 a0        	j	4 <.LBB133_30+0x20>
8000b8de: 05 45        	addi	a0, zero, 1
8000b8e0: 02 6c        	ld	s8, 0(sp)
8000b8e2: a2 6b        	ld	s7, 8(sp)
8000b8e4: 42 6b        	ld	s6, 16(sp)
8000b8e6: e2 6a        	ld	s5, 24(sp)
8000b8e8: 02 7a        	ld	s4, 32(sp)
8000b8ea: a2 79        	ld	s3, 40(sp)
8000b8ec: 42 79        	ld	s2, 48(sp)
8000b8ee: e2 74        	ld	s1, 56(sp)
8000b8f0: 06 64        	ld	s0, 64(sp)
8000b8f2: a6 60        	ld	ra, 72(sp)
8000b8f4: 61 61        	addi	sp, sp, 80
8000b8f6: 82 80        	ret

000000008000b8f8 <.LBB133_31>:
8000b8f8: 17 57 00 00  	auipc	a4, 5
8000b8fc: 13 07 07 a9  	addi	a4, a4, -1392
8000b900: 4e 85        	add	a0, zero, s3
8000b902: a6 85        	add	a1, zero, s1
8000b904: 01 46        	mv	a2, zero
8000b906: a2 86        	add	a3, zero, s0
8000b908: 97 10 00 00  	auipc	ra, 1
8000b90c: e7 80 40 f3  	jalr	-204(ra)
8000b910: 00 00        	unimp	

Disassembly of section .text._ZN4core3fmt8builders10DebugTuple5field17h968d9eaf966503caE:

000000008000b912 <_ZN4core3fmt8builders10DebugTuple5field17h968d9eaf966503caE>:
8000b912: 75 71        	addi	sp, sp, -144
8000b914: 06 e5        	sd	ra, 136(sp)
8000b916: 22 e1        	sd	s0, 128(sp)
8000b918: a6 fc        	sd	s1, 120(sp)
8000b91a: ca f8        	sd	s2, 112(sp)
8000b91c: ce f4        	sd	s3, 104(sp)
8000b91e: 2a 84        	add	s0, zero, a0
8000b920: 03 45 05 01  	lbu	a0, 16(a0)
8000b924: 85 44        	addi	s1, zero, 1
8000b926: 79 e1        	bnez	a0, 198 <.LBB137_18+0x24>
8000b928: b2 89        	add	s3, zero, a2
8000b92a: 2e 89        	add	s2, zero, a1
8000b92c: 08 60        	ld	a0, 0(s0)
8000b92e: 83 65 05 03  	lwu	a1, 48(a0)
8000b932: 10 64        	ld	a2, 8(s0)
8000b934: 93 f6 45 00  	andi	a3, a1, 4
8000b938: 13 36 16 00  	seqz	a2, a2
8000b93c: 99 e6        	bnez	a3, 14 <.LBB137_14+0xa>
8000b93e: 49 e6        	bnez	a2, 138 <.LBB137_18>

000000008000b940 <.LBB137_14>:
8000b940: 97 55 00 00  	auipc	a1, 5
8000b944: 93 85 a5 a7  	addi	a1, a1, -1414
8000b948: 61 a0        	j	136 <.LBB137_18+0x8>
8000b94a: 11 ce        	beqz	a2, 28 <.LBB137_15+0x14>
8000b94c: 0c 75        	ld	a1, 40(a0)
8000b94e: 08 71        	ld	a0, 32(a0)
8000b950: 94 6d        	ld	a3, 24(a1)

000000008000b952 <.LBB137_15>:
8000b952: 97 55 00 00  	auipc	a1, 5
8000b956: 93 85 a5 a6  	addi	a1, a1, -1430
8000b95a: 09 46        	addi	a2, zero, 2
8000b95c: 82 96        	jalr	a3
8000b95e: 59 e5        	bnez	a0, 142 <.LBB137_18+0x24>
8000b960: 08 60        	ld	a0, 0(s0)
8000b962: 83 65 05 03  	lwu	a1, 48(a0)
8000b966: 85 44        	addi	s1, zero, 1
8000b968: a3 03 91 02  	sb	s1, 39(sp)
8000b96c: 10 71        	ld	a2, 32(a0)
8000b96e: 14 75        	ld	a3, 40(a0)
8000b970: 32 e4        	sd	a2, 8(sp)
8000b972: 36 e8        	sd	a3, 16(sp)
8000b974: 13 06 71 02  	addi	a2, sp, 39
8000b978: 32 ec        	sd	a2, 24(sp)
8000b97a: 50 59        	lw	a2, 52(a0)
8000b97c: 83 06 85 03  	lb	a3, 56(a0)
8000b980: 18 61        	ld	a4, 0(a0)
8000b982: 1c 65        	ld	a5, 8(a0)
8000b984: 03 38 05 01  	ld	a6, 16(a0)
8000b988: 08 6d        	ld	a0, 24(a0)
8000b98a: ae cc        	sw	a1, 88(sp)
8000b98c: b2 ce        	sw	a2, 92(sp)
8000b98e: 23 00 d1 06  	sb	a3, 96(sp)
8000b992: 3a f4        	sd	a4, 40(sp)
8000b994: 3e f8        	sd	a5, 48(sp)
8000b996: 42 fc        	sd	a6, 56(sp)
8000b998: aa e0        	sd	a0, 64(sp)
8000b99a: 28 00        	addi	a0, sp, 8
8000b99c: 03 b6 89 01  	ld	a2, 24(s3)
8000b9a0: aa e4        	sd	a0, 72(sp)

000000008000b9a2 <.LBB137_16>:
8000b9a2: 17 55 00 00  	auipc	a0, 5
8000b9a6: 13 05 65 9b  	addi	a0, a0, -1610
8000b9aa: aa e8        	sd	a0, 80(sp)
8000b9ac: 2c 10        	addi	a1, sp, 40
8000b9ae: 4a 85        	add	a0, zero, s2
8000b9b0: 02 96        	jalr	a2
8000b9b2: 0d ed        	bnez	a0, 58 <.LBB137_18+0x24>
8000b9b4: c6 65        	ld	a1, 80(sp)
8000b9b6: 26 65        	ld	a0, 72(sp)
8000b9b8: 94 6d        	ld	a3, 24(a1)

000000008000b9ba <.LBB137_17>:
8000b9ba: 97 55 00 00  	auipc	a1, 5
8000b9be: 93 85 e5 9f  	addi	a1, a1, -1538
8000b9c2: 09 46        	addi	a2, zero, 2
8000b9c4: 82 96        	jalr	a3
8000b9c6: 15 a0        	j	36 <.LBB137_18+0x22>

000000008000b9c8 <.LBB137_18>:
8000b9c8: 97 55 00 00  	auipc	a1, 5
8000b9cc: 93 85 65 9f  	addi	a1, a1, -1546
8000b9d0: 14 75        	ld	a3, 40(a0)
8000b9d2: 08 71        	ld	a0, 32(a0)
8000b9d4: 94 6e        	ld	a3, 24(a3)
8000b9d6: 09 47        	addi	a4, zero, 2
8000b9d8: 33 06 c7 40  	sub	a2, a4, a2
8000b9dc: 82 96        	jalr	a3
8000b9de: 19 e5        	bnez	a0, 14 <.LBB137_18+0x24>
8000b9e0: 0c 60        	ld	a1, 0(s0)
8000b9e2: 03 b6 89 01  	ld	a2, 24(s3)
8000b9e6: 4a 85        	add	a0, zero, s2
8000b9e8: 02 96        	jalr	a2
8000b9ea: aa 84        	add	s1, zero, a0
8000b9ec: 08 64        	ld	a0, 8(s0)
8000b9ee: 23 08 94 00  	sb	s1, 16(s0)
8000b9f2: 05 05        	addi	a0, a0, 1
8000b9f4: 08 e4        	sd	a0, 8(s0)
8000b9f6: 22 85        	add	a0, zero, s0
8000b9f8: a6 79        	ld	s3, 104(sp)
8000b9fa: 46 79        	ld	s2, 112(sp)
8000b9fc: e6 74        	ld	s1, 120(sp)
8000b9fe: 0a 64        	ld	s0, 128(sp)
8000ba00: aa 60        	ld	ra, 136(sp)
8000ba02: 49 61        	addi	sp, sp, 144
8000ba04: 82 80        	ret

Disassembly of section .text._ZN4core3fmt8builders10DebugTuple6finish17h9067963986a9fe09E:

000000008000ba06 <_ZN4core3fmt8builders10DebugTuple6finish17h9067963986a9fe09E>:
8000ba06: 01 11        	addi	sp, sp, -32
8000ba08: 06 ec        	sd	ra, 24(sp)
8000ba0a: 22 e8        	sd	s0, 16(sp)
8000ba0c: 26 e4        	sd	s1, 8(sp)
8000ba0e: 2a 84        	add	s0, zero, a0
8000ba10: 0c 65        	ld	a1, 8(a0)
8000ba12: 03 45 05 01  	lbu	a0, 16(a0)
8000ba16: b9 c5        	beqz	a1, 78 <.LBB138_10+0x14>
8000ba18: 85 44        	addi	s1, zero, 1
8000ba1a: 31 e1        	bnez	a0, 68 <.LBB138_10+0xe>
8000ba1c: 05 45        	addi	a0, zero, 1
8000ba1e: 63 95 a5 02  	bne	a1, a0, 42 <.LBB138_9+0x10>
8000ba22: 03 45 14 01  	lbu	a0, 17(s0)
8000ba26: 0d c1        	beqz	a0, 34 <.LBB138_9+0x10>
8000ba28: 08 60        	ld	a0, 0(s0)
8000ba2a: 83 45 05 03  	lbu	a1, 48(a0)
8000ba2e: 91 89        	andi	a1, a1, 4
8000ba30: 81 ed        	bnez	a1, 24 <.LBB138_9+0x10>
8000ba32: 0c 75        	ld	a1, 40(a0)
8000ba34: 08 71        	ld	a0, 32(a0)
8000ba36: 94 6d        	ld	a3, 24(a1)

000000008000ba38 <.LBB138_9>:
8000ba38: 97 55 00 00  	auipc	a1, 5
8000ba3c: 93 85 75 98  	addi	a1, a1, -1657
8000ba40: 05 46        	addi	a2, zero, 1
8000ba42: 85 44        	addi	s1, zero, 1
8000ba44: 82 96        	jalr	a3
8000ba46: 01 ed        	bnez	a0, 24 <.LBB138_10+0xe>
8000ba48: 08 60        	ld	a0, 0(s0)
8000ba4a: 0c 75        	ld	a1, 40(a0)
8000ba4c: 08 71        	ld	a0, 32(a0)
8000ba4e: 94 6d        	ld	a3, 24(a1)

000000008000ba50 <.LBB138_10>:
8000ba50: 97 55 00 00  	auipc	a1, 5
8000ba54: 93 85 05 97  	addi	a1, a1, -1680
8000ba58: 05 46        	addi	a2, zero, 1
8000ba5a: 82 96        	jalr	a3
8000ba5c: aa 84        	add	s1, zero, a0
8000ba5e: 23 08 94 00  	sb	s1, 16(s0)
8000ba62: 26 85        	add	a0, zero, s1
8000ba64: 33 35 a0 00  	snez	a0, a0
8000ba68: a2 64        	ld	s1, 8(sp)
8000ba6a: 42 64        	ld	s0, 16(sp)
8000ba6c: e2 60        	ld	ra, 24(sp)
8000ba6e: 05 61        	addi	sp, sp, 32
8000ba70: 82 80        	ret

Disassembly of section .text._ZN4core3fmt5Write10write_char17h8aeb772118eba9e2E:

000000008000ba72 <_ZN4core3fmt5Write10write_char17h8aeb772118eba9e2E>:
8000ba72: 41 11        	addi	sp, sp, -16
8000ba74: 06 e4        	sd	ra, 8(sp)
8000ba76: 2e 86        	add	a2, zero, a1
8000ba78: 81 25        	sext.w	a1, a1
8000ba7a: 93 06 00 08  	addi	a3, zero, 128
8000ba7e: 02 c2        	sw	zero, 4(sp)
8000ba80: 63 fd d5 00  	bgeu	a1, a3, 26 <_ZN4core3fmt5Write10write_char17h8aeb772118eba9e2E+0x28>
8000ba84: 4c 00        	addi	a1, sp, 4
8000ba86: 23 02 c1 00  	sb	a2, 4(sp)
8000ba8a: 05 46        	addi	a2, zero, 1
8000ba8c: 97 00 00 00  	auipc	ra, 0
8000ba90: e7 80 20 d4  	jalr	-702(ra)
8000ba94: a2 60        	ld	ra, 8(sp)
8000ba96: 41 01        	addi	sp, sp, 16
8000ba98: 82 80        	ret
8000ba9a: 9b 55 b6 00  	srliw	a1, a2, 11
8000ba9e: 95 e5        	bnez	a1, 44 <_ZN4core3fmt5Write10write_char17h8aeb772118eba9e2E+0x58>
8000baa0: 4c 00        	addi	a1, sp, 4
8000baa2: 93 56 66 00  	srli	a3, a2, 6
8000baa6: 93 e6 06 0c  	ori	a3, a3, 192
8000baaa: 23 02 d1 00  	sb	a3, 4(sp)
8000baae: 13 76 f6 03  	andi	a2, a2, 63
8000bab2: 13 66 06 08  	ori	a2, a2, 128
8000bab6: a3 02 c1 00  	sb	a2, 5(sp)
8000baba: 09 46        	addi	a2, zero, 2
8000babc: 97 00 00 00  	auipc	ra, 0
8000bac0: e7 80 20 d1  	jalr	-750(ra)
8000bac4: a2 60        	ld	ra, 8(sp)
8000bac6: 41 01        	addi	sp, sp, 16
8000bac8: 82 80        	ret
8000baca: 9b 56 06 01  	srliw	a3, a2, 16
8000bace: 4c 00        	addi	a1, sp, 4
8000bad0: 8d ee        	bnez	a3, 58 <_ZN4core3fmt5Write10write_char17h8aeb772118eba9e2E+0x98>
8000bad2: 9b 56 c6 00  	srliw	a3, a2, 12
8000bad6: 93 e6 06 0e  	ori	a3, a3, 224
8000bada: 23 02 d1 00  	sb	a3, 4(sp)
8000bade: 9b 56 66 00  	srliw	a3, a2, 6
8000bae2: 93 f6 f6 03  	andi	a3, a3, 63
8000bae6: 93 e6 06 08  	ori	a3, a3, 128
8000baea: a3 02 d1 00  	sb	a3, 5(sp)
8000baee: 13 76 f6 03  	andi	a2, a2, 63
8000baf2: 13 66 06 08  	ori	a2, a2, 128
8000baf6: 23 03 c1 00  	sb	a2, 6(sp)
8000bafa: 0d 46        	addi	a2, zero, 3
8000bafc: 97 00 00 00  	auipc	ra, 0
8000bb00: e7 80 20 cd  	jalr	-814(ra)
8000bb04: a2 60        	ld	ra, 8(sp)
8000bb06: 41 01        	addi	sp, sp, 16
8000bb08: 82 80        	ret
8000bb0a: 9b 56 26 01  	srliw	a3, a2, 18
8000bb0e: 93 e6 06 0f  	ori	a3, a3, 240
8000bb12: 23 02 d1 00  	sb	a3, 4(sp)
8000bb16: 9b 56 c6 00  	srliw	a3, a2, 12
8000bb1a: 93 f6 f6 03  	andi	a3, a3, 63
8000bb1e: 93 e6 06 08  	ori	a3, a3, 128
8000bb22: a3 02 d1 00  	sb	a3, 5(sp)
8000bb26: 9b 56 66 00  	srliw	a3, a2, 6
8000bb2a: 93 f6 f6 03  	andi	a3, a3, 63
8000bb2e: 93 e6 06 08  	ori	a3, a3, 128
8000bb32: 23 03 d1 00  	sb	a3, 6(sp)
8000bb36: 13 76 f6 03  	andi	a2, a2, 63
8000bb3a: 13 66 06 08  	ori	a2, a2, 128
8000bb3e: a3 03 c1 00  	sb	a2, 7(sp)
8000bb42: 11 46        	addi	a2, zero, 4
8000bb44: 97 00 00 00  	auipc	ra, 0
8000bb48: e7 80 a0 c8  	jalr	-886(ra)
8000bb4c: a2 60        	ld	ra, 8(sp)
8000bb4e: 41 01        	addi	sp, sp, 16
8000bb50: 82 80        	ret

Disassembly of section .text._ZN4core3fmt5Write9write_fmt17hddb7215d3127a3d2E:

000000008000bb52 <_ZN4core3fmt5Write9write_fmt17hddb7215d3127a3d2E>:
8000bb52: 39 71        	addi	sp, sp, -64
8000bb54: 06 fc        	sd	ra, 56(sp)
8000bb56: 90 75        	ld	a2, 40(a1)
8000bb58: 94 71        	ld	a3, 32(a1)
8000bb5a: 2a e0        	sd	a0, 0(sp)
8000bb5c: 32 f8        	sd	a2, 48(sp)
8000bb5e: 36 f4        	sd	a3, 40(sp)
8000bb60: 88 6d        	ld	a0, 24(a1)
8000bb62: 90 69        	ld	a2, 16(a1)
8000bb64: 94 65        	ld	a3, 8(a1)
8000bb66: 8c 61        	ld	a1, 0(a1)
8000bb68: 2a f0        	sd	a0, 32(sp)
8000bb6a: 32 ec        	sd	a2, 24(sp)
8000bb6c: 36 e8        	sd	a3, 16(sp)
8000bb6e: 2e e4        	sd	a1, 8(sp)

000000008000bb70 <.LBB160_1>:
8000bb70: 97 55 00 00  	auipc	a1, 5
8000bb74: 93 85 85 95  	addi	a1, a1, -1704
8000bb78: 0a 85        	add	a0, zero, sp
8000bb7a: 30 00        	addi	a2, sp, 8
8000bb7c: 97 00 00 00  	auipc	ra, 0
8000bb80: e7 80 40 13  	jalr	308(ra)
8000bb84: e2 70        	ld	ra, 56(sp)
8000bb86: 21 61        	addi	sp, sp, 64
8000bb88: 82 80        	ret

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hfa57a7fc9f8589d2E:

000000008000bb8a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hfa57a7fc9f8589d2E>:
8000bb8a: 08 61        	ld	a0, 0(a0)
8000bb8c: 17 03 00 00  	auipc	t1, 0
8000bb90: 67 00 23 c4  	jr	-958(t1)

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58b6ff904fa9294fE:

000000008000bb94 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58b6ff904fa9294fE>:
8000bb94: 41 11        	addi	sp, sp, -16
8000bb96: 06 e4        	sd	ra, 8(sp)
8000bb98: 2e 86        	add	a2, zero, a1
8000bb9a: 08 61        	ld	a0, 0(a0)
8000bb9c: 81 25        	sext.w	a1, a1
8000bb9e: 93 06 00 08  	addi	a3, zero, 128
8000bba2: 02 c2        	sw	zero, 4(sp)
8000bba4: 63 fd d5 00  	bgeu	a1, a3, 26 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58b6ff904fa9294fE+0x2a>
8000bba8: 4c 00        	addi	a1, sp, 4
8000bbaa: 23 02 c1 00  	sb	a2, 4(sp)
8000bbae: 05 46        	addi	a2, zero, 1
8000bbb0: 97 00 00 00  	auipc	ra, 0
8000bbb4: e7 80 e0 c1  	jalr	-994(ra)
8000bbb8: a2 60        	ld	ra, 8(sp)
8000bbba: 41 01        	addi	sp, sp, 16
8000bbbc: 82 80        	ret
8000bbbe: 9b 55 b6 00  	srliw	a1, a2, 11
8000bbc2: 95 e5        	bnez	a1, 44 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58b6ff904fa9294fE+0x5a>
8000bbc4: 4c 00        	addi	a1, sp, 4
8000bbc6: 93 56 66 00  	srli	a3, a2, 6
8000bbca: 93 e6 06 0c  	ori	a3, a3, 192
8000bbce: 23 02 d1 00  	sb	a3, 4(sp)
8000bbd2: 13 76 f6 03  	andi	a2, a2, 63
8000bbd6: 13 66 06 08  	ori	a2, a2, 128
8000bbda: a3 02 c1 00  	sb	a2, 5(sp)
8000bbde: 09 46        	addi	a2, zero, 2
8000bbe0: 97 00 00 00  	auipc	ra, 0
8000bbe4: e7 80 e0 be  	jalr	-1042(ra)
8000bbe8: a2 60        	ld	ra, 8(sp)
8000bbea: 41 01        	addi	sp, sp, 16
8000bbec: 82 80        	ret
8000bbee: 9b 56 06 01  	srliw	a3, a2, 16
8000bbf2: 4c 00        	addi	a1, sp, 4
8000bbf4: 8d ee        	bnez	a3, 58 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h58b6ff904fa9294fE+0x9a>
8000bbf6: 9b 56 c6 00  	srliw	a3, a2, 12
8000bbfa: 93 e6 06 0e  	ori	a3, a3, 224
8000bbfe: 23 02 d1 00  	sb	a3, 4(sp)
8000bc02: 9b 56 66 00  	srliw	a3, a2, 6
8000bc06: 93 f6 f6 03  	andi	a3, a3, 63
8000bc0a: 93 e6 06 08  	ori	a3, a3, 128
8000bc0e: a3 02 d1 00  	sb	a3, 5(sp)
8000bc12: 13 76 f6 03  	andi	a2, a2, 63
8000bc16: 13 66 06 08  	ori	a2, a2, 128
8000bc1a: 23 03 c1 00  	sb	a2, 6(sp)
8000bc1e: 0d 46        	addi	a2, zero, 3
8000bc20: 97 00 00 00  	auipc	ra, 0
8000bc24: e7 80 e0 ba  	jalr	-1106(ra)
8000bc28: a2 60        	ld	ra, 8(sp)
8000bc2a: 41 01        	addi	sp, sp, 16
8000bc2c: 82 80        	ret
8000bc2e: 9b 56 26 01  	srliw	a3, a2, 18
8000bc32: 93 e6 06 0f  	ori	a3, a3, 240
8000bc36: 23 02 d1 00  	sb	a3, 4(sp)
8000bc3a: 9b 56 c6 00  	srliw	a3, a2, 12
8000bc3e: 93 f6 f6 03  	andi	a3, a3, 63
8000bc42: 93 e6 06 08  	ori	a3, a3, 128
8000bc46: a3 02 d1 00  	sb	a3, 5(sp)
8000bc4a: 9b 56 66 00  	srliw	a3, a2, 6
8000bc4e: 93 f6 f6 03  	andi	a3, a3, 63
8000bc52: 93 e6 06 08  	ori	a3, a3, 128
8000bc56: 23 03 d1 00  	sb	a3, 6(sp)
8000bc5a: 13 76 f6 03  	andi	a2, a2, 63
8000bc5e: 13 66 06 08  	ori	a2, a2, 128
8000bc62: a3 03 c1 00  	sb	a2, 7(sp)
8000bc66: 11 46        	addi	a2, zero, 4
8000bc68: 97 00 00 00  	auipc	ra, 0
8000bc6c: e7 80 60 b6  	jalr	-1178(ra)
8000bc70: a2 60        	ld	ra, 8(sp)
8000bc72: 41 01        	addi	sp, sp, 16
8000bc74: 82 80        	ret

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h242554f80beddc1fE:

000000008000bc76 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h242554f80beddc1fE>:
8000bc76: 39 71        	addi	sp, sp, -64
8000bc78: 06 fc        	sd	ra, 56(sp)
8000bc7a: 08 61        	ld	a0, 0(a0)
8000bc7c: 90 75        	ld	a2, 40(a1)
8000bc7e: 94 71        	ld	a3, 32(a1)
8000bc80: 2a e0        	sd	a0, 0(sp)
8000bc82: 32 f8        	sd	a2, 48(sp)
8000bc84: 36 f4        	sd	a3, 40(sp)
8000bc86: 88 6d        	ld	a0, 24(a1)
8000bc88: 90 69        	ld	a2, 16(a1)
8000bc8a: 94 65        	ld	a3, 8(a1)
8000bc8c: 8c 61        	ld	a1, 0(a1)
8000bc8e: 2a f0        	sd	a0, 32(sp)
8000bc90: 32 ec        	sd	a2, 24(sp)
8000bc92: 36 e8        	sd	a3, 16(sp)
8000bc94: 2e e4        	sd	a1, 8(sp)

000000008000bc96 <.LBB163_1>:
8000bc96: 97 55 00 00  	auipc	a1, 5
8000bc9a: 93 85 25 83  	addi	a1, a1, -1998
8000bc9e: 0a 85        	add	a0, zero, sp
8000bca0: 30 00        	addi	a2, sp, 8
8000bca2: 97 00 00 00  	auipc	ra, 0
8000bca6: e7 80 e0 00  	jalr	14(ra)
8000bcaa: e2 70        	ld	ra, 56(sp)
8000bcac: 21 61        	addi	sp, sp, 64
8000bcae: 82 80        	ret

Disassembly of section .text._ZN4core3fmt5write17h338141860f5a80fbE:

000000008000bcb0 <_ZN4core3fmt5write17h338141860f5a80fbE>:
8000bcb0: 35 71        	addi	sp, sp, -160
8000bcb2: 06 ed        	sd	ra, 152(sp)
8000bcb4: 22 e9        	sd	s0, 144(sp)
8000bcb6: 26 e5        	sd	s1, 136(sp)
8000bcb8: 4a e1        	sd	s2, 128(sp)
8000bcba: ce fc        	sd	s3, 120(sp)
8000bcbc: d2 f8        	sd	s4, 112(sp)
8000bcbe: d6 f4        	sd	s5, 104(sp)
8000bcc0: da f0        	sd	s6, 96(sp)
8000bcc2: de ec        	sd	s7, 88(sp)
8000bcc4: e2 e8        	sd	s8, 80(sp)
8000bcc6: e6 e4        	sd	s9, 72(sp)
8000bcc8: 32 84        	add	s0, zero, a2
8000bcca: 05 46        	addi	a2, zero, 1
8000bccc: 16 16        	slli	a2, a2, 37
8000bcce: 32 fc        	sd	a2, 56(sp)
8000bcd0: 0d 46        	addi	a2, zero, 3
8000bcd2: 23 00 c1 04  	sb	a2, 64(sp)
8000bcd6: 04 68        	ld	s1, 16(s0)
8000bcd8: 02 e4        	sd	zero, 8(sp)
8000bcda: 02 ec        	sd	zero, 24(sp)
8000bcdc: 2a f4        	sd	a0, 40(sp)
8000bcde: 2e f8        	sd	a1, 48(sp)
8000bce0: e9 cc        	beqz	s1, 218 <.LBB167_35+0x9e>
8000bce2: 10 6c        	ld	a2, 24(s0)
8000bce4: 83 39 84 00  	ld	s3, 8(s0)
8000bce8: 03 39 04 00  	ld	s2, 0(s0)
8000bcec: ce 8a        	add	s5, zero, s3
8000bcee: 63 e3 c9 00  	bltu	s3, a2, 6 <_ZN4core3fmt5write17h338141860f5a80fbE+0x44>
8000bcf2: b2 8a        	add	s5, zero, a2
8000bcf4: 63 81 0a 12  	beqz	s5, 290 <.LBB167_35+0xfa>
8000bcf8: 83 36 09 00  	ld	a3, 0(s2)
8000bcfc: 03 36 89 00  	ld	a2, 8(s2)
8000bd00: 98 6d        	ld	a4, 24(a1)
8000bd02: b6 85        	add	a1, zero, a3
8000bd04: 02 97        	jalr	a4
8000bd06: 63 16 05 12  	bnez	a0, 300 <.LBB167_35+0x116>
8000bd0a: 03 3c 04 02  	ld	s8, 32(s0)
8000bd0e: 93 84 04 03  	addi	s1, s1, 48
8000bd12: 93 0c 89 01  	addi	s9, s2, 24
8000bd16: 13 0a 81 00  	addi	s4, sp, 8
8000bd1a: 09 4b        	addi	s6, zero, 2

000000008000bd1c <.LBB167_35>:
8000bd1c: 97 0b 00 00  	auipc	s7, 0
8000bd20: 93 8b 6b 81  	addi	s7, s7, -2026
8000bd24: 56 84        	add	s0, zero, s5
8000bd26: 03 a5 84 ff  	lw	a0, -8(s1)
8000bd2a: 2a de        	sw	a0, 60(sp)
8000bd2c: 03 85 04 00  	lb	a0, 0(s1)
8000bd30: 23 00 a1 04  	sb	a0, 64(sp)
8000bd34: 03 a5 c4 ff  	lw	a0, -4(s1)
8000bd38: 2a dc        	sw	a0, 56(sp)
8000bd3a: 03 b6 84 fe  	ld	a2, -24(s1)
8000bd3e: 03 b5 04 ff  	ld	a0, -16(s1)
8000bd42: 19 ca        	beqz	a2, 22 <.LBB167_35+0x3c>
8000bd44: 81 45        	mv	a1, zero
8000bd46: 63 0c 66 01  	beq	a2, s6, 24 <.LBB167_35+0x42>
8000bd4a: 12 05        	slli	a0, a0, 4
8000bd4c: 62 95        	add	a0, a0, s8
8000bd4e: 0c 65        	ld	a1, 8(a0)
8000bd50: 63 96 75 01  	bne	a1, s7, 12 <.LBB167_35+0x40>
8000bd54: 08 61        	ld	a0, 0(a0)
8000bd56: 08 61        	ld	a0, 0(a0)
8000bd58: 85 45        	addi	a1, zero, 1
8000bd5a: 11 a0        	j	4 <.LBB167_35+0x42>
8000bd5c: 81 45        	mv	a1, zero
8000bd5e: 2e e4        	sd	a1, 8(sp)
8000bd60: 2a e8        	sd	a0, 16(sp)
8000bd62: 03 b6 84 fd  	ld	a2, -40(s1)
8000bd66: 03 b5 04 fe  	ld	a0, -32(s1)
8000bd6a: 19 ca        	beqz	a2, 22 <.LBB167_35+0x64>
8000bd6c: 81 45        	mv	a1, zero
8000bd6e: 63 0c 66 01  	beq	a2, s6, 24 <.LBB167_35+0x6a>
8000bd72: 12 05        	slli	a0, a0, 4
8000bd74: 62 95        	add	a0, a0, s8
8000bd76: 0c 65        	ld	a1, 8(a0)
8000bd78: 63 96 75 01  	bne	a1, s7, 12 <.LBB167_35+0x68>
8000bd7c: 08 61        	ld	a0, 0(a0)
8000bd7e: 08 61        	ld	a0, 0(a0)
8000bd80: 85 45        	addi	a1, zero, 1
8000bd82: 11 a0        	j	4 <.LBB167_35+0x6a>
8000bd84: 81 45        	mv	a1, zero
8000bd86: 2e ec        	sd	a1, 24(sp)
8000bd88: 2a f0        	sd	a0, 32(sp)
8000bd8a: 03 b5 04 fd  	ld	a0, -48(s1)
8000bd8e: 12 05        	slli	a0, a0, 4
8000bd90: 62 95        	add	a0, a0, s8
8000bd92: 10 65        	ld	a2, 8(a0)
8000bd94: 08 61        	ld	a0, 0(a0)
8000bd96: d2 85        	add	a1, zero, s4
8000bd98: 02 96        	jalr	a2
8000bd9a: 41 ed        	bnez	a0, 152 <.LBB167_35+0x116>
8000bd9c: 7d 14        	addi	s0, s0, -1
8000bd9e: 2d cc        	beqz	s0, 122 <.LBB167_35+0xfc>
8000bda0: c2 76        	ld	a3, 48(sp)
8000bda2: 22 75        	ld	a0, 40(sp)
8000bda4: 83 b5 8c ff  	ld	a1, -8(s9)
8000bda8: 03 b6 0c 00  	ld	a2, 0(s9)
8000bdac: 94 6e        	ld	a3, 24(a3)
8000bdae: 93 84 84 03  	addi	s1, s1, 56
8000bdb2: c1 0c        	addi	s9, s9, 16
8000bdb4: 82 96        	jalr	a3
8000bdb6: 25 d9        	beqz	a0, -144 <.LBB167_35+0xa>
8000bdb8: ad a8        	j	122 <.LBB167_35+0x116>
8000bdba: 04 70        	ld	s1, 32(s0)
8000bdbc: 10 74        	ld	a2, 40(s0)
8000bdbe: 83 39 84 00  	ld	s3, 8(s0)
8000bdc2: 03 39 04 00  	ld	s2, 0(s0)
8000bdc6: ce 8a        	add	s5, zero, s3
8000bdc8: 63 e3 c9 00  	bltu	s3, a2, 6 <.LBB167_35+0xb2>
8000bdcc: b2 8a        	add	s5, zero, a2
8000bdce: 63 84 0a 04  	beqz	s5, 72 <.LBB167_35+0xfa>
8000bdd2: 83 36 09 00  	ld	a3, 0(s2)
8000bdd6: 03 36 89 00  	ld	a2, 8(s2)
8000bdda: 98 6d        	ld	a4, 24(a1)
8000bddc: b6 85        	add	a1, zero, a3
8000bdde: 02 97        	jalr	a4
8000bde0: 29 e9        	bnez	a0, 82 <.LBB167_35+0x116>
8000bde2: a1 04        	addi	s1, s1, 8
8000bde4: 13 0b 89 01  	addi	s6, s2, 24
8000bde8: 13 0a 81 00  	addi	s4, sp, 8
8000bdec: 56 84        	add	s0, zero, s5
8000bdee: 90 60        	ld	a2, 0(s1)
8000bdf0: 03 b5 84 ff  	ld	a0, -8(s1)
8000bdf4: d2 85        	add	a1, zero, s4
8000bdf6: 02 96        	jalr	a2
8000bdf8: 0d ed        	bnez	a0, 58 <.LBB167_35+0x116>
8000bdfa: 7d 14        	addi	s0, s0, -1
8000bdfc: 11 cc        	beqz	s0, 28 <.LBB167_35+0xfc>
8000bdfe: c2 76        	ld	a3, 48(sp)
8000be00: 22 75        	ld	a0, 40(sp)
8000be02: 83 35 8b ff  	ld	a1, -8(s6)
8000be06: 03 36 0b 00  	ld	a2, 0(s6)
8000be0a: 94 6e        	ld	a3, 24(a3)
8000be0c: c1 04        	addi	s1, s1, 16
8000be0e: 41 0b        	addi	s6, s6, 16
8000be10: 82 96        	jalr	a3
8000be12: 71 dd        	beqz	a0, -36 <.LBB167_35+0xd2>
8000be14: 39 a8        	j	30 <.LBB167_35+0x116>
8000be16: 81 4a        	mv	s5, zero
8000be18: 63 ff 3a 01  	bgeu	s5, s3, 30 <.LBB167_35+0x11a>
8000be1c: 22 75        	ld	a0, 40(sp)
8000be1e: c2 76        	ld	a3, 48(sp)
8000be20: 93 95 4a 00  	slli	a1, s5, 4
8000be24: 33 06 b9 00  	add	a2, s2, a1
8000be28: 0c 62        	ld	a1, 0(a2)
8000be2a: 10 66        	ld	a2, 8(a2)
8000be2c: 94 6e        	ld	a3, 24(a3)
8000be2e: 82 96        	jalr	a3
8000be30: 19 c1        	beqz	a0, 6 <.LBB167_35+0x11a>
8000be32: 05 45        	addi	a0, zero, 1
8000be34: 11 a0        	j	4 <.LBB167_35+0x11c>
8000be36: 01 45        	mv	a0, zero
8000be38: a6 6c        	ld	s9, 72(sp)
8000be3a: 46 6c        	ld	s8, 80(sp)
8000be3c: e6 6b        	ld	s7, 88(sp)
8000be3e: 06 7b        	ld	s6, 96(sp)
8000be40: a6 7a        	ld	s5, 104(sp)
8000be42: 46 7a        	ld	s4, 112(sp)
8000be44: e6 79        	ld	s3, 120(sp)
8000be46: 0a 69        	ld	s2, 128(sp)
8000be48: aa 64        	ld	s1, 136(sp)
8000be4a: 4a 64        	ld	s0, 144(sp)
8000be4c: ea 60        	ld	ra, 152(sp)
8000be4e: 0d 61        	addi	sp, sp, 160
8000be50: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E:

000000008000be52 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E>:
8000be52: 59 71        	addi	sp, sp, -112
8000be54: 86 f4        	sd	ra, 104(sp)
8000be56: a2 f0        	sd	s0, 96(sp)
8000be58: a6 ec        	sd	s1, 88(sp)
8000be5a: ca e8        	sd	s2, 80(sp)
8000be5c: ce e4        	sd	s3, 72(sp)
8000be5e: d2 e0        	sd	s4, 64(sp)
8000be60: 56 fc        	sd	s5, 56(sp)
8000be62: 5a f8        	sd	s6, 48(sp)
8000be64: 5e f4        	sd	s7, 40(sp)
8000be66: 62 f0        	sd	s8, 32(sp)
8000be68: 66 ec        	sd	s9, 24(sp)
8000be6a: 6a e8        	sd	s10, 16(sp)
8000be6c: 6e e4        	sd	s11, 8(sp)
8000be6e: be 89        	add	s3, zero, a5
8000be70: 3a 89        	add	s2, zero, a4
8000be72: b6 8a        	add	s5, zero, a3
8000be74: 2a 84        	add	s0, zero, a0
8000be76: b9 c5        	beqz	a1, 78 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x72>
8000be78: 03 65 04 03  	lwu	a0, 48(s0)
8000be7c: 93 75 15 00  	andi	a1, a0, 1
8000be80: 37 0a 11 00  	lui	s4, 272
8000be84: 99 c1        	beqz	a1, 6 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x38>
8000be86: 13 0a b0 02  	addi	s4, zero, 43
8000be8a: b3 8c 35 01  	add	s9, a1, s3
8000be8e: 93 75 45 00  	andi	a1, a0, 4
8000be92: b1 c1        	beqz	a1, 68 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x84>
8000be94: 81 45        	mv	a1, zero
8000be96: 63 80 0a 02  	beqz	s5, 32 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x64>
8000be9a: d6 86        	add	a3, zero, s5
8000be9c: 32 87        	add	a4, zero, a2
8000be9e: 83 47 07 00  	lbu	a5, 0(a4)
8000bea2: 05 07        	addi	a4, a4, 1
8000bea4: 93 f7 07 0c  	andi	a5, a5, 192
8000bea8: 93 87 07 f8  	addi	a5, a5, -128
8000beac: b3 37 f0 00  	snez	a5, a5
8000beb0: fd 16        	addi	a3, a3, -1
8000beb2: be 95        	add	a1, a1, a5
8000beb4: ed f6        	bnez	a3, -22 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x4c>
8000beb6: ae 9c        	add	s9, s9, a1
8000beb8: 32 8b        	add	s6, zero, a2
8000beba: 0c 60        	ld	a1, 0(s0)
8000bebc: 85 4d        	addi	s11, zero, 1
8000bebe: 63 81 b5 03  	beq	a1, s11, 34 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x8e>
8000bec2: b1 a0        	j	76 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xbc>
8000bec4: 03 65 04 03  	lwu	a0, 48(s0)
8000bec8: 93 8c 19 00  	addi	s9, s3, 1
8000becc: 13 0a d0 02  	addi	s4, zero, 45
8000bed0: 93 75 45 00  	andi	a1, a0, 4
8000bed4: e1 f1        	bnez	a1, -64 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x42>
8000bed6: 01 4b        	mv	s6, zero
8000bed8: 0c 60        	ld	a1, 0(s0)
8000beda: 85 4d        	addi	s11, zero, 1
8000bedc: 63 99 b5 03  	bne	a1, s11, 50 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xbc>
8000bee0: 03 3d 84 00  	ld	s10, 8(s0)
8000bee4: 63 f5 ac 03  	bgeu	s9, s10, 42 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xbc>
8000bee8: 21 89        	andi	a0, a0, 8
8000beea: 3d ed        	bnez	a0, 126 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x116>
8000beec: 03 45 84 03  	lbu	a0, 56(s0)
8000bef0: 85 45        	addi	a1, zero, 1
8000bef2: 8d 46        	addi	a3, zero, 3
8000bef4: 05 46        	addi	a2, zero, 1
8000bef6: 63 03 d5 00  	beq	a0, a3, 6 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xaa>
8000befa: 2a 86        	add	a2, zero, a0
8000befc: 0d 8a        	andi	a2, a2, 3
8000befe: 33 05 9d 41  	sub	a0, s10, s9
8000bf02: 63 c7 c5 0a  	blt	a1, a2, 174 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x15e>
8000bf06: 45 ea        	bnez	a2, 176 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x164>
8000bf08: 2a 8c        	add	s8, zero, a0
8000bf0a: 01 45        	mv	a0, zero
8000bf0c: c9 a0        	j	194 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x17c>
8000bf0e: 22 85        	add	a0, zero, s0
8000bf10: d2 85        	add	a1, zero, s4
8000bf12: 5a 86        	add	a2, zero, s6
8000bf14: d6 86        	add	a3, zero, s5
8000bf16: 97 00 00 00  	auipc	ra, 0
8000bf1a: e7 80 40 17  	jalr	372(ra)
8000bf1e: 0d c1        	beqz	a0, 34 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xee>
8000bf20: 6e 85        	add	a0, zero, s11
8000bf22: a2 6d        	ld	s11, 8(sp)
8000bf24: 42 6d        	ld	s10, 16(sp)
8000bf26: e2 6c        	ld	s9, 24(sp)
8000bf28: 02 7c        	ld	s8, 32(sp)
8000bf2a: a2 7b        	ld	s7, 40(sp)
8000bf2c: 42 7b        	ld	s6, 48(sp)
8000bf2e: e2 7a        	ld	s5, 56(sp)
8000bf30: 06 6a        	ld	s4, 64(sp)
8000bf32: a6 69        	ld	s3, 72(sp)
8000bf34: 46 69        	ld	s2, 80(sp)
8000bf36: e6 64        	ld	s1, 88(sp)
8000bf38: 06 74        	ld	s0, 96(sp)
8000bf3a: a6 70        	ld	ra, 104(sp)
8000bf3c: 65 61        	addi	sp, sp, 112
8000bf3e: 82 80        	ret
8000bf40: 0c 74        	ld	a1, 40(s0)
8000bf42: 08 70        	ld	a0, 32(s0)
8000bf44: 9c 6d        	ld	a5, 24(a1)
8000bf46: ca 85        	add	a1, zero, s2
8000bf48: 4e 86        	add	a2, zero, s3
8000bf4a: a2 6d        	ld	s11, 8(sp)
8000bf4c: 42 6d        	ld	s10, 16(sp)
8000bf4e: e2 6c        	ld	s9, 24(sp)
8000bf50: 02 7c        	ld	s8, 32(sp)
8000bf52: a2 7b        	ld	s7, 40(sp)
8000bf54: 42 7b        	ld	s6, 48(sp)
8000bf56: e2 7a        	ld	s5, 56(sp)
8000bf58: 06 6a        	ld	s4, 64(sp)
8000bf5a: a6 69        	ld	s3, 72(sp)
8000bf5c: 46 69        	ld	s2, 80(sp)
8000bf5e: e6 64        	ld	s1, 88(sp)
8000bf60: 06 74        	ld	s0, 96(sp)
8000bf62: a6 70        	ld	ra, 104(sp)
8000bf64: 65 61        	addi	sp, sp, 112
8000bf66: 82 87        	jr	a5
8000bf68: 83 6b 44 03  	lwu	s7, 52(s0)
8000bf6c: 13 05 00 03  	addi	a0, zero, 48
8000bf70: 03 4c 84 03  	lbu	s8, 56(s0)
8000bf74: 48 d8        	sw	a0, 52(s0)
8000bf76: 85 4d        	addi	s11, zero, 1
8000bf78: 23 0c b4 03  	sb	s11, 56(s0)
8000bf7c: 22 85        	add	a0, zero, s0
8000bf7e: d2 85        	add	a1, zero, s4
8000bf80: 5a 86        	add	a2, zero, s6
8000bf82: d6 86        	add	a3, zero, s5
8000bf84: 97 00 00 00  	auipc	ra, 0
8000bf88: e7 80 60 10  	jalr	262(ra)
8000bf8c: 51 f9        	bnez	a0, -108 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000bf8e: 03 45 84 03  	lbu	a0, 56(s0)
8000bf92: 85 45        	addi	a1, zero, 1
8000bf94: 8d 46        	addi	a3, zero, 3
8000bf96: 05 46        	addi	a2, zero, 1
8000bf98: 63 03 d5 00  	beq	a0, a3, 6 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x14c>
8000bf9c: 2a 86        	add	a2, zero, a0
8000bf9e: 0d 8a        	andi	a2, a2, 3
8000bfa0: 33 05 9d 41  	sub	a0, s10, s9
8000bfa4: 63 cb c5 00  	blt	a1, a2, 22 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x168>
8000bfa8: 01 ee        	bnez	a2, 24 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x16e>
8000bfaa: aa 8a        	add	s5, zero, a0
8000bfac: 01 45        	mv	a0, zero
8000bfae: 41 a0        	j	128 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1dc>
8000bfb0: 8d 45        	addi	a1, zero, 3
8000bfb2: 63 19 b6 00  	bne	a2, a1, 18 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x172>
8000bfb6: 01 4c        	mv	s8, zero
8000bfb8: 19 a8        	j	22 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x17c>
8000bfba: 8d 45        	addi	a1, zero, 3
8000bfbc: 63 14 b6 06  	bne	a2, a1, 104 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1d2>
8000bfc0: 81 4a        	mv	s5, zero
8000bfc2: b5 a0        	j	108 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1dc>
8000bfc4: 93 05 15 00  	addi	a1, a0, 1
8000bfc8: 05 81        	srli	a0, a0, 1
8000bfca: 13 dc 15 00  	srli	s8, a1, 1
8000bfce: 93 04 15 00  	addi	s1, a0, 1
8000bfd2: fd 14        	addi	s1, s1, -1
8000bfd4: 81 c8        	beqz	s1, 16 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x192>
8000bfd6: 0c 74        	ld	a1, 40(s0)
8000bfd8: 08 70        	ld	a0, 32(s0)
8000bfda: 90 71        	ld	a2, 32(a1)
8000bfdc: 4c 58        	lw	a1, 52(s0)
8000bfde: 02 96        	jalr	a2
8000bfe0: 6d d9        	beqz	a0, -14 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x180>
8000bfe2: 85 a0        	j	96 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1f0>
8000bfe4: 83 6b 44 03  	lwu	s7, 52(s0)
8000bfe8: 22 85        	add	a0, zero, s0
8000bfea: d2 85        	add	a1, zero, s4
8000bfec: 5a 86        	add	a2, zero, s6
8000bfee: d6 86        	add	a3, zero, s5
8000bff0: 97 00 00 00  	auipc	ra, 0
8000bff4: e7 80 a0 09  	jalr	154(ra)
8000bff8: 85 4d        	addi	s11, zero, 1
8000bffa: 1d f1        	bnez	a0, -218 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000bffc: 0c 74        	ld	a1, 40(s0)
8000bffe: 08 70        	ld	a0, 32(s0)
8000c000: 94 6d        	ld	a3, 24(a1)
8000c002: ca 85        	add	a1, zero, s2
8000c004: 4e 86        	add	a2, zero, s3
8000c006: 82 96        	jalr	a3
8000c008: 01 fd        	bnez	a0, -232 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c00a: 03 39 04 02  	ld	s2, 32(s0)
8000c00e: 00 74        	ld	s0, 40(s0)
8000c010: 93 04 1c 00  	addi	s1, s8, 1
8000c014: fd 14        	addi	s1, s1, -1
8000c016: b5 c0        	beqz	s1, 100 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x228>
8000c018: 10 70        	ld	a2, 32(s0)
8000c01a: 4a 85        	add	a0, zero, s2
8000c01c: de 85        	add	a1, zero, s7
8000c01e: 02 96        	jalr	a2
8000c020: 75 d9        	beqz	a0, -12 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1c2>
8000c022: fd bd        	j	-258 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c024: 93 05 15 00  	addi	a1, a0, 1
8000c028: 05 81        	srli	a0, a0, 1
8000c02a: 93 da 15 00  	srli	s5, a1, 1
8000c02e: 93 04 15 00  	addi	s1, a0, 1
8000c032: fd 14        	addi	s1, s1, -1
8000c034: 89 c8        	beqz	s1, 18 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1f4>
8000c036: 0c 74        	ld	a1, 40(s0)
8000c038: 08 70        	ld	a0, 32(s0)
8000c03a: 90 71        	ld	a2, 32(a1)
8000c03c: 4c 58        	lw	a1, 52(s0)
8000c03e: 02 96        	jalr	a2
8000c040: 6d d9        	beqz	a0, -14 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x1e0>
8000c042: 85 4d        	addi	s11, zero, 1
8000c044: f1 bd        	j	-292 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c046: 0c 74        	ld	a1, 40(s0)
8000c048: 03 6a 44 03  	lwu	s4, 52(s0)
8000c04c: 08 70        	ld	a0, 32(s0)
8000c04e: 94 6d        	ld	a3, 24(a1)
8000c050: ca 85        	add	a1, zero, s2
8000c052: 4e 86        	add	a2, zero, s3
8000c054: 82 96        	jalr	a3
8000c056: 85 4d        	addi	s11, zero, 1
8000c058: e3 14 05 ec  	bnez	a0, -312 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c05c: 03 39 04 02  	ld	s2, 32(s0)
8000c060: 83 39 84 02  	ld	s3, 40(s0)
8000c064: 93 84 1a 00  	addi	s1, s5, 1
8000c068: fd 14        	addi	s1, s1, -1
8000c06a: 91 c8        	beqz	s1, 20 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x22c>
8000c06c: 03 b6 09 02  	ld	a2, 32(s3)
8000c070: 4a 85        	add	a0, zero, s2
8000c072: d2 85        	add	a1, zero, s4
8000c074: 02 96        	jalr	a2
8000c076: 6d d9        	beqz	a0, -14 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0x216>
8000c078: 65 b5        	j	-344 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c07a: 81 4d        	mv	s11, zero
8000c07c: 55 b5        	j	-348 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>
8000c07e: 81 4d        	mv	s11, zero
8000c080: 23 2a 74 03  	sw	s7, 52(s0)
8000c084: 23 0c 84 03  	sb	s8, 56(s0)
8000c088: 61 bd        	j	-360 <_ZN4core3fmt9Formatter12pad_integral17h005290bf5c80af87E+0xce>

Disassembly of section .text._ZN4core3fmt9Formatter12pad_integral12write_prefix17h348f9b16d5d85b52E:

000000008000c08a <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h348f9b16d5d85b52E>:
8000c08a: 01 11        	addi	sp, sp, -32
8000c08c: 06 ec        	sd	ra, 24(sp)
8000c08e: 22 e8        	sd	s0, 16(sp)
8000c090: 26 e4        	sd	s1, 8(sp)
8000c092: 4a e0        	sd	s2, 0(sp)
8000c094: 13 97 05 02  	slli	a4, a1, 32
8000c098: 01 93        	srli	a4, a4, 32
8000c09a: b7 07 11 00  	lui	a5, 272
8000c09e: 36 89        	add	s2, zero, a3
8000c0a0: b2 84        	add	s1, zero, a2
8000c0a2: 2a 84        	add	s0, zero, a0
8000c0a4: 63 09 f7 00  	beq	a4, a5, 18 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h348f9b16d5d85b52E+0x2c>
8000c0a8: 10 74        	ld	a2, 40(s0)
8000c0aa: 08 70        	ld	a0, 32(s0)
8000c0ac: 10 72        	ld	a2, 32(a2)
8000c0ae: 02 96        	jalr	a2
8000c0b0: aa 85        	add	a1, zero, a0
8000c0b2: 05 45        	addi	a0, zero, 1
8000c0b4: 91 ed        	bnez	a1, 28 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h348f9b16d5d85b52E+0x46>
8000c0b6: 81 cc        	beqz	s1, 24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h348f9b16d5d85b52E+0x44>
8000c0b8: 0c 74        	ld	a1, 40(s0)
8000c0ba: 08 70        	ld	a0, 32(s0)
8000c0bc: 9c 6d        	ld	a5, 24(a1)
8000c0be: a6 85        	add	a1, zero, s1
8000c0c0: 4a 86        	add	a2, zero, s2
8000c0c2: 02 69        	ld	s2, 0(sp)
8000c0c4: a2 64        	ld	s1, 8(sp)
8000c0c6: 42 64        	ld	s0, 16(sp)
8000c0c8: e2 60        	ld	ra, 24(sp)
8000c0ca: 05 61        	addi	sp, sp, 32
8000c0cc: 82 87        	jr	a5
8000c0ce: 01 45        	mv	a0, zero
8000c0d0: 02 69        	ld	s2, 0(sp)
8000c0d2: a2 64        	ld	s1, 8(sp)
8000c0d4: 42 64        	ld	s0, 16(sp)
8000c0d6: e2 60        	ld	ra, 24(sp)
8000c0d8: 05 61        	addi	sp, sp, 32
8000c0da: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E:

000000008000c0dc <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E>:
8000c0dc: 39 71        	addi	sp, sp, -64
8000c0de: 06 fc        	sd	ra, 56(sp)
8000c0e0: 22 f8        	sd	s0, 48(sp)
8000c0e2: 26 f4        	sd	s1, 40(sp)
8000c0e4: 4a f0        	sd	s2, 32(sp)
8000c0e6: 4e ec        	sd	s3, 24(sp)
8000c0e8: 52 e8        	sd	s4, 16(sp)
8000c0ea: 56 e4        	sd	s5, 8(sp)
8000c0ec: 5a e0        	sd	s6, 0(sp)
8000c0ee: 2a 8b        	add	s6, zero, a0
8000c0f0: 14 69        	ld	a3, 16(a0)
8000c0f2: 08 61        	ld	a0, 0(a0)
8000c0f4: b2 89        	add	s3, zero, a2
8000c0f6: 2e 89        	add	s2, zero, a1
8000c0f8: 93 85 f6 ff  	addi	a1, a3, -1
8000c0fc: 05 46        	addi	a2, zero, 1
8000c0fe: 93 b5 15 00  	seqz	a1, a1
8000c102: 63 14 c5 00  	bne	a0, a2, 8 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x2e>
8000c106: 81 e5        	bnez	a1, 8 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x32>
8000c108: 15 a2        	j	292 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x150>
8000c10a: 63 8b 05 18  	beqz	a1, 406 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1c4>
8000c10e: 83 36 8b 01  	ld	a3, 24(s6)
8000c112: 7d 15        	addi	a0, a0, -1
8000c114: 13 38 15 00  	seqz	a6, a0
8000c118: 33 07 39 01  	add	a4, s2, s3
8000c11c: 81 45        	mv	a1, zero
8000c11e: dd c2        	beqz	a3, 166 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xe8>
8000c120: 7d 5e        	addi	t3, zero, -1
8000c122: 93 03 00 0e  	addi	t2, zero, 224
8000c126: 13 03 00 0f  	addi	t1, zero, 240
8000c12a: b7 08 1c 00  	lui	a7, 448
8000c12e: b7 02 11 00  	lui	t0, 272
8000c132: 4a 85        	add	a0, zero, s2
8000c134: 15 a8        	j	52 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x8c>
8000c136: 03 44 06 00  	lbu	s0, 0(a2)
8000c13a: 93 04 16 00  	addi	s1, a2, 1
8000c13e: 93 7f f4 03  	andi	t6, s0, 63
8000c142: ca 07        	slli	a5, a5, 18
8000c144: b3 f7 17 01  	and	a5, a5, a7
8000c148: 13 14 cf 00  	slli	s0, t5, 12
8000c14c: 13 96 6e 00  	slli	a2, t4, 6
8000c150: c1 8f        	or	a5, a5, s0
8000c152: 5d 8e        	or	a2, a2, a5
8000c154: 33 66 f6 01  	or	a2, a2, t6
8000c158: 63 08 56 0c  	beq	a2, t0, 208 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c15c: 33 85 a4 40  	sub	a0, s1, a0
8000c160: fd 16        	addi	a3, a3, -1
8000c162: aa 95        	add	a1, a1, a0
8000c164: 26 85        	add	a0, zero, s1
8000c166: a5 c2        	beqz	a3, 96 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xea>
8000c168: 63 00 a7 0c  	beq	a4, a0, 192 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c16c: 03 06 05 00  	lb	a2, 0(a0)
8000c170: 93 04 15 00  	addi	s1, a0, 1
8000c174: e3 44 ce fe  	blt	t3, a2, -24 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x80>
8000c178: 93 77 f6 0f  	andi	a5, a2, 255
8000c17c: 63 8c e4 00  	beq	s1, a4, 24 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xb8>
8000c180: 03 46 15 00  	lbu	a2, 1(a0)
8000c184: 93 04 25 00  	addi	s1, a0, 2
8000c188: 13 7f f6 03  	andi	t5, a2, 63
8000c18c: 26 86        	add	a2, zero, s1
8000c18e: e3 e7 77 fc  	bltu	a5, t2, -50 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x80>
8000c192: 29 a0        	j	10 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xc0>
8000c194: 01 4f        	mv	t5, zero
8000c196: 3a 86        	add	a2, zero, a4
8000c198: e3 e2 77 fc  	bltu	a5, t2, -60 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x80>
8000c19c: 63 0c e6 00  	beq	a2, a4, 24 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xd8>
8000c1a0: 03 44 06 00  	lbu	s0, 0(a2)
8000c1a4: 93 04 16 00  	addi	s1, a2, 1
8000c1a8: 93 7e f4 03  	andi	t4, s0, 63
8000c1ac: 26 86        	add	a2, zero, s1
8000c1ae: e3 e7 67 fa  	bltu	a5, t1, -82 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x80>
8000c1b2: 29 a0        	j	10 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xe0>
8000c1b4: 81 4e        	mv	t4, zero
8000c1b6: 3a 86        	add	a2, zero, a4
8000c1b8: e3 e2 67 fa  	bltu	a5, t1, -92 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x80>
8000c1bc: e3 1d e6 f6  	bne	a2, a4, -134 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x5a>
8000c1c0: 81 4f        	mv	t6, zero
8000c1c2: 41 b7        	j	-128 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x66>
8000c1c4: ca 84        	add	s1, zero, s2
8000c1c6: 63 01 97 06  	beq	a4, s1, 98 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c1ca: 03 85 04 00  	lb	a0, 0(s1)
8000c1ce: 7d 56        	addi	a2, zero, -1
8000c1d0: 63 57 a6 02  	bge	a2, a0, 46 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x122>
8000c1d4: 13 b5 15 00  	seqz	a0, a1
8000c1d8: 33 c6 35 01  	xor	a2, a1, s3
8000c1dc: 13 36 16 00  	seqz	a2, a2
8000c1e0: 51 8d        	or	a0, a0, a2
8000c1e2: 19 e9        	bnez	a0, 22 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x11c>
8000c1e4: 63 fe 35 03  	bgeu	a1, s3, 60 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x144>
8000c1e8: 33 05 b9 00  	add	a0, s2, a1
8000c1ec: 03 05 05 00  	lb	a0, 0(a0)
8000c1f0: 13 06 00 fc  	addi	a2, zero, -64
8000c1f4: 63 46 c5 02  	blt	a0, a2, 44 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x144>
8000c1f8: 4a 85        	add	a0, zero, s2
8000c1fa: 0d e5        	bnez	a0, 42 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x148>
8000c1fc: 35 a0        	j	44 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c1fe: 13 86 14 00  	addi	a2, s1, 1
8000c202: 13 75 f5 0f  	andi	a0, a0, 255
8000c206: 63 0d e6 12  	beq	a2, a4, 314 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x264>
8000c20a: 83 c6 14 00  	lbu	a3, 1(s1)
8000c20e: 13 86 24 00  	addi	a2, s1, 2
8000c212: 93 f6 f6 03  	andi	a3, a3, 63
8000c216: 93 07 00 0e  	addi	a5, zero, 224
8000c21a: 63 79 f5 12  	bgeu	a0, a5, 306 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x270>
8000c21e: 5d bf        	j	-74 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xf8>
8000c220: 01 45        	mv	a0, zero
8000c222: 19 c1        	beqz	a0, 6 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c224: 2a 89        	add	s2, zero, a0
8000c226: ae 89        	add	s3, zero, a1
8000c228: 63 0c 08 06  	beqz	a6, 120 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1c4>
8000c22c: 63 85 09 04  	beqz	s3, 74 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x19a>
8000c230: 81 45        	mv	a1, zero
8000c232: 4e 85        	add	a0, zero, s3
8000c234: 4a 86        	add	a2, zero, s2
8000c236: 83 46 06 00  	lbu	a3, 0(a2)
8000c23a: 05 06        	addi	a2, a2, 1
8000c23c: 93 f6 06 0c  	andi	a3, a3, 192
8000c240: 93 86 06 f8  	addi	a3, a3, -128
8000c244: b3 36 d0 00  	snez	a3, a3
8000c248: 7d 15        	addi	a0, a0, -1
8000c24a: b6 95        	add	a1, a1, a3
8000c24c: 6d f5        	bnez	a0, -22 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x15a>
8000c24e: 03 35 8b 00  	ld	a0, 8(s6)
8000c252: 63 f7 a5 04  	bgeu	a1, a0, 78 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1c4>
8000c256: 81 45        	mv	a1, zero
8000c258: 4e 86        	add	a2, zero, s3
8000c25a: ca 86        	add	a3, zero, s2
8000c25c: 03 c7 06 00  	lbu	a4, 0(a3)
8000c260: 85 06        	addi	a3, a3, 1
8000c262: 13 77 07 0c  	andi	a4, a4, 192
8000c266: 13 07 07 f8  	addi	a4, a4, -128
8000c26a: 33 37 e0 00  	snez	a4, a4
8000c26e: 7d 16        	addi	a2, a2, -1
8000c270: ba 95        	add	a1, a1, a4
8000c272: 6d f6        	bnez	a2, -22 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x180>
8000c274: 29 a0        	j	10 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1a2>
8000c276: 03 35 8b 00  	ld	a0, 8(s6)
8000c27a: 81 45        	mv	a1, zero
8000c27c: 15 c1        	beqz	a0, 36 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1c4>
8000c27e: 03 46 8b 03  	lbu	a2, 56(s6)
8000c282: 0d 47        	addi	a4, zero, 3
8000c284: 81 46        	mv	a3, zero
8000c286: 63 03 e6 00  	beq	a2, a4, 6 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1b0>
8000c28a: b2 86        	add	a3, zero, a2
8000c28c: 13 f6 36 00  	andi	a2, a3, 3
8000c290: 85 46        	addi	a3, zero, 1
8000c292: 0d 8d        	sub	a0, a0, a1
8000c294: 63 c7 c6 02  	blt	a3, a2, 46 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1e6>
8000c298: 05 ea        	bnez	a2, 48 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1ec>
8000c29a: aa 8a        	add	s5, zero, a0
8000c29c: 01 45        	mv	a0, zero
8000c29e: 25 a8        	j	56 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1fa>
8000c2a0: 83 35 8b 02  	ld	a1, 40(s6)
8000c2a4: 03 35 0b 02  	ld	a0, 32(s6)
8000c2a8: 9c 6d        	ld	a5, 24(a1)
8000c2aa: ca 85        	add	a1, zero, s2
8000c2ac: 4e 86        	add	a2, zero, s3
8000c2ae: 02 6b        	ld	s6, 0(sp)
8000c2b0: a2 6a        	ld	s5, 8(sp)
8000c2b2: 42 6a        	ld	s4, 16(sp)
8000c2b4: e2 69        	ld	s3, 24(sp)
8000c2b6: 02 79        	ld	s2, 32(sp)
8000c2b8: a2 74        	ld	s1, 40(sp)
8000c2ba: 42 74        	ld	s0, 48(sp)
8000c2bc: e2 70        	ld	ra, 56(sp)
8000c2be: 21 61        	addi	sp, sp, 64
8000c2c0: 82 87        	jr	a5
8000c2c2: 8d 45        	addi	a1, zero, 3
8000c2c4: 63 14 b6 00  	bne	a2, a1, 8 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1f0>
8000c2c8: 81 4a        	mv	s5, zero
8000c2ca: 31 a0        	j	12 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1fa>
8000c2cc: 93 05 15 00  	addi	a1, a0, 1
8000c2d0: 05 81        	srli	a0, a0, 1
8000c2d2: 93 da 15 00  	srli	s5, a1, 1
8000c2d6: 93 04 15 00  	addi	s1, a0, 1
8000c2da: fd 14        	addi	s1, s1, -1
8000c2dc: 81 cc        	beqz	s1, 24 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x218>
8000c2de: 83 35 8b 02  	ld	a1, 40(s6)
8000c2e2: 03 35 0b 02  	ld	a0, 32(s6)
8000c2e6: 90 71        	ld	a2, 32(a1)
8000c2e8: 83 25 4b 03  	lw	a1, 52(s6)
8000c2ec: 02 96        	jalr	a2
8000c2ee: 75 d5        	beqz	a0, -20 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x1fe>
8000c2f0: 05 49        	addi	s2, zero, 1
8000c2f2: 25 a8        	j	56 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x24e>
8000c2f4: 83 35 8b 02  	ld	a1, 40(s6)
8000c2f8: 03 6a 4b 03  	lwu	s4, 52(s6)
8000c2fc: 03 35 0b 02  	ld	a0, 32(s6)
8000c300: 94 6d        	ld	a3, 24(a1)
8000c302: ca 85        	add	a1, zero, s2
8000c304: 4e 86        	add	a2, zero, s3
8000c306: 82 96        	jalr	a3
8000c308: 05 49        	addi	s2, zero, 1
8000c30a: 05 e1        	bnez	a0, 32 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x24e>
8000c30c: 83 39 0b 02  	ld	s3, 32(s6)
8000c310: 03 34 8b 02  	ld	s0, 40(s6)
8000c314: 93 84 1a 00  	addi	s1, s5, 1
8000c318: fd 14        	addi	s1, s1, -1
8000c31a: 99 c4        	beqz	s1, 14 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x24c>
8000c31c: 10 70        	ld	a2, 32(s0)
8000c31e: 4e 85        	add	a0, zero, s3
8000c320: d2 85        	add	a1, zero, s4
8000c322: 02 96        	jalr	a2
8000c324: 75 d9        	beqz	a0, -12 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x23c>
8000c326: 11 a0        	j	4 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x24e>
8000c328: 01 49        	mv	s2, zero
8000c32a: 4a 85        	add	a0, zero, s2
8000c32c: 02 6b        	ld	s6, 0(sp)
8000c32e: a2 6a        	ld	s5, 8(sp)
8000c330: 42 6a        	ld	s4, 16(sp)
8000c332: e2 69        	ld	s3, 24(sp)
8000c334: 02 79        	ld	s2, 32(sp)
8000c336: a2 74        	ld	s1, 40(sp)
8000c338: 42 74        	ld	s0, 48(sp)
8000c33a: e2 70        	ld	ra, 56(sp)
8000c33c: 21 61        	addi	sp, sp, 64
8000c33e: 82 80        	ret
8000c340: 81 46        	mv	a3, zero
8000c342: 3a 86        	add	a2, zero, a4
8000c344: 93 07 00 0e  	addi	a5, zero, 224
8000c348: e3 66 f5 e8  	bltu	a0, a5, -372 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xf8>
8000c34c: 63 0d e6 00  	beq	a2, a4, 26 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x28a>
8000c350: 83 44 06 00  	lbu	s1, 0(a2)
8000c354: 93 07 16 00  	addi	a5, a2, 1
8000c358: 13 f6 f4 03  	andi	a2, s1, 63
8000c35c: 93 04 00 0f  	addi	s1, zero, 240
8000c360: 63 79 95 00  	bgeu	a0, s1, 18 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x296>
8000c364: 85 bd        	j	-400 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xf8>
8000c366: 01 46        	mv	a2, zero
8000c368: ba 87        	add	a5, zero, a4
8000c36a: 93 04 00 0f  	addi	s1, zero, 240
8000c36e: e3 63 95 e6  	bltu	a0, s1, -410 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xf8>
8000c372: 63 87 e7 00  	beq	a5, a4, 14 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x2a4>
8000c376: 03 c7 07 00  	lbu	a4, 0(a5)
8000c37a: 13 77 f7 03  	andi	a4, a4, 63
8000c37e: 11 a0        	j	4 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x2a6>
8000c380: 01 47        	mv	a4, zero
8000c382: 4a 05        	slli	a0, a0, 18
8000c384: b7 07 1c 00  	lui	a5, 448
8000c388: 7d 8d        	and	a0, a0, a5
8000c38a: b2 06        	slli	a3, a3, 12
8000c38c: 1a 06        	slli	a2, a2, 6
8000c38e: 55 8d        	or	a0, a0, a3
8000c390: 51 8d        	or	a0, a0, a2
8000c392: 59 8d        	or	a0, a0, a4
8000c394: 37 06 11 00  	lui	a2, 272
8000c398: e3 08 c5 e8  	beq	a0, a2, -368 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0x14c>
8000c39c: 25 bd        	j	-456 <_ZN4core3fmt9Formatter3pad17hcc8646e0ded6ea87E+0xf8>

Disassembly of section .text._ZN4core3fmt9Formatter15debug_lower_hex17hffada68515a2cdf7E:

000000008000c39e <_ZN4core3fmt9Formatter15debug_lower_hex17hffada68515a2cdf7E>:
8000c39e: 03 45 05 03  	lbu	a0, 48(a0)
8000c3a2: 41 89        	andi	a0, a0, 16
8000c3a4: 11 81        	srli	a0, a0, 4
8000c3a6: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Formatter15debug_upper_hex17h3e8dade1475f5ac4E:

000000008000c3a8 <_ZN4core3fmt9Formatter15debug_upper_hex17h3e8dade1475f5ac4E>:
8000c3a8: 03 45 05 03  	lbu	a0, 48(a0)
8000c3ac: 13 75 05 02  	andi	a0, a0, 32
8000c3b0: 15 81        	srli	a0, a0, 5
8000c3b2: 82 80        	ret

Disassembly of section .text._ZN4core3fmt9Formatter11debug_tuple17h33e702ebb7966d6cE:

000000008000c3b4 <_ZN4core3fmt9Formatter11debug_tuple17h33e702ebb7966d6cE>:
8000c3b4: 01 11        	addi	sp, sp, -32
8000c3b6: 06 ec        	sd	ra, 24(sp)
8000c3b8: 22 e8        	sd	s0, 16(sp)
8000c3ba: 26 e4        	sd	s1, 8(sp)
8000c3bc: 4a e0        	sd	s2, 0(sp)
8000c3be: 2e 84        	add	s0, zero, a1
8000c3c0: 98 75        	ld	a4, 40(a1)
8000c3c2: 8c 71        	ld	a1, 32(a1)
8000c3c4: 18 6f        	ld	a4, 24(a4)
8000c3c6: 36 89        	add	s2, zero, a3
8000c3c8: aa 84        	add	s1, zero, a0
8000c3ca: 2e 85        	add	a0, zero, a1
8000c3cc: b2 85        	add	a1, zero, a2
8000c3ce: 36 86        	add	a2, zero, a3
8000c3d0: 02 97        	jalr	a4
8000c3d2: 93 35 19 00  	seqz	a1, s2
8000c3d6: 80 e0        	sd	s0, 0(s1)
8000c3d8: 23 88 a4 00  	sb	a0, 16(s1)
8000c3dc: 23 b4 04 00  	sd	zero, 8(s1)
8000c3e0: a3 88 b4 00  	sb	a1, 17(s1)
8000c3e4: 02 69        	ld	s2, 0(sp)
8000c3e6: a2 64        	ld	s1, 8(sp)
8000c3e8: 42 64        	ld	s0, 16(sp)
8000c3ea: e2 60        	ld	ra, 24(sp)
8000c3ec: 05 61        	addi	sp, sp, 32
8000c3ee: 82 80        	ret

Disassembly of section .text._ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h669958e415ffd666E:

000000008000c3f0 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h669958e415ffd666E>:
8000c3f0: ae 86        	add	a3, zero, a1
8000c3f2: aa 85        	add	a1, zero, a0
8000c3f4: 32 85        	add	a0, zero, a2
8000c3f6: 36 86        	add	a2, zero, a3
8000c3f8: 17 03 00 00  	auipc	t1, 0
8000c3fc: 67 00 43 ce  	jr	-796(t1)

Disassembly of section .text._ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E:

000000008000c400 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E>:
8000c400: 59 71        	addi	sp, sp, -112
8000c402: 86 f4        	sd	ra, 104(sp)
8000c404: a2 f0        	sd	s0, 96(sp)
8000c406: a6 ec        	sd	s1, 88(sp)
8000c408: ca e8        	sd	s2, 80(sp)
8000c40a: ce e4        	sd	s3, 72(sp)
8000c40c: d2 e0        	sd	s4, 64(sp)
8000c40e: 56 fc        	sd	s5, 56(sp)
8000c410: 5a f8        	sd	s6, 48(sp)
8000c412: 5e f4        	sd	s7, 40(sp)
8000c414: 62 f0        	sd	s8, 32(sp)
8000c416: 66 ec        	sd	s9, 24(sp)
8000c418: 6a e8        	sd	s10, 16(sp)
8000c41a: 6e e4        	sd	s11, 8(sp)
8000c41c: 2e 84        	add	s0, zero, a1
8000c41e: 8c 75        	ld	a1, 40(a1)
8000c420: 10 70        	ld	a2, 32(s0)
8000c422: 94 71        	ld	a3, 32(a1)
8000c424: aa 84        	add	s1, zero, a0
8000c426: 93 05 70 02  	addi	a1, zero, 39
8000c42a: 32 85        	add	a0, zero, a2
8000c42c: 82 96        	jalr	a3
8000c42e: 0d c1        	beqz	a0, 34 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x50>
8000c430: 05 45        	addi	a0, zero, 1
8000c432: a2 6d        	ld	s11, 8(sp)
8000c434: 42 6d        	ld	s10, 16(sp)
8000c436: e2 6c        	ld	s9, 24(sp)
8000c438: 02 7c        	ld	s8, 32(sp)
8000c43a: a2 7b        	ld	s7, 40(sp)
8000c43c: 42 7b        	ld	s6, 48(sp)
8000c43e: e2 7a        	ld	s5, 56(sp)
8000c440: 06 6a        	ld	s4, 64(sp)
8000c442: a6 69        	ld	s3, 72(sp)
8000c444: 46 69        	ld	s2, 80(sp)
8000c446: e6 64        	ld	s1, 88(sp)
8000c448: 06 74        	ld	s0, 96(sp)
8000c44a: a6 70        	ld	ra, 104(sp)
8000c44c: 65 61        	addi	sp, sp, 112
8000c44e: 82 80        	ret
8000c450: 83 ea 04 00  	lwu	s5, 0(s1)
8000c454: 13 05 10 02  	addi	a0, zero, 33
8000c458: 89 44        	addi	s1, zero, 2
8000c45a: 63 4e 55 01  	blt	a0, s5, 28 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x76>
8000c45e: 25 45        	addi	a0, zero, 9
8000c460: 63 87 aa 04  	beq	s5, a0, 78 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xae>
8000c464: 29 45        	addi	a0, zero, 10
8000c466: 63 87 aa 04  	beq	s5, a0, 78 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb4>
8000c46a: 35 45        	addi	a0, zero, 13
8000c46c: 63 91 aa 02  	bne	s5, a0, 34 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x8e>
8000c470: 93 0a 20 07  	addi	s5, zero, 114
8000c474: 91 a0        	j	68 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c476: 13 05 20 02  	addi	a0, zero, 34
8000c47a: 63 8f aa 02  	beq	s5, a0, 62 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c47e: 13 05 70 02  	addi	a0, zero, 39
8000c482: 63 8b aa 02  	beq	s5, a0, 54 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c486: 13 05 c0 05  	addi	a0, zero, 92
8000c48a: 63 87 aa 02  	beq	s5, a0, 46 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c48e: 56 85        	add	a0, zero, s5
8000c490: 97 10 00 00  	auipc	ra, 1
8000c494: e7 80 00 02  	jalr	32(ra)
8000c498: 63 1b 05 10  	bnez	a0, 278 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x1ae>
8000c49c: 56 85        	add	a0, zero, s5
8000c49e: 97 00 00 00  	auipc	ra, 0
8000c4a2: e7 80 80 67  	jalr	1656(ra)
8000c4a6: 63 04 05 10  	beqz	a0, 264 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x1ae>
8000c4aa: 85 44        	addi	s1, zero, 1
8000c4ac: 31 a0        	j	12 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c4ae: 93 0a 40 07  	addi	s5, zero, 116
8000c4b2: 19 a0        	j	6 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>
8000c4b4: 93 0a e0 06  	addi	s5, zero, 110
8000c4b8: 09 4a        	addi	s4, zero, 2
8000c4ba: 05 4b        	addi	s6, zero, 1
8000c4bc: 13 05 10 f0  	addi	a0, zero, -255
8000c4c0: 02 15        	slli	a0, a0, 32
8000c4c2: 93 0b f5 ff  	addi	s7, a0, -1
8000c4c6: 29 4c        	addi	s8, zero, 10
8000c4c8: 93 1c 0b 02  	slli	s9, s6, 32
8000c4cc: 0d 4d        	addi	s10, zero, 3
8000c4ce: 93 1d 1b 02  	slli	s11, s6, 33
8000c4d2: 11 49        	addi	s2, zero, 4
8000c4d4: 39 a0        	j	14 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xe2>
8000c4d6: 85 44        	addi	s1, zero, 1
8000c4d8: 10 74        	ld	a2, 40(s0)
8000c4da: 08 70        	ld	a0, 32(s0)
8000c4dc: 10 72        	ld	a2, 32(a2)
8000c4de: 02 96        	jalr	a2
8000c4e0: 21 f9        	bnez	a0, -176 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x30>
8000c4e2: 13 95 04 02  	slli	a0, s1, 32
8000c4e6: 01 91        	srli	a0, a0, 32
8000c4e8: 63 46 ab 00  	blt	s6, a0, 12 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xf4>
8000c4ec: 49 cd        	beqz	a0, 154 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x186>
8000c4ee: 81 44        	mv	s1, zero
8000c4f0: d6 85        	add	a1, zero, s5
8000c4f2: dd b7        	j	-26 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c4f4: 93 05 c0 05  	addi	a1, zero, 92
8000c4f8: e3 0f 45 fd  	beq	a0, s4, -34 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd6>
8000c4fc: 13 d5 09 02  	srli	a0, s3, 32
8000c500: 13 75 f5 0f  	andi	a0, a0, 255
8000c504: 63 4b aa 00  	blt	s4, a0, 22 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x11a>
8000c508: 3d cd        	beqz	a0, 126 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x186>
8000c50a: 63 16 65 03  	bne	a0, s6, 44 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x136>
8000c50e: b3 f9 79 01  	and	s3, s3, s7
8000c512: 8d 44        	addi	s1, zero, 3
8000c514: 93 05 d0 07  	addi	a1, zero, 125
8000c518: c1 b7        	j	-64 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c51a: 63 00 a5 05  	beq	a0, s10, 64 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x15a>
8000c51e: 63 16 25 05  	bne	a0, s2, 76 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x16a>
8000c522: 33 f5 79 01  	and	a0, s3, s7
8000c526: 8d 44        	addi	s1, zero, 3
8000c528: 93 95 04 02  	slli	a1, s1, 32
8000c52c: b3 69 b5 00  	or	s3, a0, a1
8000c530: 93 05 50 07  	addi	a1, zero, 117
8000c534: 55 b7        	j	-92 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c536: 02 66        	ld	a2, 0(sp)
8000c538: 13 15 26 00  	slli	a0, a2, 2
8000c53c: 3b d5 a9 00  	srlw	a0, s3, a0
8000c540: 3d 89        	andi	a0, a0, 15
8000c542: 93 05 00 03  	addi	a1, zero, 48
8000c546: 63 64 85 01  	bltu	a0, s8, 8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x14e>
8000c54a: 93 05 70 05  	addi	a1, zero, 87
8000c54e: aa 95        	add	a1, a1, a0
8000c550: 0d c6        	beqz	a2, 42 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0x17a>
8000c552: 7d 16        	addi	a2, a2, -1
8000c554: 32 e0        	sd	a2, 0(sp)
8000c556: 8d 44        	addi	s1, zero, 3
8000c558: 41 b7        	j	-128 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c55a: 33 f5 79 01  	and	a0, s3, s7
8000c55e: b3 69 b5 01  	or	s3, a0, s11
8000c562: 8d 44        	addi	s1, zero, 3
8000c564: 93 05 b0 07  	addi	a1, zero, 123
8000c568: 85 bf        	j	-144 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c56a: 33 f5 79 01  	and	a0, s3, s7
8000c56e: 13 16 2b 02  	slli	a2, s6, 34
8000c572: b3 69 c5 00  	or	s3, a0, a2
8000c576: 8d 44        	addi	s1, zero, 3
8000c578: 85 b7        	j	-160 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c57a: 33 f5 79 01  	and	a0, s3, s7
8000c57e: b3 69 95 01  	or	s3, a0, s9
8000c582: 8d 44        	addi	s1, zero, 3
8000c584: 91 bf        	j	-172 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xd8>
8000c586: 0c 74        	ld	a1, 40(s0)
8000c588: 08 70        	ld	a0, 32(s0)
8000c58a: 9c 71        	ld	a5, 32(a1)
8000c58c: 93 05 70 02  	addi	a1, zero, 39
8000c590: a2 6d        	ld	s11, 8(sp)
8000c592: 42 6d        	ld	s10, 16(sp)
8000c594: e2 6c        	ld	s9, 24(sp)
8000c596: 02 7c        	ld	s8, 32(sp)
8000c598: a2 7b        	ld	s7, 40(sp)
8000c59a: 42 7b        	ld	s6, 48(sp)
8000c59c: e2 7a        	ld	s5, 56(sp)
8000c59e: 06 6a        	ld	s4, 64(sp)
8000c5a0: a6 69        	ld	s3, 72(sp)
8000c5a2: 46 69        	ld	s2, 80(sp)
8000c5a4: e6 64        	ld	s1, 88(sp)
8000c5a6: 06 74        	ld	s0, 96(sp)
8000c5a8: a6 70        	ld	ra, 104(sp)
8000c5aa: 65 61        	addi	sp, sp, 112
8000c5ac: 82 87        	jr	a5
8000c5ae: 13 e5 1a 00  	ori	a0, s5, 1
8000c5b2: 93 55 15 00  	srli	a1, a0, 1
8000c5b6: 4d 8d        	or	a0, a0, a1
8000c5b8: 93 55 25 00  	srli	a1, a0, 2
8000c5bc: 4d 8d        	or	a0, a0, a1
8000c5be: 93 55 45 00  	srli	a1, a0, 4
8000c5c2: 4d 8d        	or	a0, a0, a1
8000c5c4: 93 55 85 00  	srli	a1, a0, 8
8000c5c8: 4d 8d        	or	a0, a0, a1
8000c5ca: 93 55 05 01  	srli	a1, a0, 16
8000c5ce: 4d 8d        	or	a0, a0, a1
8000c5d0: 93 55 05 02  	srli	a1, a0, 32
8000c5d4: 4d 8d        	or	a0, a0, a1
8000c5d6: 13 45 f5 ff  	not	a0, a0
8000c5da: 93 55 15 00  	srli	a1, a0, 1
8000c5de: 37 56 55 05  	lui	a2, 21845
8000c5e2: 1b 06 56 55  	addiw	a2, a2, 1365
8000c5e6: 32 06        	slli	a2, a2, 12
8000c5e8: 13 06 56 55  	addi	a2, a2, 1365
8000c5ec: 32 06        	slli	a2, a2, 12
8000c5ee: 13 06 56 55  	addi	a2, a2, 1365
8000c5f2: 32 06        	slli	a2, a2, 12
8000c5f4: 13 06 56 55  	addi	a2, a2, 1365
8000c5f8: f1 8d        	and	a1, a1, a2
8000c5fa: 0d 8d        	sub	a0, a0, a1
8000c5fc: b7 35 33 03  	lui	a1, 13107
8000c600: 9b 85 35 33  	addiw	a1, a1, 819
8000c604: b2 05        	slli	a1, a1, 12
8000c606: 93 85 35 33  	addi	a1, a1, 819
8000c60a: b2 05        	slli	a1, a1, 12
8000c60c: 93 85 35 33  	addi	a1, a1, 819
8000c610: b2 05        	slli	a1, a1, 12
8000c612: 93 85 35 33  	addi	a1, a1, 819
8000c616: 33 76 b5 00  	and	a2, a0, a1
8000c61a: 09 81        	srli	a0, a0, 2
8000c61c: 6d 8d        	and	a0, a0, a1
8000c61e: 32 95        	add	a0, a0, a2
8000c620: 93 55 45 00  	srli	a1, a0, 4
8000c624: 2e 95        	add	a0, a0, a1
8000c626: b7 f5 f0 00  	lui	a1, 3855
8000c62a: 9b 85 15 0f  	addiw	a1, a1, 241
8000c62e: b2 05        	slli	a1, a1, 12
8000c630: 93 85 f5 f0  	addi	a1, a1, -241
8000c634: b2 05        	slli	a1, a1, 12
8000c636: 93 85 15 0f  	addi	a1, a1, 241
8000c63a: b2 05        	slli	a1, a1, 12
8000c63c: 93 85 f5 f0  	addi	a1, a1, -241
8000c640: 6d 8d        	and	a0, a0, a1
8000c642: b7 05 01 01  	lui	a1, 4112
8000c646: 9b 85 15 10  	addiw	a1, a1, 257
8000c64a: c2 05        	slli	a1, a1, 16
8000c64c: 93 85 15 10  	addi	a1, a1, 257
8000c650: c2 05        	slli	a1, a1, 16
8000c652: 93 85 15 10  	addi	a1, a1, 257
8000c656: 33 05 b5 02  	<unknown>
8000c65a: 61 91        	srli	a0, a0, 56
8000c65c: 01 15        	addi	a0, a0, -32
8000c65e: 1b 55 25 00  	srliw	a0, a0, 2
8000c662: 13 45 75 00  	xori	a0, a0, 7
8000c666: 2a e0        	sd	a0, 0(sp)
8000c668: 15 45        	addi	a0, zero, 5
8000c66a: 02 15        	slli	a0, a0, 32
8000c66c: b3 e9 aa 00  	or	s3, s5, a0
8000c670: 8d 44        	addi	s1, zero, 3
8000c672: 99 b5        	j	-442 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hebe9382637ae1ba8E+0xb8>

Disassembly of section .text._ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E:

000000008000c674 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E>:
8000c674: 41 11        	addi	sp, sp, -16
8000c676: 06 e4        	sd	ra, 8(sp)
8000c678: 93 86 75 00  	addi	a3, a1, 7
8000c67c: e1 9a        	andi	a3, a3, -8
8000c67e: 8d 8e        	sub	a3, a3, a1
8000c680: 13 78 f5 0f  	andi	a6, a0, 255
8000c684: 8d c6        	beqz	a3, 42 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x3a>
8000c686: 32 85        	add	a0, zero, a2
8000c688: 63 63 d6 00  	bltu	a2, a3, 6 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x1a>
8000c68c: 36 85        	add	a0, zero, a3
8000c68e: 05 c1        	beqz	a0, 32 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x3a>
8000c690: 81 46        	mv	a3, zero
8000c692: 33 87 d5 00  	add	a4, a1, a3
8000c696: 03 47 07 00  	lbu	a4, 0(a4)
8000c69a: 63 04 07 0d  	beq	a4, a6, 200 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xee>
8000c69e: 85 06        	addi	a3, a3, 1
8000c6a0: e3 19 d5 fe  	bne	a0, a3, -14 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x1e>
8000c6a4: 93 08 06 ff  	addi	a7, a2, -16
8000c6a8: 63 f6 a8 00  	bgeu	a7, a0, 12 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x40>
8000c6ac: 49 a0        	j	130 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xba>
8000c6ae: 01 45        	mv	a0, zero
8000c6b0: 93 08 06 ff  	addi	a7, a2, -16
8000c6b4: b7 06 ff fe  	lui	a3, 1044464
8000c6b8: 9b 86 f6 ef  	addiw	a3, a3, -257
8000c6bc: c2 06        	slli	a3, a3, 16
8000c6be: 93 86 f6 ef  	addi	a3, a3, -257
8000c6c2: c2 06        	slli	a3, a3, 16
8000c6c4: 93 82 f6 ef  	addi	t0, a3, -257
8000c6c8: c1 76        	lui	a3, 1048560
8000c6ca: 9b 86 16 10  	addiw	a3, a3, 257
8000c6ce: c2 06        	slli	a3, a3, 16
8000c6d0: 93 86 16 10  	addi	a3, a3, 257
8000c6d4: c2 06        	slli	a3, a3, 16
8000c6d6: 93 86 16 10  	addi	a3, a3, 257
8000c6da: be 06        	slli	a3, a3, 15
8000c6dc: 13 83 06 08  	addi	t1, a3, 128
8000c6e0: b7 06 01 01  	lui	a3, 4112
8000c6e4: 9b 86 16 10  	addiw	a3, a3, 257
8000c6e8: c2 06        	slli	a3, a3, 16
8000c6ea: 93 86 16 10  	addi	a3, a3, 257
8000c6ee: c2 06        	slli	a3, a3, 16
8000c6f0: 93 86 16 10  	addi	a3, a3, 257
8000c6f4: b3 03 d8 02  	<unknown>
8000c6f8: b3 87 a5 00  	add	a5, a1, a0
8000c6fc: 98 63        	ld	a4, 0(a5)
8000c6fe: 9c 67        	ld	a5, 8(a5)
8000c700: 33 47 77 00  	xor	a4, a4, t2
8000c704: 93 46 f7 ff  	not	a3, a4
8000c708: 16 97        	add	a4, a4, t0
8000c70a: b3 f6 66 00  	and	a3, a3, t1
8000c70e: f9 8e        	and	a3, a3, a4
8000c710: 33 c7 77 00  	xor	a4, a5, t2
8000c714: 93 47 f7 ff  	not	a5, a4
8000c718: 16 97        	add	a4, a4, t0
8000c71a: b3 f7 67 00  	and	a5, a5, t1
8000c71e: 7d 8f        	and	a4, a4, a5
8000c720: d9 8e        	or	a3, a3, a4
8000c722: 81 e6        	bnez	a3, 8 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xb6>
8000c724: 41 05        	addi	a0, a0, 16
8000c726: e3 f9 a8 fc  	bgeu	a7, a0, -46 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0x84>
8000c72a: 63 6e a6 02  	bltu	a2, a0, 60 <.LBB203_24>
8000c72e: 81 46        	mv	a3, zero
8000c730: 63 14 c5 00  	bne	a0, a2, 8 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xc4>
8000c734: 81 45        	mv	a1, zero
8000c736: 05 a0        	j	32 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xe2>
8000c738: 09 8e        	sub	a2, a2, a0
8000c73a: aa 95        	add	a1, a1, a0
8000c73c: 33 87 d5 00  	add	a4, a1, a3
8000c740: 03 47 07 00  	lbu	a4, 0(a4)
8000c744: 63 08 07 01  	beq	a4, a6, 16 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xe0>
8000c748: 85 06        	addi	a3, a3, 1
8000c74a: e3 19 d6 fe  	bne	a2, a3, -14 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xc8>
8000c74e: 81 45        	mv	a1, zero
8000c750: b2 86        	add	a3, zero, a2
8000c752: 11 a0        	j	4 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xe2>
8000c754: 85 45        	addi	a1, zero, 1
8000c756: aa 96        	add	a3, a3, a0
8000c758: 2e 85        	add	a0, zero, a1
8000c75a: b6 85        	add	a1, zero, a3
8000c75c: a2 60        	ld	ra, 8(sp)
8000c75e: 41 01        	addi	sp, sp, 16
8000c760: 82 80        	ret
8000c762: 85 45        	addi	a1, zero, 1
8000c764: d5 bf        	j	-12 <_ZN4core5slice6memchr19memchr_general_case17h70a7e3c60d21a994E+0xe4>

000000008000c766 <.LBB203_24>:
8000c766: 97 46 00 00  	auipc	a3, 4
8000c76a: 93 86 a6 d9  	addi	a3, a3, -614
8000c76e: b2 85        	add	a1, zero, a2
8000c770: 36 86        	add	a2, zero, a3
8000c772: 97 00 00 00  	auipc	ra, 0
8000c776: e7 80 a0 00  	jalr	10(ra)
8000c77a: 00 00        	unimp	

Disassembly of section .text._ZN4core5slice5index26slice_start_index_len_fail17h43348ae2a84bde06E:

000000008000c77c <_ZN4core5slice5index26slice_start_index_len_fail17h43348ae2a84bde06E>:
8000c77c: 59 71        	addi	sp, sp, -112
8000c77e: 86 f4        	sd	ra, 104(sp)
8000c780: 2a e4        	sd	a0, 8(sp)
8000c782: 2e e8        	sd	a1, 16(sp)
8000c784: 28 00        	addi	a0, sp, 8
8000c786: aa e4        	sd	a0, 72(sp)

000000008000c788 <.LBB205_1>:
8000c788: 17 15 00 00  	auipc	a0, 1
8000c78c: 13 05 85 ae  	addi	a0, a0, -1304
8000c790: aa e8        	sd	a0, 80(sp)
8000c792: 0c 08        	addi	a1, sp, 16
8000c794: ae ec        	sd	a1, 88(sp)
8000c796: aa f0        	sd	a0, 96(sp)

000000008000c798 <.LBB205_2>:
8000c798: 17 45 00 00  	auipc	a0, 4
8000c79c: 13 05 85 db  	addi	a0, a0, -584
8000c7a0: 2a ec        	sd	a0, 24(sp)
8000c7a2: 09 45        	addi	a0, zero, 2
8000c7a4: 2a f0        	sd	a0, 32(sp)
8000c7a6: 02 f4        	sd	zero, 40(sp)
8000c7a8: ac 00        	addi	a1, sp, 72
8000c7aa: 2e fc        	sd	a1, 56(sp)
8000c7ac: aa e0        	sd	a0, 64(sp)
8000c7ae: 28 08        	addi	a0, sp, 24
8000c7b0: b2 85        	add	a1, zero, a2
8000c7b2: 97 f0 ff ff  	auipc	ra, 1048575
8000c7b6: e7 80 40 ff  	jalr	-12(ra)
8000c7ba: 00 00        	unimp	

Disassembly of section .text._ZN4core5slice5index24slice_end_index_len_fail17h397499141087200aE:

000000008000c7bc <_ZN4core5slice5index24slice_end_index_len_fail17h397499141087200aE>:
8000c7bc: 59 71        	addi	sp, sp, -112
8000c7be: 86 f4        	sd	ra, 104(sp)
8000c7c0: 2a e4        	sd	a0, 8(sp)
8000c7c2: 2e e8        	sd	a1, 16(sp)
8000c7c4: 28 00        	addi	a0, sp, 8
8000c7c6: aa e4        	sd	a0, 72(sp)

000000008000c7c8 <.LBB206_1>:
8000c7c8: 17 15 00 00  	auipc	a0, 1
8000c7cc: 13 05 85 aa  	addi	a0, a0, -1368
8000c7d0: aa e8        	sd	a0, 80(sp)
8000c7d2: 0c 08        	addi	a1, sp, 16
8000c7d4: ae ec        	sd	a1, 88(sp)
8000c7d6: aa f0        	sd	a0, 96(sp)

000000008000c7d8 <.LBB206_2>:
8000c7d8: 17 45 00 00  	auipc	a0, 4
8000c7dc: 13 05 85 d9  	addi	a0, a0, -616
8000c7e0: 2a ec        	sd	a0, 24(sp)
8000c7e2: 09 45        	addi	a0, zero, 2
8000c7e4: 2a f0        	sd	a0, 32(sp)
8000c7e6: 02 f4        	sd	zero, 40(sp)
8000c7e8: ac 00        	addi	a1, sp, 72
8000c7ea: 2e fc        	sd	a1, 56(sp)
8000c7ec: aa e0        	sd	a0, 64(sp)
8000c7ee: 28 08        	addi	a0, sp, 24
8000c7f0: b2 85        	add	a1, zero, a2
8000c7f2: 97 f0 ff ff  	auipc	ra, 1048575
8000c7f6: e7 80 40 fb  	jalr	-76(ra)
8000c7fa: 00 00        	unimp	

Disassembly of section .text._ZN4core5slice5index22slice_index_order_fail17h17f07731262cfc7fE:

000000008000c7fc <_ZN4core5slice5index22slice_index_order_fail17h17f07731262cfc7fE>:
8000c7fc: 59 71        	addi	sp, sp, -112
8000c7fe: 86 f4        	sd	ra, 104(sp)
8000c800: 2a e4        	sd	a0, 8(sp)
8000c802: 2e e8        	sd	a1, 16(sp)
8000c804: 28 00        	addi	a0, sp, 8
8000c806: aa e4        	sd	a0, 72(sp)

000000008000c808 <.LBB207_1>:
8000c808: 17 15 00 00  	auipc	a0, 1
8000c80c: 13 05 85 a6  	addi	a0, a0, -1432
8000c810: aa e8        	sd	a0, 80(sp)
8000c812: 0c 08        	addi	a1, sp, 16
8000c814: ae ec        	sd	a1, 88(sp)
8000c816: aa f0        	sd	a0, 96(sp)

000000008000c818 <.LBB207_2>:
8000c818: 17 45 00 00  	auipc	a0, 4
8000c81c: 13 05 05 da  	addi	a0, a0, -608
8000c820: 2a ec        	sd	a0, 24(sp)
8000c822: 09 45        	addi	a0, zero, 2
8000c824: 2a f0        	sd	a0, 32(sp)
8000c826: 02 f4        	sd	zero, 40(sp)
8000c828: ac 00        	addi	a1, sp, 72
8000c82a: 2e fc        	sd	a1, 56(sp)
8000c82c: aa e0        	sd	a0, 64(sp)
8000c82e: 28 08        	addi	a0, sp, 24
8000c830: b2 85        	add	a1, zero, a2
8000c832: 97 f0 ff ff  	auipc	ra, 1048575
8000c836: e7 80 40 f7  	jalr	-140(ra)
8000c83a: 00 00        	unimp	

Disassembly of section .text._ZN4core3str16slice_error_fail17he9562343589499f6E:

000000008000c83c <_ZN4core3str16slice_error_fail17he9562343589499f6E>:
8000c83c: 15 71        	addi	sp, sp, -224
8000c83e: 86 ed        	sd	ra, 216(sp)
8000c840: 32 e4        	sd	a2, 8(sp)
8000c842: 36 e8        	sd	a3, 16(sp)
8000c844: 93 07 10 10  	addi	a5, zero, 257
8000c848: 85 48        	addi	a7, zero, 1
8000c84a: 2e 88        	add	a6, zero, a1
8000c84c: 63 e2 f5 04  	bltu	a1, a5, 68 <_ZN4core3str16slice_error_fail17he9562343589499f6E+0x54>
8000c850: 81 43        	mv	t2, zero
8000c852: 93 88 15 f0  	addi	a7, a1, -255
8000c856: 93 02 05 10  	addi	t0, a0, 256
8000c85a: 13 03 f0 fb  	addi	t1, zero, -65
8000c85e: 13 88 03 10  	addi	a6, t2, 256
8000c862: 63 78 b8 00  	bgeu	a6, a1, 16 <_ZN4core3str16slice_error_fail17he9562343589499f6E+0x36>
8000c866: b3 87 72 00  	add	a5, t0, t2
8000c86a: 83 87 07 00  	lb	a5, 0(a5)
8000c86e: 63 4b f3 02  	blt	t1, a5, 54 <.LBB228_49+0xc>
8000c872: 93 87 f3 0f  	addi	a5, t2, 255
8000c876: 33 38 f0 00  	snez	a6, a5
8000c87a: b3 c7 78 00  	xor	a5, a7, t2
8000c87e: b3 37 f0 00  	snez	a5, a5
8000c882: b3 77 f8 00  	and	a5, a6, a5
8000c886: fd 13        	addi	t2, t2, -1
8000c888: f9 fb        	bnez	a5, -42 <_ZN4core3str16slice_error_fail17he9562343589499f6E+0x22>
8000c88a: 81 48        	mv	a7, zero
8000c88c: 13 88 03 10  	addi	a6, t2, 256
8000c890: 2a ec        	sd	a0, 24(sp)
8000c892: 42 f0        	sd	a6, 32(sp)
8000c894: 63 9d 08 00  	bnez	a7, 26 <.LBB228_49+0x16>

000000008000c898 <.LBB228_49>:
8000c898: 97 47 00 00  	auipc	a5, 4
8000c89c: 93 87 07 d4  	addi	a5, a5, -704
8000c8a0: 15 48        	addi	a6, zero, 5
8000c8a2: 19 a8        	j	22 <.LBB228_50+0x8>
8000c8a4: 81 48        	mv	a7, zero
8000c8a6: 2a ec        	sd	a0, 24(sp)
8000c8a8: 42 f0        	sd	a6, 32(sp)
8000c8aa: e3 87 08 fe  	beqz	a7, -18 <.LBB228_49>
8000c8ae: 01 48        	mv	a6, zero

000000008000c8b0 <.LBB228_50>:
8000c8b0: 97 47 00 00  	auipc	a5, 4
8000c8b4: 93 87 87 96  	addi	a5, a5, -1688
8000c8b8: 3e f4        	sd	a5, 40(sp)
8000c8ba: b3 b8 c5 00  	sltu	a7, a1, a2
8000c8be: 93 c2 18 00  	xori	t0, a7, 1
8000c8c2: b3 b7 d5 00  	sltu	a5, a1, a3
8000c8c6: 93 c7 17 00  	xori	a5, a5, 1
8000c8ca: b3 f7 f2 00  	and	a5, t0, a5
8000c8ce: 42 f8        	sd	a6, 48(sp)
8000c8d0: 8d ef        	bnez	a5, 58 <.LBB228_53+0xe>
8000c8d2: 63 93 08 00  	bnez	a7, 6 <.LBB228_50+0x28>
8000c8d6: 36 86        	add	a2, zero, a3
8000c8d8: b2 e4        	sd	a2, 72(sp)
8000c8da: a8 00        	addi	a0, sp, 72
8000c8dc: 2a e5        	sd	a0, 136(sp)

000000008000c8de <.LBB228_51>:
8000c8de: 17 15 00 00  	auipc	a0, 1
8000c8e2: 13 05 25 99  	addi	a0, a0, -1646
8000c8e6: 2a e9        	sd	a0, 144(sp)
8000c8e8: 28 08        	addi	a0, sp, 24
8000c8ea: 2a ed        	sd	a0, 152(sp)

000000008000c8ec <.LBB228_52>:
8000c8ec: 17 15 00 00  	auipc	a0, 1
8000c8f0: 13 05 05 b7  	addi	a0, a0, -1168
8000c8f4: 2a f1        	sd	a0, 160(sp)
8000c8f6: 2c 10        	addi	a1, sp, 40
8000c8f8: 2e f5        	sd	a1, 168(sp)
8000c8fa: 2a f9        	sd	a0, 176(sp)

000000008000c8fc <.LBB228_53>:
8000c8fc: 17 45 00 00  	auipc	a0, 4
8000c900: 13 05 45 d0  	addi	a0, a0, -764
8000c904: aa ec        	sd	a0, 88(sp)
8000c906: 0d 45        	addi	a0, zero, 3
8000c908: dd aa        	j	502 <.LBB228_62+0xc>
8000c90a: 63 fd c6 02  	bgeu	a3, a2, 58 <.LBB228_56+0xe>
8000c90e: 28 00        	addi	a0, sp, 8
8000c910: 2a e5        	sd	a0, 136(sp)

000000008000c912 <.LBB228_54>:
8000c912: 17 15 00 00  	auipc	a0, 1
8000c916: 13 05 e5 95  	addi	a0, a0, -1698
8000c91a: 2a e9        	sd	a0, 144(sp)
8000c91c: 0c 08        	addi	a1, sp, 16
8000c91e: 2e ed        	sd	a1, 152(sp)
8000c920: 2a f1        	sd	a0, 160(sp)
8000c922: 28 08        	addi	a0, sp, 24
8000c924: 2a f5        	sd	a0, 168(sp)

000000008000c926 <.LBB228_55>:
8000c926: 17 15 00 00  	auipc	a0, 1
8000c92a: 13 05 65 b3  	addi	a0, a0, -1226
8000c92e: 2a f9        	sd	a0, 176(sp)
8000c930: 2c 10        	addi	a1, sp, 40
8000c932: 2e fd        	sd	a1, 184(sp)
8000c934: aa e1        	sd	a0, 192(sp)

000000008000c936 <.LBB228_56>:
8000c936: 17 45 00 00  	auipc	a0, 4
8000c93a: 13 05 a5 d0  	addi	a0, a0, -758
8000c93e: aa ec        	sd	a0, 88(sp)
8000c940: 11 45        	addi	a0, zero, 4
8000c942: 75 aa        	j	444 <.LBB228_62+0xc>
8000c944: 13 38 16 00  	seqz	a6, a2
8000c948: b3 c7 c5 00  	xor	a5, a1, a2
8000c94c: 93 b7 17 00  	seqz	a5, a5
8000c950: b3 67 f8 00  	or	a5, a6, a5
8000c954: 99 c3        	beqz	a5, 6 <.LBB228_56+0x24>
8000c956: 36 86        	add	a2, zero, a3
8000c958: 19 a8        	j	22 <.LBB228_56+0x38>
8000c95a: 63 7a b6 00  	bgeu	a2, a1, 20 <.LBB228_56+0x38>
8000c95e: b3 07 c5 00  	add	a5, a0, a2
8000c962: 03 88 07 00  	lb	a6, 0(a5)
8000c966: 93 07 00 fc  	addi	a5, zero, -64
8000c96a: e3 56 f8 fe  	bge	a6, a5, -20 <.LBB228_56+0x20>
8000c96e: 93 36 16 00  	seqz	a3, a2
8000c972: b3 47 b6 00  	xor	a5, a2, a1
8000c976: 93 b7 17 00  	seqz	a5, a5
8000c97a: dd 8e        	or	a3, a3, a5
8000c97c: 32 fc        	sd	a2, 56(sp)
8000c97e: 81 ca        	beqz	a3, 16 <.LBB228_56+0x58>
8000c980: b2 87        	add	a5, zero, a2
8000c982: 13 03 41 04  	addi	t1, sp, 68
8000c986: 3e 86        	add	a2, zero, a5
8000c988: 63 0f b6 02  	beq	a2, a1, 62 <.LBB228_57>
8000c98c: a9 a8        	j	90 <.LBB228_57+0x20>
8000c98e: 93 88 15 00  	addi	a7, a1, 1
8000c992: 13 08 00 fc  	addi	a6, zero, -64
8000c996: 63 78 b6 00  	bgeu	a2, a1, 16 <.LBB228_56+0x70>
8000c99a: b3 07 c5 00  	add	a5, a0, a2
8000c99e: 83 87 07 00  	lb	a5, 0(a5)
8000c9a2: 63 de 07 03  	bge	a5, a6, 60 <.LBB228_57+0x18>
8000c9a6: 93 07 f6 ff  	addi	a5, a2, -1
8000c9aa: 93 b6 17 00  	seqz	a3, a5
8000c9ae: 33 c6 c8 00  	xor	a2, a7, a2
8000c9b2: 13 36 16 00  	seqz	a2, a2
8000c9b6: d1 8e        	or	a3, a3, a2
8000c9b8: 3e 86        	add	a2, zero, a5
8000c9ba: f1 de        	beqz	a3, -36 <.LBB228_56+0x60>
8000c9bc: 13 03 41 04  	addi	t1, sp, 68
8000c9c0: 3e 86        	add	a2, zero, a5
8000c9c2: 63 12 b6 02  	bne	a2, a1, 36 <.LBB228_57+0x20>

000000008000c9c6 <.LBB228_57>:
8000c9c6: 17 45 00 00  	auipc	a0, 4
8000c9ca: 13 05 a5 86  	addi	a0, a0, -1942
8000c9ce: 93 05 b0 02  	addi	a1, zero, 43
8000c9d2: 3a 86        	add	a2, zero, a4
8000c9d4: 97 f0 ff ff  	auipc	ra, 1048575
8000c9d8: e7 80 60 d6  	jalr	-666(ra)
8000c9dc: 00 00        	unimp	
8000c9de: 13 03 41 04  	addi	t1, sp, 68
8000c9e2: e3 02 b6 fe  	beq	a2, a1, -28 <.LBB228_57>
8000c9e6: b3 06 c5 00  	add	a3, a0, a2
8000c9ea: 83 87 06 00  	lb	a5, 0(a3)
8000c9ee: 93 f3 f7 0f  	andi	t2, a5, 255
8000c9f2: 63 c6 07 00  	bltz	a5, 12 <.LBB228_57+0x38>
8000c9f6: 9e c2        	sw	t2, 68(sp)
8000c9f8: a8 00        	addi	a0, sp, 72
8000c9fa: 85 47        	addi	a5, zero, 1
8000c9fc: 55 a8        	j	180 <.LBB228_57+0xea>
8000c9fe: 2e 95        	add	a0, a0, a1
8000ca00: 93 85 16 00  	addi	a1, a3, 1
8000ca04: 63 9f a5 00  	bne	a1, a0, 30 <.LBB228_57+0x5c>
8000ca08: 81 48        	mv	a7, zero
8000ca0a: aa 85        	add	a1, zero, a0
8000ca0c: 93 06 00 0e  	addi	a3, zero, 224
8000ca10: 13 f8 f3 01  	andi	a6, t2, 31
8000ca14: 63 f3 d3 02  	bgeu	t2, a3, 38 <.LBB228_57+0x74>
8000ca18: 13 15 68 00  	slli	a0, a6, 6
8000ca1c: b3 65 15 01  	or	a1, a0, a7
8000ca20: bd a0        	j	110 <.LBB228_57+0xc8>
8000ca22: 83 c7 16 00  	lbu	a5, 1(a3)
8000ca26: 93 85 26 00  	addi	a1, a3, 2
8000ca2a: 93 f8 f7 03  	andi	a7, a5, 63
8000ca2e: 93 06 00 0e  	addi	a3, zero, 224
8000ca32: 13 f8 f3 01  	andi	a6, t2, 31
8000ca36: e3 e1 d3 fe  	bltu	t2, a3, -30 <.LBB228_57+0x52>
8000ca3a: 63 95 a5 00  	bne	a1, a0, 10 <.LBB228_57+0x7e>
8000ca3e: 81 45        	mv	a1, zero
8000ca40: aa 82        	add	t0, zero, a0
8000ca42: 39 a0        	j	14 <.LBB228_57+0x8a>
8000ca44: 83 c6 05 00  	lbu	a3, 0(a1)
8000ca48: 93 82 15 00  	addi	t0, a1, 1
8000ca4c: 93 f5 f6 03  	andi	a1, a3, 63
8000ca50: 93 96 68 00  	slli	a3, a7, 6
8000ca54: 93 07 00 0f  	addi	a5, zero, 240
8000ca58: d5 8d        	or	a1, a1, a3
8000ca5a: 63 e6 f3 00  	bltu	t2, a5, 12 <.LBB228_57+0xa0>
8000ca5e: 63 98 a2 00  	bne	t0, a0, 16 <.LBB228_57+0xa8>
8000ca62: 01 45        	mv	a0, zero
8000ca64: 09 a8        	j	18 <.LBB228_57+0xb0>
8000ca66: 13 15 c8 00  	slli	a0, a6, 12
8000ca6a: c9 8d        	or	a1, a1, a0
8000ca6c: 0d a0        	j	34 <.LBB228_57+0xc8>
8000ca6e: 03 c5 02 00  	lbu	a0, 0(t0)
8000ca72: 13 75 f5 03  	andi	a0, a0, 63
8000ca76: 93 16 28 01  	slli	a3, a6, 18
8000ca7a: b7 07 1c 00  	lui	a5, 448
8000ca7e: fd 8e        	and	a3, a3, a5
8000ca80: 9a 05        	slli	a1, a1, 6
8000ca82: d5 8d        	or	a1, a1, a3
8000ca84: c9 8d        	or	a1, a1, a0
8000ca86: 37 05 11 00  	lui	a0, 272
8000ca8a: e3 8e a5 f2  	beq	a1, a0, -196 <.LBB228_57>
8000ca8e: ae c2        	sw	a1, 68(sp)
8000ca90: a8 00        	addi	a0, sp, 72
8000ca92: 93 06 00 08  	addi	a3, zero, 128
8000ca96: 85 47        	addi	a5, zero, 1
8000ca98: 63 ec d5 00  	bltu	a1, a3, 24 <.LBB228_57+0xea>
8000ca9c: 93 d6 b5 00  	srli	a3, a1, 11
8000caa0: 89 47        	addi	a5, zero, 2
8000caa2: 99 c6        	beqz	a3, 14 <.LBB228_57+0xea>
8000caa4: c1 81        	srli	a1, a1, 16
8000caa6: 93 b5 15 00  	seqz	a1, a1
8000caaa: 91 46        	addi	a3, zero, 4
8000caac: b3 87 b6 40  	sub	a5, a3, a1
8000cab0: b3 85 c7 00  	add	a1, a5, a2
8000cab4: b2 e4        	sd	a2, 72(sp)
8000cab6: ae e8        	sd	a1, 80(sp)
8000cab8: 2c 18        	addi	a1, sp, 56
8000caba: 2e e5        	sd	a1, 136(sp)

000000008000cabc <.LBB228_58>:
8000cabc: 97 05 00 00  	auipc	a1, 0
8000cac0: 93 85 45 7b  	addi	a1, a1, 1972
8000cac4: 2e e9        	sd	a1, 144(sp)
8000cac6: 1a ed        	sd	t1, 152(sp)

000000008000cac8 <.LBB228_59>:
8000cac8: 97 05 00 00  	auipc	a1, 0
8000cacc: 93 85 85 93  	addi	a1, a1, -1736
8000cad0: 2e f1        	sd	a1, 160(sp)
8000cad2: 2a f5        	sd	a0, 168(sp)

000000008000cad4 <.LBB228_60>:
8000cad4: 17 f5 ff ff  	auipc	a0, 1048575
8000cad8: 13 05 45 a6  	addi	a0, a0, -1436
8000cadc: 2a f9        	sd	a0, 176(sp)
8000cade: 28 08        	addi	a0, sp, 24
8000cae0: 2a fd        	sd	a0, 184(sp)

000000008000cae2 <.LBB228_61>:
8000cae2: 17 15 00 00  	auipc	a0, 1
8000cae6: 13 05 a5 97  	addi	a0, a0, -1670
8000caea: aa e1        	sd	a0, 192(sp)
8000caec: 2c 10        	addi	a1, sp, 40
8000caee: ae e5        	sd	a1, 200(sp)
8000caf0: aa e9        	sd	a0, 208(sp)

000000008000caf2 <.LBB228_62>:
8000caf2: 17 45 00 00  	auipc	a0, 4
8000caf6: 13 05 e5 bb  	addi	a0, a0, -1090
8000cafa: aa ec        	sd	a0, 88(sp)
8000cafc: 15 45        	addi	a0, zero, 5
8000cafe: aa f0        	sd	a0, 96(sp)
8000cb00: 82 f4        	sd	zero, 104(sp)
8000cb02: 2c 01        	addi	a1, sp, 136
8000cb04: ae fc        	sd	a1, 120(sp)
8000cb06: 2a e1        	sd	a0, 128(sp)
8000cb08: a8 08        	addi	a0, sp, 88
8000cb0a: ba 85        	add	a1, zero, a4
8000cb0c: 97 f0 ff ff  	auipc	ra, 1048575
8000cb10: e7 80 a0 c9  	jalr	-870(ra)
8000cb14: 00 00        	unimp	

Disassembly of section .text._ZN4core7unicode9printable12is_printable17hd298c127375d0caaE:

000000008000cb16 <_ZN4core7unicode9printable12is_printable17hd298c127375d0caaE>:
8000cb16: 41 11        	addi	sp, sp, -16
8000cb18: 06 e4        	sd	ra, 8(sp)
8000cb1a: 9b 55 05 01  	srliw	a1, a0, 16
8000cb1e: f1 e1        	bnez	a1, 196 <.LBB244_43+0x4c>
8000cb20: 81 45        	mv	a1, zero
8000cb22: 41 66        	lui	a2, 16
8000cb24: 1b 06 06 f0  	addiw	a2, a2, -256
8000cb28: 69 8e        	and	a2, a2, a0
8000cb2a: 13 53 86 00  	srli	t1, a2, 8

000000008000cb2e <.LBB244_41>:
8000cb2e: 17 47 00 00  	auipc	a4, 4
8000cb32: 13 07 a7 c2  	addi	a4, a4, -982
8000cb36: 13 08 30 12  	addi	a6, zero, 291

000000008000cb3a <.LBB244_42>:
8000cb3a: 97 48 00 00  	auipc	a7, 4
8000cb3e: 93 88 08 c7  	addi	a7, a7, -912
8000cb42: 93 02 27 05  	addi	t0, a4, 82
8000cb46: 93 77 f5 0f  	andi	a5, a0, 255
8000cb4a: 11 a8        	j	20 <.LBB244_42+0x24>
8000cb4c: b3 35 d3 00  	sltu	a1, t1, a3
8000cb50: 33 46 57 00  	xor	a2, a4, t0
8000cb54: 13 36 16 00  	seqz	a2, a2
8000cb58: 4d 8e        	or	a2, a2, a1
8000cb5a: 9e 85        	add	a1, zero, t2
8000cb5c: 15 ea        	bnez	a2, 52 <.LBB244_42+0x56>
8000cb5e: 83 46 07 00  	lbu	a3, 0(a4)
8000cb62: 03 46 17 00  	lbu	a2, 1(a4)
8000cb66: 09 07        	addi	a4, a4, 2
8000cb68: b3 83 c5 00  	add	t2, a1, a2
8000cb6c: e3 90 66 fe  	bne	a3, t1, -32 <.LBB244_42+0x12>
8000cb70: 63 e0 b3 1e  	bltu	t2, a1, 480 <.LBB244_47>
8000cb74: 63 f9 03 1f  	bgeu	t2, a6, 498 <.LBB244_48>
8000cb78: c6 95        	add	a1, a1, a7
8000cb7a: 01 ca        	beqz	a2, 16 <.LBB244_42+0x50>
8000cb7c: 83 c6 05 00  	lbu	a3, 0(a1)
8000cb80: 85 05        	addi	a1, a1, 1
8000cb82: 7d 16        	addi	a2, a2, -1
8000cb84: e3 9b f6 fe  	bne	a3, a5, -10 <.LBB244_42+0x40>
8000cb88: 6d a2        	j	426 <.LBB244_46+0xd4>
8000cb8a: 9e 85        	add	a1, zero, t2
8000cb8c: e3 19 57 fc  	bne	a4, t0, -46 <.LBB244_42+0x24>
8000cb90: c1 65        	lui	a1, 16
8000cb92: fd 35        	addiw	a1, a1, -1
8000cb94: e9 8d        	and	a1, a1, a0

000000008000cb96 <.LBB244_43>:
8000cb96: 17 47 00 00  	auipc	a4, 4
8000cb9a: 13 07 67 d3  	addi	a4, a4, -714
8000cb9e: 05 45        	addi	a0, zero, 1
8000cba0: 7d 58        	addi	a6, zero, -1
8000cba2: 93 06 57 13  	addi	a3, a4, 309
8000cba6: 83 07 07 00  	lb	a5, 0(a4)
8000cbaa: 13 06 17 00  	addi	a2, a4, 1
8000cbae: 63 59 f8 00  	bge	a6, a5, 18 <.LBB244_43+0x2a>
8000cbb2: 93 f7 f7 0f  	andi	a5, a5, 255
8000cbb6: 32 87        	add	a4, zero, a2
8000cbb8: 9d 9d        	subw	a1, a1, a5
8000cbba: 63 df 05 00  	bgez	a1, 30 <.LBB244_43+0x42>
8000cbbe: 9d aa        	j	374 <.LBB244_46+0xd6>
8000cbc0: 63 06 d6 1c  	beq	a2, a3, 460 <.LBB244_50>
8000cbc4: 03 46 17 00  	lbu	a2, 1(a4)
8000cbc8: 93 f7 f7 07  	andi	a5, a5, 127
8000cbcc: a2 07        	slli	a5, a5, 8
8000cbce: 09 07        	addi	a4, a4, 2
8000cbd0: d1 8f        	or	a5, a5, a2
8000cbd2: 9d 9d        	subw	a1, a1, a5
8000cbd4: 63 c0 05 16  	bltz	a1, 352 <.LBB244_46+0xd6>
8000cbd8: 13 45 15 00  	xori	a0, a0, 1
8000cbdc: e3 15 d7 fc  	bne	a4, a3, -54 <.LBB244_43+0x10>
8000cbe0: 91 aa        	j	340 <.LBB244_46+0xd6>
8000cbe2: 9b 55 15 01  	srliw	a1, a0, 17
8000cbe6: f1 e1        	bnez	a1, 196 <.LBB244_46+0x4c>
8000cbe8: 81 45        	mv	a1, zero
8000cbea: 41 66        	lui	a2, 16
8000cbec: 1b 06 06 f0  	addiw	a2, a2, -256
8000cbf0: 69 8e        	and	a2, a2, a0
8000cbf2: 13 53 86 00  	srli	t1, a2, 8

000000008000cbf6 <.LBB244_44>:
8000cbf6: 17 47 00 00  	auipc	a4, 4
8000cbfa: 13 07 b7 e0  	addi	a4, a4, -501
8000cbfe: 13 08 00 0b  	addi	a6, zero, 176

000000008000cc02 <.LBB244_45>:
8000cc02: 97 48 00 00  	auipc	a7, 4
8000cc06: 93 88 b8 e4  	addi	a7, a7, -437
8000cc0a: 93 02 c7 04  	addi	t0, a4, 76
8000cc0e: 93 77 f5 0f  	andi	a5, a0, 255
8000cc12: 11 a8        	j	20 <.LBB244_45+0x24>
8000cc14: b3 35 d3 00  	sltu	a1, t1, a3
8000cc18: 33 46 57 00  	xor	a2, a4, t0
8000cc1c: 13 36 16 00  	seqz	a2, a2
8000cc20: 4d 8e        	or	a2, a2, a1
8000cc22: 9e 85        	add	a1, zero, t2
8000cc24: 15 ea        	bnez	a2, 52 <.LBB244_45+0x56>
8000cc26: 83 46 07 00  	lbu	a3, 0(a4)
8000cc2a: 03 46 17 00  	lbu	a2, 1(a4)
8000cc2e: 09 07        	addi	a4, a4, 2
8000cc30: b3 83 c5 00  	add	t2, a1, a2
8000cc34: e3 90 66 fe  	bne	a3, t1, -32 <.LBB244_45+0x12>
8000cc38: 63 ec b3 10  	bltu	t2, a1, 280 <.LBB244_47>
8000cc3c: 63 fc 03 13  	bgeu	t2, a6, 312 <.LBB244_49>
8000cc40: c6 95        	add	a1, a1, a7
8000cc42: 01 ca        	beqz	a2, 16 <.LBB244_45+0x50>
8000cc44: 83 c6 05 00  	lbu	a3, 0(a1)
8000cc48: 85 05        	addi	a1, a1, 1
8000cc4a: 7d 16        	addi	a2, a2, -1
8000cc4c: e3 9b f6 fe  	bne	a3, a5, -10 <.LBB244_45+0x40>
8000cc50: cd a0        	j	226 <.LBB244_46+0xd4>
8000cc52: 9e 85        	add	a1, zero, t2
8000cc54: e3 19 57 fc  	bne	a4, t0, -46 <.LBB244_45+0x24>
8000cc58: c1 65        	lui	a1, 16
8000cc5a: fd 35        	addiw	a1, a1, -1
8000cc5c: e9 8d        	and	a1, a1, a0

000000008000cc5e <.LBB244_46>:
8000cc5e: 17 47 00 00  	auipc	a4, 4
8000cc62: 13 07 e7 e9  	addi	a4, a4, -354
8000cc66: 05 45        	addi	a0, zero, 1
8000cc68: 7d 58        	addi	a6, zero, -1
8000cc6a: 93 06 37 1a  	addi	a3, a4, 419
8000cc6e: 83 07 07 00  	lb	a5, 0(a4)
8000cc72: 13 06 17 00  	addi	a2, a4, 1
8000cc76: 63 59 f8 00  	bge	a6, a5, 18 <.LBB244_46+0x2a>
8000cc7a: 93 f7 f7 0f  	andi	a5, a5, 255
8000cc7e: 32 87        	add	a4, zero, a2
8000cc80: 9d 9d        	subw	a1, a1, a5
8000cc82: 63 df 05 00  	bgez	a1, 30 <.LBB244_46+0x42>
8000cc86: 7d a0        	j	174 <.LBB244_46+0xd6>
8000cc88: 63 02 d6 10  	beq	a2, a3, 260 <.LBB244_50>
8000cc8c: 03 46 17 00  	lbu	a2, 1(a4)
8000cc90: 93 f7 f7 07  	andi	a5, a5, 127
8000cc94: a2 07        	slli	a5, a5, 8
8000cc96: 09 07        	addi	a4, a4, 2
8000cc98: d1 8f        	or	a5, a5, a2
8000cc9a: 9d 9d        	subw	a1, a1, a5
8000cc9c: 63 cc 05 08  	bltz	a1, 152 <.LBB244_46+0xd6>
8000cca0: 13 45 15 00  	xori	a0, a0, 1
8000cca4: e3 15 d7 fc  	bne	a4, a3, -54 <.LBB244_46+0x10>
8000cca8: 71 a0        	j	140 <.LBB244_46+0xd6>
8000ccaa: b7 65 fd ff  	lui	a1, 1048534
8000ccae: 9b 85 25 92  	addiw	a1, a1, -1758
8000ccb2: a9 9d        	addw	a1, a1, a0
8000ccb4: 93 b5 25 02  	sltiu	a1, a1, 34
8000ccb8: 37 56 fd ff  	lui	a2, 1048533
8000ccbc: 1b 06 b6 8c  	addiw	a2, a2, -1845
8000ccc0: 29 9e        	addw	a2, a2, a0
8000ccc2: 13 36 b6 00  	sltiu	a2, a2, 11
8000ccc6: d1 8d        	or	a1, a1, a2
8000ccc8: 37 06 20 00  	lui	a2, 512
8000cccc: 79 36        	addiw	a2, a2, -2
8000ccce: 69 8e        	and	a2, a2, a0
8000ccd0: b7 c6 02 00  	lui	a3, 44
8000ccd4: 9b 86 e6 81  	addiw	a3, a3, -2018
8000ccd8: 35 8e        	xor	a2, a2, a3
8000ccda: 13 36 16 00  	seqz	a2, a2
8000ccde: d1 8d        	or	a1, a1, a2
8000cce0: 37 36 fd ff  	lui	a2, 1048531
8000cce4: 1b 06 e6 15  	addiw	a2, a2, 350
8000cce8: 29 9e        	addw	a2, a2, a0
8000ccea: 13 36 e6 00  	sltiu	a2, a2, 14
8000ccee: d1 8d        	or	a1, a1, a2
8000ccf0: 37 16 fd ff  	lui	a2, 1048529
8000ccf4: 1b 06 f6 41  	addiw	a2, a2, 1055
8000ccf8: 29 9e        	addw	a2, a2, a0
8000ccfa: 85 66        	lui	a3, 1
8000ccfc: 9b 86 f6 c1  	addiw	a3, a3, -993
8000cd00: 33 36 d6 00  	sltu	a2, a2, a3
8000cd04: d1 8d        	or	a1, a1, a2
8000cd06: 37 06 fd ff  	lui	a2, 1048528
8000cd0a: 1b 06 26 5e  	addiw	a2, a2, 1506
8000cd0e: 29 9e        	addw	a2, a2, a0
8000cd10: 13 36 26 5e  	sltiu	a2, a2, 1506
8000cd14: d1 8d        	or	a1, a1, a2
8000cd16: 37 f6 fc ff  	lui	a2, 1048527
8000cd1a: 1b 06 56 cb  	addiw	a2, a2, -843
8000cd1e: 29 9e        	addw	a2, a2, a0
8000cd20: b7 f6 0a 00  	lui	a3, 175
8000cd24: 9b 86 56 db  	addiw	a3, a3, -587
8000cd28: 33 36 d6 00  	sltu	a2, a2, a3
8000cd2c: d1 8d        	or	a1, a1, a2
8000cd2e: 85 89        	andi	a1, a1, 1
8000cd30: 91 c5        	beqz	a1, 12 <.LBB244_46+0xde>
8000cd32: 01 45        	mv	a0, zero
8000cd34: 05 89        	andi	a0, a0, 1
8000cd36: a2 60        	ld	ra, 8(sp)
8000cd38: 41 01        	addi	sp, sp, 16
8000cd3a: 82 80        	ret
8000cd3c: 01 25        	sext.w	a0, a0
8000cd3e: b7 05 0e 00  	lui	a1, 224
8000cd42: 9b 85 05 1f  	addiw	a1, a1, 496
8000cd46: 33 35 b5 00  	sltu	a0, a0, a1
8000cd4a: a2 60        	ld	ra, 8(sp)
8000cd4c: 41 01        	addi	sp, sp, 16
8000cd4e: 82 80        	ret

000000008000cd50 <.LBB244_47>:
8000cd50: 17 46 00 00  	auipc	a2, 4
8000cd54: 13 06 86 9d  	addi	a2, a2, -1576
8000cd58: 2e 85        	add	a0, zero, a1
8000cd5a: 9e 85        	add	a1, zero, t2
8000cd5c: 97 00 00 00  	auipc	ra, 0
8000cd60: e7 80 00 aa  	jalr	-1376(ra)
8000cd64: 00 00        	unimp	

000000008000cd66 <.LBB244_48>:
8000cd66: 17 46 00 00  	auipc	a2, 4
8000cd6a: 13 06 26 9c  	addi	a2, a2, -1598
8000cd6e: 93 05 20 12  	addi	a1, zero, 290
8000cd72: 39 a0        	j	14 <.LBB244_49+0xc>

000000008000cd74 <.LBB244_49>:
8000cd74: 17 46 00 00  	auipc	a2, 4
8000cd78: 13 06 46 9b  	addi	a2, a2, -1612
8000cd7c: 93 05 f0 0a  	addi	a1, zero, 175
8000cd80: 1e 85        	add	a0, zero, t2
8000cd82: 97 00 00 00  	auipc	ra, 0
8000cd86: e7 80 a0 a3  	jalr	-1478(ra)
8000cd8a: 00 00        	unimp	

000000008000cd8c <.LBB244_50>:
8000cd8c: 17 35 00 00  	auipc	a0, 3
8000cd90: 13 05 45 4a  	addi	a0, a0, 1188

000000008000cd94 <.LBB244_51>:
8000cd94: 17 46 00 00  	auipc	a2, 4
8000cd98: 13 06 c6 9a  	addi	a2, a2, -1620
8000cd9c: 93 05 b0 02  	addi	a1, zero, 43
8000cda0: 97 f0 ff ff  	auipc	ra, 1048575
8000cda4: e7 80 a0 99  	jalr	-1638(ra)
8000cda8: 00 00        	unimp	

Disassembly of section .text._ZN70_$LT$core..num..error..TryFromIntError$u20$as$u20$core..fmt..Debug$GT$3fmt17h6db9c97b6577249aE:

000000008000cdaa <_ZN70_$LT$core..num..error..TryFromIntError$u20$as$u20$core..fmt..Debug$GT$3fmt17h6db9c97b6577249aE>:
8000cdaa: 39 71        	addi	sp, sp, -64
8000cdac: 06 fc        	sd	ra, 56(sp)
8000cdae: 22 f8        	sd	s0, 48(sp)
8000cdb0: 26 f4        	sd	s1, 40(sp)
8000cdb2: 2e 84        	add	s0, zero, a1
8000cdb4: 8c 75        	ld	a1, 40(a1)
8000cdb6: 14 70        	ld	a3, 32(s0)
8000cdb8: 98 6d        	ld	a4, 24(a1)
8000cdba: aa 84        	add	s1, zero, a0

000000008000cdbc <.LBB312_8>:
8000cdbc: 97 45 00 00  	auipc	a1, 4
8000cdc0: 93 85 45 f5  	addi	a1, a1, -172
8000cdc4: 3d 46        	addi	a2, zero, 15
8000cdc6: 36 85        	add	a0, zero, a3
8000cdc8: 02 97        	jalr	a4
8000cdca: 22 e4        	sd	s0, 8(sp)
8000cdcc: 23 0c a1 00  	sb	a0, 24(sp)
8000cdd0: 02 e8        	sd	zero, 16(sp)
8000cdd2: a3 0c 01 00  	sb	zero, 25(sp)
8000cdd6: 26 f0        	sd	s1, 32(sp)

000000008000cdd8 <.LBB312_9>:
8000cdd8: 17 46 00 00  	auipc	a2, 4
8000cddc: 13 06 86 f4  	addi	a2, a2, -184
8000cde0: 28 00        	addi	a0, sp, 8
8000cde2: 0c 10        	addi	a1, sp, 32
8000cde4: 97 f0 ff ff  	auipc	ra, 1048575
8000cde8: e7 80 e0 b2  	jalr	-1234(ra)
8000cdec: 42 65        	ld	a0, 16(sp)
8000cdee: 83 45 81 01  	lbu	a1, 24(sp)
8000cdf2: 31 c9        	beqz	a0, 84 <.LBB312_11+0x14>
8000cdf4: 05 44        	addi	s0, zero, 1
8000cdf6: a9 e5        	bnez	a1, 74 <.LBB312_11+0xe>
8000cdf8: 83 45 91 01  	lbu	a1, 25(sp)
8000cdfc: 7d 15        	addi	a0, a0, -1
8000cdfe: 33 35 a0 00  	snez	a0, a0
8000ce02: 93 b5 15 00  	seqz	a1, a1
8000ce06: 4d 8d        	or	a0, a0, a1
8000ce08: 0d e1        	bnez	a0, 34 <.LBB312_10+0x10>
8000ce0a: 22 65        	ld	a0, 8(sp)
8000ce0c: 83 45 05 03  	lbu	a1, 48(a0)
8000ce10: 91 89        	andi	a1, a1, 4
8000ce12: 81 ed        	bnez	a1, 24 <.LBB312_10+0x10>
8000ce14: 0c 75        	ld	a1, 40(a0)
8000ce16: 08 71        	ld	a0, 32(a0)
8000ce18: 94 6d        	ld	a3, 24(a1)

000000008000ce1a <.LBB312_10>:
8000ce1a: 97 35 00 00  	auipc	a1, 3
8000ce1e: 93 85 55 5a  	addi	a1, a1, 1445
8000ce22: 05 46        	addi	a2, zero, 1
8000ce24: 05 44        	addi	s0, zero, 1
8000ce26: 82 96        	jalr	a3
8000ce28: 01 ed        	bnez	a0, 24 <.LBB312_11+0xe>
8000ce2a: 22 65        	ld	a0, 8(sp)
8000ce2c: 0c 75        	ld	a1, 40(a0)
8000ce2e: 08 71        	ld	a0, 32(a0)
8000ce30: 94 6d        	ld	a3, 24(a1)

000000008000ce32 <.LBB312_11>:
8000ce32: 97 35 00 00  	auipc	a1, 3
8000ce36: 93 85 e5 58  	addi	a1, a1, 1422
8000ce3a: 05 46        	addi	a2, zero, 1
8000ce3c: 82 96        	jalr	a3
8000ce3e: 2a 84        	add	s0, zero, a0
8000ce40: 23 0c 81 00  	sb	s0, 24(sp)
8000ce44: a2 85        	add	a1, zero, s0
8000ce46: 33 35 b0 00  	snez	a0, a1
8000ce4a: a2 74        	ld	s1, 40(sp)
8000ce4c: 42 74        	ld	s0, 48(sp)
8000ce4e: e2 70        	ld	ra, 56(sp)
8000ce50: 21 61        	addi	sp, sp, 64
8000ce52: 82 80        	ret

Disassembly of section .text._ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h4c4c08db6a399c7cE:

000000008000ce54 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h4f4cc2dd857f987cE>:
8000ce54: 75 71        	addi	sp, sp, -144
8000ce56: 06 e5        	sd	ra, 136(sp)
8000ce58: 2e 88        	add	a6, zero, a1
8000ce5a: 81 45        	mv	a1, zero
8000ce5c: 03 67 05 00  	lwu	a4, 0(a0)
8000ce60: 93 08 81 00  	addi	a7, sp, 8
8000ce64: 37 05 00 10  	lui	a0, 65536
8000ce68: 7d 35        	addiw	a0, a0, -1
8000ce6a: a9 42        	addi	t0, zero, 10
8000ce6c: 39 a0        	j	14 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h4f4cc2dd857f987cE+0x26>
8000ce6e: 13 06 76 03  	addi	a2, a2, 55
8000ce72: a3 8f c7 06  	sb	a2, 127(a5)
8000ce76: fd 15        	addi	a1, a1, -1
8000ce78: 0d c3        	beqz	a4, 34 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h4f4cc2dd857f987cE+0x46>
8000ce7a: b3 87 b8 00  	add	a5, a7, a1
8000ce7e: 93 56 47 00  	srli	a3, a4, 4
8000ce82: 13 76 f7 00  	andi	a2, a4, 15
8000ce86: 33 f7 a6 00  	and	a4, a3, a0
8000ce8a: e3 72 56 fe  	bgeu	a2, t0, -28 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h4f4cc2dd857f987cE+0x1a>
8000ce8e: 13 66 06 03  	ori	a2, a2, 48
8000ce92: a3 8f c7 06  	sb	a2, 127(a5)
8000ce96: fd 15        	addi	a1, a1, -1
8000ce98: 6d f3        	bnez	a4, -30 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17h4f4cc2dd857f987cE+0x26>
8000ce9a: 13 85 05 08  	addi	a0, a1, 128
8000ce9e: 13 06 10 08  	addi	a2, zero, 129
8000cea2: 63 76 c5 02  	bgeu	a0, a2, 44 <.LBB453_8>
8000cea6: b3 07 b0 40  	neg	a5, a1
8000ceaa: 33 85 b8 00  	add	a0, a7, a1
8000ceae: 13 07 05 08  	addi	a4, a0, 128

000000008000ceb2 <.LBB453_7>:
8000ceb2: 17 36 00 00  	auipc	a2, 3
8000ceb6: 13 06 66 54  	addi	a2, a2, 1350
8000ceba: 85 45        	addi	a1, zero, 1
8000cebc: 89 46        	addi	a3, zero, 2
8000cebe: 42 85        	add	a0, zero, a6
8000cec0: 97 f0 ff ff  	auipc	ra, 1048575
8000cec4: e7 80 20 f9  	jalr	-110(ra)
8000cec8: aa 60        	ld	ra, 136(sp)
8000ceca: 49 61        	addi	sp, sp, 144
8000cecc: 82 80        	ret

000000008000cece <.LBB453_8>:
8000cece: 17 36 00 00  	auipc	a2, 3
8000ced2: 13 06 26 51  	addi	a2, a2, 1298
8000ced6: 93 05 00 08  	addi	a1, zero, 128
8000ceda: 97 00 00 00  	auipc	ra, 0
8000cede: e7 80 20 8a  	jalr	-1886(ra)
8000cee2: 00 00        	unimp	

Disassembly of section .text._ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17he21e11f173f31e15E:

000000008000cee4 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h8027222638df1206E>:
8000cee4: 75 71        	addi	sp, sp, -144
8000cee6: 06 e5        	sd	ra, 136(sp)
8000cee8: 14 61        	ld	a3, 0(a0)
8000ceea: 2e 85        	add	a0, zero, a1
8000ceec: 81 45        	mv	a1, zero
8000ceee: 13 08 81 00  	addi	a6, sp, 8
8000cef2: 29 47        	addi	a4, zero, 10
8000cef4: 39 a0        	j	14 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h8027222638df1206E+0x1e>
8000cef6: 13 06 76 05  	addi	a2, a2, 87
8000cefa: a3 8f c7 06  	sb	a2, 127(a5)
8000cefe: fd 15        	addi	a1, a1, -1
8000cf00: 91 ce        	beqz	a3, 28 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h8027222638df1206E+0x38>
8000cf02: b3 07 b8 00  	add	a5, a6, a1
8000cf06: 13 f6 f6 00  	andi	a2, a3, 15
8000cf0a: 91 82        	srli	a3, a3, 4
8000cf0c: e3 75 e6 fe  	bgeu	a2, a4, -22 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h8027222638df1206E+0x12>
8000cf10: 13 66 06 03  	ori	a2, a2, 48
8000cf14: a3 8f c7 06  	sb	a2, 127(a5)
8000cf18: fd 15        	addi	a1, a1, -1
8000cf1a: e5 f6        	bnez	a3, -24 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h8027222638df1206E+0x1e>
8000cf1c: 93 86 05 08  	addi	a3, a1, 128
8000cf20: 13 06 10 08  	addi	a2, zero, 129
8000cf24: 63 f4 c6 02  	bgeu	a3, a2, 40 <.LBB456_8>
8000cf28: b3 07 b0 40  	neg	a5, a1
8000cf2c: c2 95        	add	a1, a1, a6
8000cf2e: 13 87 05 08  	addi	a4, a1, 128

000000008000cf32 <.LBB456_7>:
8000cf32: 17 36 00 00  	auipc	a2, 3
8000cf36: 13 06 66 4c  	addi	a2, a2, 1222
8000cf3a: 85 45        	addi	a1, zero, 1
8000cf3c: 89 46        	addi	a3, zero, 2
8000cf3e: 97 f0 ff ff  	auipc	ra, 1048575
8000cf42: e7 80 40 f1  	jalr	-236(ra)
8000cf46: aa 60        	ld	ra, 136(sp)
8000cf48: 49 61        	addi	sp, sp, 144
8000cf4a: 82 80        	ret

000000008000cf4c <.LBB456_8>:
8000cf4c: 17 36 00 00  	auipc	a2, 3
8000cf50: 13 06 46 49  	addi	a2, a2, 1172
8000cf54: 93 05 00 08  	addi	a1, zero, 128
8000cf58: 36 85        	add	a0, zero, a3
8000cf5a: 97 00 00 00  	auipc	ra, 0
8000cf5e: e7 80 20 82  	jalr	-2014(ra)
8000cf62: 00 00        	unimp	

Disassembly of section .text._ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h7a5b1e38fb0bc5b9E:

000000008000cf64 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h19ccadc9c208c1d9E>:
8000cf64: 75 71        	addi	sp, sp, -144
8000cf66: 06 e5        	sd	ra, 136(sp)
8000cf68: 14 61        	ld	a3, 0(a0)
8000cf6a: 2e 85        	add	a0, zero, a1
8000cf6c: 81 45        	mv	a1, zero
8000cf6e: 13 08 81 00  	addi	a6, sp, 8
8000cf72: 29 47        	addi	a4, zero, 10
8000cf74: 39 a0        	j	14 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h19ccadc9c208c1d9E+0x1e>
8000cf76: 13 06 76 03  	addi	a2, a2, 55
8000cf7a: a3 8f c7 06  	sb	a2, 127(a5)
8000cf7e: fd 15        	addi	a1, a1, -1
8000cf80: 91 ce        	beqz	a3, 28 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h19ccadc9c208c1d9E+0x38>
8000cf82: b3 07 b8 00  	add	a5, a6, a1
8000cf86: 13 f6 f6 00  	andi	a2, a3, 15
8000cf8a: 91 82        	srli	a3, a3, 4
8000cf8c: e3 75 e6 fe  	bgeu	a2, a4, -22 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h19ccadc9c208c1d9E+0x12>
8000cf90: 13 66 06 03  	ori	a2, a2, 48
8000cf94: a3 8f c7 06  	sb	a2, 127(a5)
8000cf98: fd 15        	addi	a1, a1, -1
8000cf9a: e5 f6        	bnez	a3, -24 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h19ccadc9c208c1d9E+0x1e>
8000cf9c: 93 86 05 08  	addi	a3, a1, 128
8000cfa0: 13 06 10 08  	addi	a2, zero, 129
8000cfa4: 63 f4 c6 02  	bgeu	a3, a2, 40 <.LBB457_8>
8000cfa8: b3 07 b0 40  	neg	a5, a1
8000cfac: c2 95        	add	a1, a1, a6
8000cfae: 13 87 05 08  	addi	a4, a1, 128

000000008000cfb2 <.LBB457_7>:
8000cfb2: 17 36 00 00  	auipc	a2, 3
8000cfb6: 13 06 66 44  	addi	a2, a2, 1094
8000cfba: 85 45        	addi	a1, zero, 1
8000cfbc: 89 46        	addi	a3, zero, 2
8000cfbe: 97 f0 ff ff  	auipc	ra, 1048575
8000cfc2: e7 80 40 e9  	jalr	-364(ra)
8000cfc6: aa 60        	ld	ra, 136(sp)
8000cfc8: 49 61        	addi	sp, sp, 144
8000cfca: 82 80        	ret

000000008000cfcc <.LBB457_8>:
8000cfcc: 17 36 00 00  	auipc	a2, 3
8000cfd0: 13 06 46 41  	addi	a2, a2, 1044
8000cfd4: 93 05 00 08  	addi	a1, zero, 128
8000cfd8: 36 85        	add	a0, zero, a3
8000cfda: 97 f0 ff ff  	auipc	ra, 1048575
8000cfde: e7 80 20 7a  	jalr	1954(ra)
8000cfe2: 00 00        	unimp	

Disassembly of section .text._ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE:

000000008000cfe4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE>:
8000cfe4: 75 71        	addi	sp, sp, -144
8000cfe6: 06 e5        	sd	ra, 136(sp)
8000cfe8: 2e 88        	add	a6, zero, a1
8000cfea: 83 e5 05 03  	lwu	a1, 48(a1)
8000cfee: 13 f6 05 01  	andi	a2, a1, 16
8000cff2: 19 ea        	bnez	a2, 22 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x24>
8000cff4: 93 f5 05 02  	andi	a1, a1, 32
8000cff8: a9 e1        	bnez	a1, 66 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x56>
8000cffa: c2 85        	add	a1, zero, a6
8000cffc: aa 60        	ld	ra, 136(sp)
8000cffe: 49 61        	addi	sp, sp, 144
8000d000: 17 03 00 00  	auipc	t1, 0
8000d004: 67 00 03 27  	jr	624(t1)
8000d008: 08 61        	ld	a0, 0(a0)
8000d00a: 81 45        	mv	a1, zero
8000d00c: 30 00        	addi	a2, sp, 8
8000d00e: a9 46        	addi	a3, zero, 10
8000d010: 39 a0        	j	14 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x3a>
8000d012: 93 87 77 05  	addi	a5, a5, 87
8000d016: a3 0f f7 06  	sb	a5, 127(a4)
8000d01a: fd 15        	addi	a1, a1, -1
8000d01c: 39 c5        	beqz	a0, 78 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x86>
8000d01e: 33 07 b6 00  	add	a4, a2, a1
8000d022: 93 77 f5 00  	andi	a5, a0, 15
8000d026: 11 81        	srli	a0, a0, 4
8000d028: e3 f5 d7 fe  	bgeu	a5, a3, -22 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x2e>
8000d02c: 93 e7 07 03  	ori	a5, a5, 48
8000d030: a3 0f f7 06  	sb	a5, 127(a4)
8000d034: fd 15        	addi	a1, a1, -1
8000d036: 65 f5        	bnez	a0, -24 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x3a>
8000d038: 0d a8        	j	50 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x86>
8000d03a: 08 61        	ld	a0, 0(a0)
8000d03c: 81 45        	mv	a1, zero
8000d03e: 30 00        	addi	a2, sp, 8
8000d040: a9 46        	addi	a3, zero, 10
8000d042: 39 a0        	j	14 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x6c>
8000d044: 93 87 77 03  	addi	a5, a5, 55
8000d048: a3 0f f7 06  	sb	a5, 127(a4)
8000d04c: fd 15        	addi	a1, a1, -1
8000d04e: 11 cd        	beqz	a0, 28 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x86>
8000d050: 33 07 b6 00  	add	a4, a2, a1
8000d054: 93 77 f5 00  	andi	a5, a0, 15
8000d058: 11 81        	srli	a0, a0, 4
8000d05a: e3 f5 d7 fe  	bgeu	a5, a3, -22 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x60>
8000d05e: 93 e7 07 03  	ori	a5, a5, 48
8000d062: a3 0f f7 06  	sb	a5, 127(a4)
8000d066: fd 15        	addi	a1, a1, -1
8000d068: 65 f5        	bnez	a0, -24 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h65700e50f045d1fbE+0x6c>
8000d06a: 13 85 05 08  	addi	a0, a1, 128
8000d06e: 93 06 10 08  	addi	a3, zero, 129
8000d072: 63 76 d5 02  	bgeu	a0, a3, 44 <.LBB462_15>
8000d076: b3 07 b0 40  	neg	a5, a1
8000d07a: 33 05 b6 00  	add	a0, a2, a1
8000d07e: 13 07 05 08  	addi	a4, a0, 128

000000008000d082 <.LBB462_14>:
8000d082: 17 36 00 00  	auipc	a2, 3
8000d086: 13 06 66 37  	addi	a2, a2, 886
8000d08a: 85 45        	addi	a1, zero, 1
8000d08c: 89 46        	addi	a3, zero, 2
8000d08e: 42 85        	add	a0, zero, a6
8000d090: 97 f0 ff ff  	auipc	ra, 1048575
8000d094: e7 80 20 dc  	jalr	-574(ra)
8000d098: aa 60        	ld	ra, 136(sp)
8000d09a: 49 61        	addi	sp, sp, 144
8000d09c: 82 80        	ret

000000008000d09e <.LBB462_15>:
8000d09e: 17 36 00 00  	auipc	a2, 3
8000d0a2: 13 06 26 34  	addi	a2, a2, 834
8000d0a6: 93 05 00 08  	addi	a1, zero, 128
8000d0aa: 97 f0 ff ff  	auipc	ra, 1048575
8000d0ae: e7 80 20 6d  	jalr	1746(ra)
8000d0b2: 00 00        	unimp	

Disassembly of section .text._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4f29d8511ba5e68eE:

000000008000d0b4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4f29d8511ba5e68eE>:
8000d0b4: 5d 71        	addi	sp, sp, -80
8000d0b6: 86 e4        	sd	ra, 72(sp)
8000d0b8: a2 e0        	sd	s0, 64(sp)
8000d0ba: 26 fc        	sd	s1, 56(sp)
8000d0bc: 4a f8        	sd	s2, 48(sp)
8000d0be: 03 69 05 00  	lwu	s2, 0(a0)
8000d0c2: 2e 85        	add	a0, zero, a1
8000d0c4: 93 55 49 00  	srli	a1, s2, 4
8000d0c8: 93 06 70 02  	addi	a3, zero, 39
8000d0cc: 13 07 10 27  	addi	a4, zero, 625

000000008000d0d0 <.LBB468_10>:
8000d0d0: 17 38 00 00  	auipc	a6, 3
8000d0d4: 13 08 a8 32  	addi	a6, a6, 810
8000d0d8: 63 f3 e5 02  	bgeu	a1, a4, 38 <.LBB468_10+0x2e>
8000d0dc: 93 05 30 06  	addi	a1, zero, 99
8000d0e0: 63 e0 25 0f  	bltu	a1, s2, 224 <.LBB468_10+0xf0>
8000d0e4: a5 45        	addi	a1, zero, 9
8000d0e6: 63 cd 25 13  	blt	a1, s2, 314 <.LBB468_10+0x150>
8000d0ea: 93 85 f6 ff  	addi	a1, a3, -1
8000d0ee: 13 06 91 00  	addi	a2, sp, 9
8000d0f2: 2e 96        	add	a2, a2, a1
8000d0f4: 93 06 09 03  	addi	a3, s2, 48
8000d0f8: 23 00 d6 00  	sb	a3, 0(a2)
8000d0fc: 91 a2        	j	324 <.LBB468_10+0x170>
8000d0fe: 81 46        	mv	a3, zero
8000d100: b7 35 1a 00  	lui	a1, 419
8000d104: 9b 85 35 6e  	addiw	a1, a1, 1763
8000d108: ba 05        	slli	a1, a1, 14
8000d10a: 93 85 75 ac  	addi	a1, a1, -1337
8000d10e: ba 05        	slli	a1, a1, 14
8000d110: 93 85 35 43  	addi	a1, a1, 1075
8000d114: b6 05        	slli	a1, a1, 13
8000d116: 93 88 b5 94  	addi	a7, a1, -1717
8000d11a: 89 65        	lui	a1, 2
8000d11c: 1b 83 05 71  	addiw	t1, a1, 1808
8000d120: c1 65        	lui	a1, 16
8000d122: 1b 8e c5 ff  	addiw	t3, a1, -4
8000d126: 37 f7 51 00  	lui	a4, 1311
8000d12a: 1b 07 57 b8  	addiw	a4, a4, -1147
8000d12e: 36 07        	slli	a4, a4, 13
8000d130: 13 07 77 3d  	addi	a4, a4, 983
8000d134: 3a 07        	slli	a4, a4, 14
8000d136: 13 07 f7 28  	addi	a4, a4, 655
8000d13a: 32 07        	slli	a4, a4, 12
8000d13c: 93 0e 37 5c  	addi	t4, a4, 1475
8000d140: 93 02 40 06  	addi	t0, zero, 100
8000d144: 1b 8f e5 ff  	addiw	t5, a1, -2
8000d148: 93 03 91 00  	addi	t2, sp, 9
8000d14c: b7 e5 f5 05  	lui	a1, 24414
8000d150: 9b 8f f5 0f  	addiw	t6, a1, 255
8000d154: 4a 86        	add	a2, zero, s2
8000d156: b3 37 19 03  	<unknown>
8000d15a: 13 d9 b7 00  	srli	s2, a5, 11
8000d15e: 33 07 69 02  	<unknown>
8000d162: 33 07 e6 40  	sub	a4, a2, a4
8000d166: b3 75 c7 01  	and	a1, a4, t3
8000d16a: 89 81        	srli	a1, a1, 2
8000d16c: b3 b5 d5 03  	<unknown>
8000d170: 89 81        	srli	a1, a1, 2
8000d172: 13 94 15 00  	slli	s0, a1, 1
8000d176: b3 85 55 02  	<unknown>
8000d17a: b3 05 b7 40  	sub	a1, a4, a1
8000d17e: 86 05        	slli	a1, a1, 1
8000d180: b3 f5 e5 01  	and	a1, a1, t5
8000d184: 33 07 04 01  	add	a4, s0, a6
8000d188: 33 84 d3 00  	add	s0, t2, a3
8000d18c: 83 44 07 00  	lbu	s1, 0(a4)
8000d190: 03 07 17 00  	lb	a4, 1(a4)
8000d194: c2 95        	add	a1, a1, a6
8000d196: 83 87 15 00  	lb	a5, 1(a1)
8000d19a: 83 c5 05 00  	lbu	a1, 0(a1)
8000d19e: 23 02 e4 02  	sb	a4, 36(s0)
8000d1a2: a3 01 94 02  	sb	s1, 35(s0)
8000d1a6: 23 03 f4 02  	sb	a5, 38(s0)
8000d1aa: a3 02 b4 02  	sb	a1, 37(s0)
8000d1ae: f1 16        	addi	a3, a3, -4
8000d1b0: e3 e2 cf fa  	bltu	t6, a2, -92 <.LBB468_10+0x84>
8000d1b4: 93 86 76 02  	addi	a3, a3, 39
8000d1b8: 93 05 30 06  	addi	a1, zero, 99
8000d1bc: e3 f4 25 f3  	bgeu	a1, s2, -216 <.LBB468_10+0x14>
8000d1c0: c1 65        	lui	a1, 16
8000d1c2: 1b 86 c5 ff  	addiw	a2, a1, -4
8000d1c6: 33 76 c9 00  	and	a2, s2, a2
8000d1ca: 09 82        	srli	a2, a2, 2
8000d1cc: 37 f7 51 00  	lui	a4, 1311
8000d1d0: 1b 07 57 b8  	addiw	a4, a4, -1147
8000d1d4: 36 07        	slli	a4, a4, 13
8000d1d6: 13 07 77 3d  	addi	a4, a4, 983
8000d1da: 3a 07        	slli	a4, a4, 14
8000d1dc: 13 07 f7 28  	addi	a4, a4, 655
8000d1e0: 32 07        	slli	a4, a4, 12
8000d1e2: 13 07 37 5c  	addi	a4, a4, 1475
8000d1e6: 33 36 e6 02  	<unknown>
8000d1ea: 09 82        	srli	a2, a2, 2
8000d1ec: 13 07 40 06  	addi	a4, zero, 100
8000d1f0: 33 07 e6 02  	<unknown>
8000d1f4: 33 07 e9 40  	sub	a4, s2, a4
8000d1f8: 06 07        	slli	a4, a4, 1
8000d1fa: f9 35        	addiw	a1, a1, -2
8000d1fc: f9 8d        	and	a1, a1, a4
8000d1fe: f9 16        	addi	a3, a3, -2
8000d200: c2 95        	add	a1, a1, a6
8000d202: 03 87 15 00  	lb	a4, 1(a1)
8000d206: 83 c5 05 00  	lbu	a1, 0(a1)
8000d20a: 93 07 91 00  	addi	a5, sp, 9
8000d20e: b6 97        	add	a5, a5, a3
8000d210: a3 80 e7 00  	sb	a4, 1(a5)
8000d214: 23 80 b7 00  	sb	a1, 0(a5)
8000d218: 32 89        	add	s2, zero, a2
8000d21a: a5 45        	addi	a1, zero, 9
8000d21c: e3 d7 25 ed  	bge	a1, s2, -306 <.LBB468_10+0x1a>
8000d220: 13 16 19 00  	slli	a2, s2, 1
8000d224: 93 85 e6 ff  	addi	a1, a3, -2
8000d228: 42 96        	add	a2, a2, a6
8000d22a: 83 06 16 00  	lb	a3, 1(a2)
8000d22e: 03 46 06 00  	lbu	a2, 0(a2)
8000d232: 13 07 91 00  	addi	a4, sp, 9
8000d236: 2e 97        	add	a4, a4, a1
8000d238: a3 00 d7 00  	sb	a3, 1(a4)
8000d23c: 23 00 c7 00  	sb	a2, 0(a4)
8000d240: 13 06 91 00  	addi	a2, sp, 9
8000d244: 33 07 b6 00  	add	a4, a2, a1
8000d248: 13 06 70 02  	addi	a2, zero, 39
8000d24c: b3 07 b6 40  	sub	a5, a2, a1

000000008000d250 <.LBB468_11>:
8000d250: 17 36 00 00  	auipc	a2, 3
8000d254: 13 06 86 fc  	addi	a2, a2, -56
8000d258: 85 45        	addi	a1, zero, 1
8000d25a: 81 46        	mv	a3, zero
8000d25c: 97 f0 ff ff  	auipc	ra, 1048575
8000d260: e7 80 60 bf  	jalr	-1034(ra)
8000d264: 42 79        	ld	s2, 48(sp)
8000d266: e2 74        	ld	s1, 56(sp)
8000d268: 06 64        	ld	s0, 64(sp)
8000d26a: a6 60        	ld	ra, 72(sp)
8000d26c: 61 61        	addi	sp, sp, 80
8000d26e: 82 80        	ret

Disassembly of section .text._ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h056fc685b1c7ea74E:

000000008000d270 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h3ddc565198bd69ffE>:
8000d270: 5d 71        	addi	sp, sp, -80
8000d272: 86 e4        	sd	ra, 72(sp)
8000d274: a2 e0        	sd	s0, 64(sp)
8000d276: 26 fc        	sd	s1, 56(sp)
8000d278: 4a f8        	sd	s2, 48(sp)
8000d27a: 03 39 05 00  	ld	s2, 0(a0)
8000d27e: 2e 85        	add	a0, zero, a1
8000d280: 93 55 49 00  	srli	a1, s2, 4
8000d284: 93 06 70 02  	addi	a3, zero, 39
8000d288: 13 07 10 27  	addi	a4, zero, 625

000000008000d28c <.LBB470_10>:
8000d28c: 17 38 00 00  	auipc	a6, 3
8000d290: 13 08 e8 16  	addi	a6, a6, 366
8000d294: 63 f3 e5 02  	bgeu	a1, a4, 38 <.LBB470_10+0x2e>
8000d298: 93 05 30 06  	addi	a1, zero, 99
8000d29c: 63 c0 25 0f  	blt	a1, s2, 224 <.LBB470_10+0xf0>
8000d2a0: a5 45        	addi	a1, zero, 9
8000d2a2: 63 cd 25 13  	blt	a1, s2, 314 <.LBB470_10+0x150>
8000d2a6: 93 85 f6 ff  	addi	a1, a3, -1
8000d2aa: 13 06 91 00  	addi	a2, sp, 9
8000d2ae: 2e 96        	add	a2, a2, a1
8000d2b0: 93 06 09 03  	addi	a3, s2, 48
8000d2b4: 23 00 d6 00  	sb	a3, 0(a2)
8000d2b8: 91 a2        	j	324 <.LBB470_10+0x170>
8000d2ba: 81 46        	mv	a3, zero
8000d2bc: b7 35 1a 00  	lui	a1, 419
8000d2c0: 9b 85 35 6e  	addiw	a1, a1, 1763
8000d2c4: ba 05        	slli	a1, a1, 14
8000d2c6: 93 85 75 ac  	addi	a1, a1, -1337
8000d2ca: ba 05        	slli	a1, a1, 14
8000d2cc: 93 85 35 43  	addi	a1, a1, 1075
8000d2d0: b6 05        	slli	a1, a1, 13
8000d2d2: 93 88 b5 94  	addi	a7, a1, -1717
8000d2d6: 89 65        	lui	a1, 2
8000d2d8: 1b 83 05 71  	addiw	t1, a1, 1808
8000d2dc: c1 65        	lui	a1, 16
8000d2de: 1b 8e c5 ff  	addiw	t3, a1, -4
8000d2e2: 37 f7 51 00  	lui	a4, 1311
8000d2e6: 1b 07 57 b8  	addiw	a4, a4, -1147
8000d2ea: 36 07        	slli	a4, a4, 13
8000d2ec: 13 07 77 3d  	addi	a4, a4, 983
8000d2f0: 3a 07        	slli	a4, a4, 14
8000d2f2: 13 07 f7 28  	addi	a4, a4, 655
8000d2f6: 32 07        	slli	a4, a4, 12
8000d2f8: 93 0e 37 5c  	addi	t4, a4, 1475
8000d2fc: 93 02 40 06  	addi	t0, zero, 100
8000d300: 1b 8f e5 ff  	addiw	t5, a1, -2
8000d304: 93 03 91 00  	addi	t2, sp, 9
8000d308: b7 e5 f5 05  	lui	a1, 24414
8000d30c: 9b 8f f5 0f  	addiw	t6, a1, 255
8000d310: 4a 86        	add	a2, zero, s2
8000d312: b3 37 19 03  	<unknown>
8000d316: 13 d9 b7 00  	srli	s2, a5, 11
8000d31a: 33 07 69 02  	<unknown>
8000d31e: 33 07 e6 40  	sub	a4, a2, a4
8000d322: b3 75 c7 01  	and	a1, a4, t3
8000d326: 89 81        	srli	a1, a1, 2
8000d328: b3 b5 d5 03  	<unknown>
8000d32c: 89 81        	srli	a1, a1, 2
8000d32e: 13 94 15 00  	slli	s0, a1, 1
8000d332: b3 85 55 02  	<unknown>
8000d336: b3 05 b7 40  	sub	a1, a4, a1
8000d33a: 86 05        	slli	a1, a1, 1
8000d33c: b3 f5 e5 01  	and	a1, a1, t5
8000d340: 33 07 04 01  	add	a4, s0, a6
8000d344: 33 84 d3 00  	add	s0, t2, a3
8000d348: 83 44 07 00  	lbu	s1, 0(a4)
8000d34c: 03 07 17 00  	lb	a4, 1(a4)
8000d350: c2 95        	add	a1, a1, a6
8000d352: 83 87 15 00  	lb	a5, 1(a1)
8000d356: 83 c5 05 00  	lbu	a1, 0(a1)
8000d35a: 23 02 e4 02  	sb	a4, 36(s0)
8000d35e: a3 01 94 02  	sb	s1, 35(s0)
8000d362: 23 03 f4 02  	sb	a5, 38(s0)
8000d366: a3 02 b4 02  	sb	a1, 37(s0)
8000d36a: f1 16        	addi	a3, a3, -4
8000d36c: e3 e2 cf fa  	bltu	t6, a2, -92 <.LBB470_10+0x84>
8000d370: 93 86 76 02  	addi	a3, a3, 39
8000d374: 93 05 30 06  	addi	a1, zero, 99
8000d378: e3 d4 25 f3  	bge	a1, s2, -216 <.LBB470_10+0x14>
8000d37c: c1 65        	lui	a1, 16
8000d37e: 1b 86 c5 ff  	addiw	a2, a1, -4
8000d382: 33 76 c9 00  	and	a2, s2, a2
8000d386: 09 82        	srli	a2, a2, 2
8000d388: 37 f7 51 00  	lui	a4, 1311
8000d38c: 1b 07 57 b8  	addiw	a4, a4, -1147
8000d390: 36 07        	slli	a4, a4, 13
8000d392: 13 07 77 3d  	addi	a4, a4, 983
8000d396: 3a 07        	slli	a4, a4, 14
8000d398: 13 07 f7 28  	addi	a4, a4, 655
8000d39c: 32 07        	slli	a4, a4, 12
8000d39e: 13 07 37 5c  	addi	a4, a4, 1475
8000d3a2: 33 36 e6 02  	<unknown>
8000d3a6: 09 82        	srli	a2, a2, 2
8000d3a8: 13 07 40 06  	addi	a4, zero, 100
8000d3ac: 33 07 e6 02  	<unknown>
8000d3b0: 33 07 e9 40  	sub	a4, s2, a4
8000d3b4: 06 07        	slli	a4, a4, 1
8000d3b6: f9 35        	addiw	a1, a1, -2
8000d3b8: f9 8d        	and	a1, a1, a4
8000d3ba: f9 16        	addi	a3, a3, -2
8000d3bc: c2 95        	add	a1, a1, a6
8000d3be: 03 87 15 00  	lb	a4, 1(a1)
8000d3c2: 83 c5 05 00  	lbu	a1, 0(a1)
8000d3c6: 93 07 91 00  	addi	a5, sp, 9
8000d3ca: b6 97        	add	a5, a5, a3
8000d3cc: a3 80 e7 00  	sb	a4, 1(a5)
8000d3d0: 23 80 b7 00  	sb	a1, 0(a5)
8000d3d4: 32 89        	add	s2, zero, a2
8000d3d6: a5 45        	addi	a1, zero, 9
8000d3d8: e3 d7 25 ed  	bge	a1, s2, -306 <.LBB470_10+0x1a>
8000d3dc: 13 16 19 00  	slli	a2, s2, 1
8000d3e0: 93 85 e6 ff  	addi	a1, a3, -2
8000d3e4: 42 96        	add	a2, a2, a6
8000d3e6: 83 06 16 00  	lb	a3, 1(a2)
8000d3ea: 03 46 06 00  	lbu	a2, 0(a2)
8000d3ee: 13 07 91 00  	addi	a4, sp, 9
8000d3f2: 2e 97        	add	a4, a4, a1
8000d3f4: a3 00 d7 00  	sb	a3, 1(a4)
8000d3f8: 23 00 c7 00  	sb	a2, 0(a4)
8000d3fc: 13 06 91 00  	addi	a2, sp, 9
8000d400: 33 07 b6 00  	add	a4, a2, a1
8000d404: 13 06 70 02  	addi	a2, zero, 39
8000d408: b3 07 b6 40  	sub	a5, a2, a1

000000008000d40c <.LBB470_11>:
8000d40c: 17 36 00 00  	auipc	a2, 3
8000d410: 13 06 c6 e0  	addi	a2, a2, -500
8000d414: 85 45        	addi	a1, zero, 1
8000d416: 81 46        	mv	a3, zero
8000d418: 97 f0 ff ff  	auipc	ra, 1048575
8000d41c: e7 80 a0 a3  	jalr	-1478(ra)
8000d420: 42 79        	ld	s2, 48(sp)
8000d422: e2 74        	ld	s1, 56(sp)
8000d424: 06 64        	ld	s0, 64(sp)
8000d426: a6 60        	ld	ra, 72(sp)
8000d428: 61 61        	addi	sp, sp, 80
8000d42a: 82 80        	ret

Disassembly of section .text._ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h9b30d63a2778a2bdE:

000000008000d42c <_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h9b30d63a2778a2bdE>:
8000d42c: 90 75        	ld	a2, 40(a1)
8000d42e: 88 71        	ld	a0, 32(a1)
8000d430: 1c 6e        	ld	a5, 24(a2)

000000008000d432 <.LBB494_1>:
8000d432: 97 45 00 00  	auipc	a1, 4
8000d436: 93 85 e5 90  	addi	a1, a1, -1778
8000d43a: 15 46        	addi	a2, zero, 5
8000d43c: 82 87        	jr	a5

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc3a74066347440a3E:

000000008000d43e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc3a74066347440a3E>:
8000d43e: 97 36 00 00  	auipc	a3, 3
8000d442: 93 86 a6 0b  	addi	a3, a3, 186
8000d446: 09 46        	addi	a2, zero, 2
8000d448: 2e 85        	add	a0, zero, a1
8000d44a: b6 85        	add	a1, zero, a3
8000d44c: 17 f3 ff ff  	auipc	t1, 1048575
8000d450: 67 00 03 c9  	jr	-880(t1)

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc803731d5e879d1bE:

000000008000d454 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc803731d5e879d1bE>:
8000d454: 10 65        	ld	a2, 8(a0)
8000d456: 08 61        	ld	a0, 0(a0)
8000d458: 1c 6e        	ld	a5, 24(a2)
8000d45a: 82 87        	jr	a5

Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h0ab56ae6638005b3E:

000000008000d45c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h0ab56ae6638005b3E>:
8000d45c: 14 61        	ld	a3, 0(a0)
8000d45e: 10 65        	ld	a2, 8(a0)
8000d460: 2e 85        	add	a0, zero, a1
8000d462: b6 85        	add	a1, zero, a3
8000d464: 17 f3 ff ff  	auipc	t1, 1048575
8000d468: 67 00 83 c7  	jr	-904(t1)

Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h10736fa640ad137aE:

000000008000d46c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h10736fa640ad137aE>:
8000d46c: 08 61        	ld	a0, 0(a0)
8000d46e: 14 61        	ld	a3, 0(a0)
8000d470: 10 65        	ld	a2, 8(a0)
8000d472: 2e 85        	add	a0, zero, a1
8000d474: b6 85        	add	a1, zero, a3
8000d476: 17 f3 ff ff  	auipc	t1, 1048575
8000d47a: 67 00 63 c6  	jr	-922(t1)

Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hf8d117bc396dc3c6E:

000000008000d47e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hf8d117bc396dc3c6E>:
8000d47e: 39 71        	addi	sp, sp, -64
8000d480: 06 fc        	sd	ra, 56(sp)
8000d482: 10 61        	ld	a2, 0(a0)
8000d484: 14 76        	ld	a3, 40(a2)
8000d486: 88 71        	ld	a0, 32(a1)
8000d488: 8c 75        	ld	a1, 40(a1)
8000d48a: 36 f8        	sd	a3, 48(sp)
8000d48c: 14 72        	ld	a3, 32(a2)
8000d48e: 36 f4        	sd	a3, 40(sp)
8000d490: 14 6e        	ld	a3, 24(a2)
8000d492: 36 f0        	sd	a3, 32(sp)
8000d494: 14 6a        	ld	a3, 16(a2)
8000d496: 36 ec        	sd	a3, 24(sp)
8000d498: 14 66        	ld	a3, 8(a2)
8000d49a: 36 e8        	sd	a3, 16(sp)
8000d49c: 10 62        	ld	a2, 0(a2)
8000d49e: 32 e4        	sd	a2, 8(sp)
8000d4a0: 30 00        	addi	a2, sp, 8
8000d4a2: 97 f0 ff ff  	auipc	ra, 1048575
8000d4a6: e7 80 e0 80  	jalr	-2034(ra)
8000d4aa: e2 70        	ld	ra, 56(sp)
8000d4ac: 21 61        	addi	sp, sp, 64
8000d4ae: 82 80        	ret

Disassembly of section .text._ZN4core7unicode12unicode_data15grapheme_extend6lookup17hc6378705226a5029E:

000000008000d4b0 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17hc6378705226a5029E>:
8000d4b0: 41 11        	addi	sp, sp, -16
8000d4b2: 06 e4        	sd	ra, 8(sp)
8000d4b4: 81 46        	mv	a3, zero
8000d4b6: 9b 05 05 00  	sext.w	a1, a0
8000d4ba: 45 66        	lui	a2, 17
8000d4bc: 1b 07 46 d2  	addiw	a4, a2, -732
8000d4c0: 1b 16 b5 00  	slliw	a2, a0, 11
8000d4c4: 63 e3 e5 00  	bltu	a1, a4, 6 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17hc6378705226a5029E+0x1a>
8000d4c8: bd 46        	addi	a3, zero, 15
8000d4ca: 13 87 86 00  	addi	a4, a3, 8
8000d4ce: 93 17 27 00  	slli	a5, a4, 2

000000008000d4d2 <.LBB614_29>:
8000d4d2: 97 45 00 00  	auipc	a1, 4
8000d4d6: 93 85 65 87  	addi	a1, a1, -1930
8000d4da: ae 97        	add	a5, a5, a1
8000d4dc: 9c 43        	lw	a5, 0(a5)
8000d4de: 9b 97 b7 00  	slliw	a5, a5, 11
8000d4e2: 63 63 f6 00  	bltu	a2, a5, 6 <.LBB614_29+0x16>
8000d4e6: ba 86        	add	a3, zero, a4
8000d4e8: 13 87 46 00  	addi	a4, a3, 4
8000d4ec: 93 17 27 00  	slli	a5, a4, 2
8000d4f0: ae 97        	add	a5, a5, a1
8000d4f2: 9c 43        	lw	a5, 0(a5)
8000d4f4: 9b 97 b7 00  	slliw	a5, a5, 11
8000d4f8: 63 63 f6 00  	bltu	a2, a5, 6 <.LBB614_29+0x2c>
8000d4fc: ba 86        	add	a3, zero, a4
8000d4fe: 13 87 26 00  	addi	a4, a3, 2
8000d502: 93 17 27 00  	slli	a5, a4, 2
8000d506: ae 97        	add	a5, a5, a1
8000d508: 9c 43        	lw	a5, 0(a5)
8000d50a: 9b 97 b7 00  	slliw	a5, a5, 11
8000d50e: 63 63 f6 00  	bltu	a2, a5, 6 <.LBB614_29+0x42>
8000d512: ba 86        	add	a3, zero, a4
8000d514: 13 87 16 00  	addi	a4, a3, 1
8000d518: 93 17 27 00  	slli	a5, a4, 2
8000d51c: ae 97        	add	a5, a5, a1
8000d51e: 9c 43        	lw	a5, 0(a5)
8000d520: 9b 97 b7 00  	slliw	a5, a5, 11
8000d524: 63 63 f6 00  	bltu	a2, a5, 6 <.LBB614_29+0x58>
8000d528: ba 86        	add	a3, zero, a4
8000d52a: 13 97 26 00  	slli	a4, a3, 2
8000d52e: 2e 97        	add	a4, a4, a1
8000d530: 18 43        	lw	a4, 0(a4)
8000d532: 1b 17 b7 00  	slliw	a4, a4, 11
8000d536: b3 37 c7 00  	sltu	a5, a4, a2
8000d53a: 39 8e        	xor	a2, a2, a4
8000d53c: 13 36 16 00  	seqz	a2, a2
8000d540: 3e 96        	add	a2, a2, a5
8000d542: 33 07 d6 00  	add	a4, a2, a3
8000d546: f9 46        	addi	a3, zero, 30
8000d548: 63 e4 e6 0a  	bltu	a3, a4, 168 <.LBB614_32>
8000d54c: 93 17 27 00  	slli	a5, a4, 2
8000d550: 13 06 10 2b  	addi	a2, zero, 689
8000d554: 63 07 d7 00  	beq	a4, a3, 14 <.LBB614_29+0x90>
8000d558: 33 86 f5 00  	add	a2, a1, a5
8000d55c: 03 66 46 00  	lwu	a2, 4(a2)
8000d560: 55 82        	srli	a2, a2, 21
8000d562: 93 06 f7 ff  	addi	a3, a4, -1
8000d566: 63 74 d7 00  	bgeu	a4, a3, 8 <.LBB614_29+0x9c>
8000d56a: 01 47        	mv	a4, zero
8000d56c: 21 a8        	j	24 <.LBB614_29+0xb2>
8000d56e: 7d 47        	addi	a4, zero, 31
8000d570: 63 fb e6 08  	bgeu	a3, a4, 150 <.LBB614_33>
8000d574: 8a 06        	slli	a3, a3, 2
8000d576: ae 96        	add	a3, a3, a1
8000d578: 83 e6 06 00  	lwu	a3, 0(a3)
8000d57c: 37 07 20 00  	lui	a4, 512
8000d580: 7d 37        	addiw	a4, a4, -1
8000d582: 75 8f        	and	a4, a4, a3
8000d584: be 95        	add	a1, a1, a5
8000d586: 83 e5 05 00  	lwu	a1, 0(a1)
8000d58a: d5 81        	srli	a1, a1, 21
8000d58c: 93 86 15 00  	addi	a3, a1, 1
8000d590: 63 0f d6 02  	beq	a2, a3, 62 <.LBB614_30+0x22>
8000d594: 93 07 10 2b  	addi	a5, zero, 689
8000d598: 2e 88        	add	a6, zero, a1
8000d59a: 63 e4 b7 00  	bltu	a5, a1, 8 <.LBB614_29+0xd0>
8000d59e: 13 08 10 2b  	addi	a6, zero, 689
8000d5a2: 81 47        	mv	a5, zero
8000d5a4: 3b 07 e5 40  	subw	a4, a0, a4
8000d5a8: 13 05 f6 ff  	addi	a0, a2, -1

000000008000d5ac <.LBB614_30>:
8000d5ac: 17 46 00 00  	auipc	a2, 4
8000d5b0: 13 06 86 81  	addi	a2, a2, -2024
8000d5b4: 63 02 b8 02  	beq	a6, a1, 36 <.LBB614_31>
8000d5b8: b3 86 c5 00  	add	a3, a1, a2
8000d5bc: 83 c6 06 00  	lbu	a3, 0(a3)
8000d5c0: b5 9f        	addw	a5, a5, a3
8000d5c2: 63 66 f7 00  	bltu	a4, a5, 12 <.LBB614_30+0x22>
8000d5c6: 85 05        	addi	a1, a1, 1
8000d5c8: e3 16 b5 fe  	bne	a0, a1, -20 <.LBB614_30+0x8>
8000d5cc: aa 85        	add	a1, zero, a0
8000d5ce: 13 f5 15 00  	andi	a0, a1, 1
8000d5d2: a2 60        	ld	ra, 8(sp)
8000d5d4: 41 01        	addi	sp, sp, 16
8000d5d6: 82 80        	ret

000000008000d5d8 <.LBB614_31>:
8000d5d8: 17 36 00 00  	auipc	a2, 3
8000d5dc: 13 06 86 70  	addi	a2, a2, 1800
8000d5e0: 93 05 10 2b  	addi	a1, zero, 689
8000d5e4: 42 85        	add	a0, zero, a6
8000d5e6: 97 e0 ff ff  	auipc	ra, 1048574
8000d5ea: e7 80 00 18  	jalr	384(ra)
8000d5ee: 00 00        	unimp	

000000008000d5f0 <.LBB614_32>:
8000d5f0: 17 36 00 00  	auipc	a2, 3
8000d5f4: 13 06 86 6d  	addi	a2, a2, 1752
8000d5f8: fd 45        	addi	a1, zero, 31
8000d5fa: 3a 85        	add	a0, zero, a4
8000d5fc: 97 e0 ff ff  	auipc	ra, 1048574
8000d600: e7 80 a0 16  	jalr	362(ra)
8000d604: 00 00        	unimp	

000000008000d606 <.LBB614_33>:
8000d606: 17 36 00 00  	auipc	a2, 3
8000d60a: 13 06 26 6f  	addi	a2, a2, 1778
8000d60e: fd 45        	addi	a1, zero, 31
8000d610: 36 85        	add	a0, zero, a3
8000d612: 97 e0 ff ff  	auipc	ra, 1048574
8000d616: e7 80 40 15  	jalr	340(ra)
8000d61a: 00 00        	unimp	

Disassembly of section .text.memcpy:

000000008000d61c <memcpy>:
8000d61c: 11 ca        	beqz	a2, 20 <memcpy+0x14>
8000d61e: aa 86        	add	a3, zero, a0
8000d620: 03 87 05 00  	lb	a4, 0(a1)
8000d624: 23 80 e6 00  	sb	a4, 0(a3)
8000d628: 7d 16        	addi	a2, a2, -1
8000d62a: 85 06        	addi	a3, a3, 1
8000d62c: 85 05        	addi	a1, a1, 1
8000d62e: 6d fa        	bnez	a2, -14 <memcpy+0x4>
8000d630: 82 80        	ret

Disassembly of section .text.memset:

000000008000d632 <memset>:
8000d632: 19 c6        	beqz	a2, 14 <memset+0xe>
8000d634: aa 86        	add	a3, zero, a0
8000d636: 23 80 b6 00  	sb	a1, 0(a3)
8000d63a: 7d 16        	addi	a2, a2, -1
8000d63c: 85 06        	addi	a3, a3, 1
8000d63e: 65 fe        	bnez	a2, -8 <memset+0x4>
8000d640: 82 80        	ret
