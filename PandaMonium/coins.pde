class coin extends DrawableThing
{
  coin(int x, int y)
  {
    location.x = x;
    location.y = y;
  }

void display()
{
   ellipseMode(CENTER);
   fill(0,255,0);
   ellipse(location.x,location.y,40,40);
}

void update()
{
  if(mouseX > location.x - 40)
  {
    if (mouseX < location.x + 40){
        if(mouseY > location.y - 40)
        {
        if (mouseY < location.y + 40){
          
             objects.remove(acoin);
             coins += 1;
             acoin = new coin((int)random(0, 1750),(int)random(0, 800));
             objects.add(acoin);
             coinNumber = coinNumber + 1;
             println(coins);
        }
        }
    }
         

  }
}
}
