size(800, 800);
background(0);
for (int i=0; i<100000; i++) {
  float x=map(i, 0, 100000, 0, width);
  x+=tan(TWO_PI*noise(x));
  float y=height/2+sin(map(i, 0, 100000, 0, TWO_PI*30))*300;
  stroke(255, 100);
  circle(x, y, .7);
}
