class Turret extends DrawableThing
{
  PVector location;
  float angle = 0;
  float x;
  float y;
  float targetAngle = 0;
  float easing = 0.051f;
  PVector target;
  float accuracyAngle = -138;
  int range;
  PImage image;
  Turret(PVector vector, PVector thetarget, int range, PImage image)
  {
    location = vector;
    target = thetarget;
    this.range = range;
    this.image = image;
  }

  void update()
  {
    PVector thetarget = new PVector(0, 0);
    if (balls.size() > 0) {
      thetarget = balls.get(0).location;
    }

    for (int i = 0; i < balls.size();i++) {
      if (location.dist(balls.get(i).location) < location.dist(thetarget)) {
        thetarget = balls.get(i).location;
      }
    }

    float dx = location.x - thetarget.x;
    float dy = location.y - thetarget.y;
    angle = atan2(dy, dx);
  }

  void display()
  {
    noFill();
    stroke( 200 );
    pushMatrix();
    imageMode(CENTER);
    angle += radians(accuracyAngle);
    translate( location.x, location.y );
    rotate( angle );
    image(this.image, 0, 0,50,50);
    popMatrix();

    rangeCircle();         // displays circle around turret
  }

  void shoot()
  {
    for (int i = 0; i < balls.size(); i++) {
      if (balls.get(i).location.dist(location) > 0 && balls.get(i).location.dist(location) < range-100) {              // range
        b.makeBullet(location, angle);
      }
    }
  }

  void rangeCircle() {
    fill(100, 100, 100, 100);
    ellipse(location.x, location.y, this.range, this.range);
  }
}

/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
class ShotgunTurret extends Turret {

  int range = 200;
  ShotgunTurret(PVector vector, PVector thetarget, int range, PImage image) {
    super(vector, thetarget, range, image);
  }

  void rangeCircle() {
    fill(100, 100, 100, 100);
    ellipse(location.x, location.y, range, range);
  }

  void shoot() {
    for (int i = 0; i < balls.size(); i++) {
      if (balls.get(i).location.dist(location) > 0 && balls.get(i).location.dist(location) < range-100) {              // range
        b.makeBullet(location, angle - 50);
        b.makeBullet(location, angle);
        b.makeBullet(location, angle + 50);
      }
    }
  }
}

/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
class ThreeSixtyTurret extends Turret {
  int range = 300;

  ThreeSixtyTurret(PVector vector, PVector thetarget, int range, PImage image) {
    super(vector, thetarget, range, image);
  }

  void shoot() {
    for (int i = 0; i < balls.size(); i++) {
      if (balls.get(i).location.dist(location) > 0 && balls.get(i).location.dist(location) < range-100) {              // range
        b.makeBullet(location, angle-160);
        b.makeBullet(location, angle-120);
        b.makeBullet(location, angle-80);
        b.makeBullet(location, angle-40);
        b.makeBullet(location, angle);
        b.makeBullet(location, angle+40);
        b.makeBullet(location, angle+80);
        b.makeBullet(location, angle+120);
        b.makeBullet(location, angle+160);
      }
    }
  }
}



/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
class FreezeTurret extends Turret {
  int range = 600;

  FreezeTurret(PVector vector, PVector thetarget, int range, PImage image) {
    super(vector, thetarget, range, image);
  }

  void shoot() {
    for (int i = 0; i < balls.size(); i++) {
      if (balls.get(i).location.dist(location) > 0 && balls.get(i).location.dist(location) < range-100) {

        balls.get(i).acc.x *= 0.6;
        balls.get(i).acc.y *= 0.6;
      }
    }
  }
}

