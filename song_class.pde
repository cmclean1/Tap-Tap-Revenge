class Song
{
  float BPM;
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
  AudioPlayer player;
  AudioMetaData meta;
  Song(String _player, int _whichSong)
  {
    name = _player;
    which = _whichSong;
    player = minim.loadFile(name);
    meta = player.getMetaData();
    loadString = loadStrings("Welcome To Me.txt");
    data = new String[loadString.length][3];
    for (int i = 0; i < data.length; i++)
    {
      data[i] = split(loadString[i], ", ");
    }
    start = float(data[0][0]);
    BPM = float(ss[0][1]);
    SPB = (60/BPM)*1000;
    coverArt = loadImage(meta.title() + ".jpg");
  }
  void displayMenu()
  {
    if (whichSong == which)
    {
      fill(0);
      textSize(30);
      text(meta.title(), width/2, 400);
      textSize(25);
      text(meta.author(), width/2, 440);
      imageMode(CENTER);
      image(coverArt, width/2, 200, 300, 300);
    }
  }
  void initializeDrops()
  {
    d = new Drop[loadString.length-1];
    for (int i = 0; i < d.length; i++)
    {
      d[i] = new Drop(int(data[i+1][0]), float(data[i+1][1]), float(data[i+1][2]));
    }
    songTime = startTime+(start*1000);
    beatTime = songTime;
    for (int i = 0; i < d.length; i++)
    {
      d[i].beatTime = songTime+((d[i].dropTime-1)*SPB)-d[i].travelTime;
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

