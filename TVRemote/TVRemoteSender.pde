TVRemote remote; 
const unsigned int BAUD_RATE = 9600; 
void setup() { 
  Serial.begin(BAUD_RATE); 
} 

void loop() { 
  if (Serial.available()) { 
    const char command = Serial.read(); 
    switch(command) { 
    case 'u': 
      remote.volumeUp(); 
      break; 
    case 'd': 
      remote.volumeDown(); 
      break; 
    default: 
      break; 
    } 
  } 
} 



