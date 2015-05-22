

class Bullet extends DrawableThing{
  PVector vel;
  float speed;
  boolean isDead = false;

  Bullet(PVector loc, Float angleInRadians)  {
    location = new PVector( loc.x, loc.y ); // note we COPY the location
    angleInRadians += radians(-48);
    vel = new PVector(cos(angleInRadians), sin(angleInRadians));  // angle in radians
    // could have a bullet speed & age for fancier particle system effects
    speed = 15;
    vel = PVector.mult( vel, speed );
  }

  void update(){
    location.add(vel);
    destroyPanda();
    //   destroyBullet();
  }

  void display(){
    fill(0, 0, 255);
    ellipse(location.x, location.y, 5, 5);
  }


  void destroyPanda() {
    for (int i=0; i< game.balls.size(); i++) {
      if (location.dist(game.balls.get(i).location) < 10) {
        game.balls.remove(i);
      }
    }

  }


}  //  +++++++++++++++++++++++++++++++++++++++++++++++++  Class
