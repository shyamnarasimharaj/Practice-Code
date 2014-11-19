float locx, locy;        //declare location
float velx, vely;        //declare velocity
float accx, accy;        //declare acceleration

int sz = 50;

void setup() {
  colorMode(HSB,360,100,100,100);
  size(800, 600);

  //initialize location variables
  locx = width/2;
  locy = height/2;

  //initialize velocity
  velx = 0;
  vely = 0;

  //initialize acceleration
  accx = random(-.1,.1);
  accy = random(-.1,.1);
}

void draw() {
  fill(frameCount%360,100,100);
  //add acceleration to velocity
  velx += accx;
  vely += accy;
  
  //limit velocity to avoid going uncontrollably fast
  velx = constrain(velx,-5,5);
  vely = constrain(vely,-5,5);

  //add velocity to location
  locx += velx;
  locy += vely;

  //draw a circle
  ellipse(locx, locy, sz, sz);

  //all of these are written so the ball goes completely off the screen
  if (locx - sz/2 > width) {      //if circle goes off of right edge...
    locx = -sz/2;                 //...wrap around to left edge
  }

  if (locx + sz/2 < 0) {          //if circle goes off of left edge....
    locx = width + sz/2;          //...wrap around to right edge
  }

  if (locy - sz/2 > height) {     //if circle goes beyond bottom...
    locy = -sz/2;                 //...wrap around to top
  }

  if (locy + sz/2 < 0) {          //if circle goes beyond top...
    locy = height + sz/2;         //...wrap around to bottom
  }
}

//each time the mouse is pressed, pick new values for acceleration
void mousePressed(){
  accx = random(-.1,.1);
  accy = random(-.1,.1);
}
