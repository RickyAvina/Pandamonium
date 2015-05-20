class Ball extends DrawableThing {

  PVector location, acc, vel;
  float distance, opacity;
  int maxSpeed;
  float maxForce;

  Ball() {
    location = new PVector(random(10, width-10), random(10, height-10));
    acc = new PVector(random(-4, 4), random(-4, 4)); 
    vel = new PVector(random(-2, 2), random(-2, 2));
    maxSpeed = 2;
    maxForce = .2;
  }

  Ball(PVector loc) {
    location = loc;
    acc = new PVector(random(-4, 4), random(-4, 4)); 
    vel = new PVector(random(-2, 2), random(-2, 2));
    maxSpeed = 4;
    maxForce = .2;
  }

  void update() {

    // Movement Basics
    location.add(acc);
    acc.limit(maxSpeed);
    acc.add(vel);
    vel.mult(0);

    // toMouse();
    toBase();
    aroundObs();
    //lineInbetween(); 
    checkEdges();
  }


  void display() {

    // Draw the balls
    fill(255, 255, 255, 100);
    noStroke();
    ellipse(location.x, location.y, 20, 20);
  }

  void aroundObs() {

    PVector sum = new PVector();                          // Sum just stores the local values
    int count = 0;

    // assigns one Ball to hold loction of all others
    for (int i = 0; i<balls.size(); i++) {
      Ball other = (Ball) balls.get(i);
      distance = PVector.dist(location, other.location);
      if(balls.size() == 0) level = 2;
    }

    for (int i =0; i < rocks.size(); i++) {
      if (rocks.get(i).location.dist(location) > 0 && rocks.get(i).location.dist(location) < 20) {
        PVector diff = PVector.sub(location, rocks.get(i).location);             // A PVector pointing away from the other's loc
        diff.normalize();
        sum.add(diff);
        count++;
      }
    }
    //  if ((distance > 0) && (distance < 80)) {

    //        PVector diff = PVector.sub(location, other.location);             // A PVector pointing away from the other's loc
    //        diff.normalize();
    //        sum.add(diff);
    //        count++;
    //      }


    if (count > 0) {

      sum.div(count);   
      sum.setMag(maxSpeed); 
      PVector steer = PVector.sub(vel, sum);
      steer.limit(maxForce);
      steer.mult(1.5);                                                    // Force of flow
      steer.mult(-1);                                                   // Flow away
      acc.add(steer);
    }
  }


  void lineInbetween() {

    PVector sum = new PVector();                          // Sum just stores the local values
    int count = 0;

    // assigns one Ball to hold loction of all others
    for (int i = 0; i<balls.size(); i++) {
      Ball other = (Ball) balls.get(i);
      distance = PVector.dist(location, other.location);

      if ((distance > 0) && (distance < 80)) {

        PVector diff = PVector.sub(location, other.location);             // A PVector pointing away from the other's loc
        diff.normalize();
        sum.add(diff);
        count++;
      }
    }

    if (count > 0) {

      sum.div(count);   
      sum.setMag(maxSpeed); 
      PVector steer = PVector.sub(vel, sum);
      steer.limit(maxForce);
      acc.add(steer);
    }
  }

  void toMouse() {
    PVector mouse = new PVector(mouseX, mouseY);  
    PVector difference = PVector.sub(mouse, location);

    // assigns one Ball to hold loction of all others
    for (int i = 0; i<balls.size(); i++) {
      Ball other = (Ball) balls.get(i);
      distance = PVector.dist(location, other.location);

      // drawing of the line
      if ((distance > 70) && (distance < 80)) {
        difference.normalize();
        difference.mult(0.2);
        acc.add(difference);
      }
    }
  }

  void toBase() {
    PVector baseLoc = new PVector(base.loc.x, base.loc.y);  
    PVector difference = PVector.sub(baseLoc, location);

    // assigns one Ball to hold loction of all others
    for (int i = 0; i<balls.size(); i++) {
      Ball other = (Ball) balls.get(i);
      distance = PVector.dist(location, other.location);

      // drawing of the line
      if ((distance > 70) && (distance < 80)) {
        difference.normalize();
        difference.mult(0.2);
        acc.add(difference);
      }
      
      if (PVector.dist(location, base.loc) < 60){
        base.health -= 1;  
      }
    }
  }

  void checkEdges() {

    // Check Edges!
    if ((location.x < 10) || (location.x > width-10))  acc.x*=-1;
    if ((location.y < 10) || (location.y > height-10))  acc.y*=-1;
  }

  void shootPanda() {
    for (int i = 0; i < turretss.size(); i++) {
      if (PVector.dist(location, turretss.get(i).location) > 0 && PVector.dist(location, turretss.get(i).location) < turretss.get(i).range) {              // range
        b.makeBullet(turretss.get(i).location, turretss.get(i).angle);
      }
    }
  }
}

