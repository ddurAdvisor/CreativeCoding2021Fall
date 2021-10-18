/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 14:14:27
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:24:01
* @detail
*/

int totalNum = 200;
Ball[] theBall;

void setup() {
  size(600, 600);
  //Ball(PVector loc, float d)
  theBall = new Ball[totalNum];

  initiateData();
}

void initiateData() {
  for (int i = 0; i < theBall.length; i ++) {
    PVector loc = new PVector(random(width), random(height));
    float d = random(20, 50);
    theBall[i] = new Ball(loc, d, i);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < theBall.length; i ++) {
    theBall[i].show();
    theBall[i].connection();
    theBall[i].repellence();
    //println(theBall[2].dd);
  }
}

void keyPressed() {
  if (key == 'r') {
    initiateData();
  }
}
