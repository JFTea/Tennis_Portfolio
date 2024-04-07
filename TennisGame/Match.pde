class Match
{
  Boolean lastScored = true; // false for opponent, true for player
  Boolean setup = false;
  Boolean matchOver = false;
  int difficulty = 2;
  int playerScore = 0;
  int opponentScore = 0;
  Boolean timerStarted = false;
  int time;
  Player player;
  Opponent opponent;
  Map map;
  Ball ball;
  Match()
  {
    playerScore = 0;
    opponentScore = 0;
  }

//Sets up the map
  void setupMap()
  {
    background(0, 255, 0);
    //Checks if the gamemode is timer and if so starts the timer
    if (!timerStarted && RulesList.getSelectedIndex() == 0 && !tournamentActive)
    {
      GameTimer.start();
      
      //Converts the timer time into seconds for display
      time = GameTimer.getInterval()/1000;
      timerStarted = true;
      TimerLabel.setVisible(true);
    }
    //Instantiates the player and the map
    player = new Player(new PVector(200, 300), new Animation(playerCharacter));
    map = new Map(new PVector(0, 0));
    //Randomly chooses the opponents sprite
    PImage[] opponentSprite = SpriteV1;
    int random = round(random(1,3));
    
    if(random == 1)
    {
      opponentSprite = SpriteV1;
    }else if(random == 2)
    {
      opponentSprite = SpriteV2;
    }else if(random == 3)
    {
      opponentSprite = SpriteV3;
    }
    
    //Instantiates the opponent
    opponent = new Opponent(new PVector(550, 300), difficulty, new Animation(opponentSprite));
    if (!lastScored)
    {
      ball = new Ball(new PVector(250, random(100, 350)));
    } else
    {
      ball = new Ball(new PVector(550, 300));
      opponent.activeCollider = true;
    }
    textSize(32);
    text("Player: "+playerScore + " || " + "Opponent: " + opponentScore, width/3.325, height/15);
    textSize(20);
    ball.active = true;
    player.active = true;
    opponent.active = true;

    //Sets the UI up for the match
    StartButton.setVisible(false);
    QuitButton.setVisible(false);
    ResumeButton.setVisible(false);
    OptionsQuit.setVisible(false);
    BackButton.setVisible(false);
    PlayButton.setVisible(false);
    DifficultyList.setVisible(false);
    RulesList.setVisible(false);
    NumberList.setVisible(false);
    TournamentButton.setVisible(false);
    
    //Sets the difficulty of the opponent
    changeDifficulty();
    setup = true;
  }
  
  //Sets the difficulty of the opponent
  void changeDifficulty()
  {
    //Checks if it is a tornament
    if (!tournamentActive)
    {
      //Sets the difficulty to what the user selected
      if (DifficultyList.getSelectedIndex() == 0)
      {
        difficulty = 2;
      } else if (DifficultyList.getSelectedIndex() == 1)
      {
        difficulty = 5;
      } else if (DifficultyList.getSelectedIndex() == 2)
      {
        difficulty = 10;
      }
    } else
    {
      //Sets the difficulty in a tornament
      opponent.speed = tournament.Rounds[tournament.currentRound].OpponentDifficulty;
    }
  }
  
  //Draws the match
  void matchDraw()
  {
    //If the match/map is not setup setupMap() is called
    if (!setup)
    {
      setupMap();
    }
    background(29, 133, 48);
    
    //Draws and moves all objects
    map.drawMap();
    player.drawPlayer();
    ball.moveBall(ball.moveVector);
    ball.drawBall();
    opponent.moveOpponent(ball);
    opponent.drawOpponent();
    
    //Displayes the current score
    text("Player: "+playerScore + " || " + "Opponent: " + opponentScore, width/3.325, height/15);
    
    //Checks if the ball has left the screen
    if (ball.position.x < 0 || ball.position.x > width || ball.position.y < 0 || ball.position.y > height)
    {
      PVector lastballPosition = ball.position;
      //Checks which side of the screen the ball went off and awards scores approprietly
      if (lastballPosition.x > width/2)
      {
        playerScore +=1;
        lastScored = true;
      } else
      {
        opponentScore +=1;
        lastScored = false;
      }
      setupMap();
    }
    if (player.active)
    {
      player.movePlayer(moveVector);
      player.hitBall(ball, opponent);
    }
    
    //If the gamemode is Best Of then it will check who wins
    if (playerScore + opponentScore == Integer.valueOf(NumberList.getSelectedText()) && RulesList.getSelectedIndex() == 1 || playerScore + opponentScore == Integer.valueOf(NumberList.getSelectedText()) && tournamentActive)
    {
      checkWin();
    } else if (frameCount % 60 == 0)
    {
      //Decreases the timer ever second
      time -= 1;
      TimerLabel.setText("Timer: " + time);
    }
  }

  //Checks who has won
  void checkWin()
  {
    if (playerScore > opponentScore)
    {
      image(winText, width/4, height/5);
    } else
    {
      image(loseText, width/4, height/5);
      if (tournamentActive)
      {
        tournamentActive = false;
      }
    }
    matchOver = true;
    //Goes to the winning screen and displays an image depending on if the player wins or loses
    state = 4;
  }
}
