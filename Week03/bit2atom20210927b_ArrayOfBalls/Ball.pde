class Ball{
  float bX, by, bD;
  //构造函数
  Ball(float bX_, float bY_, float bD_){
    bX = bX_;
    by = bY_;
    bD = bD_;
  }
  
  void display(){
    stroke(255);
    strokeWeight(1);
    ellipse(bX, by, bD, bD);
  }
}
