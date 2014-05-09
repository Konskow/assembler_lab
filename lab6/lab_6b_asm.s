
	.type fiba, @function	
	.globl fiba
	.type fibai, @function
	.globl fibai
	

fiba:	pushl %ebp
	movl %esp, %ebp

	subl $4, %esp

	movl 8(%ebp), %eax

	cmpl $0, %eax
	jz	f_0
	cmpl $1, %eax
	jz	f_1

	pushl %eax

	subl $2, %eax

	pushl %eax
	call fiba
	addl $4, %esp

	movl %eax, -4(%ebp)

	popl %eax

	dec %eax

	pushl %eax
	call fiba 
	addl $4, %esp

	addl -4(%ebp), %eax

	jmp f_e

f_0:
	movl $0, %eax
	jmp f_e

f_1:
	movl $1, %eax

f_e:
	movl %ebp, %esp
	popl %ebp
	ret

	
fibai:
	movl %eax,%ecx
	dec %ecx		
	movl $1, %edx
	movl $0, %ebx
	
next:
	movl %edx, %eax
	addl %ebx, %eax
	movl %edx, %ebx
	movl %eax, %edx
	
	loop next
	