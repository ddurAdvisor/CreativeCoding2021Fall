/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 14:14:40
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:23:03
* @detail
*/

int totalNum = 500;
Ball[] theBall;

float scaleSize = 0.5;

void setup() {
  size(600, 600);
  initiateData();
}

/**
 * [initiateData description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:22:17+0800
 * @return   {[type]}                 [description]
 */
void initiateData(){
  theBall = new Ball[totalNum];
  
  for(int i = 0; i < theBall.length; i ++){
    PVector loc = new PVector(random(width), random(height));
    float d = random(10, 50);
    theBall[i] = new Ball(loc, d, i);
  }
}

void draw() {
  background(0);
  scale(scaleSize);
  translate(width/2, height/2);
  for(int i = 0; i < theBall.length; i ++){
    theBall[i].show();
    //theBall[i].connection();
    theBall[i].repellence();
    //println(theBall[2].dd);
  }
  
  noFill();
  stroke(#C9F022);
  strokeWeight(3);
  rect(0, 0, width, height);
}

void keyPressed(){
  if(key == 'r'){
    initiateData();
  }
  if(key == 'a'){
    scaleSize += 0.1;
  }
  if(key == 'z'){
    if(scaleSize > 0.2){
      scaleSize -= 0.1;
    }
  }
}
