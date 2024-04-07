//The class that controls the ball, which extends the object class as it is a game object
class Ball extends Object
{
  int speed = 4;
  int ballWidth = 20;
  Collider hitCollider;
  Boolean activeCollider;
  PVector moveVector = new PVector(0,0);
  Ball(PVector startPos)
  {
    super(startPos);
    hitCollider = new Collider(position, ballWidth);
    active = false;
  }
  
  void drawBall()
  {
    fill(255);
    circle(position.x, position.y, 20);
  }
  
  //Moves the ball according to the move vector input.
  void moveBall(PVector move_Vector)
  {
    PVector potentialPosition = new PVector(position.x +move_Vector.x * speed, position.y + move_Vector.y * speed);
    position = potentialPosition;
    hitCollider = new Collider(position, ballWidth);
  }
}
