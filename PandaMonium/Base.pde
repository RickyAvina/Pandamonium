class Base extends DrawableThing
{
  int baseSize;
  PVector loc;

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
  }
}
    

