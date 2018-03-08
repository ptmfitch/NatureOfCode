class Mover {
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  float mass;
  
  Mover(PVector _pos, float _mass) {
    pos = _pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    mass = _mass;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
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
   ellipse(pos.x, pos.y, mass * 50, mass * 50);
 }
 
 void checkEdges() {
   if (pos.x > width) {
     pos.x = width;
     vel.x *= -1;
   }
   else if (pos.x < 0) {
     pos.x = 0;
     vel.x *= -1;
   }
   if (pos.y > height) {
     pos.y = height;
     vel.y *= -1;
   }
   else if (pos.y < 0) {
     pos.y = 0;
     vel.y *= -1;
   }
   
 }
 
}

Mover mover;
PVector gravity;
PVector wind;

void setup() {
  size(320, 320);
  background(255);
  gravity = new PVector(0, 0.1);
  wind = new PVector(0.05, 0);
  mover = new Mover(new PVector(width/2, height/2), 1);
}

void draw() {
  background(255);
  mover.applyForce(gravity);
  mover.applyForce(wind);
  mover.update();
  mover.display();
}