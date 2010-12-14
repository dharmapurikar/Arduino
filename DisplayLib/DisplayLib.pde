#include <Display.h>
#include <LiquidCrystal.h>

int ROWS = 4;
int COLS = 20;
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
Display screen(lcd);

void setup(){
  // initialize the serial communications:
  Serial.begin(9600);
  screen.begin(ROWS, COLS);
}

void loop()
{
  // when characters arrive over the serial port...
  if (Serial.available()) {
    // wait a bit for the entire message to arrive
    delay(100);
    screen.erase();
    // read all the available characters
    while (Serial.available() > 0) {
      screen.save(Serial.read());
    }
    screen.paint();
  }
}


