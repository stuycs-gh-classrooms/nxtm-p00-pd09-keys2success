//simulation 1
//spawn orbs in a certain place

class Gravity {
  FixedOrb sun;
  OrbList planets;
  float grav;

  Gravity() {
    sun = new FixedOrb(width/2, height/2, 50, 120, 0);
    planets = new OrbList();
    grav = 0.2;
    circlePopulate(3);
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
        planets.applyGravity(sun, grav);
        //if gravity on, orbital motion
      }
    }
  }

  void circlePopulate(int n) {
    OrbNode addition;
    planets.front = null;

    int count = 0;
    while (count < n) { //populate n amount of orbs
      addition = new OrbNode((float)160+(count*100), (float)(height-60), random(40,50), 100, 0);
      print(addition.bsize);
      addition.velocity.x = 4; //aded velocity to "pull" planets into orbit
      planets.addFront(addition);
      count++;
    }
  }

  void addS() {
    OrbNode n = new OrbNode((float)260, (float)(height-60), random(40,50), 100, 0);
    n.velocity.x = 4;
    planets.addFront(n);
  }

  void removeS() {
    planets.removeFront();
  }
}
