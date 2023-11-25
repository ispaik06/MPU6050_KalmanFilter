#include <Servo.h>

Servo servo;

void setup() {
  servo.attach(6);
  servo.write(0);
  delay(2000);
}

void loop() {
  for(int i=0;i<=60;i++) {
    servo.write(i);
    delay(20);
  }
  for(int i=60;i>=0;i--) {
    servo.write(i);
    delay(20);
  }
}
