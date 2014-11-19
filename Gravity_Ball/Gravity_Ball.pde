float x, y, velX, velY, gravity;
int sz= 50;
void setup() {
  size(800, 600);
  x= width/2;
  y=height*.1;
  velX=0;
  velY=0;
  gravity=.1;
}

void draw() {
  background(0);
  ellipse(x, y, sz, sz);
  velY+= gravity;
  x+= velX;
  y+= velY;


  if (y+sz/2>height) {
    y= height - sz/2;
    velX *= .9;
    velY *= -.7;
  }
  if (x+sz/2 >width || x-sz/2 <0) {
    velX *=-1;
  }
}

