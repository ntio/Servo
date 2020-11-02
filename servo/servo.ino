#include <Servo.h>
Servo myServo;
String data = "";

int Value;
int angle;

void setup() {
  myServo.attach(12); 
  Serial.begin(9600);

}

void loop() {

   while (Serial.available() > 0) 
   { 
     char inChar = Serial.read();
     data += inChar;
     delay(1);
     if (inChar == '.')
     {
      Value = data.toInt();
      angle = map(Value, 0, 255, 0, 179);
      myServo.write(angle);
      delay(30);
      data = "";
      }
    }
}
