class Song
{
  File art;
  boolean[] diff = {
    false, false, false, false
  };
  color[] diffFill = new color[4];
  String[] diffString = {
    "Easy", "Medium", "Hard", "Insane"
  };
  int[] arrowLoc = {
    120, 120+70, 120+140, 120+210
  };
  float BPM;
  int diffArrow = 0;
  float start;
  float SPB;
  float songTime;
  float beatTime;
  String name;
  PImage coverArt;
  String[] loadString;
  int which;
  String[][] data;
  Drop[] d;
  ArrayList<Drop> drops;
  AudioPlayer player;
  AudioMetaData meta;
  Song(String _player, int _whichSong)
  {
    name = _player;
    which = _whichSong;
    player = minim.loadFile(name);
    meta = player.getMetaData();

    art = new File(dataPath(meta.title() + ".jpg"));
    if (art.exists())
    {
      coverArt = loadImage(meta.title() + ".jpg");
    } else
    {
      coverArt = loadImage("noArt.jpg");
    }
    checkDifficulty();
  }
  void checkDifficulty()
  {
    File f = new File(dataPath(meta.title() + "Easy.txt"));
    if (f.exists())
    {
      diff[0] = true;
      diffArrow = 0;
    }
    f = new File(dataPath(meta.title() + "Medium.txt"));
    if (f.exists())
    {
      diff[1] = true;
      diffArrow = 1;
    }
    f = new File(dataPath(meta.title() + "Hard.txt"));
    if (f.exists())
    {
      diff[2] = true;
      diffArrow = 2;
    }
    f = new File(dataPath(meta.title() + "Insane.txt"));
    if (f.exists())
    {
      diff[3] = true;
      diffArrow = 3;
    }
  }
  void displayMenu()
  {
    if (whichSong == which)
    {
      if (!diffChoose)
      {
        fill(0);
        textSize(30);
        text(meta.title(), width/2, 400);
        textSize(25);
        text(meta.author(), width/2, 440);
        imageMode(CENTER);
        image(coverArt, width/2, 200, 300, 300);
      } else
      {
        displayDiff();
      }
      player.play();
    } else
    {
      player.rewind();
      player.pause();
    }
  }
  void displayDiff()
  {
    for (int i = 0; i <= 3; i++)
    {
      if (diff[i])
      {
        diffFill[i] = color(0);
      } else
      {
        diffFill[i] = color(150);
      }
      textSize(50);
      fill(diffFill[i]);
      text(diffString[i], width/2, 120+(i*70));
      fill(0);
    }
    text(">", width/2-200, arrowLoc[diffArrow]);
  }
  void arrow()
  {
    if (diffChoose)
    {
      if (keyCode == UP)
      {
        diffArrow--;
        if (diffArrow < 0)
        {
          diffArrow = 3;
        }
      }
    }
    if (keyCode == DOWN)
    {
      diffArrow++;
      if (diffArrow > 3)
      {
        diffArrow = 0;
      }
    }
  }


  void initializeSong()
  {

    // d = new Drop[loadString.length-1];
    loadString = loadStrings(meta.title() + diffString[diffArrow] + ".txt");
    data = new String[loadString.length][3];
    for (int i = 0; i < data.length; i++)
    {
      data[i] = split(loadString[i], ", ");
    }
    start = float(data[0][0]);
    BPM = float(data[0][1]);
    SPB = (60/BPM)*1000;
    drops = new ArrayList<Drop>();
    for (int i = 0; i < loadString.length-1; i++) {
      drops.add(new Drop(int(data[i+1][0]), float(data[i+1][1]), float(data[i+1][2])));
    }
    //    for (int i = 0; i < d.length; i++)
    //    {
    //      d[i] = new Drop(int(data[i+1][0]), float(data[i+1][1]), float(data[i+1][2]));
    //    }
    songTime = startTime+(start*1000);
    beatTime = songTime;
    //    for (int i = 0; i < d.length; i++)
    //    {
    //      d[i].beatTime = songTime+((d[i].dropTime-1)*SPB)-d[i].travelTime;
    //    }
    for (int i = 0; i < loadString.length-1; i++) {
      Drop d = drops.get(i);
      d.beatTime = songTime+((d.dropTime-1)*SPB)-d.travelTime;
    }
  }

  void playSong()
  {
    for (int i = 0; i < d.length; i++)
    {
      d[i].display();
      d[i].move();
    }
  }
}

