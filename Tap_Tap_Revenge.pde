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
int location = 0;
/*
0 = logo
 1 = main menu
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
  for (int i = 0; i < c.length; i++)
  {
    c[i] = new Catch(i+1);
  }
  noStroke();
}
void Logo()
{
  if (millis() < 5000)
  {
    gunPlayer.play();
    imageMode(CENTER);
    image(loadImage("logo.png"), width/2, height/2);
  } else
  {
    location = 1;
  }
}
void draw()
{
  frameRate(60);
  background(255);
  if (location == 0)
  {
    Logo();
  }
  if (location == 1)
  {
    textSize(40);
    fill(0);
    textAlign(CENTER);
    text("Revenge of Tap Tap Revenge \nthe Sequel to the Prequel to the Remake", width/2, 50);
    textSize(20);
    text("Press SPACE to START", width/2, 400);
  }
  if (location == 2)
  {
    for (int i = 0; i < songs.length; i++)
    {
      songs[i].displayMenu();
    }
    textSize(20);
    text("CHOOSE A SONG", width/2, 35);
    textSize(15);
    text("SELECT WITH SPACE", width/2, 485);
    textSize(50);
    text("<-", 50, 400);
    text("->", 750, 400);
  }
  if (location == 3)
  {
    if (millis() >= startTime && songStart == false)
    {
      songs[whichSong].player.play();
      songStart = true;
    }
    if (millis() > beatTime && songStart)
    {
      songs[whichSong].beatTime+=songs[whichSong].SPB;
    }
    fill(0);
    //    for (int i = 0; i < song.d.length; i++)
    //    {
    //      songs[whichSong].d[i].display();
    //      songs[whichSong].d[i].move();
    //    }
    for (int i = 0; i < c.length; i++)
    {
      c[i].display();
      c[i].ifPressed();
    }
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

