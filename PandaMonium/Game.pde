class Game {
    // +++++++++++ Lists of game objects

    /* ++++++++++++++++++++++++++++ ArrayLists ++++++++++++++++++++++++++++++++ */
    ArrayList<Bullet> bullets = new ArrayList<Bullet>();
    ArrayList<DrawableThing> objects = new ArrayList<DrawableThing>();
    ArrayList<Ball> balls = new ArrayList<Ball>();
    ArrayList<Rock> rocks = new ArrayList<Rock>();

    /* +++++++++++++++++++++++++++++ Objects ++++++++++++++++++++++++++++++++++ */
    MouseTarget ball = new MouseTarget();;
    Bullets b = new Bullets();
    Turrets turrets = new Turrets();
    Base base = new Base(new PVector(100, 100));
    //Button b1 = new Button();
   // GameOver g1 = new GameOver();

    //    /* +++++++++++++++++++++++++++++ Instance Variables +++++++++++++++++++++++ */
    
    int passedTime = 0;
    int fireRate = 300;
    int width = 1920;
    int height = 1080;
    boolean f = true;

    // When game constructed, create buttons, flock, areas, and game objects
    /* +++++++++++++++++++++++++ Instantiate Vars ++++++++++++++++++++++++++++++ */
    

    /* +++++++++++++++++++++++++ Add all objects +++++++++++++++++++++++++++++++ */
    
  //  Constructor  +++++++++++++++++++++++++++++++
  
  Game() {    
   objects.add(ball);
   objects.add(base);
    
    for (int i = 0; i < 50; i++)  balls.add(new Ball());
    for (int i = 0; i < 200; i++) rocks.add(new Rock(new PVector(random(0, 1920), random(0, 1080))));
  }

  void initGameObjects() {
  }


  void keyCodeHandler(int kc) {
    // what do we do with keyboard input?
  }

  void mousePressedHandler(PVector mouse) {
    turrets.makeTurret(new PVector(mouseX, mouseY), ball.location);
  }

  void mouseMovedHandler(PVector mouseLoc) {
    // what do we do when mouse is moved?
  }

  void makeButtons() {
    // width and heith of game buttons
    int w = 300;
    int h = 100;
    //  add buttons to an array list of buttons with location, size, and color
    //  load buttons into button aray
   // buttons.add( new Button("Play", new PVector(width/2, 200), w, h, color(45, 54, 74)));
   // buttons.add( new Button("Instructions", new PVector(width/2, 400), w, h, color(45, 54, 74)));
    //buttons.add( new Button("Reset?", new PVector(width/2, 200), w, h, color(45, 54, 74)));
  }

  void run() {
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
    if ((millis()- passedTime> fireRate))                          // FIRE RATE YAARRR            
    {
      turrets.shoot(); 
      passedTime = millis();
    }
  }
} // end Game class

