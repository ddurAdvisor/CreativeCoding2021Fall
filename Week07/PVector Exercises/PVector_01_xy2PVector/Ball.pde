/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2020-12-06 17:07:23
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:27:36
* @detail
*/
class Ball{
  PVector location;
  float dd;
  int indexNum;
  
  /**
   * [Ball description]
   * @Author   bit2atom
   * @DateTime 2021-10-18T14:27:35+0800
   * @param    {[type]}                 PVector loc   [description]
   * @param    {[type]}                 float   d     [description]
   * @param    {[type]}                 int     index [description]
   */
  Ball(PVector loc, float d, int index){
    location = loc;
    dd = d;
    indexNum = index;
  }
  
  /**
   * [show description]
   * @Author   bit2atom
   * @DateTime 2021-10-18T14:27:29+0800
   * @return   {[type]}                 [description]
   */
  void show(){
    fill(255);
    noStroke();
    ellipse(location.x, location.y, dd, dd);
    fill(#5493E8);
    textAlign(CENTER, CENTER);
    text(indexNum, location.x, location.y);
  }
  
  /**
   * [connection description]
   * @Author   bit2atom
   * @DateTime 2021-10-18T14:27:26+0800
   * @return   {[type]}                 [description]
   */
  void connection(){
    for(Ball other : theBall){
      float ddd = PVector.dist(other.location, location);
      if(ddd > 0 && ddd < 50){
        stroke(#5493E8);
        line(other.location.x, other.location.y, location.x, location.y);
      }
    }
  }

}
