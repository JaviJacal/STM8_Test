/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

 #define Green_LED GPIOC, GPIO_PIN_4
 #define Buzzer GPIOD, GPIO_PIN_4

 #include "STM8S.h"
#include "stm8s103_serial.h" 

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

    Serial_begin(9600);
    Serial_print_string("Enter command");
    Serial_newline();

    // Declare PD4  as ush Pull Output pin
    GPIO_Init (Buzzer, GPIO_MODE_OUT_PP_LOW_SLOW); 

    // Declare PC4 as Push Pull Output pin
    GPIO_Init (Green_LED, GPIO_MODE_OUT_PP_LOW_SLOW);


    while (1)
    {
        if(Serial_available())
        {
            Serial_print_string("You have pressed: ");
            ch = Serial_read_char();
            Serial_print_char(ch);
            Serial_newline();

            if (ch == '0'){
                GPIO_WriteHigh(Green_LED); //LED OFF
                GPIO_WriteHigh(Buzzer); //LED OFF
            }
            if (ch == '1'){
                GPIO_WriteLow(Green_LED); //LED ON
                GPIO_WriteLow(Buzzer); //LED ON
            }
        }

    }
}