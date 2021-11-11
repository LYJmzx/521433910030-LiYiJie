import java.util.*;
ArrayList<Particle> particles;
int n = 120;

void setup() {
 size(900, 900);
 rectMode(CENTER);
 newParticles();
}
void newParticles() {
 particles = new ArrayList<Particle>();
 background(#FCFCF0);
 forms();
 noiseSeed((int)random(100000));
}
void draw() {
 Iterator<Particle> it = particles.iterator();
 while (it.hasNext()) {
   Particle p = it.next();
   p.run();
   if (p.isDead()) {
     it.remove();
   }
 }
}
void forms() {
 for (int j = 0; j < n; j ++) {
   float x = random(width), y = random(height);
   float s = random(20, 100);
   float hs = s/2;
   //int[] colors = {#e4572e, #29335c, #f3a712, #a8c686, #669bbc, #efc2f0};
   color[] colors = {#880D1E, #DD2D4A, #F26A8D, #F49CBB, #CBEEF3};
   color c = colors[(int)random(colors.length)];
   noStroke();
   fill(c);
   if (random(1) > 0.5) {
     for (float i = -s/2; i < s/2; i ++) {
       particles.add(new Particle(x+i, y-hs, c));//上边
       particles.add(new Particle(x+i, y+hs, c));//下边
       particles.add(new Particle(x-hs, y+i, c));//左边
       particles.add(new Particle(x+hs, y+i, c));//右边
     }
     rect(x, y, s,s);
   } else {
     for (float a = 0; a < TWO_PI; a += TWO_PI/360) {
       particles.add(new Particle(x+hs*cos(a), y+hs*sin(a), c));
     }
     ellipse(x, y,s ,s);
   }
 }
}
class Particle {
 PVector pos;
 float lifeSpan;
 color col ;
 float angle;
 float noiseScale, noiseStrength;
 Particle(float x, float y, color col) {
   pos = new PVector(x, y);
   lifeSpan = 100;
   noiseScale = 800;
   noiseStrength = 90;
   this.col = col;
 }
 void run() {
   show();
   move();
 }
  void show() {
   noStroke();
   fill(col, lifeSpan);
   ellipse(pos.x, pos.y, 0.5,0.5);
  }
  
   void move() {
   angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
   pos.x += cos(angle) ;
   pos.y += sin(angle) ;
   lifeSpan -= 0.1;
 }
 boolean isDead() {
   if (lifeSpan < 0) {
     return true;
   } else {
     return false;
   }
 }
}

void mousePressed() {
 newParticles();
}
void keyPressed() {
 if (key == 's')
 saveFrame("####.jpg");
}
