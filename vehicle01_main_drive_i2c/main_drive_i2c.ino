#include <SomeSerial.h>
#include <timer-api.h>
#include <timer_setup.h>
#include <PRIZM.h>
#include <Wire.h>

#define BLERx (2)
#define BLETx (9)
#define timerFreq       (100000.0) //Hz
#define timerPeriod     (1.0/(timerFreq)) //s
#define wheelRadius     (0.051) //m
#define axisHalfLength  (0.732/2)  //m

SoftwareSerial BLE(BLERx, BLETx);
PRIZM prizm;
bool controlFlag = false;

struct motorStatus {
  long cnt1, cnt2;
  double pdeg1, pdeg2;
  double deg1 = 0;
  double deg2 = 0;
  double drad1, drad2;
} motors;

struct robotStatus {
  double worldX, worldY, rotP;  // m, m, rad
  double drotW, dvelV;
  double tgtX, tgtY, tgtB, tgtD;
} robot;

struct armStatus {
  int grip_angle, link2_angle;
  long elevator_hight, link1_angle; 
} arm;
 
void setup() {
  Serial.println("start");
  Serial.begin(115200);
  Wire.begin();
  BLE.begin(115200);

  timer_init_ISR_100KHz(TIMER_DEFAULT);

  BLE.println("Press Green to Start");
  prizm.setGreenLED(LOW);
  prizm.setRedLED(HIGH);

  prizm.PrizmBegin();
  prizm.setMotorInvert(1, 1);
  prizm.setGreenLED(HIGH);
  prizm.setRedLED(LOW);
  Serial.println("start");
}

void loop() {
  static unsigned long pTime = 0;

  if (controlFlag) {
    controlFlag = false;
    updateMotorStatus();
    receiveCommunications();
    controlRobot();
  }


  //100ms job
  if (millis() - pTime > 100) {
    pTime = millis();
    //BLE.print("ROT:");
    BLE.print(robot.rotP * 180.0 / PI, 4);
    BLE.print("\t");
    //BLE.print("\tposX:");
    BLE.print(robot.worldX, 4);
    BLE.print("\t");
    //BLE.print("\tposY:");
    BLE.print(robot.worldY, 4);
    BLE.print("\n");
  }

}

void timer_handle_interrupts(int timer) {
  controlFlag = true;
}

int receiveCommunications() {
  bool rxq = false;
  bool flag_grip = false;
  bool flag_link1 = false;
  bool flag_link2 = false;
  bool flag_elevator = false;
  
  char receivedChar;
  if (BLE.available() > 0) {
    char c = BLE.read();
    if (c == 't') {
      robot.tgtX = BLE.parseFloat();
      robot.tgtY = BLE.parseFloat();
      rxq = true;
    }
    if (c == 'g') {
      arm.grip_angle = BLE.parseFloat();
      flag_grip = true;
    }
    if (c == 'l') {
      arm.link2_angle = BLE.parseFloat();
      flag_link2 = true;
    }
    if (c == 'h') {
      arm.link1_angle = BLE.parseFloat();
      flag_link1 = true;
    }
    if (c == 'd') {
      arm.elevator_hight = BLE.parseFloat();
      flag_elevator = true;
    }            
  }
  if (Serial.available() > 0) {
    char c = Serial.read();
    if (c == 't') {
      robot.tgtX = Serial.parseFloat();
      robot.tgtY = Serial.parseFloat();
      rxq = true;
    }
    if (c == 'g') {
      arm.grip_angle = Serial.parseFloat();
      flag_grip = true;
    }
    if (c == 'l') {
      arm.link2_angle = Serial.parseFloat();
      flag_link2 = true;
    }
    if (c == 'h') {
      arm.link1_angle = Serial.parseFloat();
      flag_link1 = true;
    }
    if (c == 'd') {
      arm.elevator_hight = Serial.parseFloat();
      flag_elevator = true;
    }
  }
  if (flag_elevator){
    Serial.print("elevator :");
    Serial.println(arm.elevator_hight);
    Wire.beginTransmission(9); // transmit to device #8
    Wire.write("d");        // sends five bytes
    Wire.write(arm.elevator_hight);              // sends one byte
    Wire.endTransmission();    // stop transmittin
  }
  if (flag_link1){
    Serial.print("link1 :");
    Serial.println(arm.link1_angle);
    Wire.beginTransmission(8); // transmit to device #8
    Wire.write("h");        // sends five bytes
    Wire.write(arm.link1_angle);              // sends one byte
    Wire.endTransmission();    // stop transmittin
  }
  if (flag_link2){
    Serial.print("link2 :");
    Serial.println(arm.link2_angle);
    Wire.beginTransmission(8); // transmit to device #8
    Wire.write("l");        // sends five bytes
    Wire.write(arm.link2_angle);              // sends one byte
    Wire.endTransmission();    // stop transmittin
  }
  if (flag_grip){
    Serial.print("grip :");
    Serial.println(arm.grip_angle);
    Wire.beginTransmission(8); // transmit to device #8
    Wire.write("g");        // sends five bytes
    Wire.write(arm.grip_angle);              // sends one byte
    Wire.endTransmission();    // stop transmittin
  }
  if (rxq) {
    Serial.print("TX:");
    Serial.print(robot.tgtX);
    Serial.print("\tTY:");
    Serial.println(robot.tgtY);
  }
}

int updateMotorStatus(void) {
  motors.cnt1 = -prizm.readEncoderCount(1);
  motors.cnt2 = prizm.readEncoderCount(2);
  motors.pdeg1 = motors.deg1;
  motors.pdeg2 = motors.deg2;
  motors.deg1 = motors.cnt1 / 4.0;
  motors.deg2 = motors.cnt2 / 4.0;
  motors.drad1 = (motors.deg1 - motors.pdeg1)  * PI / 180.0 / timerPeriod;  //wl
  motors.drad2 = (motors.deg2 - motors.pdeg2) * PI / 180.0 / timerPeriod;   //wr

  robot.drotW = wheelRadius * (motors.drad1 - motors.drad2) / (2.0 * axisHalfLength);
  robot.dvelV = wheelRadius * (motors.drad1 + motors.drad2) / 2.0;

  robot.rotP += robot.drotW * timerPeriod;
  robot.worldX += robot.dvelV * sin(robot.rotP) * timerPeriod;
  robot.worldY += robot.dvelV * cos(robot.rotP) * timerPeriod;

  return 1;
}

int controlRobot() {

  robot.tgtB = atan2(robot.tgtX - robot.worldX, robot.tgtY - robot.worldY);
  robot.tgtD = sqrt((robot.tgtX - robot.worldX) * (robot.tgtX - robot.worldX) + (robot.tgtY - robot.worldY) * (robot.tgtY - robot.worldY));

  static double aF;
  if (robot.tgtD < 0.01) {
    aF *= 0.9;
  } else {
    aF = 1;
  }

  double vecRot, vecVel;
  vecRot = aF * (robot.tgtB - robot.rotP);
  vecVel = cos(vecRot) * min(1, max(0, robot.tgtD * 10));

  double motorLeft, motorRight;
  motorLeft = (vecVel + sin(vecRot)) / 2.0;
  motorRight = (vecVel - sin(vecRot)) / 2.0;

  prizm.setMotorSpeeds(aF * motorLeft * 500.0, aF * motorRight * 500.0);
  /*
  Serial.print(motorLeft * 100.0);
  Serial.print("\t");
  Serial.print(motorRight * 100.0);
  Serial.print("\t");
  Serial.print(robot.tgtB);
  Serial.print("\t");
  Serial.print(robot.tgtD);
  Serial.print("\t");
  Serial.print(robot.tgtX);
  Serial.print("\t");
  Serial.print(robot.tgtY);
  Serial.print("\n");
  */
}
