//creates a spring simulation by setting a springNode

class Spring {
  int SPRING_LENGTH;
  float  SPRING_K;
  FixedOrb earth;
  OrbNode o;

  Spring(int l, float k) {
    this.SPRING_LENGTH = l;
    this.SPRING_K = k;
    earth = new FixedOrb(width/2, height * 200, 1, 20000);

    OrbNode o0 = new OrbNode();
    OrbNode o1 = new OrbNode();
    OrbNode o2 = new OrbNode();


    o0.next = o1;
    o1.previous = o0;
    o1.next = o2;
    o2.previous = o1;

    o = o0;
  }

  void boing() {
    OrbNode orb = o;
    while (orb != null) {
      orb.setColor();
      orb.display(SPRING_LENGTH);
      orb = orb.next;
    }

    orb = o;

    while (orb != null) {
      orb.applySprings(SPRING_LENGTH, SPRING_K);
      orb = orb.next;
    }

    orb = o;
    PVector gravity = orb.getGravity(earth, G_CONSTANT);

    if (toggles[GRAVITY]) {
      while (orb != null) {
        orb.applyForce(gravity);
        orb = orb.next;
      }
    }

    orb = o;

    if (toggles[MOVING]) { //allows pausing
      while (orb != null) {
        orb.move(toggles[BOUNCE]);
        orb = orb.next;
      }
    }

    earth.display();
  }
}
