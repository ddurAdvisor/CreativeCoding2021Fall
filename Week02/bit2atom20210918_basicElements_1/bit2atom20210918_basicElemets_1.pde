float diaW;
float diaH;

void setup() {
  size(720, 640);
  background(255, 0, 125);
  diaW = 50;
  diaH = 50;
}

void draw() {
  //background(255, 0, 125, 10);
  fill(255, 0, 125, 10);
  rect(0, 0, width, height);
  stroke(255);
  fill(100, 200, 255);
  ellipse(mouseX, mouseY, diaW, diaH);
}
