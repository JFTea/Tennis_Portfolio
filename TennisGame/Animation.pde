class Animation
{
  PImage[] Sprites;
  PImage activeSprite;
  int activeSpritePosition = 0;
  Animation(PImage[] _sprites)
  {
    Sprites = _sprites;
    activeSprite = Sprites[0];
  }

  void drawAnimation(PVector position)
  {
    //Animates the sprite by changing the active image every 10 frames as that is the same frame rate used in the animation software
    if (frameCount % 10 == 0)
    {
      if (activeSpritePosition == Sprites.length-1)
      {
        activeSpritePosition = 0;
      } else
      {
        activeSpritePosition += 1;
      }
      activeSprite = Sprites[activeSpritePosition];
    }
    image(activeSprite, position.x, position.y);
  }
}
