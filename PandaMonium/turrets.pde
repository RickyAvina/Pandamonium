class Turrets extends DrawableThing
{ 
  Turrets()
  {
    turretss = new ArrayList<Turret>();
  }

  void update()
  {
    for (int i = 0; i < turretss.size (); i++)
    {
      turretss.get(i).update();
    }
  }

  void display()
  {
    if (turretss.size() > 0) {
      fill(255, 0, 0);
      ellipse(turretss.get(0).location.x + 0, turretss.get(0).location.y+ 200, 20, 20);
    }

    for (int i = 0; i < turretss.size (); i++)
    {
      turretss.get(i).display();
    }
  }

  void makeTurret(PVector location, PVector thetarget, int range, PImage imgae)
  {
    turretss.add(new Turret(location, thetarget, range, imgae));
  }

  void makeShotGunTurret(PVector location, PVector thetarget, int range, PImage imgae) {
    turretss.add(new ShotgunTurret(location, thetarget, range, imgae));
  }
  
  void makeThreeSixtyTurret(PVector location, PVector thetarget, int range, PImage imgae) {
    turretss.add(new ThreeSixtyTurret(location, thetarget, range, imgae));
  }
  
  void makeFreezeTurret(PVector location, PVector thetarget, int range, PImage imgae) {
    turretss.add(new FreezeTurret(location, thetarget, range, imgae));
  }

  // shoot all the turrets
  void shoot()
  {
    for (int i = 0; i < turretss.size (); i++) 
    {
      turretss.get(i).shoot();
    }
  }
}

