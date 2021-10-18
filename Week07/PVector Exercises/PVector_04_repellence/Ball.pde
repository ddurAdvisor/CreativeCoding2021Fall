/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2020-12-06 17:05:58
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:24:00
* @detail
*/

class Ball {
  PVector location;
  float dd;
  int indexNum;
  boolean stable = true;

  Ball(PVector loc, float d, int index) {
    location = loc;
    dd = d;
    indexNum = index;
  }

/**
 * [show description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:23:44+0800
 * @return   {[type]}                 [description]
 */
  void show() {
    if (stable) {
      fill(255);
    } else {
      fill(#E80C0C);
    }
    noStroke();
    ellipse(location.x, location.y, dd, dd);
    fill(#5493E8);
    textAlign(CENTER, CENTER);
    text(indexNum, location.x, location.y);
  }

/**
 * [connection description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:23:48+0800
 * @return   {[type]}                 [description]
 */
  void connection() {
    for (Ball other : theBall) {
      float ddd = PVector.dist(other.location, location);
      if (ddd > 0 && ddd < 50) {
        stroke(#5493E8);
        line(other.location.x, other.location.y, location.x, location.y);
      }
    }
  }
  
  /**
   * [repellence description]
   * @Author   bit2atom
   * @DateTime 2021-10-18T14:23:53+0800
   * @return   {[type]}                 [description]
   */
  void repellence() {
    for (Ball other : theBall) {
      float ddd = PVector.dist(other.location, location);
      if (ddd < (other.dd + dd)/2) {
        PVector repelForce = PVector.sub(location, other.location);
        if (repelForce.mag()>0) {
          stable = false;
        } else {
          stable = true;
        }
        repelForce.normalize();
        repelForce.mult(500/dd);
        location.add(repelForce);
        repelForce = new PVector(0, 0);
      }
    }
  }
}
