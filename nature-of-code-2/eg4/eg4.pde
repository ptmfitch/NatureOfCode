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
 }
 
 void display() {

   stroke(0);
   fill(128, 128);
   ellipse(pos.x, pos.y, mass * 16, mass * 16);
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
 
 PVector getGravity(Float c) {
   return new PVector(0, c*mass);
 }
 
 PVector getFriction(Float c) {
   PVector friction = vel.get();
   friction.mult(-1);
   friction.normalize();
   friction.mult(c);
   return friction;
 }
 
}

Mover[] movers = new Mover[100];
PVector wind;

void setup() {
  size(720, 360);
  background(255);
  wind = new PVector(0.001, 0);
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(new PVector(0, 0), random(0.1,5));
  }
}

void draw() {
  background(255);
  for(int i = 0; i < movers.length; i++) {
    PVector gravity = movers[i].getGravity(0.1);
    PVector friction = movers[i].getFriction(0.01);
    movers[i].applyForce(gravity);
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].display(); 
  }
}