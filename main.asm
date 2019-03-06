;Cesar Sepulveda
;Date:2/6/19
;CPSC 240
;Assignment #5:Create a procedure name Extended_Sub that subtracts two binary integers of 
;arbitrary size. The storage size of the two integers must be the same, and their size must 
;be a multiply of 32 bites. Write a test program that passes several pairs of integers, each 
;at least 10 bytes long. 
						
INCLUDE Irvine32.inc							            ;Including the irvine library

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	num1 QWORD 0000000100000000h				        ;Setting the value of num1
	num2 QWORD 0000000100000000h				        ;Setting the value of num2
.code

main PROC
	mov EAX, num1								                ;Moving num1 to the EAX register
	mov EDX, num2								                ;Moving num2 to the EDX register
	call Extended_Sub							              ;Calling the Extended_Sub procedure

	INVOKE ExitProcess, 0
main ENDP

Extended_Sub PROC								              ;Start of the Extended_Sub Procedure
	mov edx,1									                  ; set upper half					;
	mov eax,0									                  ; set lower half
	sub eax,1									                  ; subtract lower half
	sbb edx,0									                  ; subtract upper half
	EDX:EAX = 00000000 FFFFFFFF
	call WriteBinB								              ;Calling the WriteBinB procedure
	call Crlf									                  ;Calling the Crlf procedure

	ret
Extended_Sub ENDP								              ;End of Extended_Sub pocedure

END main
