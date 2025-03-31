class OrbList {

  OrbNode front;
  OrbNode addition;

  OrbList() {
    front = null;
  }//constructor

  void addFront(OrbNode o) {
    o.next = front; //make space for new orbnode
    if (front != null) { //avoid nullpointerexception errors
      front.previous = o;
    }
    front = o; //since o is added to the beginning it will be the new front
  }//addFront

  void populate(int n, boolean ordered) {
    front = null;

    int count = 0;
    while (count < n) { //populate n amount of orbs
      if (ordered) {
        addition = new OrbNode((float)count*SPRING_LENGTH, (float)height/2, random(10, 60), random(2, 100), 10); //generated orbs will be SPRING_LENGTTH apart, 10 is a placeholder for now
      } else {
        addition = new OrbNode(random(10, width), random(10, height), random(10, 60), random(2, 100), 10); //random coords
      }
      addFront(addition);
      count++;
    }
  }//populate

  void display() {

    OrbNode o = front;
    while (o != null) {
      o.display();
      o = o.next;
    }
  }//display

  void applySprings(int springLength, float springK) {
    OrbNode o = front;
    while (o != null) {
      o.applySprings(springLength, springK);
      o = o.next;
    }
  }//applySprings

  void applyGravity(Orb other, float gConstant) {
    OrbNode o = front;
    while (o != null) {
      o.applyForce(o.getGravity(other, gConstant));
      o = o.next;
    }
  }//applyGravity

  void applyElectric(float eConstant) {
    OrbNode o = front;
    o.setColor();
    while (o != null) {
      o.applyElectric(eConstant);
      fill(255, 0, 0);
      text(o.charge, o.center.x, o.center.y);
      o = o.next;
    }
    while (o != null) {
      o.applyElectric(eConstant);
      o = o.previous;
    }
  }

  void run(boolean bounce) {
    OrbNode o = front;
    while (o != null) {
      o.move(bounce);
      o = o.next;
    }
  }//applySprings

  void removeFront() {
    //OrbNode o = front;
    //front = o.next;
    OrbNode o = front;
    front = front.next;
    if (front != null) {
      front.previous = null;
    }
    o.next = null;
    o.previous = null;
    //o = null;
  }//removeFront

  void removeNode(OrbNode o) {
    OrbNode d = front;
    while (d != null) {
      if (d.next == o) {
        d.next = d.next.next;
      }
      d = d.next;
    }
  }

  void showSprings(int l) {
    OrbNode s = front;

    while (s != null) {

      if (s.next != null) {
        springColor(PVector.dist(s.center, s.next.center), l);
        line(s.center.x, s.center.y, s.next.center.x, s.next.center.y);
      }
      if (s.previous != null) {
        springColor(PVector.dist(s.center, s.previous.center), l);
        line(s.center.x, s.center.y+5, s.previous.center.x, s.previous.center.y+5);
      }
      s = s.next;
    }
  }

  void springColor(float dist, int l) {
    if (dist < l) {
      stroke(0, 255, 0);
    } else if (dist > l) {
      stroke(255, 0, 0);
    } else {
      stroke(0);
    }
  }

  
}//OrbList
