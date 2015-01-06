
ArrayList<Particle> particles= new ArrayList<Particle>(); // Make a new Particle named Prticle

PImage Tsar; // make an image
PImage field; // make an image

void setup() {

 
  Tsar = loadImage("Tsar Cannon.png"); // upload the file
  field= loadImage("Field.jpg");
   size(field.width, field.height);
}

void draw() {
  background(field); // tell the code to use field as a background
  if (mousePressed) { // tell the code: everytime mouse clicked add a particle (cannon)
    particles.add(new Particle());
  }
  image(Tsar, 50, 300, 100, 100); // place the cannon in desired location
  for (int i= 0; i<particles.size (); i++ ) {
    Particle currentParticle = particles.get(i);
    currentParticle.display();
    currentParticle.move();
  }
}

class Particle {   
  PVector loc, vel, acc; //you need all this to make the cannon move
  float size;
  //  int life;

  Particle() {
    loc = new PVector(140,333); 
    vel = new PVector(random(10, .00000001), random(.001, 1)); // use loc,vel,acc to make ball go in a curved path toward target 
    acc = new PVector( 0, 0);
    size= 23; // size of the cannon ball
  } 
  void display() {
        fill(0); // color of the cannon ball
    ellipse(loc.x,loc.y, size, size); // tell the code the beginning location of the cannon
    println(loc);
  }
  void move() {
    vel.add(acc); 
    loc.add(vel);
  }
}

