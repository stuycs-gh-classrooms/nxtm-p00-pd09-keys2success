class FixedOrb extends Orb
{
    
    FixedOrb(float x, float y, float s, float m, int q)
    {
  super(x, y, s, m, q);
  c = color(255, 0, 0);
    }
    

    FixedOrb()
    {
  super();
  c = color(255, 0, 0);
    }

    
    void move(boolean bounce)
    {
  //do nothing
    }

}//fixedOrb
