class Mover {

  PVector pos;
  PVector vel;
  PVector acc;
 
 Mover() {
   pos = new PVector(width/2, height/2);
   vel = new PVector(0, 0);
   acc = new PVector(0, 0);
 }
 
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, pos);
    
    dir.normalize();
    dir.mult(0.5);
    
    acc = dir;
    
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
  }
  
  void setAcc(PVector _acc) {
    acc = _acc;
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x, pos.y, 16, 16);
  }
  
  void checkEdges() {
    if (pos.x > width) pos.x = 0;
    else if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    else if (pos.y < 0) pos.y = height;
  }
 
}

Mover mover;

void setup() {
  size(640, 360);
  
  mover = new Mover();
}

void draw() {
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display();
}