class Rock extends DrawableThing
{
  int Radius;
  
  Rock(PVector loc)
  { 
    location.x = loc.x;
    location.y = loc.y;
    Radius = 40;
  }
  
  void display()
  {
    fill(20);
    strokeWeight(1);
    image(rocksss,location.x, location.y, Radius, Radius);  
   
  }
  
  void update()
  {
    
  }
}
