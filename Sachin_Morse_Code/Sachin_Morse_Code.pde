const unsigned int DOT = 150;
const unsigned int DASH = DOT * 3;
const unsigned int LED_PIN = 13;
const unsigned int BLIP = DOT;
// Name : Sachin
// Morse: ... .- -.-. .... .. -.


void setup(){
  pinMode(LED_PIN, OUTPUT);
}

void loop(){
  // S
  dot();
  unitSeparator();
  dot();
  unitSeparator();
  dot();
  charSeparator();

  // a
  dot();
  unitSeparator();
  dash();
  charSeparator();
  
  // c
  dash();
  unitSeparator();
  dot();
  unitSeparator();
  dash();
  unitSeparator();
  dot();
  charSeparator();

  // h
  dot();
  unitSeparator();
  dot();
  unitSeparator();
  dot();
  unitSeparator();
  dot();
  charSeparator();

  // i
  dot();
  unitSeparator();
  dot();
  unitSeparator();
  charSeparator();

  // n
  dash();
  unitSeparator();
  dot();
  charSeparator();
  
  digitalWrite(LED_PIN, LOW);
  delay(5000);
}

void dash(){
  digitalWrite(LED_PIN, HIGH);
  delay(DASH);
  digitalWrite(LED_PIN, LOW); 
}

void dot(){
  digitalWrite(LED_PIN, HIGH);
  delay(DOT);
  digitalWrite(LED_PIN, LOW);
}

void unitSeparator(){
  digitalWrite(LED_PIN, LOW);
  delay(BLIP);
}

void charSeparator(){
  digitalWrite(LED_PIN, LOW);
  delay(DASH);
}

