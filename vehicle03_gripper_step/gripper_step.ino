//GRIP
#include <Servo.h> 
#include <Wire.h>

#define ENA (3)
#define DIR (5)
#define PUL (6)
#define SW  (4)


//int grap_servo()

class Grap_servo: public Servo{
public:
  //initiate
  Grap_servo(void){
  }
  //method
  void grap(int aimAngle){
    if(aimAngle < 50 || aimAngle > 140){
      Serial.println("Servo Break! set angle : 50 < angle < 130");
      return 0;
    }   
   write(aimAngle);
   return 0;
  }
  void open(void){
    write(50);
  }
  void close(void){
    write(130);
  }

  void linkMove(int aimAngle){
  // 180 -> initial state 
    write(aimAngle);
    return 0;
  }
  void linkFull(void){
    write(0);
    return 0;
  }
  void linkInitial(void){
    write(180);
    return 0;
  }
  
  //member
  int angle = 0;
};


struct stepMotor {
  long pul, tgt;
  double hgt;
  bool dir = true; //up
  bool sw = false;
} sm1;


bool flag_exectution = false;
bool flag_grip = false;
bool flag_link2 = false;
bool flag_link1 = false;
int link_servo_pin = 12;
int grap_servo_pin = 9;

unsigned stepPeriod = 2000 ;




Grap_servo link_servo;
Grap_servo grap_servo;

void setup() 
{ 
  Wire.begin(8);                // join i2c bus with address #8
  Wire.onReceive(receiveEvent);
  grap_servo.attach(grap_servo_pin); 
  link_servo.attach(link_servo_pin);
  Serial.begin(115200);
  
  //pinmode Settings
  pinMode(ENA, OUTPUT);
  pinMode(DIR, OUTPUT);
  pinMode(PUL, OUTPUT);
  pinMode(SW, INPUT_PULLUP);
  pinMode(LED_BUILTIN, OUTPUT);
  //pin init
  digitalWrite(ENA, LOW);
  digitalWrite(DIR, LOW);
  digitalWrite(PUL, LOW);
  
  grap_servo.close();
  link_servo.linkInitial();
  delay(1000);
  grap_servo.open();
  Serial.println("Servo Start!!");
} 


void loop() 
{ 
    // SW 인식
  sm1.sw = digitalRead(SW);
  if (sm1.sw) {
    sm1.dir = true;
    sm1.tgt = 1000;
    sm1.pul = 0;
  }
  if (Serial.available() > 0) {
      char c = Serial.read();
      if ( c == 'l') {
        link_servo.angle = Serial.parseFloat();
        //link_servo.linkMove(link_servo.angle);
        flag_exectution = true;
        flag_link2 = true;
        Serial.println(link_servo.angle);
      }
      if ( c == 'g') {
        grap_servo.angle = Serial.parseFloat();
        //grap_servo.grap(grap_servo.angle);
        flag_exectution = true;
        flag_grip = true;
        Serial.println(grap_servo.angle);
      }     
      if ( c == 'h') {
        sm1.tgt = Serial.parseFloat();
        Serial.println(sm1.tgt);
      }     
  }

// 펄스주기

  if (sm1.tgt > sm1.pul) {
    sm1.dir = true;
  } else {
    sm1.dir = false;
  }
  digitalWrite(DIR, sm1.dir);

  if (abs(sm1.pul - sm1.tgt)) {
    digitalWrite(PUL, !digitalRead(PUL));
    digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
    if (sm1.dir) {
      sm1.pul++;
    } else {
      sm1.pul--;
    }
  }

  delayMicroseconds(stepPeriod);

  if(flag_exectution){
    if(flag_grip){
      grap_servo.grap(grap_servo.angle);
      flag_grip = false;
    }
    if(flag_link2){
      link_servo.linkMove(link_servo.angle);
      flag_link2 = false;
    }
    flag_exectution = false;
  }
} 

void receiveEvent(int howMany) {
  while ( 1 < Wire.available()) { // loop through all but the last
    char c = Wire.read(); // receive byte as a character
    //Serial.print(c);         // print the character
    if (c == 'g'){
      grap_servo.angle = Wire.read();    // receive byte as an integer
      flag_grip = true;
      flag_exectution = true;
      Serial.println(grap_servo.angle);         // print the integer
    }
    if ( c == 'l'){
      link_servo.angle = Wire.read();    // receive byte as an integer
      flag_link2 = true;
      flag_exectution = true;
      Serial.println(link_servo.angle);         // print the integer
    }
    if ( c == 'h'){
      sm1.tgt =20*Wire.read();    // receive byte as an integer
      Serial.println(sm1.tgt);         // print the integer
    }    
  }
}
