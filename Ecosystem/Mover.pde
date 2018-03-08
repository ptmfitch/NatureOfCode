class Mover {
  PVector pos, vel, acc;
  float maxVel = 0;
  float m = 1;
  
  Mover(PVector pos_) {
    pos = pos_;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(m);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    if (maxVel > 0) vel.limit(maxVel);
    pos.add(vel);
    //checkEdges();
  }
  
  void display() {
    stroke(0);
    fill(128);
    ellipse(pos.x, pos.y, m*10, m*10);
  }
  
  void checkEdges() {
    //if(pos.x > width) pos.x = 0;
    //else if(pos.x < 0) pos.x = width;
    //if(pos.y > height) pos.y = 0;
    //else if(pos.y < 0) pos.y = height;
  }
  
  boolean isInside(float x, float y, float w, float h) {
    return (pos.x >= x) && (pos.x <= x + w) && (pos.y >= y) && (pos.y <= y + h);
  }
  
  void drag(float c) {
    float s = vel.mag();
    float d = c * s*s;
    PVector drag = vel.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(d);
    applyForce(drag);
  }
  
}