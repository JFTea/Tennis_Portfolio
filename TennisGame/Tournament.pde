class Tournament
{
  int NumberOfRounds;
  Round[] Rounds;
  int currentRound;
  Tournament(int numberOfRounds)
  {
    NumberOfRounds = numberOfRounds;
    Rounds = new Round[NumberOfRounds];
    currentRound = 1;
    //Creates all the rounds and sets the difficulty for each round
    for(int i = 0; i < NumberOfRounds; i++)
    {
      Rounds[i] = new Round("",i*2);
    }
    tournamentMenu.createTournament();
  }
}
