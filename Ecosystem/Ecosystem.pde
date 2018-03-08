//Pred pred;
Prey[] prey = new Prey[1000];
Water water;

void setup() {
  size(500,500);
  background(255);
  //pred = new Pred();
  for(int i = 0; i < prey.length; i++) {
    prey[i] = new Prey(new PVector(random(0, width), random(0, height)));
  }
  water = new Water(0, height*0.25, width, height*0.75, 0.1);
}

void draw() {
  background(255);
  for(int i = 0; i < prey.length; i++) {
    PVector g = new PVector(0, 0.1);
    prey[i].applyForce(g);
    if (prey[i].isInside(water.x, water.y, water.w, water.h)) {
      prey[i].drag(water.c);
    }
    prey[i].update();
    prey[i].display();
  }
  water.display();
}