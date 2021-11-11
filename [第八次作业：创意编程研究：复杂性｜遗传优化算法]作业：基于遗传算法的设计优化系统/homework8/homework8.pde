World world;

void setup() {
  size(800, 800);
  world = new World(20);
  smooth();
}

void draw() {
  background(#C5ECF7);
  world.run();
}

void mousePressed() {
  world.born(mouseX,mouseY); 
}
