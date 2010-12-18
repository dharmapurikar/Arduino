#include <Display.h>
#include <LiquidCrystal.h>

int ROWS = 4;
int COLS = 20;
boolean flag = false;
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);
Display screen(lcd);

void setup(){
  // initialize the serial communications:
  Serial.begin(9600);
  screen.begin(ROWS, COLS);
}

void loop()
{
  loadText();
  handleCommands();
}

void handleCommands(){
  if(flag){
    Serial.println("You can scroll up or down with arrow now.");
    while(true){
      while (Serial.available() > 0) {
        int command = Serial.read();
        switch(command){
        case 106:
          Serial.println("Scrolling up");
          screen.scrollUp();
          break;
        case 107:
          Serial.println("Scrolling down");
          screen.scrollDown();
          break;
        default:
          Serial.println("Unknown command");
        }
      }
    }
  }
}

void loadText(){
  // when characters arrive over the serial port...
  if (Serial.available()) {
    int received_chars = 0;
    // wait a bit for the entire message to arrive
    delay(100);
    screen.erase();
    // read all the available characters
    while (Serial.available() > 0) {
      screen.save(Serial.read());
      received_chars = received_chars + 1;
    }
    screen.save('#');
    screen.clear();
    screen.paint();
    flag = true;
  }
}









