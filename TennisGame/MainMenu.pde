class MainMenu
{
  MainMenu()
  {
  }
  
  //Sets the needed GUI elements for the main menu
  void mainMenu()
  {
    background(255);
    image(logo, width/4, height/5);
    TimerLabel.setVisible(false);
    ResumeButton.setVisible(false);
    OptionsQuit.setVisible(false);
    StartButton.setVisible(true);
    QuitButton.setVisible(true);
    BackButton.setVisible(false);
    PlayButton.setVisible(false);
    DifficultyList.setVisible(false);
    RulesList.setVisible(false);
    NumberList.setVisible(false);
    TournamentButton.setVisible(true);
    Character1Button.setVisible(false);
    Character2Button.setVisible(false);
    Character3Button.setVisible(false);
  }
}
