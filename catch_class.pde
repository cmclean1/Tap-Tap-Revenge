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
    checkMissedList(songs[whichSong].drops);
    if (keys[type-1])
    {
      checkDrop(songs[whichSong].drops);
    }
  }
  void checkMissed(Drop[] d)
  {
    for (int i = 0; i < d.length; i++)
    {
      if (d[i].loc.y > 500 && d[i].loc.y < 600 && type == d[i].type )
      {
        d[i].loc.y = 1000;
        if (!d[i].longBeat)
        {
          c = color(255, 0, 0);
          gameStats[0]++;
          gameStats[2] = 0;
        }
        return;
      }
    }
  }
  void checkMissedList(ArrayList<Drop> drops)
  {
    for (int i = drops.size ()-1; i >= 0; i--)
    {
      Drop d = drops.get(i);
      if (d.loc.y > 500  && type == d.type )
      {
        //d.loc.y = 1000;
        if (!d.longBeat)
        {
          drops.remove(i);
          c = color(255, 0, 0);
          gameStats[0]++;
          gameStats[2] = 0;
        } else
        {
          if (!d.longPressed)
          {
            drops.remove(i);
            c = color(255, 0, 0);
            gameStats[0]++;
            gameStats[2] = 0;
          }
        }
        return;
      }
    }
  }
  void checkLong(ArrayList<Drop> drops)
  {
    for (int i = drops.size ()-1; i >= 0; i--)
    {
      Drop d = drops.get(i);
      if (loc.y > d.loc.y - 5 && loc.y < d.loc.y + 5 && loc.x == d.loc.x && keys[type-1] && d.longBeat) {
        c = color(0, 0, 244);
        d.longPressed = true;
        d.beatLength-=d.vel;      
        d.loc.y-=d.dropSpeed;  
        gameStats[4] += 10 * gameStats[5];
        if (d.beatLength <=0)
        {
          drops.remove(i);
        }
        return;
      } else if (loc.y > d.loc.y - 10 && loc.y < d.loc.y + 10 && loc.x == d.loc.x && keys[type-1] && d.longBeat) {
        d.longPressed = true;
        c = color(0, 255, 0);
        d.beatLength-=d.vel;      
        d.loc.y-=d.dropSpeed;
        gameStats[4] += 8 * gameStats[5];
        if (d.beatLength <=0)
        {
          drops.remove(i);
        }
        return;
      } else if (loc.y > d.loc.y - 15 && loc.y < d.loc.y + 15 && loc.x == d.loc.x && keys[type-1] && d.longBeat) {
        d.longPressed = true;
        c = color(255, 255, 0);
        d.beatLength-=d.vel;      
        d.loc.y-=d.dropSpeed;        
        gameStats[4] += 5 * gameStats[5];
        if (d.beatLength <=0)
        {
          drops.remove(i);
        }
        return;
      } else if (loc.y > d.loc.y - 20 && loc.y < d.loc.y + 20 && loc.x == d.loc.x && keys[type-1] && d.longBeat) {
        d.longPressed = true;
        c = color(255, 165, 0);
        d.beatLength-=d.vel;      
        d.loc.y-=d.dropSpeed;  
        gameStats[4] += 3 * gameStats[5];
        if (d.beatLength <= 0)
        {
          drops.remove(i);
        }
        return;
      }
    }
  }
  void checkDrop(ArrayList<Drop> drops)
  {
    for (int i = drops.size ()-1; i >= 0; i--)
    {
      Drop d = drops.get(i);
      if (loc.y > d.loc.y - 5 && loc.y < d.loc.y + 5 && loc.x == d.loc.x) {


        if (!justPressed && !d.longBeat)
        {
          drops.remove(i);
          gameStats[1]++;
          gameStats[2]++;
          gameStats[4] += 50 * gameStats[5];
          if (gameStats[2] > gameStats[3])
          {
            gameStats[3]++;
          }
          justPressed = true;
          c = color(0, 0, 255);
        }

        return;
      } else if (loc.y > d.loc.y - 10 && loc.y < d.loc.y + 10 && loc.x == d.loc.x) {   


        if (!justPressed && !d.longBeat)

        {            
          gameStats[1]++;
          gameStats[2]++;
          gameStats[4] += 40 * gameStats[5];

          if (gameStats[2] > gameStats[3])
          {
            gameStats[3]++;
          }
          c = color(0, 255, 0);
          drops.remove(i);
          justPressed = true;
        }

        return;
      } else if (loc.y > d.loc.y - 15 && loc.y < d.loc.y + 15 && loc.x == d.loc.x)
      {


        if (!justPressed && !d.longBeat)

        {            
          gameStats[1]++;
          gameStats[2]++;
          gameStats[4] += 30 * gameStats[5];
          if (gameStats[2] > gameStats[3])
          {
            gameStats[3]++;
          }
          c = color(255, 255, 0);
          drops.remove(i);
          justPressed = true;
        }

        return;
      } else if (loc.y > d.loc.y - 20 && loc.y < d.loc.y + 20 && loc.x == d.loc.x)
      {               



        if (!justPressed && !d.longBeat)

        {            
          gameStats[1]++;
          gameStats[2]++;
          gameStats[4] += 15 * gameStats[5];
          if (gameStats[2] > gameStats[3])
          {
            gameStats[3]++;
          }
          drops.remove(i);
          justPressed = true;
          c = color(255, 165, 0);
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

