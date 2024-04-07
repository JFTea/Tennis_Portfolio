class Opponent extends Object
{
  int speed = 2;
  int opponentWidth = 30;
  Collider hitCollider;
  Boolean activeCollider;
  Animation animation;
  Opponent(PVector startPos, int difficulty, Animation _animation)
  {
    super(startPos);
    hitCollider = new Collider(new PVector(position.x + opponentWidth/2, position.y + opponentWidth/2), opponentWidth);
    active = false;
    activeCollider = false;
    speed = difficulty;
    animation = _animation;
  }
  
  //Moves the opponent
  void moveOpponent(Ball ball)
  {
    //Checks if the collider is active, if it is the player has hit the ball and the opponent will move to intercept
    if (activeCollider)
    {
      PVector move_Vector = direction(ball);
      PVector potentialPosition = new PVector(position.x +move_Vector.x * speed, position.y + move_Vector.y * speed);
      //Checks if the opponent is going to leave the map and stops it if it would
      if (potentialPosition.y < height - opponentWidth && potentialPosition.y > 0)
      {
        position = potentialPosition;
        //Resets the collider to the new position
        hitCollider = new Collider(new PVector(position.x + opponentWidth/2, position.y + opponentWidth/2), opponentWidth);
        //Checks if the ball has been hit
        hitBall(ball);
      }
    }
  }

  //Checks if the ball has been hit and handles the collision if it has
  void hitBall(Ball ball)
  {
    //Checks if the opponent has collided with the ball
    if (hitCollider.hasCollided(ball.hitCollider))
    {
      //Checks if the clap sound effect is already playing and plays it if it is not
      if (!clap.isPlaying())
      {
        clap.play();
      }
      //Calculates the ball's new direction vector and resets the opponent collider to false
      PVector ballPosition = new PVector(ball.position.x, ball.position.y);
      ballPosition.sub(new PVector(position.x + opponentWidth/2, position.y));
      ballPosition.normalize();
      ball.moveVector = ballPosition;
      activeCollider = false;
    }
  }

  //Draws the opponent
  void drawOpponent()
  {
    fill(255);
    animation.drawAnimation(position);
  }

  //Calculates the interception point and direction the opponent needs to travel
  PVector direction(Ball ball)
  {
    //Resets the direction to (0,0)
    PVector direction = new PVector(0, 0);
    //Gets the centre of the opponent
    PVector centre = new PVector(position.x + opponentWidth/2, position.y + opponentWidth/2);
    float x = ball.position.x;
    //Gets the direction the ball is currently moving in
    PVector ballDirection = new PVector(ball.moveVector.x, ball.moveVector.y);
    
    //Calculates the interception vector using the vector equation and then uses the value of lambda to get the y position of the location where the ball and opponent would intercept
    float lambda = (centre.x - x)/ballDirection.x;
    float y = ball.position.y + lambda * ballDirection.y;

    //If the position is above the ball then the opponent moves up, if it is below it moves down
    if (y > position.y)
    {
      return direction = new PVector(0, 1);
    } else if (y < position.y)
    {
      return direction = new PVector(0, -1);
    } else
    {
      return direction;
    }
  }
}
