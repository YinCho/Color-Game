//Jerry You
PFont MilkyCoffee;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music, point, lose;

////// SPACE BAR TO PAUSE

//keyboard variables
boolean spacekey;
PImage [] gif;
int numberOfFrames;
int f;
float timer;
float colorY;

color grey = (200);
color purple = #462255;
color blue     = #0F56E6;
color orange   = #FFB350;
color white    = #FFFFFF;
color black    = #000000;
color red = #F93113;
color yellow = #F9F113;
color green = #6DDB06;

int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;

int guess;
final int TRUE = 1;
final int FALSE = 2;
final int RESET = 3;

void setup() {
  size( 800, 800, FX2D);
  numberOfFrames = 8;
  gif = new PImage[numberOfFrames] ;

  int i = 0; 
  while (i < numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i++;
    highScore = 0;
    colorY = 0;
    timer = 0;
  }

  mode = INTRO;
  textSize(100);
  textAlign(CENTER, CENTER);
  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  point = minim.loadFile("SUCCESS.wav");
  lose = minim.loadFile("FAILURE.wav");
  MilkyCoffee = createFont("MilkyCoffee.ttf", 1);
}

void draw() {
  textFont(MilkyCoffee, 50);
  music.play();

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("MODE ERROR in draw " + mode);
  }
}
