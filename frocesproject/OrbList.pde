class OrbList {

  OrbNode front;
  OrbNode addition;

  /*===========================
   Contructor
   Does very little.
   You do not need to modify this method.
   =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
   addFront(OrbNode o)
   
   Insert o to the beginning of the list.
   =========================*/
  void addFront(OrbNode o) {
    o.next = front; //make space for new orbnode
    if (front != null) { //avoid nullpointerexception errors
      front.previous = o;
    }
    front = o; //since o is added to the beginning it will be the new front
  }//addFront


  /*===========================
   populate(int n, boolean ordered)
   
   Clear the list.
   Add n randomly generated  orbs to the list,
   using addFront.
   If ordered is true, the orbs should all
   have the same y coordinate and be spaced
   SPRING_LEGNTH apart horizontally.
   =========================*/
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

  /*===========================
   display(int springLength)
   
   Display all the nodes in the list using
   the display method defined in the OrbNode class.
   =========================*/
  void display() {

    OrbNode o = front;
    while (o != null) {
      o.display();
      o = o.next;
    }
  }//display

  /*===========================
   applySprings(int springLength, float springK)
   
   Use the applySprings method in OrbNode on each
   element in the list.
   =========================*/
  void applySprings(int springLength, float springK) {
    OrbNode o = front;
    while (o != null) {
      o.applySprings(springLength, springK);
      o = o.next;
    }
  }//applySprings

  /*===========================
   applyGravity(Orb other, float gConstant)
   
   Use the getGravity and applyForce methods
   to apply gravity crrectly.
   =========================*/
  void applyGravity(Orb other, float gConstant) {
    OrbNode o = front;
    while (o != null) {
      o.applyForce(o.getGravity(other, gConstant));
      o = o.next;
    }
  }//applyGravity

  /*===========================
   run(boolean bounce)
   
   Call run on each node in the list.
   =========================*/
  void run(boolean bounce) {
    OrbNode o = front;
    while (o != null) {
      o.move(bounce);
      o = o.next;
    }
  }//applySprings

  /*===========================
   removeFront()
   
   Remove the element at the front of the list, i.e.
   after this method is run, the former second element
   should now be the first (and so on).
   =========================*/
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

  /*===========================
   removeNode(OrbNode o)
   
   Removes o from the list. You can
   assume o is an OrbNode in the list.
   You cannot assume anything about the
   position of o in the list.
   =========================*/
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
