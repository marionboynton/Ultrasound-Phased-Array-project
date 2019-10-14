#include <util/delay.h>

void setup() {
DDRA = 0b11111111; //outputs
DDRC = 0b11111111;
DDRL = 0b11111111;
}

void loop() {
noInterrupts();
PORTA = 0b10101010; 
PORTL = 0b10101010;
PORTC = 0b01010101;
_delay_us(8.62);
PORTC = 0b10101010; 
_delay_us(3.5);

PORTA = 0b01010101;
PORTL = 0b01010101;
_delay_us(8.62);
PORTC = 0b01010101; 
_delay_us(3.5);
interrupts();
}
