abstract class DrawableThing{  
  PVector location;

  DrawableThing() {
    location = new PVector( 0, 0 );
  }
  abstract void display();
  abstract void update();
}

class ExampleObject extends DrawableThing{
  void update()  {
    location.x = mouseX;
    location.y = mouseY;
  }

  void display()  {
    ellipse(location.x, location.y, 100, 100);
  }
}

class MouseTarget extends DrawableThing{
  void update()  {
    location.x = mouseX;
    location.y = mouseY;
  }

  void display()  {
    pushMatrix();
    fill(0);
    ellipse(location.x, location.y, 20, 20);
    popMatrix();
  }
}

