float lineSize = 0;
float colSize = 0;

color[] colors = {#FFFFFF,#CBCBCB,#838383,#3E3E3E};

void mondrian() {
  for (int line = 0; line < height; line += lineSize + 5) {
    lineSize = random(5, width/2);
    for (int col = 0; col < width; col += colSize + 5) {
      colSize = random(5, height/2);

      color rectColor = colors[int(random(colors.length))];
      fill(rectColor);
      rect(col, line, colSize, lineSize);

      strokeWeight(15);
      stroke(#000000);
      float x = col+colSize;
      float y = line+lineSize;
      line(0, y, width, y);
      line(x, line, x, y);
    }
  }
}

void setup() {
  size(600, 600);
  background(#FFFFFF);
  mondrian();
}

void draw() {
  if (mousePressed) {
    mondrian();
  }
}
