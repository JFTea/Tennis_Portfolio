//The class that handles the creating of colliders and collisions
class Collider
{
  PVector TopLeft;
  PVector TopRight;
  PVector BottomLeft;
  PVector BottomRight;
  Collider(PVector centre, int objectWidth)
  {
    //Each collider is a quaderlateral
    TopLeft = new PVector(centre.x - objectWidth/2,centre.y - objectWidth/2);
    TopRight = new PVector(centre.x + objectWidth/2,centre.y - objectWidth/2);
    BottomLeft = new PVector(centre.x - objectWidth/2,centre.y + objectWidth/2);
    BottomRight = new PVector(centre.x + objectWidth/2,centre.y + objectWidth/2);
  }
  
  //Returns true if the tested collider has been hit
  Boolean hasCollided(Collider testCollider)
  {
    Boolean collision = false;
    if(testingCollider(testCollider))
    {
      collision = true;
    }
    return collision;
  }
  
  Boolean testingCollider(Collider testCollider)
  {
    //Checks to see if any of the corners are overlapping in the collided areas and returns true if they are
    if(testCollider.TopLeft.x >= TopLeft.x && testCollider.TopLeft.y >= TopLeft.y && testCollider.TopRight.x <= TopRight.x && testCollider.BottomLeft.y <= BottomLeft.y)
    {
      return true;
    }
    else if(testCollider.TopLeft.x >=TopLeft.x && testCollider.TopLeft.x <= TopRight.x && testCollider.TopLeft.y >= TopLeft.y && testCollider.TopLeft.y <=BottomLeft.y)
    {
      return true;
    }
    else if(testCollider.TopRight.x >=TopLeft.x && testCollider.TopRight.x <= TopRight.x && testCollider.TopRight.y >= TopLeft.y && testCollider.TopRight.y <=BottomLeft.y)
    {
      return true;
    }
    else if(testCollider.BottomLeft.x >=TopLeft.x && testCollider.BottomLeft.x <= TopRight.x && testCollider.BottomLeft.y >= TopLeft.y && testCollider.BottomLeft.y <=BottomLeft.y)
    {
      return true;
    }
    else if(testCollider.BottomRight.x >=TopLeft.x && testCollider.BottomRight.x <= TopRight.x && testCollider.BottomRight.y >= TopLeft.y && testCollider.BottomRight.y <=BottomLeft.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
