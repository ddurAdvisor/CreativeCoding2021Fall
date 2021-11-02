// Interactive Selection
// https://www.karlsims.com/papers/siggraph91.html

// The class for our Design, contains DNA sequence, fitness value, position on screen

// Fitness Function f(t) = t (where t is "time" mouse rolls over Design)

class Design {

  DNA dna;          // Design's DNA
  float fitness;    // How good is this Design?
  float x, y;       // Position on screen
  int wh = 200;      // Size of square enclosing Design
  boolean rolloverOn; // Are we rolling over this Design?
  PShape[] childShape;

  Rectangle r;

  // Create a new Design
  Design(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;

    int count = s.getChildCount();
    childShape = new PShape[count];
    for (int i = 0; i < childShape.length; i ++) {
      childShape[i] = s.getChild(i);
    }

    fitness = 1;
    // Using java.awt.Rectangle (see: http://java.sun.com/j2se/1.4.2/docs/api/java/awt/Rectangle.html)
    r = new Rectangle(int(x), int(y), int(wh), int(wh));
  }

  // Display the Design
  void display() {

    pushMatrix();
    translate(x, y);
    noStroke();

    // Draw the bounding box
    //stroke(0.25);
    if (rolloverOn) fill(0, 0.25);
    else noFill();
    //rectMode(CENTER);
    //rect(0, 0, wh, wh);

    for (int i = 1; i < childShape.length; i ++) {
      //stroke(0);
      strokeWeight(1);
      fill(dna.genes[(i-1)*3+0], dna.genes[(i-1)*3+1], dna.genes[(i-1)*3+2]);
      //shapeMode(CENTER);
      shape(childShape[i], 0, 0);
    }

    popMatrix();

    // Display fitness value
    textAlign(CENTER);
    if (rolloverOn) fill(0);
    else fill(0.25);
    text(int(fitness), x+wh/2, y+wh+20);
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  boolean clickedOn;

  boolean clicked(int mx, int my) {
    if (r.contains(mx, my)) clickedOn = true;
    return clickedOn;
  }

  // Increment fitness if mouse is rolling over Design
  void rollover(int mx, int my) {
    if (r.contains(mx, my)) {
      rolloverOn = true;
      if (mousePressed) {
        fitness += 0.25;
      }
    } else {
      rolloverOn = false;
    }
  }
}
