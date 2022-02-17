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
    fill(165);
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
      
}

ellipse p1, p2, p3;

void setup(){
  size(600, 400);
  p1 = new ellipse(100, 100, 50);
  p2 = new ellipse(55, 60, 60);
  p3 = new ellipse();
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
  
  if (p2.overlaps(p3)){
    p3 = new ellipse();
  }
  
  if (p3.overlaps(p1)){
    p1.increaseRadius();
  }
  
}
