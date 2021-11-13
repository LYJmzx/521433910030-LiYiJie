import controlP5.*;

ControlP5 cp5;
int size;

ColorPicker cp;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
  cp5 = new ControlP5(this);
  cp = cp5.addColorPicker("picker")
    .setPosition(10, 10)
    .setColorValue(color(0, 0, 0, 255))
    ;
  cp5.addButton("clear")
    .setValue(0)
    .setPosition(10, 75)
    .setSize(255, 20)
    ;
  cp5.addSlider("size")
    .setPosition(10, 100)
    .setSize(255, 20)
    .setRange(1, 100)
    ;
  cp5.getController("size").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}

void draw() {
  fill(#5C59C4);
  noStroke();
  rect(0, 0, 275, 150);
  noStroke();
  fill(255);
  rect(10, 54, 255, 14);
  if (mousePressed==true) {
    strokeWeight(size);
    stroke(cp.getColorValue());  
    line(mouseX, mouseY, pmouseX,pmouseY);
  }
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if (c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r, g, b, a);
    println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}

// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}

public void clear(int theValue) {
  println("a button event from clear: "+theValue);
  background(255);
}

void keyPressed() {
 if (key == 's')
 saveFrame("####.jpg");
}
