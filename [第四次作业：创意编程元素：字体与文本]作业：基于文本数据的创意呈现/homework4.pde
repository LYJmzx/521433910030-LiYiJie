PFont f;
String s="lalallalalalalalalalalalal";
float r=137;
float homex=0, homey=0, x, y;
void setup() {
  //colorMode(HSB, 360, 100, 100);
  size(600, 600);
  f=createFont("Consolas", 50);
  textFont(f);
  textAlign(CENTER);
  frameRate(10);
}

void draw() {
  background(255);

  translate(width/2, height/2);
  noFill();
  noStroke();
  ellipse(0, 0, r/2, r/2);
  display();
}

void display() {
  float arclength=0;
  for (int i=0; i<s.length(); i++) {
    char everychar=s.charAt(i);
    float w=textWidth(everychar);

    arclength+=w/2;
    float theta=PI+arclength/r;

    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta+PI/2);
    fill(random(0, 255), random(0, 255), random(0, 255));
    textSize(random(50, 70));
    text(everychar, x, y);
    popMatrix();

    arclength+=w/2;
    if (mousePressed) {
      x+=random(-1, 1);
      y+=random(-1, 1);
    } else {
      x=homex;
      y=homey;
    }
  }
}
