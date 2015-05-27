/*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 $  PandaMonium created May-April 2015                                      $
 $  Created by:                                                             $
 $  Alex Yancey, Ricky Avina, Henry MacArthur, Jason Asenso, Rodrigo Mejia  $
 $                                                                          $
 $                               Notes:                                     $
 $ * Using 1080p for now (subject to change)                                $
 $ * Panda Theme                                                            $
 $                               To Do:                                     $
 $ * Range / shooting                                                       $
 $ * Menu                                                                   $
 $ * Currency and buying turrets                                            $
 $ * Different types of turrets                                             $
 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 */

/* ++++++++++++++++++++++++++++ ArrayLists ++++++++++++++++++++++++++++++++ */

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<DrawableThing> objects = new ArrayList<DrawableThing>();
ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Turret> turretss;

/* +++++++++++++++++++++++++++++ Objects ++++++++++++++++++++++++++++++++++ */

MouseTarget ball;
Bullets b = new Bullets();
Turrets turrets = new Turrets();
Base base = new Base(new PVector(100, 400));
DrawableThing acoin;

/* +++++++++++++++++++++++++++++ Instance Variables +++++++++++++++++++++++ */
Button b1 = new Button(new PVector(100, 100), 100, 100, "Button");
PImage turretssss;
PImage rocksss;
int passedTime = 0;
int passedT = 0;
int fireRate = 300;
int spawn = 1000;
int width = 1920;
int height = 1080;
boolean hits= false;
boolean stopp = false;
boolean money = false;
int shotgunX = 600;
int shotgunY = 930;
int normalX = 600;
int normalY = 980;
int sixtyX = 750;
int sixtyY = 930;
int startX = 750;
int startY = 980;
PImage shotgunss;
boolean turretsNormal = false;
boolean shotgun = false;
int maxTurrets = 4;
int tA = 5;
boolean shooting = false;
boolean sixtyTurret = false;
int counter = 0;
PImage Pandas;
PImage bg2;
PImage background;
PImage turretsss;
int level = 1;
int coins = 50;
int coinNumber;
int playAreaWidth  = 1800;
int playAreaHeight  = 900;
int MenuAreaHeight = 100;
int myScreenHeight = playAreaHeight+MenuAreaHeight;
Menu m = new Menu(new PVector(0, playAreaHeight ));
boolean hit = false;
boolean start =false;
void setup()
{ 

  /* +++++++++++++++++++++++++ Game Setup +++++++++++++++++++++++++++++++++++ */
  turretssss = loadImage("t2.png");
  frameRate(60);
  size(playAreaWidth, myScreenHeight);
  ball = new MouseTarget();
  rocksss = loadImage("rockfinal.png");
  objects.add(ball);
  passedTime= millis();
  passedT = millis();
  shotgunss = loadImage("t3.png");
  bg2 = loadImage("forrest.png");
  Pandas = loadImage("panda1.png");
  background = loadImage("bg.png");
  acoin = new coin((int)random(0, 1700), (int)random(0, 800));
  objects.add(acoin);

  /* +++++++++++++++++++++++++ Instantiate Vars ++++++++++++++++++++++++++++++ */

  //turret = loadImage("t1.png");
  ball = new MouseTarget();
  objects.add(ball);
  objects.add(base);

  /* +++++++++++++++++++++++++ Add all objects +++++++++++++++++++++++++++++++ */

  for (int i = 0; i < 8; i++)  balls.add(new Ball(new PVector(1800, 100)));
  for (int i = 0; i < 8; i++)  balls.add(new Ball(new PVector(1800, 500)));
  for (int i = 0; i < 8; i++)  balls.add(new Ball(new PVector(1800, 700)));

  //   for (int i = 0; i < 100; i++)  balls.add(new Ball(new PVector(1800, 100)));
  //for (int i = 0; i < 80; i++)  balls.add(new Ball(new PVector(1800, 500)));
  //   for (int i = 0; i < 800; i++)  balls.add(new Ball(new PVector(1800, 700)));

  for (int i = 0; i < 50; i++) rocks.add(new Rock(new PVector(random(0, 1920), random(0, 1080))));
} // end setup

void draw()
{
  if(level == 1)
  {
  // erase background before drawing current frame:
  background(background);
  }
  else
  {
   background(bg2); 
  }
  fill(0);

  /* +++++++++++++++++++++ Display and update objects ++++++++++++++++++++++++ */

  for (int i = 0; i < rocks.size(); i++) rocks.get(i).display();  
  if (balls.size()<3)
  {
    coins = coins +30;
    start = false;
    level = 2;
    for (int i = 0; i < 23; i++)  balls.add(new Ball(new PVector(1800, 100)));
    for (int i = 0; i < 23; i++)  balls.add(new Ball(new PVector(1800, 500)));
    for (int i = 0; i < 23; i++)  balls.add(new Ball(new PVector(1800, 900)));
     for (int i = 0; i < 23; i++)  balls.add(new Ball(new PVector(1800, 300)));
   
  }
  for (int i = 0; i < objects.size();i++) {
    objects.get(i).update();
    objects.get(i).display();
  }
  if (start == true)
  {
    for (int i = 0; i < balls.size();i++) {
      balls.get(i).update();
      balls.get(i).display();
    }
  }

  b.update();
  turrets.update();
  b.display();
  turrets.display();

  /* +++++++++++++++++++++++++++ Fire Rate +++++++++++++++++++++++++++++++++++ */

  if ((millis()- passedTime> fireRate))                            
  {
    turrets.shoot(); 
    passedTime = millis();
  }


  //  if (coins >= 10 && stopp == false)
  //  {
  //    tA +=1;
  //    maxTurrets += 1;
  //    stopp = true;
  //  }
  //
  //  if (counter >= 6 && coins >= 10 && money == false)
  //  {
  //    coins -= 10;
  //    money = true;
  //  }
  //  if (coins<10)
  //  {
  //    stopp = false;
  //    money = false;
  //  }
  m.back();
  // m.turretsPlaced();
  m.display();
  m.update();
  m.shotgun(shotgunX, shotgunY);
  m.normals(normalX, normalY);
  m.threeSixtyTurret(sixtyX, sixtyY);
  m.Start(startX, startY);
  // m.clicked();
  //m.tA();
  //println(mouseY);
  //   if(mouseX >=590 && mouseX <=700 && mouseY >=960 && mouseY <=1010)
  //  {
  //   //turretsNormal = true;
  //  println(true); 
  //  }
} // end draw

void mouseClicked()
{
  if (mouseX >=590 && mouseX <=700 && mouseY >=960 && mouseY <=1010 )
  {
    sixtyTurret = false;
    turretsNormal = true;
    shotgun = false;
    // println(turretsNormal);
  }

  if (mouseX >=590 && mouseX <=700 && mouseY >=900 && mouseY <=955)
  {
    sixtyTurret = false;
    turretsNormal = false;
    shotgun = true;
    //println(turretsNormal);
  }
  if (mouseX >=740 && mouseX <=920 && mouseY >=900 && mouseY <=955)
  {
    sixtyTurret = true;
    turretsNormal = false;
    shotgun = false;
  }
  if (mouseX >=740 && mouseX <=920 && mouseY >=960 && mouseY <=1010)
  {
    print("hit");
    start = true;
  }


  if ( coins >= 12 && turretsNormal == true && mouseY< 900 && money == true && mouseX >= 400  )
  {

    turrets.makeTurret(new PVector(mouseX, mouseY), ball.location, 400, turretssss);
    counter = counter + 1;
    tA = tA -1;
    coins = coins - 12;
    money = false;
  }
  if ( coins >= 15 && shotgun == true && mouseY< 900 && money == true && mouseX >= 400 )
  {

    turrets.makeShotGunTurret(new PVector(mouseX, mouseY), ball.location, 600, shotgunss);
    counter = counter + 1;
    tA = tA -1;
    coins = coins - 15;
    money = false;
  }
  if (coins >= 50 && sixtyTurret == true && mouseY< 900 && money == true && mouseX >= 400)
  {

    turrets.makeThreeSixtyTurret(new PVector(mouseX, mouseY), ball.location, 400, turretssss);
    counter = counter + 1;
    tA = tA -1;
    coins = coins - 50;
    money = false;
  }
  if (coins  >=10)
  {
    money =true;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    turrets.makeShotGunTurret(new PVector(mouseX, mouseY), ball.location, 400, shotgunss);
  }
  if (keyCode == LEFT) {
    turrets.makeThreeSixtyTurret(new PVector(mouseX, mouseY), ball.location, 400, turretssss);
  }
  if (keyCode == UP) {
    turrets.makeFreezeTurret(new PVector(mouseX, mouseY), ball.location, 600, turretssss);
  }
}

