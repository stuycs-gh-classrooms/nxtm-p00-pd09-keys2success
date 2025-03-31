//simulation 3

class Electric {
  OrbList charges;
  float electricity;

  Electric(float e) {
    electricity = e; //electricity constant
    charges = new OrbList();
    circlePopulate(2);
  }

  void electric() {
    charges.display();

    if (toggles[MOVING]) {
      //planets move randomly
      charges.run(toggles[BOUNCE]);

      if (toggles[TELECTRIC]) {
        charges.applyElectric(electricity);
      }
    }
  }

  void circlePopulate(int n) {
    OrbNode addition;
    charges.front = null;

    int count = 0;
    while (count < n) { //populate n amount of orbs
      addition = new OrbNode((float)160+(count*100), (float)(height/2), random(40, 50), 100, int(random(-10, 10)));
      print(addition.bsize);
      charges.addFront(addition);
      count++;
    }
  }

  void addS() {
    charges.addFront(new OrbNode());
  }

  void removeS() {
    charges.removeFront();
  }
}
