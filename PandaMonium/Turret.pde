class Turret extends DrawableThing
{
  PVector location;
  float angle = 0;
  float x;
  float y;
  float targetAngle = 0;
  float easing = 0.051f;
  PVector target;
  float accuracyAngle = -136;
  int range = 200;

  Turret(PVector vector, PVector thetarget)
  {
    location = vector;
    target = thetarget;
  }

  void update()
  {
    PVector thetarget = new PVector(0, 0);
    if (game.balls.size() > 0) {
      thetarget = game.balls.get(0).location;
    }

    for (int i = 0; i < game.balls.size();i++) {
      if (location.dist(game.balls.get(i).location) < location.dist(thetarget)) {
        thetarget = game.balls.get(i).location;
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
    scale(.2);
    image(turret,0, 0);
    popMatrix();

    range();
  }

  void shoot()
  {
    for (int i = 0; i < game.balls.size(); i++) {
      if (game.balls.get(i).location.dist(location) > 0 && game.balls.get(i).location.dist(location) < range) {              // range
        game.b.makeBullet(location, angle);
      }
    }
  }

  void range() {
    fill(100, 100, 100, 100);
    ellipse(location.x, location.y, 400, 400);
  }
}

