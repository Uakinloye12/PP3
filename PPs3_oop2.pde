class ellipse {
  float x, y, r;
  float xspeed = 1;
  float yspeed = 9;
  
  ellipse(){
    x = random(width);
    y = random(height);
    r = random(4,18);
  }
  
  ellipse(float tempX, float tempY, float tempR){
    x = tempX;
    y = tempY;
    r = tempR;
  }
  
  void display(){
    fill(130);
    ellipse(x, y, r*2, r*2);
  }
  
  void update(){
    x += xspeed;
    y += yspeed;
  }
  
  void checkEdges(){
    if(x > width || x < 0) {
      xspeed *= -1; 
    }
    if(y > height || y < 0){
      yspeed *= -1;
    }
  }
  
  boolean overlaps(ellipse other){
    float d = dist(x, y, other.x, other.y);
    if (d < r + other.r) {
      return true;
    } else {
      return false;
    }
  }
  
  void increaseRadius(){
    r += 1;
  }
      
  void fill1(){
    r += 0.56;
  }

  void fill2(){
    r += 0.30;
  }
  
  void fill3(){
    r += 1.25;
  }
  
  void fill4(){
    r += 0.75;
  }
      
}

ellipse p1, p2, p3, p4, p5;

void setup(){
  size(600, 400);
  p1 = new ellipse(100, 100, 50);
  p2 = new ellipse(55, 60, 60);
  p3 = new ellipse();
  p4 = new ellipse();
  p5 = new ellipse();
}

void draw(){ 
  background(250);
  
  p1.update();
  p1.checkEdges();
  p1.display();
  
  p2.display();
  p2.update();
  p2.checkEdges();
  
  p3.display();
  p3.update();
  p3.checkEdges();
  
  p4.display();
  p4.update();
  p4.checkEdges();
  
  p5.display();
  p5.update();
  p5.checkEdges();
  
  if (p2.overlaps(p3)){
    p3 = new ellipse();
  }
  
  if (p3.overlaps(p1)){
    p1.increaseRadius();
  }
  
  if (p2.overlaps(p1)){
    p1.fill1();
  }
  
  if (p2.overlaps(p3)){
    p3.fill2();
  }
  
  if (p2.overlaps(p4)){
    p4.fill3();
  }
  
  if (p2.overlaps(p5)){
    p5.fill4();
  }
  
}
