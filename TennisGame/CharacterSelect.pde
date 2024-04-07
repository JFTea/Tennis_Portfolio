class CharacterSelect
{

  CharacterSelect()
  {

  }
  
  void characterMenu()
  {
    //Sets up the character selection menu
    background(255);
    TimerLabel.setVisible(false);
    ResumeButton.setVisible(false);
    OptionsQuit.setVisible(false);
    StartButton.setVisible(false);
    QuitButton.setVisible(false);
    BackButton.setVisible(false);
    PlayButton.setVisible(false);
    DifficultyList.setVisible(false);
    RulesList.setVisible(false);
    NumberList.setVisible(false);
    TournamentButton.setVisible(false);
    Character1Button.setVisible(true);
    Character2Button.setVisible(true);
    Character3Button.setVisible(true);
    
    image(bigCharacter1,0,height/20);
    image(bigCharacter2,250,height/20);
    image(bigCharacter3,500,height/20);
  }
}
