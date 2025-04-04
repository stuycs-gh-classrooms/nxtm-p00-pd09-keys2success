//setup: line up some orbs at the left vertically / line up orbs at top right
//make rectangle to highlight the part where drag force is applied (bottom right 1/4 total screen)
//apply velocity to orb
//apply drag

//SIM 3 - Drag

class Drag {
  Orb[] orbs;
  float d_constant;
  PVector grav;

  Drag(float d, PVector g) {
    d_constant = d;
    grav = g;
    makeArray();
    drag();
  }

  void drag() {
    if (toggles[DRAGF]) {
      fill(195, 177, 225);
      rect(0, 200, width, height-200);
      for (int i = 0; i < orbs.length; i++) {
        if (orbs[i].center.y + orbs[i].bsize/2 > 200) {
          orbs[i].applyForce(orbs[i].getDragForce(d_constant));
        }
      }
    }
    for (int i = 0; i < orbs.length; i++) {
      orbs[i].display();
    }

    if (toggles[MOVING]) {
      //planets move randomly
      for (int i = 0; i < orbs.length; i++) {
        orbs[i].move(true);
      }

      if (toggles[GRAVITY]) {
        for (int i = 0; i < orbs.length; i++) {
          orbs[i].applyForce(grav);
        }
      }
    }
  }

  void makeArray() {
    orbs = new Orb[2];
    for (int i = 0; i < orbs.length; i++) {
      orbs[i] = new Orb(50+50*i, 100, random(10, MAX_SIZE), random(10, 100), 0);
    }
  }
}
