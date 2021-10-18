int numFrames = 6;
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(900, 900);
  frameRate(15);
  background(255);
  for(int i = 0; i < 225; i ++){
    images[i] = loadImage("walking-"+nf(i, 4)+".jpg");
  }
}

void draw() {
  background(255);
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
  image(images[frame], mouseX - images[frame].width/2, mouseY - images[frame].height/2);
}
