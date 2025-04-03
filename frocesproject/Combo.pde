//last simulation, will extend from Spring, Gravity, and Electric

class Combo {
  FixedOrb[][] borderOrbs; //orbs lining up at the border
  OrbList main = new OrbList(); //orbs moving at the center
  FixedOrb earth;
  int l;
  float k_constant;
  float gravity;
  float e_constant;
  int bsize;
  int numCols;
  int numRows;

  Combo(int len, float k, float grav, float e, int size) {
    earth = new FixedOrb(width/2, height * 200, 1, 20000, 0);
    this.l = len;
    this.k_constant = k;
    this.gravity = grav;
    this.e_constant = e;
    this.bsize = size;
    main.populate(3, false);
    numCols = (int) width/bsize;
    numRows = (int) height/bsize;
    makeBorder();
  }

  void makeBorder() {
    borderOrbs = new FixedOrb[numCols][numRows];
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        if (i == 0 || i == numRows - 1 || j == 0 || j == numCols - 1) {
          if (i == 0 || i == numRows - 1) {
            borderOrbs[i][j] = new FixedOrb(i*bsize+(bsize/2), (bsize)+j*bsize, bsize, random(10, 100), 5); //only line up the border
          } else if (j == 0 || j == numCols - 1) {
            borderOrbs[i][j] = new FixedOrb(i*bsize+(bsize/2), (bsize)+j*bsize, bsize, random(10, 100), -5);
          }
        }
      }
    }
  }

  void startSim() {
    main.display();
    for (int i = 0; i < numRows; i++) { //display border
      for (int j = 0; j < numCols; j++) {
        if (borderOrbs[i][j] != null) { //out of bounds
          borderOrbs[i][j].display();
        }
      }
    }

    main.showSprings(l);
    main.applySprings(l, k_constant);

    if (toggles[GRAVITY]) {
      main.applyGravity(earth, gravity);
    }

    if (toggles[MOVING]) {
      //planets move randomly
      main.run(toggles[BOUNCE]);

      if (toggles[TELECTRIC]) {
        OrbNode current = main.front;
        while (current != null) { //main orbs
          fill(255, 0, 0);
          text(current.charge, current.center.x, current.center.y);
          //checking each borderOrb
          for (int i = 0; i < numRows; i++) {
            for (int j = 0; j < numCols; j++) {
              fill(0);
              textAlign(CENTER);
              if (borderOrbs[i][j] != null) {
                text(borderOrbs[i][j].charge, borderOrbs[i][j].center.x, borderOrbs[i][j].center.y); //show charge
              }
              FixedOrb borderOrb = borderOrbs[i][j];
              if (borderOrb != null) { //applying the forces
                PVector electricForce = current.getElectric(borderOrb, e_constant);
                current.applyEForce(electricForce);
              }
            }
          }
          current = current.next;
        }
      }
    }
  }

  void addS() {
    main.addFront(new OrbNode());
  }

  void removeS() {
    main.removeFront();
  }
}
