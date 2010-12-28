/*******************************************
 *
 * Name.......:  cameraIrControl Library
 * Description:  A powerful Library to control easy various cameras via IR. Please check the project page and leave a comment.
 * Author.....:  Sebastian Setz
 * Version....:  1.2
 * Date.......:  2010-12-16
 * Project....:  http://sebastian.setz.name/arduino/my-libraries/multi-camera-ir-control
 * Contact....:  http://Sebastian.Setz.name
 * License....:  This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
 *               To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to
 *               Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
 * Keywords...:  arduino, library, camera, ir, control, canon, nikon, olympus, minolta, sony, pentax, interval, timelapse
 *
 ********************************************/

#include "WProgram.h"
#include "multiCameraIrControl.h"

void wait(unsigned int time){
  unsigned long start = micros();
  while(micros()-start<=time){
  }
}

void high(unsigned int time, int freq, int pinLED){
  int pause = (1000/freq/2)-4;
  unsigned long start = micros();
  while(micros()-start<=time){
    digitalWrite(pinLED,HIGH);
    delayMicroseconds(pause);
    digitalWrite(pinLED,LOW);
    delayMicroseconds(pause);
  }
}

Nikon::Nikon(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 40;
}

void Nikon::shotNow()
{
	high(2000,_freq,_pin);
	wait(27830);
	high(390,_freq,_pin);
	wait(1580);
	high(410,_freq,_pin);
	wait(3580);
	high(400,_freq,_pin);
}

Pentax::Pentax(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 38;
}

void Pentax::shotNow()
{
  high(13000,_freq,_pin);
  wait(3000);
  for (int i=0;i<7;i++){
    high(1000,_freq,_pin);
    wait(1000);
  };
}

Olympus::Olympus(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 40;
}

void Olympus::shotNow()
{
  bool _seq[] = {
    0,1,1,0,0,0,0,1,1,1,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1  };
  high(3800,_freq,_pin);
  wait(4000);
  high(550,_freq,_pin);
  for (int i=0;i<sizeof(_seq);i++){
    if (_seq[i]==0){
      wait(500);
      high(500,_freq,_pin);
    }
    else{
      wait(1500);
      high(500,_freq,_pin);
    }
  };
}

Minolta::Minolta(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 38;
}

void Minolta::shotNow()
{
  bool _seq[] = {
    0,0,1,0,1,1,0,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1  };
  high(3750,_freq,_pin);
  wait(1890);
  for (int i=0;i<sizeof(_seq);i++){
    if (_seq[i]==0){
      high(456,_freq,_pin);
      wait(487);
    }
    else{
      high(456,_freq,_pin);
      wait(1430);
    }
  };
}

void Minolta::shotDelayed()
{
  bool _seqDelayed[] = {
    0,0,1,0,1,1,0,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1  };
  high(3750,_freq,_pin);
  wait(1890);
  for (int i=0;i<sizeof(_seqDelayed);i++){
    if (_seqDelayed[i]==0){
      high(456,_freq,_pin);
      wait(487);
    }
    else{
      high(456,_freq,_pin);
      wait(1430);
    }
  };
}

Sony::Sony(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 40;
}

void Sony::shotNow()
{
  bool _seq[] = {
    1,0,1,1,0,1,0,0,1,0,1,1,1,0,0,0,1,1,1,1  };
  high(2320,_freq,_pin);
  for (int i=0;i<sizeof(_seq);i++){
    if (_seq[i]==0){
      high(575,_freq,_pin);
      wait(650);
    }
    else{
      high(1175,_freq,_pin);
      wait(650);
    }
  };
}

void Sony::shotDelayed()
{
  bool _seqDelayed[] = {
    1,1,1,0,1,1,0,0,1,0,1,1,1,0,0,0,1,1,1,1  };
  high(2320,_freq,_pin);
  for (int i=0;i<sizeof(_seqDelayed);i++){
    if (_seqDelayed[i]==0){
      high(575,_freq,_pin);
      wait(650);
    }
    else{
      high(1175,_freq,_pin);
      wait(650);
    }
  };
}

Canon::Canon(int pin)
{
  pinMode(pin, OUTPUT);
  _pin = pin;
  _freq = 33;
}

void Canon::shotNow()
{
  high(480,_freq,_pin);
  wait(7330);
  high(480,_freq,_pin);
}

void Canon::shotDelayed()
{
  high(488,_freq,_pin);
  wait(5360);
  high(488,_freq,_pin);
}
