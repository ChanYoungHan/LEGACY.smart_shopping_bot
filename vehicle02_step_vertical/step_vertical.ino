//VERTICAL
#include <Wire.h>

#define ENA (3)
#define DIR (5)
#define PUL (6)
#define SW  (4)

unsigned stepPeriod = 1500;

struct stepMotor {
  long pul, tgt;
  double hgt;
  bool dir = true; //up
  bool sw = false;
} sm1;

void setup() {
  Wire.begin(9);                // join i2c bus with address #8
  Wire.onReceive(receiveEvent);
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
  Serial.println("slave vertical start!");
}

void loop() {
  // SW 인식
  sm1.sw = digitalRead(SW);
  if (sm1.sw) {
    sm1.dir = true;
    sm1.tgt = 50;
    sm1.pul = 0;
  }

  // SERIAL 목표치
  if (Serial.available()) {
    sm1.tgt = 453*Serial.parseFloat();
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

//  Serial.print("SW:");
//  Serial.print(sm1.sw);
//  Serial.print("\tPUL:");
//  Serial.print(sm1.pul);
//  Serial.print("\tTGT:");
//  Serial.print(sm1.tgt);
//  Serial.print("\n");
}

void receiveEvent(int howMany) {
  while ( 1 < Wire.available()) { // loop through all but the last
    char c = Wire.read(); // receive byte as a character
    Serial.print(c);         // print the character

    if ( c == 'd'){
      sm1.tgt = 453*Wire.read();    // receive byte as an integer
      Serial.println(sm1.tgt);         // print the integer
    }    
  }
}
