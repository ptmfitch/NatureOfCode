class Prey extends Mover {
  Prey(PVector pos_) {
    super(pos_);
  }
  
  void display() {
    stroke(0);
    fill(255, 128, 0);
    ellipse(pos.x, pos.y, m*10, m*10);
  }
}