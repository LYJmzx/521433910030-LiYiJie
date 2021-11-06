float theta;  

void setup() {
  size(600,600);
  smooth();
  newTree();
}

void draw() {

}

void mousePressed() {   
  newTree();
}

void newTree() {   
  background(255);
  translate(width/2, height);
  branch(100,0);
}

void branch(float len,int level) {    

  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.66;  
  level++;
  
  if(level <10){ 
    theta = random(0,PI/3); 
    
    for(int i=0; i<int(random(0,3)); i++){ 
        pushMatrix();    
        rotate(theta);   
        branch(len,level);      
        popMatrix();    
    
        pushMatrix();
        rotate(-theta); 
        branch(len,level);
        popMatrix();
     }
    }
}
