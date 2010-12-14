#ifndef __DISPLAY_H__ 
#define __DISPLAY_H__ 
#include "LiquidCrystal.h"

class Display { 
public: 
	Display(LiquidCrystal &lcd);
	void begin(int rows, int cols); 
	void save(const char c); 
	void paint();
	void erase();
private: 
	int getRow();
	int getCol();
	
	int ROWS; 
	int COLS; 
	int buffer[4][20]; 
	int count;
	LiquidCrystal _lcd;
}; 
#endif 

