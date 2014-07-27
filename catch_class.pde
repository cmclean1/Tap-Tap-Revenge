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
  }
  void display()
  {
    fill(c);
    ellipse(loc.x, loc.y, 10, 10);
  }
  void ifPressed()
  {
    if (type == 1 && keyCode == LEFT && keyPressed)
    {
      c = color(255, 255, 0);
    } 
    else
    {
      c = color(0);
    }
  }
}

