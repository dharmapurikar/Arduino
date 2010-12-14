const unsigned int LED_BIT0 = 10;
const unsigned int LED_BIT1 = 11;
const unsigned int LED_BIT2 = 12;
const unsigned int BUTTON_PIN = 7;
const unsigned int BAUD_RATE = 9600;

void setup(){
  pinMode(LED_BIT0, OUTPUT);
  pinMode(LED_BIT1, OUTPUT);
  pinMode(LED_BIT2, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);
  Serial.begin(BAUD_RATE);

  randomSeed(analogRead(A0));
}

int last_state = LOW;
int current_state = LOW;

void loop(){
  current_state = digitalRead(BUTTON_PIN);
  if( current_state != last_state &&
    current_state == HIGH) {
    Serial.println("Rolling dice...");
    rollDice();
    delay(50);  
  }
  last_state = current_state;
}

void rollDice(){
  long result = random(1, 7);
  Serial.print("Next number: ");
  Serial.println(result);
  output_result(result);

}

void output_result(const long result){
  digitalWrite(LED_BIT0, result & B001);
  digitalWrite(LED_BIT1, result & B010);
  digitalWrite(LED_BIT2, result & B100);
}






