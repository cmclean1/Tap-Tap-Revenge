import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Catch[] c = new Catch[4];
Song[] songs;
Minim minim;
AudioPlayer gunPlayer;
java.io.File folder;
java.io.FilenameFilter jpgFilter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".mp3");
  }
};
String[] s;
String[][] ss;
float songTime;
boolean beat = true;
float beatTime;
float BPS;
int whichSong = 0;
boolean[] keys = new boolean[4];
boolean songStart = false;
float[] gameStats = new float[4];
/*
0 = missed drops
 1 = caught drops
 2 = current streak
 3 = top streak
 */
int location = 0;
/*
0 = logo
 1 = intro
 2 = song select
 3 = game
 4 = stats after game
 */
float startTime = 4000;
String[] filenames;

void setup()
{
  size(800, 500);
  minim = new Minim(this);
  gunPlayer =  minim.loadFile("gun.wmv");
  folder = new java.io.File(dataPath(""));
  filenames = folder.list(jpgFilter);
  s = loadStrings("Welcome To Me.txt");
  ss = new String[s.length][3];
  for (int i = 0; i < s.length; i++)
  {
    ss[i] = split(s[i], ", ");
  }
  songs = new Song[filenames.length];
  for (int i = 0; i < songs.length; i++)
  {
    songs[i] = new Song(filenames[i], i);
  }
  //  song.d = new Drop[s.length-1];
  //
  //  for (int i = 0; i < song.d.length; i++)
  //  {
  //    song.d[i] = new Drop(int(ss[i+1][0]), float(ss[i+1][1]), float(ss[i+1][2]));
  //  }

  //  songTime = startTime+(song.start*1000);
  //  beatTime = songTime;
  //  for (int i = 0; i < song.d.length; i++)
  //  {
  //    song.d[i].beatTime = songTime+((song.d[i].dropTime-1)*song.SPB)-song.d[i].travelTime;
  //  }

  noStroke();
}

void draw()
{
  frameRate(60);
  background(255);
  Logo();
  intro();
  songSelect();
  game();
  if (location == 4)
  {
    textSize(20);
    text("Great Job!", width/2, 50);
    text("Press SPACE to return to song selection", width/2, 450);
    textSize(15);
    textAlign(LEFT);
    text("Drops Caught: " + int(gameStats[1]), 50, 100);
    text("Drops Missed: " + int(gameStats[0]), 50, 150);
    text("Accuracy: " + round(gameStats[1]/(gameStats[0]+gameStats[1])*100) + "%", 50, 200);
    text("Longext Streak: " + int(gameStats[3]), 50, 250);
    textAlign(CENTER);
  }
}
void keyPressed()
{
  if (location == 1)
  {
    if (key == ' ')
    {
      location = 2;
    }
  } else if (location == 2)
  {
    if (key == ' ')
    {
      location = 3;
      for (int i = 0; i < c.length; i++)
      {
        c[i] = new Catch(i+1);
      }
      startTime = millis() + 3000;
      songs[whichSong].initializeDrops();
      songs[whichSong].player.rewind();
      songs[whichSong].player.pause();
    } else if (keyCode == RIGHT)
    {
      whichSong++;
      if (whichSong > songs.length-1)
      {
        whichSong = 0;
      }
    } else if (keyCode == LEFT)
    {
      whichSong--;
      if (whichSong < 0)
      {
        whichSong = songs.length-1;
      }
    }
  } else if (location == 3)
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
  } else if (location == 4)
  {
    if (key == ' ')
    {
      location = 2;
      gameStats = new float[4];
    }
  }
}
void keyReleased()
{
  if (location == 3)
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
}

