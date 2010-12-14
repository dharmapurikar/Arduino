#include <ctype.h> 
#include <WProgram.h> 
#include "LiquidCrystal.h"
#include "display.h"

Display::Display(LiquidCrystal &lcd):_lcd(lcd) {
	count = 0;
}

void Display::begin(int rows, int cols){
	ROWS = rows;
	COLS = cols;
	_lcd.begin(rows, cols);
}

void Display::save(const char c){
	if(count < 80) {
		buffer[getRow()][getCol()] = c;
	}
	count++;
}

void Display::paint(){
	// clear the screen
	  _lcd.clear();
	  for(int c=0; c < COLS; c++){
	    for(int r=0; r < ROWS; r++){
	      _lcd.setCursor(c,r);
	      // display each character to the LCD
	      _lcd.write(buffer[r][c]);   
	    }
	  }
}

void Display::erase(){
	count = 0;
	for(int c=0; c< COLS; c++){
	    for(int r=0; r< ROWS; r++){
	      _lcd.setCursor(c,r);
	      buffer[r][c] = ' ';   
	    }
	  }
	paint();	
}

int Display::getRow(){
  return count / COLS;
}

int Display::getCol(){
  return count % COLS;
}