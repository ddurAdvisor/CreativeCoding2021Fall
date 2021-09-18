boolean withStroke;
boolean withFill;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  float xx = random(width);
  float yy = random(0, height);
  float dia = random(50, 150);
  float alpha = random(255);

  float choice = random(1);
  if (choice < 0.3) {
    withStroke = true;
    noFill();
  } else if(choice < 0.6){
    withFill = true;
    noStroke();
  }
  
  if (withStroke) {
    stroke(random(255), random(255), random(255));
  }

  if (withFill) {
    fill(random(255), random(255), random(255), alpha);
  }

  ellipse(xx, yy, dia, dia);
}
