class Mover {
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  Mover(PVector _pos) {
    pos = _pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
   void update() {
    checkEdges();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.mult(0.99);
 }
 
 void display() {
   stroke(0);
   fill(255, 0, 0);
   ellipse(pos.x, pos.y, 10.0, 10.0);
 }
 
 void checkEdges() {
   if (pos.x > width) {
     applyForce(new PVector(-0.5, 0));
   }
   else if (pos.x < 0) {
     applyForce(new PVector(0.5, 0));
   }
   if (pos.y > height) {
     applyForce(new PVector(0, -0.5));
   }
   else if (pos.y < 0) {
     applyForce(new PVector(0, 0.5));
   }
   
 }
 
}

Mover mover;
PVector gravity;

void setup() {
  size(640, 640);
  background(255);
  gravity = new PVector(0, -0.1);
  mover = new Mover(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  if (mousePressed) {
    PVector wind = new PVector(0, 0);
    if (mouseButton == LEFT) wind.add(new PVector(-0.5, 0));
    else if (mouseButton == RIGHT) wind.add(new PVector(0.5, 0));
    mover.applyForce(wind);
  }
  mover.applyForce(gravity);
  mover.update();
  mover.display();
}