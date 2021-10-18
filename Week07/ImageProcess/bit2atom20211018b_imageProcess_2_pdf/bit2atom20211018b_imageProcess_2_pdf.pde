/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2021-10-18 14:36:10
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2021-10-18 14:38:13
* @detail
*/
import processing.pdf.*;

PImage img;

boolean SaveImage;
boolean savePDF;

void setup() {
  size(424, 440);
  initiate();
}

void initiate() {
  img = loadImage("dog.png");
}

void draw() {
  //background(255);
  //image(img, 0, 0);
  img.loadPixels();

/**
 * [if description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:37:49+0800
 * @param    {[type]}                 savePDF [description]
 * @return   {[type]}                         [description]
 */
  if (savePDF == true) {
    beginRecord(PDF, "outPut/vectorDog.pdf");
  }

/**
 * [for description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:37:41+0800
 * @param    {[type]}                 int i             [description]
 * @return   {[type]}                     [description]
 */
  for (int i = 0; i < 5000; i ++) {
    int xx = floor(random(width));
    int yy = ceil(random(height));
    color c = img.get(xx, yy);
    float b = brightness(c);
    float eSize = map(b, 0, 255, 5, 50);
    noStroke();
    //stroke(255);
    fill(c, 105);
    ellipse(xx, yy, eSize, eSize);
  }

  if (savePDF == false) {
    endRecord();
    savePDF = false;
  }

/**
 * [if description]
 * @Author   bit2atom
 * @DateTime 2021-10-18T14:37:28+0800
 * @param    {[type]}                 SaveImage [description]
 * @return   {[type]}                           [description]
 */
  if (SaveImage) {
    save("outPut/dog"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png");
    SaveImage = false;
  }
}

void keyPressed() {
  if (key == 's') {
    SaveImage = true;
  }
  
  if (key == 'p') {
    if (savePDF == true) {
      savePDF = false;
    } else {
      savePDF = true;
    }
  }
}
