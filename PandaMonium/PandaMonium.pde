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
Base base = new Base(new PVector(100, 100));

/* +++++++++++++++++++++++++++++ Instance Variables +++++++++++++++++++++++ */

PImage turret;
int passedTime = 0;
int fireRate = 300;
int width = 1920;
int height = 1080;
int level = 2;

void setup()
{ 

/* +++++++++++++++++++++++++ Game Setup +++++++++++++++++++++++++++++++++++ */

  frameRate(60);
  size(width, height);
  
/* +++++++++++++++++++++++++ Instantiate Vars ++++++++++++++++++++++++++++++ */ 

  turret = loadImage("t1.png");
  ball = new MouseTarget();
  objects.add(ball);
  objects.add(base);

/* +++++++++++++++++++++++++ Add all objects +++++++++++++++++++++++++++++++ */
  
  if (level == 1){
    for (int i = 0; i < 50; i++)  balls.add(new Ball(new PVector(width - 100, random(height/2-200, height/2+200))));
  }
  if (level == 2){
    for (int i = 0; i < 75; i++)  balls.add(new Ball(new PVector(width - 100, random(height/2-200, height/2+200))));
  }
  for (int i = 0; i < 200; i++) rocks.add(new Rock(new PVector(random(0, 1920), random(0, 1080))));  
  
} // end setup

void draw()
{
  // erase background before drawing current frame:
  background(100, 100, 100);
  
/* +++++++++++++++++++++ Display and update objects ++++++++++++++++++++++++ */

  for (int i = 0; i < rocks.size(); i++) rocks.get(i).display();  
  
  for (int i = 0; i < objects.size();i++) {
    objects.get(i).update();
    objects.get(i).display();
  }

  for (int i = 0; i < balls.size();i++) {
   
    balls.get(i).update();
    balls.get(i).display();
    
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
} // end draw

void mouseClicked()
{
  turrets.makeTurret(new PVector(mouseX, mouseY), ball.location, 400);
}

void keyPressed(){
  if(keyCode == RIGHT){
  turrets.makeShotGunTurret(new PVector(mouseX, mouseY), ball.location, 400);
  }
  if (keyCode == LEFT){
  turrets.makeThreeSixtyTurret(new PVector(mouseX, mouseY), ball.location, 400);  
  }
  if(keyCode == UP){
  turrets.makeFreezeTurret(new PVector(mouseX, mouseY), ball.location, 600);  
  }
  if(keyCode == ' '){
  turrets.makeBombTurret(new PVector(mouseX, mouseY), ball.location, 350);  
  }
}

