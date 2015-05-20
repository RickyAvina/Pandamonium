class Bullet extends DrawableThing
{
  PVector vel;
  float speed;
  boolean isDead = false;

  Bullet(PVector loc, Float angleInRadians)
  {
    location = new PVector( loc.x, loc.y ); // note we COPY the location
    angleInRadians += radians(-48);
    vel = new PVector(cos(angleInRadians), sin(angleInRadians));  // angle in radians

      // could have a bullet speed & age for fancier particle system effects
    speed = 15;
    vel = PVector.mult( vel, speed );
  }

  void update()
  {
    location.add(vel);
    destroyPanda();
    //   destroyBullet();
  }

  void display()
  {
    fill(0, 0, 255);
    ellipse(location.x, location.y, 5, 5);
  }


  void destroyPanda() {
    for (int i = 0; i<balls.size(); i++) {
      if (location.dist(balls.get(i).location) < 10) {
        balls.remove(i);
      }
    }
  }

  //  void destroyBullet() {
  //    for (int i = 0; i < b.bullets.size(); i++) {
  //      if (location.x > 900 + 5 || location.x < 0 - 5 || location.y > 900 + 5 || location.y < 0 - 5)      // replace 900 with width or height
  //        b.bullets.remove(i);
  //      println("REMOVED");
  //    }
  //  }
}

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

class Bomb extends Bullet {
  int passedTime = 0;
  float fireRate = 150;
  int timeTime = 0;
  boolean boom;

  Bomb(PVector loc, float angleInRadians) {
    super(loc, angleInRadians);
    speed = 10;
    boom = false;
  } 

  void update() {
    location.add(vel);
    destroyPanda();
    vel.mult(0.95);
  }

  void display() {
    fill(0, 0, 255);
    ellipse(location.x, location.y, 25, 25);

    if (vel.y < 1) {
      fill(255, 0, 0, 100);
      ellipse(location.x, location.y, 200, 200);
      boom = true;
    }
  }

  void destroyPanda() {
    for (int i = 0; i<balls.size(); i++) {
      if (boom){
       if(location.dist(balls.get(i).location) < 100){
          balls.remove(i);
       } 
      } else {
      if (location.dist(balls.get(i).location) < 10) {
        balls.remove(i);
      }
      }
    }
  }
}

