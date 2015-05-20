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
//      fill(255, 255, 255);
      ellipse(turretss.get(0).location.x + 0, turretss.get(0).location.y+ 200, 20, 20);
    }

    for (int i = 0; i < turretss.size (); i++)
    {
      turretss.get(i).display();
    }
  }

  void makeTurret(PVector location, PVector thetarget, int range)
  {
    turretss.add(new Turret(location, thetarget, range));
  }

  void makeShotGunTurret(PVector location, PVector thetarget, int range) {
    turretss.add(new ShotgunTurret(location, thetarget, range));
  }
  
  void makeThreeSixtyTurret(PVector location, PVector thetarget, int range) {
    turretss.add(new ThreeSixtyTurret(location, thetarget, range));
  }
  
  void makeFreezeTurret(PVector location, PVector thetarget, int range) {
    turretss.add(new FreezeTurret(location, thetarget, range));
  }
  
  void makeBombTurret(PVector location, PVector thetarget, int range) {
     turretss.add(new BombTurret(location, thetarget, range)); 
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

