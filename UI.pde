void Logo()
{
  if (location == 0)
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
}
void intro()
{
  if (location == 1)
  {
    textSize(40);
    fill(0);
    textAlign(CENTER);
    text("Revenge of Tap Tap Revenge 2\nthe Sequel to the Prequel to the Remake", width/2, 50);
    textSize(20);
    text("Press SPACE to START", width/2, 400);
  }
}
void songSelect()
{
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
    text("←", 50, 400);
    text("→", 750, 400);
  }
}
void game()
{
  if (location == 3)
  {
    if (millis() >= startTime && songStart == false)
    {
      songs[whichSong].player.play();
      songStart = true;
    } else if (millis() <= startTime)
    {
      textSize(100);
      text(1+ceil(startTime-millis())/1000, width/2, height/2);
    }
    if (millis() > beatTime && songStart)
    {
      songs[whichSong].beatTime+=songs[whichSong].SPB;
    }
    fill(0);
    for (int i = 0; i < songs[whichSong].d.length; i++)
    {
      songs[whichSong].d[i].display();
      songs[whichSong].d[i].move();
    }
    for (int i = 0; i < c.length; i++)
    {
      c[i].display();
      c[i].ifPressed();
    }
    if (songs[whichSong].player.isPlaying() == false && songStart)
    {
      songs[whichSong].player.rewind();
      songs[whichSong].player.pause();
      songStart = false;
      location = 4;
    }
  }
}
