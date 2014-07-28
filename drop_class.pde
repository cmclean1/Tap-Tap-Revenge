class Drop
{
  int type;
  PVector loc;
  float dropTime;
  float beatTime;
  float dropSpeed = 5;
  boolean go = false;
  float travelTime;
  Drop(int _type, float _dropTime)
  {
    type = _type;
    dropTime = _dropTime;
    travelTime = (450/dropSpeed)*1000/60;
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

