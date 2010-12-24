#include "Bounce.h"

const unsigned int LED_BIT0 = 10;
const unsigned int LED_BIT1 = 11;
const unsigned int LED_BIT2 = 12;
const unsigned int START_BUTTON_PIN = 3;
const unsigned int GUESS_BUTTON_PIN = 5;
const unsigned int BAUD_RATE = 9600;

void setup(){
  pinMode(LED_BIT0, OUTPUT);
  pinMode(LED_BIT1, OUTPUT);
  pinMode(LED_BIT2, OUTPUT);
  pinMode(START_BUTTON_PIN, INPUT);
  pinMode(GUESS_BUTTON_PIN, INPUT);
  Serial.begin(BAUD_RATE);
  randomSeed(analogRead(A0));
}

const unsigned DEBOUNCE_DELAY = 20;
Bounce start_button(START_BUTTON_PIN, DEBOUNCE_DELAY);
Bounce guess_button(GUESS_BUTTON_PIN, DEBOUNCE_DELAY);
int guess = 0;

void loop(){
  handle_guess_button();
  handle_start_button();
}

void handle_start_button(){
  if(start_button.update()){
    if(start_button.read() == HIGH){
      long result = random(1, 7);
      Serial.print("Result: ");
      Serial.println(result);
      output_result(result);
      if(guess > 0){
        if(result == guess){
          Serial.println("Hurray! You win!!!");
          animate_lights();
        } 
        else {
          Serial.println("Better luck next time. :(");
        }
      }
      delay(1000);
      guess = 0;
      output_result(0);  
    }
  }

}

void handle_guess_button(){
  if(guess_button.update()){
    if(guess_button.read() == HIGH){
      guess = (guess % 6) + 1;
      output_result(guess);
      Serial.print("Guess: ");
      Serial.println(guess);
    }
  }
}

void output_result(const long result){
  digitalWrite(LED_BIT0, result & B001);
  digitalWrite(LED_BIT1, result & B010);
  digitalWrite(LED_BIT2, result & B100);
}

void animate_lights(){
  digitalWrite(LED_BIT2, LOW);
  digitalWrite(LED_BIT0, HIGH);
  digitalWrite(LED_BIT1, LOW); 
  for(int i = 0; i < 5; i++){
    digitalWrite(LED_BIT0, HIGH);
    delay(75);
    digitalWrite(LED_BIT0, LOW);
    digitalWrite(LED_BIT1, HIGH);
    delay(75);
    digitalWrite(LED_BIT1, LOW);  
    digitalWrite(LED_BIT2, HIGH);
    delay(75);
    digitalWrite(LED_BIT2, LOW);
  }
}






