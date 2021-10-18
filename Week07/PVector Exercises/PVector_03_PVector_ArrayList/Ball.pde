/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2020-12-06 17:10:54
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:26:02
* @detail
*/

class Ball {
  PVector loc;
  PVector speed = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector gravity = new PVector(0, 0.05);
  float r;
  color c;

  boolean mouseAttraction = false;

/**
 * [Ball description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:34+0800
 * @param    {[type]}                 PVector loc_ [description]
 * @param    {[type]}                 float   r_   [description]
 * @param    {[type]}                 color   c_   [description]
 */
  Ball(PVector loc_, float r_, color c_) {
    loc = loc_;
    r=r_;
    c=c_;
  }

  void run() {
    update();//
    show();
    edge();//ball bouncing with edges of canvas
    collision();//balls collide with each other
    if(mousePressed){
      mouseAttraction();
    }
  }

/**
 * [mouseAttraction description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:40+0800
 * @return   {[type]}                 [description]
 */
  void mouseAttraction() {
    PVector mouseForce = new PVector(mouseX, mouseY);
    for (int i=0; i<myBall.size(); i++) {
      PVector diff = PVector.sub(mouseForce, loc);
      diff.normalize();
      diff.mult(10/r);//small balls can be more easierly change motion
      acc.add(diff);
    }
  }

/**
 * [collision description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:46+0800
 * @return   {[type]}                 [description]
 */
  void collision() {
    for (int i=0; i<myBall.size(); i++) {
      Ball other = (Ball)myBall.get(i);
      PVector diff = PVector.sub(loc, other.loc);
      float distance = diff.mag();

      if (distance >0 && distance <r+other.r) {
        diff.normalize();
        diff.mult(20/r);//small balls can be more easierly change motion
        acc.add(diff);
      }
    }
  }

/**
 * [update description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:50+0800
 * @return   {[type]}                 [description]
 */
  void update() {
    acc.add(gravity);
    speed.add(acc);
    //computing resistance from the air
    speed.mult(0.995);
    //limit the speed to maxium of 5
    if (speed.mag()>5) {
      speed.normalize();
      speed.mult(5);
    }
    loc.add(speed);
    acc = new PVector(0, 0);
  }

/**
 * [edge description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:54+0800
 * @return   {[type]}                 [description]
 */
  void edge() {
    if (loc.x>width-r) {
      speed.x*=-1;
      loc.x = width-r;
    }
    if (loc.x<r) {
      speed.x*=-1;
      loc.x = r;
    }
    if (loc.y>height-r) {
      speed.y*=-1;
      loc.y = height-r;
    }
    if (loc.y<r) {
      speed.y*=-1;
      loc.y = r;
    }
  }

/**
 * [show description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:25:59+0800
 * @return   {[type]}                 [description]
 */
  void show() {
    stroke(255);
    fill(c); 
    ellipse(loc.x, loc.y, r*2, r*2);

    //draw Arrows at the end of each speed vectors
    float ang = speed.heading();
    stroke(255); //stroke(#9C9AEA);
    float arrowLength = 10;
    PVector headLocation = new PVector(loc.x+10*speed.mag()*cos(ang), loc.y+10*speed.mag()*sin(ang));
    line(loc.x, loc.y, headLocation.x, headLocation.y);
    line(headLocation.x, headLocation.y, headLocation.x + arrowLength*cos(ang + PI*3/4), headLocation.y + arrowLength*sin(ang + PI*3/4));
    line(headLocation.x, headLocation.y, headLocation.x + arrowLength*cos(ang - PI*3/4), headLocation.y + arrowLength*sin(ang - PI*3/4));
  }
}
