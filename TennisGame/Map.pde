class Map extends Object
{
  Map(PVector newPosition)
  {
    super(newPosition);
  }
  
  void drawMap()
  {
    //Draws the map
    fill(255);
    rect(0 + width/10,0+height/10,width - width/5,5);
    rect(0 + width/10,0+height/10,5,height - height/5);
    rect(width - width/10,0+height/10,5,height - height/5);
    rect(0 + width/10,height - height/10,width - width/5,5);
    
    rect(0 + width/10,0+height/6,width - width/5,5);
    rect(0 + width/3,0+height/10,5,height - height/5);
    rect(0 + width/1.5,0+height/10,5,height - height/5);
    rect(0 + width/10,0+height/1.2,width - width/5,5);
    
    rect(0 + width/3,0+height/2,width/3,5);
    
    for(int i = 0; i < 400; i += 40)
    {
      rect(width/2, height/8 + i,10,20);
    }
  }
}
