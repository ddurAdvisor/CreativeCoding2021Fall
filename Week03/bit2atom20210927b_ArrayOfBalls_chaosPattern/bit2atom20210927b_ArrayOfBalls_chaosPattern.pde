Ball[] tinyBalls;
int totalNumOfBalls = 500;

void setup() {
  size(800, 800);
  background(0);
  initiateData();
  //float bX_, float bY_, float bD_
  //tinyBall = new Ball(random(width), random(height), 50);
}

void initiateData() {
  //float bX_, float bY_, float bD_
  //tinyBall = new Ball(random(width), random(height), 50);
  tinyBalls = new Ball[totalNumOfBalls];
  for (int i = 0; i < tinyBalls.length; i ++) {
    float dd = random(10, 60);
    tinyBalls[i] = new Ball(random(width), random(height), dd);
  }
}

void draw() {
  //background(0);
  fill(0, 2);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i < tinyBalls.length; i ++) {
    //tinyBalls[i].display();
    tinyBalls[i].move();
    tinyBalls[i].edge();
    tinyBalls[i].shakeHands();
  }
}

void keyPressed() {
  if ( key == 'r') {
    initiateData();
  }
}
