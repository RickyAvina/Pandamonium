
class Button3
{

  void display()
  {
    fill (255);
    stroke(1);
    rect (300, 400, 200, 100);
    textSize(35);
    fill(10);
    text("Play Again?", 310, 450);
    if (mouseX < 500 && mouseX > 300 && mouseY > 400 && mouseY < 500) {
      fill(100);
      stroke(1);
      rect (300, 400, 200, 100);
      textSize(35);
      fill(10);
      text("Play Again?", 310, 450);

      if (mousePressed) {
        fill(10);
        stroke(1);
        rect( 300, 400, 200, 100);
        game.run();
      }
    }
  }
}

