int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 50;     // Diameter of rect
int circleSize = 50;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(800, 800);
  background(255);
  stroke(255);
  rectColor = color(#9FB8FA);
  rectHighlight = color(#A9BFFA);
  circleColor = color(#FA95C4);
  circleHighlight = color(#FAA7CE);
  baseColor = color(#FFFFFF);
  circleX = 31;
  circleY = 30;
  rectX = 8;
  rectY = 65;
}

void draw() {
  update(mouseX, mouseY);

  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  noStroke();
  rect(rectX, rectY, rectSize, rectSize);

  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  noStroke();
  ellipse(circleX, circleY, circleSize, circleSize);

  if (mousePressed) {
    translate(mouseX, mouseY);
    for (int i = 0; i < 10; i++) {
      stroke(currentColor);
      strokeWeight(i);
      point(0, i * -10);
    }
  }
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
  }
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
