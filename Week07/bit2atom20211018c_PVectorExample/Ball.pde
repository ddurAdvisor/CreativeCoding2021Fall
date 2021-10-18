/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 13:14:00
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:33:11
* @detail
*/
class Ball {
  //float positionX, positionY;
  PVector position;
  float dd;
  color bC;
  PVector speed;
  float attractionIndex = 10;

/**
 * [Ball description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:39+0800
 * @param    {[type]}                 PVector p [description]
 * @param    {[type]}                 float   d [description]
 */
  Ball(PVector p, float d) {
    position = p;
    dd = d;
    bC = color(random(255), random(255), random(255));
    speed = new PVector(random(-1, 1), random(-1, 1));
  }

/**
 * [run description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:44+0800
 * @return   {[type]}                 [description]
 */
  void run() {
    move();
    collision();
    egde();
    mouseAttraction();
    showBall();
    speed.limit(5);
  }

/**
 * [move description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:51+0800
 * @return   {[type]}                 [description]
 */
  void move() {
    position.add(speed);
  }

/**
 * [collision description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:55+0800
 * @return   {[type]}                 [description]
 */
  void collision() {
    for (Ball tb : myBalls) {
      float d = PVector.dist(tb.position, this.position);
      if (d > 0) {
        if (d < (tb.dd/2 + dd/2)) {
          PVector a = PVector.sub(position, tb.position);
          speed.add(a);
        }
      }
    }
  }

/**
 * [mouseAttraction description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:32:59+0800
 * @return   {[type]}                 [description]
 */
  void mouseAttraction() {
    PVector m = new PVector(mouseX, mouseY);
    float d = PVector.dist(m, position);
    PVector attr = PVector.sub(m, position);
    attr.normalize();
    attr.mult(attractionIndex/d);
    speed.add(attr);
  }

/**
 * [egde description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:33:03+0800
 * @return   {[type]}                 [description]
 */
  void egde() {
    if (position.x > width - dd/2) {
      position.x = width - dd/2;
      speed.x *= -1;
    }
    if (position.x < dd/2) {
      position.x = dd/2;
      speed.x *= -1;
    }

    if (position.y > height - dd/2) {
      position.y = height - dd/2;
      speed.y *= -1;
    }
    if (position.y < dd/2) {
      position.y = dd/2;
      speed.y *= -1;
    }
  }

/**
 * [showBall description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:33:09+0800
 * @return   {[type]}                 [description]
 */
  void showBall() {
    stroke(0);
    fill(bC);
    ellipse(position.x, position.y, dd, dd);
  }
}
