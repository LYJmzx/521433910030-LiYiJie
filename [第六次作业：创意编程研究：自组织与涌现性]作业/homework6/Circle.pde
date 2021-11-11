class Circle {
  float x, y, r;
  boolean growing=true;
  Circle(float x_, float y_) {
    x=x_;
    y=y_;
    r=1;
  }
  void grow() {
    if (growing) {
      r+=0.5;
    }
  }
  void show() {
    noFill();
    stroke(255);
    strokeWeight(4);
    ellipse(x, y, 2*r, 2*r);
  }
}
