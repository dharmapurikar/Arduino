const int SENSOR = 2;

void setup(){
  Serial.begin(9600);
}

void loop(){
  int value = analogRead(SENSOR);
  float voltage = value * 5.0;
  voltage /= 1024.0;
  Serial.print(voltage);
  Serial.println(" V");
  float temprature = (voltage - 0.5) * 100;
  Serial.print(temprature);
  Serial.println(" C");
  delay(500);
}
