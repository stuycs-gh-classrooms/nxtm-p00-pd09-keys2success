//creates a spring simulation by setting a springNode

class Spring {
  int SPRING_LENGTH;
  float SPRING_K;
  FixedOrb earth;
  OrbList o = new OrbList();

  Spring(int l, float k) {
    this.SPRING_LENGTH = l;
    this.SPRING_K = k;
    earth = new FixedOrb(width/2, height * 200, 1, 20000,20);
    
    o.populate(3,false);
  }

  void boing(float g) {
    o.display();
    o.showSprings(SPRING_LENGTH);
    o.applySprings(SPRING_LENGTH, SPRING_K);
    
    if (toggles[GRAVITY]) {
      o.applyGravity(earth, g);
    }

    // Only run physics if NOT paused
    if (toggles[MOVING]) {
      o.run(toggles[BOUNCE]);
    }

    earth.display();
  }
  
  void addS() {
    o.addFront(new OrbNode());
  }
  
  void removeS() {
    o.removeFront();
  }
}
