/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

 #define Green_LED GPIOC, GPIO_PIN_4
 #define Buzzer GPIOD, GPIO_PIN_4

 #include "STM8S.h"

void delay (int ms) //Function Definition 
{
    int i =0 ;
    int j=0;
    for (i=0; i<=ms; i++)
    {
        for (j=0; j<120; j++) // Nop = Fosc/4
        _asm("nop"); //Perform no operation //assembly code  
    }
}

main()
{
GPIO_DeInit(GPIOC); //prepare Port C for working 
GPIO_DeInit(GPIOD); // prepare Port D for working 

// Declare PD4  as ush Pull Output pin
 GPIO_Init (Buzzer, GPIO_MODE_OUT_PP_LOW_SLOW); 

// Declare PA3 as Push Pull Output pin
 GPIO_Init (Green_LED, GPIO_MODE_OUT_PP_LOW_SLOW);

//Declare PB5 as push pull Output pin
//GPIO_Init (GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_SLOW);

while (1)
{

        GPIO_WriteHigh(Green_LED); //LED OFF
        GPIO_WriteHigh(Buzzer); //LED OFF
        delay (1000);
        GPIO_WriteLow(Green_LED); //LED ON
        GPIO_WriteLow(Buzzer); //LED ON
        delay (1000);
}
}