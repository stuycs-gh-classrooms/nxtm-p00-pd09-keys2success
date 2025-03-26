class OrbList {

  OrbNode front;

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
    o.next = front;
    front = o;
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
    OrbNode o = front;
    while (o != null) {
      front = o.next;
      o = o.next;
    } //clears the linkedlist

    for (int i = 0; i < n; i++) {
      if (ordered) {
        addFront(new OrbNode(float(SPRING_LENGTH * i), float(height/2), random(10, MAX_SIZE), random(10, 100), 0));
      } else {
        addFront(new OrbNode());
      }
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
    OrbNode o = front;
    front = o.next;
    //o = null;
  }//removeFront


  /*===========================
   getSelected(float x, float y)
   
   If there is a node at (x, y), return
   a reference to that node.
   Otherwise, return null.
   
   See isSlected(float x, float y) in
   the Orb class (line 115).
   =========================*/
  OrbNode getSelected(int x, int y) {
    OrbNode o = front;
    while (o != null) {
      if (o.isSelected(x, y)) {
        return o;
      }
      o = o.next;
    }
    return null;
  }//getSelected

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
}//OrbList
