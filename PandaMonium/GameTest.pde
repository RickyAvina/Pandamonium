int level;

PImage turret;
Game game = new Game();




void setup() {
  size(900, 800);
  background(0);
  frameRate(18);
  initGame();
 turret = loadImage("turret.png");
}

void draw() {
  background(0);
  game.run();
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

