class Song
{
  float BPM;
  float start;
  float SPB;
  Drop[] d;
  AudioPlayer player;
  Song(float _start, float _BPM, String _player)
  {
    start = _start;
    BPM = _BPM;
    player = minim.loadFile(_player);
    SPB = (60/BPM)*1000;
  }
}

