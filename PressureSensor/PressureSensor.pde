const int FSR = 2;
const int LED = 13;
int val = 0;
void setup(){
  pinMode(FSR, INPUT);
  pinMode(LED, OUTPUT);
  Serial.begin(9600);
  digitalWrite(LED, LOW);
}

void loop(){
  val = analogRead(FSR);
  if(val > 800) {
    digitalWrite(LED, HIGH);  
  } 
  else {
    digitalWrite(LED, LOW);
  }
  Serial.println(val*0.0049);
  delay(1000);
}

