	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.syntax unified
	.globl	_add                            @ -- Begin function add
	.p2align	1
	.code	16                              @ @add
	.thumb_func	_add
_add:
@ %bb.0:
	sub	sp, #4
	str	r0, [sp]
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	ldr	r0, [sp]
	add	sp, #4
	bx	lr
                                        @ -- End function
	.globl	_main                           @ -- Begin function main
	.p2align	1
	.code	16                              @ @main
	.thumb_func	_main
_main:
@ %bb.0:
	push	{r7, lr}
	mov	r7, sp
	sub	sp, #12
	movs	r0, #0
	str	r0, [sp, #8]
	movs	r0, #3
	str	r0, [sp, #4]
	movs	r0, #0
	str	r0, [sp]
LBB1_1:                                 @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp]
	cmp	r0, #5
	bge	LBB1_6
@ %bb.2:                                @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp, #4]
	cmp	r0, #6
	bge	LBB1_4
@ %bb.3:                                @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp, #4]
	bl	_add
	str	r0, [sp, #4]
LBB1_4:                                 @   in Loop: Header=BB1_1 Depth=1
	b	LBB1_5
LBB1_5:                                 @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	LBB1_1
LBB1_6:
	ldr	r1, [sp, #4]
	movw	r0, :lower16:(L_.str-(LPC1_0+4))
	movt	r0, :upper16:(L_.str-(LPC1_0+4))
LPC1_0:
	add	r0, pc
	bl	_printf
	movs	r0, #0
	add	sp, #12
	pop	{r7, pc}
                                        @ -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 @ @.str
	.asciz	"answer:%d\n"

.subsections_via_symbols
