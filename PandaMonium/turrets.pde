class Turrets extends DrawableThing {
  ArrayList<Turret> turrets;
  Turrets() {
    turrets = new ArrayList<Turret>();
  }

  void update() {
    for (int i = 0; i < turrets.size (); i++) {
      turrets.get(i).update();
    }
  }

  void display() {
    if (turrets.size() > 0) {
      fill(255, 0, 0);
      ellipse(turrets.get(0).location.x + 0, turrets.get(0).location.y+ 200, 20, 20);
    }

    for (int i = 0; i < turrets.size (); i++) {
      turrets.get(i).display();
    }
  }

  void makeTurret(PVector location, PVector thetarget) {
    turrets.add(new Turret(location, thetarget));
  }

// shoot all the turrets
void shoot() {
  for (int i = 0; i < turrets.size (); i++) {
    turrets.get(i).shoot();
  }
}

}  //++++++++++++++++++++++++++++++++++++++++++++++++++++  Class

