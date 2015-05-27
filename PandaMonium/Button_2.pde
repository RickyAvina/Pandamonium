
class Button2
{

  void display()
  {
    if (!run){
    fill (255);
    stroke(1);
    rect (300, 400, 200, 100);
    textSize(35);
    fill(10);
    text("Start", 355, 450);
    if (mouseX < 500 && mouseX > 300 && mouseY > 400 && mouseY < 500) {
      fill(100);
      stroke(1);
      rect (300, 400, 200, 100);
      textSize(35);
      fill(10);
      text("Start", 355, 450);

      if (mousePressed) {
        fill(10);
        stroke(1);
        rect( 300, 400, 200, 100);
        run = true;
      }
    }
  }
  }
}

