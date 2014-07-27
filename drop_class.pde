class Drop
{
  int type;
  PVector loc;
  float dropTime;
  boolean go = false;
  Drop(int _type, float _dropTime)
  {
    type = _type;
    dropTime = _dropTime;
    if (type == 1)
    {
      loc = new PVector(50, 0);
    }
  }
  void display()
  {
    fill(0);
    if (go)
    {
      ellipse(loc.x, loc.y, 10, 10);
    }
  }
  void move()
  {
    if (go)
    {
      loc.y++;
    }
    if (millis() >= dropTime)
    {
      go = true;
    }
  }
}

