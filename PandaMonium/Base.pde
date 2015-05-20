class Base extends DrawableThing
{
  int baseSize;
  PVector loc;
  int health = 10000;

  Base(PVector loc)
  {
    this.loc = loc;
    location.x = loc.x;
    location.y = loc.y;
    baseSize = 100;
  }
  
  void display()
  {
    fill(50);
    strokeWeight(1);
    rectMode(CENTER);
    rect(location.x, location.y, baseSize, baseSize);
  }
  
  void update(){
    depleteHealth();
    displayHealth();
  }
  
  void depleteHealth(){
  
  }
  
  void displayHealth(){
    textSize(32);
    fill(9,255,255);
    text(health, width-100, 100);
    fill(255,255,255);
    text(health, width-98, 98);  
  }
}
    

