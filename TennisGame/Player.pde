class Player extends Object
{
  int speed = 3;
  int playerWidth = 30;
  Collider hitCollider;
  Boolean activeCollider;
  Animation animation;
  Player(PVector newPosition, Animation _animation)
  {
    super(newPosition);
    hitCollider = new Collider(new PVector(position.x + playerWidth/2, position.y + playerWidth/2), playerWidth);
    active = true;
    activeCollider = false;
    active = false;
    animation = _animation;
  }
  
  //Draws the player
  void drawPlayer()
  {
    fill(255);
    animation.drawAnimation(position);
  }
  
  //Moves the player
  void movePlayer(PVector move_Vector)
  {
    //Gets the potential position and checks it against the bounds of the map to see if it can move there
    PVector potentialPosition = new PVector(position.x +move_Vector.x * speed, position.y + move_Vector.y * speed);
    if(potentialPosition.x > width/10 && potentialPosition.y < height - height/10 && potentialPosition.y > 0 + height/10 && potentialPosition.x < width/2 - playerWidth)
    {
      //If the potential position is okay the player moves there and the collider is updated
      position = potentialPosition;
      hitCollider = new Collider(new PVector(position.x + playerWidth/2, position.y + playerWidth/2), playerWidth);
    }
  }
  
  //Checks if the player has hit the ball and handles the collision
  void hitBall(Ball ball, Opponent opponent)
  {
    activeCollider = true;
    //Checks if the player has hit the ball
    if(hitCollider.hasCollided(ball.hitCollider))
    {
      //Checks if the sound effect is playing and plays it if it is not
      if (!clap.isPlaying())
      {
        clap.play();
      }
      //Gets the ball position and calculates the new movement vector of the ball
      PVector ballPosition = new PVector(ball.position.x,ball.position.y);
      ballPosition.sub(new PVector(position.x + playerWidth/2,position.y + playerWidth/2));
      ballPosition.normalize();
      ball.moveVector = ballPosition;
      //Sets the opponent collider to active so that it can respond
      opponent.activeCollider = true;
    }
  }
  //Resets the players collider
  void resetCollider()
  {
    activeCollider = false;
  }
}
