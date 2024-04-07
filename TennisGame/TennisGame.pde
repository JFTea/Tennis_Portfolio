import processing.sound.*;
import g4p_controls.*;

Tournament tournament;
MainMenu mainMenu = new MainMenu();
PlayMenu playMenu = new PlayMenu();
Match currentMatch;
TournamentMenu tournamentMenu = new TournamentMenu();
CharacterSelect characterSelect = new CharacterSelect();


PVector moveVector = new PVector(0, 0);
int state = 0;
PImage logo;
PImage winText;
PImage loseText;
Boolean tournamentActive = false;
String NAME_FILE = "NAME_FILE.txt";
String[] names;
PImage[] SpriteV1 = new PImage[3];
PImage[] SpriteV2 = new PImage[3];
PImage[] SpriteV3 = new PImage[3];
PImage bigCharacter1;
PImage bigCharacter2;
PImage bigCharacter3;
PImage[] playerCharacter;
SoundFile clap;
SoundFile backgroundMusic;

void setup()
{
  //Limits the frame rate to 60 to prevent massive frame drops from about 200 - 100
  frameRate(60);

  //Sets the size of the canvas
  size(750, 500);

  //Loads the sound effect used when the ball is hit
  clap = new SoundFile(this, "Clap.wav");

  backgroundMusic = new SoundFile(this, "Unplugged Stars Main.wav");
  backgroundMusic.loop();

  //Loads all the sprites that are used in the game
  getSprites();

  //Loads all the names used for the AI
  names = loadStrings(NAME_FILE);
  names = split(names[0], ',');
  createGUI();
  //Sets the timer for the timed match setting
  GameTimer.setInitialDelay(90000);
  GameTimer.setDelay(90000);

  //Creates the main menu
  mainMenu.mainMenu();
}

//Sets up the options menu
void optionsMenu()
{
  ResumeButton.setVisible(true);
  OptionsQuit.setVisible(true);
}

//Sets up the winning screen
void winScreen()
{
  OptionsQuit.setVisible(true);
}

//Changes the state
void changeState(int newState)
{
  state = newState;
}


//Houses the state machine used, 0 is main menu, 1 is the match screen, 2 is the mid match pause, 3 is the custom game menu, 4 is the winning screen, 5 is the tournament menu, 6 is for character selection
void draw()
{
  switch(state)
  {
  case 0:
    mainMenu.mainMenu();
    break;
  case 1:
    if (!currentMatch.setup)
    {
      currentMatch.setupMap();
    }
    currentMatch.matchDraw();
    break;
  case 2:
    optionsMenu();
    break;
  case 3:
    playMenu.playMenu();
    break;
  case 4:
    winScreen();
    break;
  case 5:
    tournamentMenu.menu();
    break;
  case 6:
    characterSelect.characterMenu();
    break;
  }
}
void keyPressed()
{
  if (state == 1)
  {
    if (currentMatch.player.active)
    {
      if (key == 'w' || keyCode == UP)
      {
        moveVector.y = -1;
      }

      if (key == 'a' || keyCode == LEFT)
      {
        moveVector.x = -1;
      }

      if (key == 's' || keyCode == DOWN)
      {
        moveVector.y = 1;
      }

      if (key == 'd' || keyCode == RIGHT)
      {
        moveVector.x = 1;
      }
    }
    if (key== '1')
    {
      changeState(2);
    }
  }
}

//Resets the move vectors after the player has released the key
void keyReleased()
{
  if (state == 1)
  {
    if (currentMatch.player.active)
    {
      if (key == 'w'|| keyCode == UP)
      {
        moveVector.y = 0;
      }

      if (key == 'a'|| keyCode == LEFT)
      {
        moveVector.x = 0;
      }

      if (key == 's'|| keyCode == DOWN)
      {
        moveVector.y = 0;
      }

      if (key == 'd'|| keyCode == RIGHT)
      {
        moveVector.x = 0;
      }
    }
  }
}

//Loads all images and sprites used
void getSprites()
{
  for (int i = 1; i<4; i++)
  {
    //Loads the different variations of the player character
    SpriteV1[i-1] = loadImage("TennisPlayerV1S" + i + ".gif");
    SpriteV2[i-1] = loadImage("TennisPlayerV2S" + i + ".gif");
    SpriteV3[i-1] = loadImage("TennisPlayerV3S" + i + ".gif");
  }
  logo = loadImage("SensibleTennisLogo.png");
  winText = loadImage("CTWinArt.png");
  loseText = loadImage("CTLoseArt.png");
      bigCharacter1 = loadImage("TennisPlayerV1Big.gif");
    bigCharacter2 = loadImage("TennisPlayerV2Big.gif");
    bigCharacter3 = loadImage("TennisPlayerV3Big.gif");
}
