#include <util/delay.h>

void setup() {
DDRA = 0b11111111; //outputs
DDRC = 0b11111111;
DDRL = 0b11111111;
//PORTA = 0b0000000; 
//PORTC = 0b0000000;

}

void loop() {
noInterrupts();
/*
PORTA |= _BV(PA0);   // 22 HIGH
PORTA &= ~_BV(PA1);   // 23 LOW
*/
PORTA = 0b10101010; 
PORTL = 0b10101010;
PORTC = 0b10101010;
_delay_us(12.12);


PORTA = 0b01010101;
PORTL = 0b01010101;
PORTC = 0b01010101; 
_delay_us(12.12);

interrupts();

}
