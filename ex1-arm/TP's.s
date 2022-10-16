	.section	__TEXT,__text,regular,pure_instructions
	.syntax unified



@ 以下定义add函数
	.globl	_add                            @ add函数
	.p2align	1                           @ 1字节对齐
	.code	16                              
	.thumb_func	_add
_add:
@ 用r0-r3传参 函数一般都会开辟个栈帧，但其实这个函数没必要，一条指令add就够了
	@sub	sp, #4
	add	r0, #1
	@add	sp, #4
	bx	lr
@ -- End function

@以下定义main
.globl	_main                           
	.p2align	1
	.code	16                              @ @main
	.thumb_func	_main
_main:
    push	{r7, lr}    @因为用了系统函数printf所以存一下系统pc
    sub	sp, #12         @栈帧                       
    @两个变量j=0,i=3
    movs	r0, #0      @0-3是j                          
    str	r0, [sp]
    movs	r0, #3      @4-7是i
	str	r0, [sp, #4]
begin_for:
    @循环条件判断
    ldr	r0, [sp]
	cmp	r0, #5
    bge end_for
    @if条件判断
    ldr	r0, [sp, #4]
	cmp	r0, #6
	bge	end_if
    @if内容
    ldr	r0, [sp, #4]    @i存入r0传参
	bl	_add
	str	r0, [sp, #4]    @更新i             
end_if:
    ldr	r0, [sp]
	adds	r0, #1      @j++
	str	r0, [sp]    
	b	begin_for:
end_for:
    @调用printf
	ldr	r1, [sp, #4]    @第二个参数=i
	movw	r0, :lower16:(output_str-call_print)
	movt	r0, :upper16:(output_str-call_print)
    add	r0, pc          @以上三条指令将“answer”字符串的地址存入r0，方法是算出pc到字符串的偏移再加pc
call_print:
	bl	_printf
    add	sp, #12         @恢复栈帧
    pop	{r7, pc}        @恢复pc

    .section	__TEXT,__cstring,cstring_literals
output_str:                                 @ @.str
	.asciz	"answer:%d\n"


.subsections_via_symbols                    @ 编译器生成的汇编都有这个，我也不知道是啥


