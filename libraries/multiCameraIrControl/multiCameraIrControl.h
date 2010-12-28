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

#ifndef multiCameraIrControl_h
#define multiCameraIrControl_h

#include "WProgram.h"

class Nikon{
public:
  Nikon(int pin);
  void shotNow();
private:
  int _pin;
  int _freq;
};

class Canon{
public:
  Canon(int pin);
  void shotNow();
  void shotDelayed();
private:
  int _pin;
  int _freq;
};

class Pentax{
public:
  Pentax(int pin);
  void shotNow();
private:
  int _pin;
  int _freq;
};

class Olympus{
public:
  Olympus(int pin);
  void shotNow();
private:
  int _pin;
  int _freq;
};

class Minolta{
public:
  Minolta(int pin);
  void shotNow();
  void shotDelayed();
private:
  int _pin;
  int _freq;
};

class Sony{
public:
  Sony(int pin);
  void shotNow();
  void shotDelayed();
private:
  int _pin;
  int _freq;
};

#endif
