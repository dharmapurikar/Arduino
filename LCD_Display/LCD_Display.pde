/*
 This sketch displays text sent over the serial port 
 (e.g. from the Serial Monitor) on an attached LCD.
 
 The circuit:
 * LCD RS pin to digital pin 7
 * LCD Enable pin to digital pin 8
 * LCD D4 pin to digital pin 9
 * LCD D5 pin to digital pin 10
 * LCD D6 pin to digital pin 11
 * LCD D7 pin to digital pin 12
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 */

// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
const int unsigned ROWS = 4;
const int unsigned COLS = 20;
int count = 0;
int chars[ROWS][COLS];
void setup(){
  // set up the LCD's number of columns and rows: 
  lcd.begin(ROWS, COLS);
  // initialize the serial communications:
  Serial.begin(9600);
  defaultDisplayBuffer();
  display();
}

void loop()
{
  // when characters arrive over the serial port...
  if (Serial.available()) {
    readFromSerial();
    display();
  }
}

void readFromSerial(){
  // wait a bit for the entire message to arrive
  delay(100);
  count = 0;
  defaultDisplayBuffer();
  // read all the available characters
  while (Serial.available() > 0) {
    int c = Serial.read();
    chars[getRow()][getCol()] = c;
    count = count + 1;
  }
}

void defaultDisplayBuffer(){
  for(int c=0; c< COLS; c++){
    for(int r=0; r< ROWS; r++){
      lcd.setCursor(c,r);
      chars[r][c] = ' ';   
    }
  }
}

int getRow(){
  return count / COLS;
}

int getCol(){
  return count % COLS;
}

void display(){
  // clear the screen
  lcd.clear();
  for(int c=0; c < COLS; c++){
    for(int r=0; r < ROWS; r++){
      lcd.setCursor(c,r);
      // display each character to the LCD
      lcd.write(chars[r][c]);   
    }
  }
}

void dump() {
  Serial.println("Sending buffer.");
  for(int r=0; r< ROWS; r++){
    for(int c=0; c< COLS; c++){
      Serial.print("chars[");
      Serial.print(r);
      Serial.print("][");
      Serial.print(c);
      Serial.print("]: ");
      Serial.println((char) chars[r][c]);
    }
  }
}
