const unsigned int BUTTON_PIN = 7;
const unsigned int LED_PIN    = 13;

void setup(){
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);
}

int LED_STATE = LOW;
int OLD_BUTTON_STATE = LOW;

void loop(){
  const int CURRENT_BUTTON_STATE = digitalRead(BUTTON_PIN);
  
  if( CURRENT_BUTTON_STATE != OLD_BUTTON_STATE && 
      CURRENT_BUTTON_STATE == HIGH) {
    LED_STATE = (LED_STATE == LOW) ? HIGH : LOW;
    digitalWrite(LED_PIN, LED_STATE);
    delay(50);
  }
  OLD_BUTTON_STATE = CURRENT_BUTTON_STATE;
}
