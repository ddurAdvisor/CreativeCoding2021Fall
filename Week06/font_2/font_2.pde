PFont font1, font2;

void setup(){
  size(600, 400);
  font1 = createFont("微软雅黑", 24);
  font2 = createFont("ArialMT", 24);
  
  textSize(72);
  -2
  textFont(font1);
  fill(0);
  text("今天是周一", width/2, height/2);
  
  textFont(font2);
  fill(255, 0, 255);
  text("Monday", width/2, height/2 + 50);
}
