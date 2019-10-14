#include <util/delay.h>

void setup() {
DDRA = 0b11111111; //outputs
DDRC = 0b11111111;
DDRL = 0b11111111;
}

void loop() {
noInterrupts();
PORTA = 0b10101010; //A1,A3,A5&A7 -> 1
//PORTL = 0b01010101;
PORTC = 0b10100101; //C1&C3 ->0; C5&C7 -> 1

_delay_us(1.03); //1.15
PORTA = 0b01011010; //A5&A7->0

_delay_us(2.28); //2.4
PORTC = 0b10101010;  // C1&C3 ->1

_delay_us(5.67); //5.79
PORTC = 0b01011010;//C5&C7 ->`0

_delay_us(3.04); //3.16
PORTA = 0b01010101; //A1&A3->0

_delay_us(1.15); //1.15
PORTA = 0b10100101; //A5&A7 -> 1

_delay_us(2.28); //2.4
PORTC = 0b01010101;  // C1&C3 ->0

_delay_us(5.67); //5.79
PORTC = 0b10100101;//C5&C7 ->`1

_delay_us(3.04); //3.16
interrupts();
}
