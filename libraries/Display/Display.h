#ifndef __DISPLAY_H__ 
#define __DISPLAY_H__ 
#include "LiquidCrystal.h"

/**

Name: Display Library for Liquid Crystal
Author: Sachin Dharmapurikar

Display library for LiquidCrystal. This hides all the dirty details of managing 
text on 20x4 display screen. LiquidCrystal doesn't map the screen in 20x4 chars.
Instead it has first and third row joined. For long texts its very difficult to 
display across multiple rows.

Usage: Declare a LiquidCrystal and pass it to library.

LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
Display screen(lcd);

In your setup call -

screen.begin(ROWS, COLS);

In loop you can read input from serial or save all your input character by character.

if (Serial.available()) {
  // wait a bit for the entire message to arrive
  delay(100);
  // Reset screen to default display.
  screen.erase();
  // read all the available characters
  
  while (Serial.available() > 0) {
    // This will add the character to appropriate position in buffer.
    screen.save(Serial.read());
  }
  
  // Draw buffer to screen. Till you call this, the text will be only saved in buffer.
  screen.paint();
}

*/

class Display { 
public: 
  Display(LiquidCrystal &lcd);
  void begin(int rows, int cols); 
  void save(const char c); 
  void paint();
  void paint(int begin);
  void erase();
  void scrollUp();
  void scrollDown();
  void clear();
private: 
  int getRow();
  int getCol();
  void prepareBuffer(int begin);

  int ROWS; 
  int COLS; 
  int screen[4][20]; 
  int buffer[512];
  int count;
  int buffer_count;
  int current_offset;
  LiquidCrystal _lcd;
}; 
#endif 

