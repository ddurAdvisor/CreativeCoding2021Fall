/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 14:14:00
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:26:06
* @detail
*/

ArrayList myBall;

void setup() {
  size(600, 600);
  myBall = new ArrayList();
}

void draw() {
  background(0);
  for (int i=0; i<myBall.size(); i++) {
    Ball mb = (Ball)myBall.get(i);
    mb.run();
  }
}

void keyPressed() {
  if (key == 'a') {
    PVector mb = new PVector(mouseX, mouseY);
    color cb = color(random(255), random(255), random(255));
    myBall.add(new Ball(mb, random(5, 30), cb));
  }
}
