class Button {
  // +++++++++++++++++++++++++++++++++++++++++      Properties
  PVector loc;
  
  int w, h;
  color c = color(255, 0, 0);
  color f = color(0, 255, 0);
  String txt;

  //  +++++++++++++++++++++++++++++++++++++++++++   Constructor
  Button(PVector loc, int w, int h, String txt) {
    this.loc = loc;
    this.w = w;
    this.h = h;
    this.txt = txt;
  } 

  Button(PVector loc, int w, int h) {
        this.loc = loc;
    this.w = w;
    this.h = h;
    this.txt = "Pump Pie";
  } 

  //  ++++++++++++++++++++++++++++++++++++++++++++   Methods
  void run() {
    display();
  }


  void display() {
    if (hit == true)
    {
      fill(f);
    }
    else 
    {
      fill(c);
    }
    rect(loc.x, loc.y, w, h,50);
    fill(0);
    text(txt, loc.x + w/2, loc.y + h/2);
  }


  void hitTest()
  {
    if (mouseX>loc.x && mouseX<loc.x + w && mouseY > loc.y && mouseY < loc.y + h) 
      hit = true;
      else
      {
       hit = false; 
      }
  }

  //  boolean hitTest(PVector m) {
  //  }
}
