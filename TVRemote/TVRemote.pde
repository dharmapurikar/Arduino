#include <IRremote.h>

class TVRemote { 
  enum { 
    CMD_LEN = 32, 
    VOL_UP = 0x210706F9, 
    VOL_DOWN = 0x21078679,
    MUTE = 0x210726D9, 
    INPUT_SELECT = 0x210702FD 
  }; 
  
  IRsend mac; 
  
  void send_command(const long command) { 
    mac.sendNEC(command, CMD_LEN); 
  }
  
public: 
  void volumeUp() { 
    send_command(VOL_UP); 
  } 
  void volumeDown() { 
    send_command(VOL_DOWN); 
  } 
}; 


