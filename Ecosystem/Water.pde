class Water {
  float x, y;
  float w, h;
  float c;
  
  Water(float x_, float y_, float w_, float h_, float c_) {
    x = x_; y = y_;
    w = w_; h = h_;
    c = c_;
  }
  
  void display() {
    noStroke();
    fill(0, 64, 255, 64);
    rect(x, y, w, h);
  }
}