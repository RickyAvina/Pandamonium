int level;
Button2 b3 = new Button2();
Button3 b2 = new Button3();
boolean run = false;
import ddf.minim.*;

AudioSnippet player;
Minim minim;//audio context

PImage turret;
Game game = new Game();

void setup() {
  size(900, 800);
  background(0);
  frameRate(18);
  initGame();
 turret = loadImage("turret.png");
  minim = new Minim(this);
  player = minim.loadSnippet("mozic.mp3");
  player.play();
}

void draw() {
  background(0);
  //game.run();
    b3.display();
    //  b2.display();
//     if (mousePressed){
//   run = true;
// }
    if(run == true){
       game.run(); 
    }
    
}

void initGame() {
  game = new Game();
  level = 0;
  loadImages();
}

void loadImages() {
}

void mousePressed() {
  game.mousePressedHandler(new PVector(mouseX, mouseY));
}

void mouseMoved() {
  game.mouseMovedHandler(new PVector(mouseX, mouseY));
}

void keyPressed() {
  game.keyCodeHandler(keyCode);
}

