// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
int custom_0[] = { 0x0,0x0,0x1b,0x1f,0xe,0x4,0x0}; // Heart
int custom_1[] = { 0x18,0x14,0x1f,0x15,0x17,0x13,0x15}; // Pri
int custom_2[] = { 0x0,0x0,0x1f,0x15,0x1d,0x15,0x5}; // Pri
int custom_3[] = { 0x1f,0x19,0x5,0x9,0x1f,0x9,0x5 };


void setup()
{
    lcd.begin(20,4);
    lcd.clear();
    // set initial values for program
    defineCharacter(3, custom_3);
    lcd.write(3);
} 

void loop()
{
  
}

// Define a custom char in lcd
int defineCharacter(int ascii, int *data) {
    int baseAddress = (ascii * 8) + 64;  
    // baseAddress = 64 | (ascii << 3);
    lcd.command(baseAddress);
    for (int i = 0; i < 8; i++)
        lcd.write(data[i]);
    lcd.command(128);
    return ascii;
} 
