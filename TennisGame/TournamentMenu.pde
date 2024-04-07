class TournamentMenu
{
  String[] round1 = new String[8];
  String[] round2 = new String[4];
  String[] round3 = new String[2];
  PImage screenImage;
  TournamentMenu()
  {
  }

  //Sets up the tournament
  void menu()
  {
    background(255);
    
    //Sets all needed UI for the tournament screen
    image(screenImage, width/4, height/50);
    TimerLabel.setVisible(false);
    StartButton.setVisible(false);
    QuitButton.setVisible(false);
    ResumeButton.setVisible(false);
    OptionsQuit.setVisible(false);
    BackButton.setVisible(true);
    Character1Button.setVisible(false);
    Character2Button.setVisible(false);
    Character3Button.setVisible(false);
    DifficultyList.setVisible(false);
    RulesList.setVisible(false);
    TournamentButton.setVisible(false);
    
    //Checks if the tournament has been won and sets the play button visible or not depending on if it has been won
    if (screenImage == winText)
    {
      PlayButton.setVisible(false);
    }
    else
    {
      PlayButton.setVisible(true);
    }

    fill(0);
    textSize(20);

    //Shows the tournament bracket and all the names of the players
    for (int i = 0; i < 4; i++)
    {
      text(round1[i], 100, 200 + i*80);
      text(round1[i+4], 100, 230 + i*80);

      text(round2[i], 300, 215 + i*80);
    }

    text(round3[0], 500, 245);
    text(round3[1], 500, 405);
  }


  //Creates the tournament
  void createTournament()
  {
    //Sets the text of all the player names from the names file
    screenImage = logo;
    for (int i = 0; i < round1.length; i++)
    {
      if (i == round1.length - 1)
      {
        round1[i] = "Player";
      } else
      {
        round1[i] = names[round(random(0, names.length-1))];
      }
    }
    round2[0] = "-";
    round2[1] = "-";
    round2[2] = "-";
    round2[3] = "-";
    round3[0] = "-";
    round3[1] = "-";
  }

  //Updates the tournament
  void updateTournament()
  {
    
    tournament.currentRound +=1;
    
    //Sets the text of the bracket depending on what round it is
    if (tournament.currentRound == 2)
    {
      for (int i = 0; i < 4; i++)
      {
        int random = round(random(1, 2));
        if (random == 1)
        {
          round2[i] = round1[i];
        } else if (i == 3)
        {
          round2[i] = "Player";
        } else
        {
          round2[i] = round1[i+4];
        }
      }
    }

    if (tournament.currentRound == 3)
    {
      round3[0] = round2[round(random(0, 1))];
      round3[1] = "Player";
    }

    if (tournament.currentRound == 4)
    {
      screenImage = winText;
    }
  }
}
