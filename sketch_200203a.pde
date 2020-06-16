ArrayList<PVector> path;

float angle = 0;
int resolution = 15;

Orbit sun;
Orbit end;

public void settings() {
  size(444, 333);
}

void setup() {
  path = new ArrayList<PVector>();
  sun = new Orbit(width / 2, height / 2, width / 4, 0);
  Orbit next = sun;
  for (int i = 0; i < 10; i++) {
    next = next.addChild();
  }
  end = next;
}

void draw() {
  background(51);
  
  for (int i = 0; i < resolution; i++) {
    Orbit next = sun;
    while (next != null) {
      next.update();
      //next.show();
      next = next.child;
    }
    path.add(new PVector(end.x, end.y));
  }
  
  //angle -= 0.01;
  
  beginShape();
  stroke(255, 0, 222);
  noFill();
  for (PVector pos : path) {
    vertex(pos.x, pos.y);
  }
  endShape();
}
