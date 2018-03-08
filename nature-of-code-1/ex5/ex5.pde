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
 
  PVector acc = new PVector(0,0);
  
  if(keyCode == LEFT) acc.add(new PVector(-0.1, 0));
  if(keyCode == RIGHT) acc.add(new PVector(0.1, 0));
  if(keyCode == UP) acc.add(new PVector(0, -0.1));
  if(keyCode == DOWN) acc.add(new PVector(0, 0.1));
  
  mover.setAcc(acc);
  mover.update();
  mover.checkEdges();
  mover.display();
}