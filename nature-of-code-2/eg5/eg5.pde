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
   fill(128);
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
 
 boolean isInside(Liquid l) {
   if (pos.x >= l.x && pos.x <= l.x + l.w && pos.y >= l.y && pos.y <= l.y + l.h) {
     return true;
   } else {
     return false;
   }
 }
 
 void drag(Liquid l) {
   float speed = vel.mag();
    // The force’s magnitude: Cd * v~2~
    float dragMagnitude = l.c * speed * speed;

    PVector drag = vel.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);

    // Apply the force.
    applyForce(drag);
 }
 
}

class Liquid {
  float x, y, w, h;
  float c;
  
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display() {
    noStroke();
    fill(0, 0, 255, 128);
    rect(x,y,w,h);
  }
}

Mover[] movers = new Mover[10];
Liquid liquid;
//PVector wind;

void setup() {
  size(720, 360);
  background(255);
  //wind = new PVector(0.001, 0);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(new PVector(i * (width / movers.length) + (width / movers.length) / 2 , 0), random(1, 5));
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);
  for(int i = 0; i < movers.length; i++) {
    PVector gravity = movers[i].getGravity(0.1);
    float c;
    if (movers[i].pos.x < width/2) c = -0.05;
    else c = 0.1;
    //PVector friction = movers[i].getFriction(c);
    movers[i].applyForce(gravity);
    //movers[i].applyForce(wind);
        if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
    movers[i].update();
    movers[i].display(); 
  }
  liquid.display();
}