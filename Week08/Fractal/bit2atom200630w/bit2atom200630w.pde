float t, i, x, y;
int curveNum = 12;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  noFill();
  t += 0.05;
  translate(width/2, height/2);
  for (i = 0; i < TAU; i += PI / curveNum) {
    x = cos(i);
    y = sin(i);
    bezier(x, y, y, x, noise(t * x) * (width-10) - (width/2-5), noise(t * y) * (height-10) - (height/2-5), x * (width/2-5), y * (height/2-5));
  }
}
