//simulation 1
//spawn orbs in a certain place

class Gravity {
  FixedOrb sun;
  OrbList planets;
  float grav;

  Gravity(float g) {
    sun = new FixedOrb(width/2, height/2, 50, 100, 0);
    planets = new OrbList();
    this.grav = g;
    planets.populate(3, false);
  }

  void orbit() {
    planets.display();
    sun.display();

    //if (toggles[MOVING]) {
    //  planets.run(toggles[BOUNCE]);
    //}
    if (toggles[MOVING]) {
      //planets move randomly
      planets.run(toggles[BOUNCE]);
      if (toggles[GRAVITY]) {
        
        //if gravity on, orbital motion
      }
        
    }
  }

  void addS() {
    planets.addFront(new OrbNode());
  }

  void removeS() {
    planets.removeFront();
  }
}
