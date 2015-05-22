class Bullets extends DrawableThing
{
  Bullets()
  {
  }

  void display()
  {
    for (int i = 0; i < game.bullets.size (); i++) 
    {
      game.bullets.get(i).display();
    }
  }

  void update()
  {
    for (int i = 0; i < game.bullets.size (); i++) 
    {
      game.bullets.get(i).update();
      if (game.bullets.get(i).location.x > 900 + 5 || game.bullets.get(i).location.x < 0 - 5 || game.bullets.get(i).location.y > 900 + 5 || game.bullets.get(i).location.y < 0 - 5) {
        game.bullets.remove(i);
      }

      // TBD: what if the bullet hits something like the player or another turret ?
      // perhaps it should explode the object and also get deleted !
      // for example each bullet could ask each turret whether it hit it ss
      // as well as the player.
      // If yes, it could tell the turret to explode/disappear etc.

      // TBD: if a bullet leaves the  screen, we should delete it
      // no point updating and drawing it if it is never going to be visible again
    }
  }

  void makeBullet(PVector location, Float angle)
  {
    if (game.balls.size() != 0) {
      game.bullets.add(new Bullet(location, angle));
    }
  }
}

