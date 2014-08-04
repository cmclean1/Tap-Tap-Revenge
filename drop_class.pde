class Drop
{
  int type;
  PVector loc;
  boolean longBeat = false;
  boolean longPressed = false;
  float dropTime;
  float beatTime;
  float dropLength;
  float beatLength;
  float vel = 5;
  float dropSpeed = 5;
  boolean go = false;
  float travelTime;
  Drop(int _type, float _dropTime, float _dropLength)
  {
    type = _type;
    dropLength = _dropLength;
    dropTime = _dropTime;
    travelTime = (450/dropSpeed)*1000/60;
    if(dropLength > 0)
    {
      longBeat = true;
    }
    beatLength = (dropSpeed*60)*songs[whichSong].SPB/1000*dropLength;
    //beatTime = songTime+((dropTime-1)*song.SPB);
    if (type == 1)
    {
      loc = new PVector(50, 0);
    }
    if (type == 2)
    {
      loc = new PVector(100, 0);
    }
    if (type == 3)
    {
      loc = new PVector(150, 0);
    }
    if (type == 4)
    {
      loc = new PVector(200, 0);
    }
  }
  void display()
  {
    fill(0);
    if (go)
    {
      ellipse(loc.x, loc.y, 20, 20);
      if (longBeat)
      {
        rectMode(CORNER);
        fill(50);
        rect(loc.x-10, loc.y, 20, -beatLength);
      }
    }
  }
  void move()
  {
    if (go)
    {
      loc.y+=dropSpeed;
    }
    if (millis() >= beatTime) //&& millis() > 4000)
    {
      go = true;
    }
  }
}

