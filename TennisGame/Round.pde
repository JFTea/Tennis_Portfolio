class Round
{
  String OpponentName;
  int OpponentDifficulty;
  Round(String opponentName, int difficulty)
  {
     OpponentName = opponentName;
     OpponentDifficulty = difficulty;
  }
  
  void startRound()
  {
    state = 1;
  }
}
