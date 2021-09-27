class Ball {
  float bX, by, bD;
  color c = 255;
  boolean shakeHand;
  
  float speedX, speedY;

  //构造函数
  Ball(float bX_, float bY_, float bD_) {
    bX = bX_;
    by = bY_;
    bD = bD_;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
  }
  
  void move(){
    bX = bX + speedX;
    by += speedY;
  }
  
  void edge(){
    if(bX > width + bD/2){
      bX = -bD/2;
    }
    if(bX < -bD/2){
      bX = width + bD/2;
    }
    if(by > height + bD/2){
      by = -bD/2;
    }
    if(by < -bD/2){
      by = height + bD/2;
    }
  }

  void display() {
    if (shakeHand) {
      stroke(255, 255, 255);
    } else {
      stroke(c);
    }
    strokeWeight(1);
    noFill();
    ellipse(bX, by, bD, bD);
  }

  void shakeHands() {
    for (Ball b : tinyBalls) {
      if (b != this) {
        float rR = b.bD/2 + this.bD/2;
        float d = sqrt((b.bX - bX)
          *(b.bX - bX)
          +(b.by - by)
          *(b.by - by));
        if (d < rR) {
          shakeHand = true;
          stroke(255);
          float w = map(d, 0, rR, 10, 1);
          strokeWeight(w);
          line(b.bX, b.by, bX, by);
        }
      }
    }
  }
}
