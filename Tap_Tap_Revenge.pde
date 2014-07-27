Drop[] d;
Catch c;
String[] s;
String[][] ss;
void setup()
{
  size(800, 500);
  s = loadStrings("welcome to me.txt");
  ss = new String[s.length][3];
  for (int i = 0; i < s.length-1; i++)
  {
    ss[i] = split(s[i], ", ");
  }
  d = new Drop[s.length-1];
  for (int i = 0; i < d.length-1; i++)
  {
    d[i] = new Drop(1, int(ss[i+1][1]));
    println(d[i].dropTime);
  }
  c = new Catch(1);
  noStroke();
 print(d.length);
}
void draw()
{
  background(255);
  text(millis(), width/2, height/2);
  for (int i = 0; i < d.length-1; i++)
  {
    d[i].display();
    d[i].move();
  }
  c.display();
  c.ifPressed();
}

