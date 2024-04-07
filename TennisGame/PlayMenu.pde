class PlayMenu
{
  PlayMenu()
  {
  }
  
  //Sets up the needed UI for the custom games menu
  void playMenu()
  {
    background(255);
    image(logo, width/4, height/5);
    TimerLabel.setVisible(false);
    StartButton.setVisible(false);
    QuitButton.setVisible(false);
    ResumeButton.setVisible(false);
    OptionsQuit.setVisible(false);
    BackButton.setVisible(true);
    PlayButton.setVisible(true);
    DifficultyList.setVisible(true);
    RulesList.setVisible(true);
    TournamentButton.setVisible(false);
    Character1Button.setVisible(false);
    Character2Button.setVisible(false);
    Character3Button.setVisible(false);
    
    //Checks if the gamemode is Best Of and shows the number of rounds editor if it is
    if (RulesList.getSelectedIndex() == 1)
    {
      NumberList.setVisible(true);
    } else
    {
      NumberList.setVisible(false);
    }
  }
}
