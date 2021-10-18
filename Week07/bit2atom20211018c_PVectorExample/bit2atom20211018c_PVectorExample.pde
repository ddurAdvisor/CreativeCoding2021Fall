/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 14:09:14
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:33:27
* @detail
*/
Ball[] myBalls;
int totalNum = 20;

void setup() {
  size(600, 600);
  background(0);
  initiate();
}

/**
 * [initiate description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:26+0800
 * @return   {[type]}                 [description]
 */
void initiate() {
  myBalls = new Ball[totalNum];
  for (int i = 0; i < myBalls.length; i ++) {
    PVector p = new PVector(random(width), random(height));
    myBalls[i] = new Ball(p, 5);//float pX, float pY, float d
  }
}

void draw() {
  //background(255);
  fill(255,10);
  noStroke();
  rect(0, 0, width, height);
  
  for(Ball b : myBalls){
    b.run();
  }
}

void keyPressed() {
  if (key == 'r') {
    initiate();
  }
}
