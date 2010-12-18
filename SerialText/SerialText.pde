#include <Display.h>
#include <LiquidCrystal.h>

int ROWS = 4;
int COLS = 20;
boolean COMMAND_MODE = false;
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
  if(COMMAND_MODE){
    Serial.println("You can scroll up or down with arrow now.");
    while(true){
      while (Serial.available() > 0) {
        int command = Serial.read();
        switch(command){
        case 106: // Scroll up
          Serial.println("Scrolling up");
          screen.scrollUp();
          break;
        case 107: // Scroll down
          Serial.println("Scrolling down");
          screen.scrollDown();
          break;
        default:
          Serial.print("Unknown command: ");
          Serial.println(command);
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
    delay(500);
    screen.erase();
    // read all the available characters
    while (Serial.available() > 0) {
      screen.save(Serial.read());
      received_chars = received_chars + 1;
    }
    screen.save('#');
    screen.clear();
    screen.paint();
    COMMAND_MODE = true;
  }
}










