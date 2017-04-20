
import processing.serial.*;
Serial myPort; 
byte[] buf;
LightLine ll;
LightLine ll2;
float time =0;
int num=500;  
float step=0.5; 
boolean count=false;
int numOfLight;
void setup() {
  colorMode(HSB);
  buf = new byte[num*3+6];
  //buf = [0x41, 0x64, 0x61, 0x00, 0x20, 0x57];
  buf[0] = 0x41;
  buf[1] = 0x64;
  buf[2] = 0x61;
  buf[3] = byte((num)>>8-1);
  buf[4] = byte(num-1);
  buf[5] = byte(int(buf[3])^int(buf[4])^0x55);
  
  background(200);
  ll= new LightLine( 0, 0, num);
  ll2= new LightLine(0, 0, num);
  size(1600, 600);
  //for (int i=0; i<num; i++) {
  //println(ll.get(i).index);
  //}
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 115200);
  noStroke();
}
void draw() {
  background(50);
  translate(50, height/2);
  ll.update(int(time%(num/2)), 20);//  ll.update(int(time), constrain(int(time/10), 10, 200));
  if (count) {
    time+= 1;
    step+=0.01;
  }
 println(frameRate);
 // println(buf[0]);
}
void keyPressed() {
  count = !count;
}