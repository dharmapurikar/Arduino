#include <ctype.h> 
#include <WProgram.h> 
#include "LiquidCrystal.h"
#include "display.h"

Display::Display(LiquidCrystal &lcd):_lcd(lcd) {
  count = 0;
  buffer_count = 0;
  current_offset = 0;
}

void Display::begin(int rows, int cols){
  ROWS = rows;
  COLS = cols;
  _lcd.begin(rows, cols);
}

void Display::save(const char c){
  buffer[buffer_count] = c;
  buffer_count = buffer_count + 1; 
}

void Display::paint(){
  paint(0);
}

void Display::erase(){
  count = 0;
  for(int c=0; c< COLS; c++){
    for(int r=0; r< ROWS; r++){
      _lcd.setCursor(c,r);
      screen[r][c] = ' ';   
    }
  }
  for(int c = 0; c < 512; c++){
    buffer[c] = ' ';
  }
  paint();	
}

void Display::scrollUp(){
  delay(200);
  current_offset = (current_offset + COLS ) >= buffer_count ? (buffer_count - COLS) : (current_offset + COLS);
  paint(current_offset);
}

void Display::scrollDown(){
  delay(200);
  current_offset = (current_offset - COLS) < 0 ? 0 : current_offset - COLS;
  paint(current_offset);
}

void Display::clear(){
  // clear the screen
  _lcd.clear();
}

void Display::prepareBuffer(int begin){
  count = 0;
  do {
    if((count + begin) < buffer_count){
      screen[getRow()][getCol()] = buffer[count + begin];
    } else {
      screen[getRow()][getCol()] = ' ';
    }
    count = count + 1;
  } while (count < 80);
  }

  void Display::paint(int begin) {
    current_offset = begin;
    prepareBuffer(begin);
    for(int c=0; c < COLS; c++){
      for(int r=0; r < ROWS; r++){
        _lcd.setCursor(c,r);
        // display each character to the LCD
        _lcd.write(screen[r][c]);   
      }
    }
  }

  int Display::getRow(){
    return count / COLS;
  }

  int Display::getCol(){
    return count % COLS;
  }