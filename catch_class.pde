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
    checkMissed(song.d);
    if (keyPressed)
    {
      if (type == 1 && keyCode == LEFT || type == 2 && keyCode == DOWN || type == 3 && keyCode == UP || type == 4 && keyCode == RIGHT)
      {
        checkDrop(song.d);
        keyPressed = !keyPressed;
      }
    } else
    {
      // c = color(0);
    }
  }
  void checkMissed(Drop[] d)
  {
    for (int i = 0; i < d.length; i++)
    {
       if (d[i].loc.y > 500 && d[i].loc.y < 600 && type == d[i].type)
      {
        d[i].loc.y = 1000;
        c = color(255, 0, 0);
        println("LOL");
        return;
      }
    }
  }
  void checkDrop(Drop[] d)
  {
    for (int i = 0; i < d.length; i++)
    {
      if (loc.y > d[i].loc.y - 5 && loc.y < d[i].loc.y + 5) {
        if (type == d[i].type)
        {
          d[i].loc.y = 1000;
          c = color(0, 0, 255);
          return;
        }
      } else if (loc.y > d[i].loc.y - 10 && loc.y < d[i].loc.y + 10) {
        if (type == d[i].type)
        {
          d[i].loc.y = 1000;
          c = color(0, 255, 0);
          return;
        }
      } else if (loc.y > d[i].loc.y - 15 && loc.y < d[i].loc.y + 15)
      {
        if (type == d[i].type)
        {
          d[i].loc.y = 1000;
          c = color(255, 255, 0);
          return;
        }
      } else if (loc.y > d[i].loc.y - 20 && loc.y < d[i].loc.y + 20)
      {
        if (type == d[i].type)
        {
          d[i].loc.y = 1000;
          c = color(255, 165, 0);
          return;
        }
      } else
      {
        c = color(255, 0, 0);
      }
    }
  }
}

