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
    song.d[i] = new Drop(int(ss[i+1][0]), float(ss[i+1][1]));
  }
  songTime = startTime+(song.start*1000);
  beatTime = songTime;
  for (int i = 0; i < song.d.length; i++)
  {
    song.d[i].beatTime = songTime+((song.d[i].dropTime-1)*song.SPB)-song.d[i].travelTime;
    println(song.d[i].travelTime);
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
  text(millis(), width/2, height/2);
  for (int i = 0; i < song.d.length; i++)
  {
    song.d[i].display();
    song.d[i].move();
  }
  for (int i = 0; i < c.length; i++)
  {
    c[i].display();
    c[i].ifPressed();
  }
}
void keyPressed()
{

}

