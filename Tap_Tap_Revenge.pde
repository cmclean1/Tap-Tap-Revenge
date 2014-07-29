import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Catch[] c = new Catch[4];
Song song;
Minim minim;
String[] s;
String[][] ss;
float songTime;
boolean beat = true;
float beatTime;
float BPS;
boolean[] keys = new boolean[4];
boolean songStart = false;
float startTime = 4000;
void setup()
{
  size(800, 500);
  minim = new Minim(this);
  s = loadStrings("Welcome To Me.txt");
  ss = new String[s.length][3];
  for (int i = 0; i < s.length; i++)
  {
    ss[i] = split(s[i], ", ");
  }
  song = new Song(float(ss[0][0]), float(ss[0][1]), "Welcome To Me.mp3");
  song.d = new Drop[s.length-1];

  for (int i = 0; i < song.d.length; i++)
  {
    song.d[i] = new Drop(int(ss[i+1][0]), float(ss[i+1][1]), float(ss[i+1][2]));
    //song.d[i] = new Drop(int(ss[i+1][0]), float(ss[i+1][1]), 2);
  }
  println((5*60)*(song.SPB)/1000);

  songTime = startTime+(song.start*1000);
  beatTime = songTime;
  for (int i = 0; i < song.d.length; i++)
  {
    song.d[i].beatTime = songTime+((song.d[i].dropTime-1)*song.SPB)-song.d[i].travelTime;
  }
  for (int i = 0; i < c.length; i++)
  {
    c[i] = new Catch(i+1);
  }
  noStroke();
}
void draw()
{
  frameRate(60);
  println(c[0].justPressed);
  if (millis() >= startTime && songStart == false)
  {
    song.player.play();
    songStart = true;
  }
  if (millis() > beatTime && songStart)
  {
    beatTime+=song.SPB;
    beat = !beat;
  }
  background(255);
  fill(0);
  for (int i = 0; i < song.d.length; i++)
  {
    song.d[i].display();
    song.d[i].move();
  }
  for (int i = 0; i < c.length; i++)
  {
    c[i].display();
    c[i].ifPressed();
    //  c[i].checkDrop(song.d);
  }
}
void keyPressed()
{
  if (keyCode == LEFT)
  {
    keys[0] = true;
  }
  if (keyCode == DOWN)
  {
    keys[1] = true;
  }
  if (keyCode == UP)
  {
    keys[2] = true;
  }
  if (keyCode == RIGHT)
  {
    keys[3] = true;
  }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
    keys[0] = false;
    c[0].justPressed = false;
  }
  if (keyCode == DOWN)
  {
    keys[1] = false;
    c[1].justPressed = false;

  }
  if (keyCode == UP)
  {
    keys[2] = false;
    c[2].justPressed = false;

  }
  if (keyCode == RIGHT)
  {
    keys[3] = false;
    c[3].justPressed = false;

  }
}

