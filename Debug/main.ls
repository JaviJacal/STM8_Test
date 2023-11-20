   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  72                     ; 11 void delay (int ms) //Function Definition 
  72                     ; 12 {
  74                     	switch	.text
  75  0000               _delay:
  77  0000 89            	pushw	x
  78  0001 5204          	subw	sp,#4
  79       00000004      OFST:	set	4
  82                     ; 13     int i =0 ;
  84                     ; 14     int j=0;
  86                     ; 15     for (i=0; i<=ms; i++)
  88  0003 5f            	clrw	x
  89  0004 1f01          	ldw	(OFST-3,sp),x
  92  0006 201a          	jra	L34
  93  0008               L73:
  94                     ; 17         for (j=0; j<120; j++) // Nop = Fosc/4
  96  0008 5f            	clrw	x
  97  0009 1f03          	ldw	(OFST-1,sp),x
  99  000b               L74:
 100                     ; 18         _asm("nop"); //Perform no operation //assembly code  
 103  000b 9d            nop
 105                     ; 17         for (j=0; j<120; j++) // Nop = Fosc/4
 107  000c 1e03          	ldw	x,(OFST-1,sp)
 108  000e 1c0001        	addw	x,#1
 109  0011 1f03          	ldw	(OFST-1,sp),x
 113  0013 9c            	rvf
 114  0014 1e03          	ldw	x,(OFST-1,sp)
 115  0016 a30078        	cpw	x,#120
 116  0019 2ff0          	jrslt	L74
 117                     ; 15     for (i=0; i<=ms; i++)
 119  001b 1e01          	ldw	x,(OFST-3,sp)
 120  001d 1c0001        	addw	x,#1
 121  0020 1f01          	ldw	(OFST-3,sp),x
 123  0022               L34:
 126  0022 9c            	rvf
 127  0023 1e01          	ldw	x,(OFST-3,sp)
 128  0025 1305          	cpw	x,(OFST+1,sp)
 129  0027 2ddf          	jrsle	L73
 130                     ; 20 }
 133  0029 5b06          	addw	sp,#6
 134  002b 81            	ret
 162                     ; 22 main()
 162                     ; 23 {
 163                     	switch	.text
 164  002c               _main:
 168                     ; 24 GPIO_DeInit(GPIOC); //prepare Port C for working 
 170  002c ae500a        	ldw	x,#20490
 171  002f cd0000        	call	_GPIO_DeInit
 173                     ; 25 GPIO_DeInit(GPIOD); // prepare Port D for working 
 175  0032 ae500f        	ldw	x,#20495
 176  0035 cd0000        	call	_GPIO_DeInit
 178                     ; 28  GPIO_Init (Buzzer, GPIO_MODE_OUT_PP_LOW_SLOW); 
 180  0038 4bc0          	push	#192
 181  003a 4b10          	push	#16
 182  003c ae500f        	ldw	x,#20495
 183  003f cd0000        	call	_GPIO_Init
 185  0042 85            	popw	x
 186                     ; 31  GPIO_Init (Green_LED, GPIO_MODE_OUT_PP_LOW_SLOW);
 188  0043 4bc0          	push	#192
 189  0045 4b10          	push	#16
 190  0047 ae500a        	ldw	x,#20490
 191  004a cd0000        	call	_GPIO_Init
 193  004d 85            	popw	x
 194  004e               L56:
 195                     ; 39         GPIO_WriteHigh(Green_LED); //LED OFF
 197  004e 4b10          	push	#16
 198  0050 ae500a        	ldw	x,#20490
 199  0053 cd0000        	call	_GPIO_WriteHigh
 201  0056 84            	pop	a
 202                     ; 40         GPIO_WriteHigh(Buzzer); //LED OFF
 204  0057 4b10          	push	#16
 205  0059 ae500f        	ldw	x,#20495
 206  005c cd0000        	call	_GPIO_WriteHigh
 208  005f 84            	pop	a
 209                     ; 41         delay (1000);
 211  0060 ae03e8        	ldw	x,#1000
 212  0063 ad9b          	call	_delay
 214                     ; 42         GPIO_WriteLow(Green_LED); //LED ON
 216  0065 4b10          	push	#16
 217  0067 ae500a        	ldw	x,#20490
 218  006a cd0000        	call	_GPIO_WriteLow
 220  006d 84            	pop	a
 221                     ; 43         GPIO_WriteLow(Buzzer); //LED ON
 223  006e 4b10          	push	#16
 224  0070 ae500f        	ldw	x,#20495
 225  0073 cd0000        	call	_GPIO_WriteLow
 227  0076 84            	pop	a
 228                     ; 44         delay (1000);
 230  0077 ae03e8        	ldw	x,#1000
 231  007a ad84          	call	_delay
 234  007c 20d0          	jra	L56
 247                     	xdef	_main
 248                     	xdef	_delay
 249                     	xref	_GPIO_WriteLow
 250                     	xref	_GPIO_WriteHigh
 251                     	xref	_GPIO_Init
 252                     	xref	_GPIO_DeInit
 271                     	end
