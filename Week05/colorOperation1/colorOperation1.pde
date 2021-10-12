int colorRingLoc;
int cc;

void setup() {
  size(800, 400);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(255);
  noStroke();
  fill(colorRingLoc, 100, 100);
  rect(0, 0, width/2, height);

  if (colorRingLoc < 180) {
    cc = colorRingLoc + 180;
  } else {
    cc = colorRingLoc - 180;
  }

  fill(cc, 100, 100);
  rect(width/2, 0, width/2, height);

  noStroke();
  fill(200);
  ellipse(width/4, height/2, 50, 50);
  ellipse(width*3/4, height/2, 50, 50);

  textAlign(CENTER, CENTER);
  fill(255);
  text(colorRingLoc, width/4, height/2);
  text(cc, width*3/4, height/2);
}

void keyPressed() {
  if (key == 'r') {
    colorRingLoc = floor(random(360));
  }
}
