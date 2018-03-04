import processing.sound.*;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

SoundFile file;
PImage img;
PImage good;

int AVG = 20;
int counter = 0;
int THRESHOLD = 6000;

int BAD_SWING = 0;

float[] last_x = new float[AVG];

void setup() {
  img = loadImage("image.png");
  good = loadImage("good_golf.jpg");
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  file = new SoundFile(this, "wii_music.mp3");
  file.play();
  size(640, 360);
  background(255);
}      


float get_avg(float[] last_x){
 int sum = 0;
 for (int i = 0; i < last_x.length; i++){
   sum += last_x[i];
 }
 return (float) sum/last_x.length;
}

void check_swing(float avg_swing){
 if (avg_swing < THRESHOLD){
   file = new SoundFile(this, "HoleInOne.wav");
   file.play(); 
  println("GOOD SWING"); 
  BAD_SWING = 0;
 }else{
  println("BAD SWING"); 
  BAD_SWING = 1;
 }
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
        if (counter == AVG){
          float avg_swing = get_avg(last_x);
          check_swing(avg_swing);
          counter = 0;
        } else {
          last_x[counter] = theOscMessage.get(0).floatValue();
          counter += 1;
        }
        
 }
}

void draw() {
  if (BAD_SWING == 1){
    image(img, 0, 0);
  }else{
    image(good, 0, 0); 
  }
}