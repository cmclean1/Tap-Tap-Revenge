class Catch
{
  int type;
  color c = color(0);
  PVector loc;
  Catch(int _type)
  {
    type = _type;
    if (type == 1)
    {
      loc = new PVector(50, 450);
    }
    if (type == 2)
    {
      loc = new PVector(100, 450);
    }
    if (type == 3)
    {
      loc = new PVector(150, 450);
    }
    if (type == 4)
    {
      loc = new PVector(200, 450);
    }
  }
  void display()
  {
    fill(c);
    ellipse(loc.x, loc.y, 20, 20);
  }
  void ifPressed()
  {
    if (keyPressed)
    {
      if (type == 1 && keyCode == LEFT || type == 2 && keyCode == DOWN || type == 3 && keyCode == UP || type == 4 && keyCode == RIGHT)
      {
        c = color(255, 255, 0);
      }
    } else
    {
      c = color(0);
    }
  }
}

