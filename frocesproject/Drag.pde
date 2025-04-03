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
  }

  void drag() {
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

      if (toggles[DRAGF]) {
        for (int i = 0; i < orbs.length; i++) {
          if (orbs[i].center.y + orbs[i].bsize/2 > 100) {
            orbs[i].applyForce(orbs[i].getDragForce(d_constant));
          }
        }
      }
    }
  }
}
