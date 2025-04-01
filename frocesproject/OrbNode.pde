class OrbNode extends Orb
{
  //attributes aka instance variables
  OrbNode next;
  OrbNode previous;
  float x;

  OrbNode() {
    super();
  }

  OrbNode(float x, float y, float s, float m,int q) {
    super(x, y, s, m,q);
    next = previous = null;
  }//constructor

  void display(int springLength) {
    super.display();

    if (next != null) {
      x = PVector.dist(this.center, next.center);
      if (x < springLength) { //set colors
        stroke(0, 255, 0);
      } else if (x > springLength) {
        stroke(255, 0, 0);
      } else {
        stroke(0);
      }
      line(this.center.x, this.center.y+2, next.center.x, next.center.y+2); // +2 for adjusting endpoints
    }
    if (previous != null) {
      x = PVector.dist(previous.center, this.center);
      if (x < springLength) {
        stroke(0, 255, 0);
      } else if (x > springLength) {
        stroke(255, 0, 0);
      } else {
        stroke(0);
      }
      line(previous.center.x+5, previous.center.y, this.center.x+5, this.center.y);
    }
  }

  void applySprings(int springLength, float springK) {
    PVector f = new PVector();
    if (next != null) {
      f = this.getSpring(next, springLength, springK);
      this.applyForce(f);
    }
    if (previous != null) {
      f = this.getSpring(previous, springLength, springK);
      this.applyForce(f);
    }
  }
  
  void applyElectric(float eConstant) {
    if (next != null) {
      PVector sforce = getElectric(next, eConstant);
      applyEForce(sforce);
    }
    if (previous != null) {
      PVector sforce = getElectric(previous, eConstant);
      applyEForce(sforce);
    }
  }///applyElectric
  
  void applyFixedElectric(Orb fixed, float eConstant) {
    PVector sforce = getElectric(fixed, eConstant);
    applyEForce(sforce);
  }
}//OrbNode
