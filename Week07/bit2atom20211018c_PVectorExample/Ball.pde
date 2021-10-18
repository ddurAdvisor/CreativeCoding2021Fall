class Ball {
  //float positionX, positionY;
  PVector position;
  float dd;
  color bC;
  PVector speed;
  float attractionIndex = 10;


  Ball(PVector p, float d) {
    position = p;
    dd = d;
    bC = color(random(255), random(255), random(255));
    speed = new PVector(random(-1, 1), random(-1, 1));
  }

  void run() {
    move();
    collision();
    egde();
    mouseAttraction();
    showBall();
    speed.limit(5);
  }

  void move() {
    position.add(speed);
  }

  void collision() {
    for (Ball tb : myBalls) {
      float d = PVector.dist(tb.position, this.position);
      if (d > 0) {
        if (d < (tb.dd/2 + dd/2)) {
          PVector a = PVector.sub(position, tb.position);
          speed.add(a);
        }
      }
    }
  }

  void mouseAttraction() {
    PVector m = new PVector(mouseX, mouseY);
    float d = PVector.dist(m, position);
    PVector attr = PVector.sub(m, position);
    attr.normalize();
    attr.mult(attractionIndex/d);
    speed.add(attr);
  }

  void egde() {
    if (position.x > width - dd/2) {
      position.x = width - dd/2;
      speed.x *= -1;
    }
    if (position.x < dd/2) {
      position.x = dd/2;
      speed.x *= -1;
    }

    if (position.y > height - dd/2) {
      position.y = height - dd/2;
      speed.y *= -1;
    }
    if (position.y < dd/2) {
      position.y = dd/2;
      speed.y *= -1;
    }
  }

  void showBall() {
    stroke(0);
    fill(bC);
    ellipse(position.x, position.y, dd, dd);
  }
}
