/*******************************************
 *
 * Name.......:  multiCameraIrControl Library - Canon Example
 * Description:  A small example sketch how to use multiCameraIrControl library. Please check the project page and leave a comment.
 * Author.....:  Sebastian Setz
 * Version....:  1.1
 * Date.......:  2010-12-16
 * Project....:  http://sebastian.setz.name/arduino/my-libraries/multi-camera-ir-control
 * Contact....:  http://Sebastian.Setz.name
 * License....:  This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
 *               To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to
 *               Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
 * Keywords...:  arduino, library, camera, ir, control, canon, nikon, olympus, minolta, sony, pentax, interval, timelapse
 *
 ********************************************/

#include <multiCameraIrControl.h>

Canon D5(13);

void setup(){
}

void loop(){
  D5.shotNow();
  delay(5000);
  D5.shotDelayed();
  delay(5000);
}



