const int POT = 0;

void setup(){
  pinMode(POT, INPUT);
  Serial.begin(9600);
}

void loop(){
  int val = analogRead(POT);
  Serial.print("Value: ");
  Serial.print(val);
  Serial.print(", ");
  Serial.print(val * 0.0049);
  Serial.println(" V");
  delay(1000);
}

