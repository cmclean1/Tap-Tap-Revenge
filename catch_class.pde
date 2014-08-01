class Catch
{
  int type;
  color c = color(0);
  PVector loc;
  boolean justPressed = false;
  String typeString;
  Catch(int _type)
  {
    type = _type;
    if (type == 1)
    {
      loc = new PVector(50, 450);
      typeString = "←";
    }
    if (type == 2)
    {
      loc = new PVector(100, 450);
      typeString = "↓";
    }
    if (type == 3)
    {
      loc = new PVector(150, 450);
      typeString = "↑";
    }
    if (type == 4)
    {
      loc = new PVector(200, 450);
      typeString = "→";
    }
  }
  void display()
  {
    fill(c);
    ellipse(loc.x, loc.y, 20, 20);
    fill(0);
    textSize(20);
    text(typeString, loc.x, 480);
  }
  void ifPressed()
  {
    checkMissed(songs[whichSong].d);
    if (keys[type-1])
    {
      checkDrop(songs[whichSong].d);
    }
  }
  void checkMissed(Drop[] d)
  {
    for (int i = 0; i < d.length; i++)
    {
      if (d[i].loc.y > 500 && d[i].loc.y < 600 && type == d[i].type && !d[i].longBeat)
      {
        d[i].loc.y = 1000;
        c = color(255, 0, 0);
        gameStats[0]++;
        gameStats[2] = 0;
        return;
      }
    }
  }
  void checkDrop(Drop[] d)
  {
    for (int i = 0; i < d.length; i++)
    {
      if (loc.y > d[i].loc.y - 5 && loc.y < d[i].loc.y + 5 && loc.x == d[i].loc.x) {
        if (d[i].longBeat)
        {
          c = color(0, 0, 244);
          d[i].beatLength-=d[i].dropSpeed;            
          d[i].loc.y-=d[i].dropSpeed;
          if (d[i].beatLength <=0)
          {
            d[i].longBeat = false;
          }
        } else
        {
          if (!justPressed)
          {
            d[i].loc.y = 1000;
            gameStats[1]++;
            gameStats[2]++;
            if (gameStats[2] > gameStats[3])
            {
              gameStats[3]++;
            }
            justPressed = true;
            c = color(0, 0, 255);
          }
        }
        return;
      } else if (loc.y > d[i].loc.y - 10 && loc.y < d[i].loc.y + 10 && loc.x == d[i].loc.x) {      
        if (d[i].longBeat)
        {
          c = color(0, 255, 0);
          d[i].beatLength-=d[i].dropSpeed;
          d[i].loc.y-=d[i].dropSpeed;
          if (d[i].beatLength <=0)
          {
            d[i].longBeat = false;
          }
        } else
        {
          if (!justPressed)

          {            
            gameStats[1]++;
            gameStats[2]++;
            if (gameStats[2] > gameStats[3])
            {
              gameStats[3]++;
            }
            c = color(0, 255, 0);
            d[i].loc.y = 1000;
            justPressed = true;
          }
        }
        return;
      } else if (loc.y > d[i].loc.y - 15 && loc.y < d[i].loc.y + 15 && loc.x == d[i].loc.x)
      {
        if (d[i].longBeat)
        {
          c = color(255, 255, 0);
          d[i].beatLength-=d[i].dropSpeed;            
          d[i].loc.y-=d[i].dropSpeed;
          if (d[i].beatLength <=0)
          {
            d[i].longBeat = false;
          }
        } else
        {
          if (!justPressed)

          {            
            gameStats[1]++;
            gameStats[2]++;
            if (gameStats[2] > gameStats[3])
            {
              gameStats[3]++;
            }
            c = color(255, 255, 0);
            d[i].loc.y = 1000;
            justPressed = true;
          }
        }
        return;
      } else if (loc.y > d[i].loc.y - 20 && loc.y < d[i].loc.y + 20 && loc.x == d[i].loc.x)
      {       
        if (d[i].longBeat)
        {
          c = color(255, 165, 0);
          d[i].beatLength-=d[i].dropSpeed;            
          d[i].loc.y-=d[i].dropSpeed;
          if (d[i].beatLength <=0)
          {
            d[i].longBeat = false;
          }
        } else
        {
          if (!justPressed)

          {            
            gameStats[1]++;
            gameStats[2]++;
            if (gameStats[2] > gameStats[3])
            {
              gameStats[3]++;
            }
            d[i].loc.y = 1000;
            justPressed = true;
            c = color(255, 165, 0);
          }
        }
        return;
      } else
      {
        if (!justPressed)
        {
          c = color(255, 0, 0);
          gameStats[2] = 0;
        }
      }
    }
  }
}

