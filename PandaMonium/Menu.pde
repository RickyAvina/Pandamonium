class Menu {
  PVector location = new PVector(0, 0);
  int hw = 100;

  Menu(PVector loc) {
    location = loc;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rect(0, 0, width, 100 );
    tA(40,0);
    hbar(40,5);
    $bar(90,5);
    turretsPlaced(15,5);
    normalss(40,0);
    
   
    popMatrix();  
    //hbar();
   // $bar();
  }
  void hbar(int h, int w)
  {
    
    fill(200, 69, 69);
    rect(160, h -18, hw, 20);
    textSize(30);
    text("Health:", 40, h );
  }
  void $bar(int h, int w)
  {
   
    fill(218, 165, 32);
    textSize(30);
    text("$: " + coins, 114, h -5);
  }
  void turretsPlaced(int h, int w)
  {
    
    fill(255);
    textSize(25);
    text("Shotgun = 15",375,h+150,200,200);
    //text(nf(counter, 2), 580, h+150, 200, 200);
  }
  
  void tA(int h, int w)
  {
    
    fill(255);
    textSize(25);
    text("360 = 50:",575,h + 70,600,200);
    //text(nf(tA, 2), 550, h + 70, 100 , 200);
  }
   void normalss(int h, int w)
  {
    
    fill(255);
    textSize(25);
    text("normal = 12",575,h + 100,600,200);
    //text(nf(tA, 2), 550, h + 70, 100 , 200);
  }

  void mousePressed() {
    println("dghdjghdjdhjgd");
    hw = hw - 10;
  }
  void update()
  {
    if (mousePressed)
      hw = hw - 1;
  }
  void back()
  {
    fill(0);
    rect(0, 980, 1920, 100);
  }
  void shotgun(int xx, int yy)
  {
   fill(255,0,0); 
   textSize(25);
   text("SHOTGUN ",xx,yy);
   
  }
  void normals(int xx, int yy)
  {
   fill(0,255,0); 
   textSize(25);
   text("NORMAL ",xx,yy);
  }
  void threeSixtyTurret(int xx, int yy)
  {
   fill(0,0,255); 
   textSize(25);
   text("ThreeSixtyTurret ",xx,yy);
  }
    void Start(int xx, int yy)
  {
   fill(0,255,255); 
   textSize(25);
   text("Start ",xx,yy);
  }
}

