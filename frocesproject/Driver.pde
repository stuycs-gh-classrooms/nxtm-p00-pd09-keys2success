int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
boolean[] toggles = new boolean[4];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag"};

FixedOrb earth;
OrbNode o;


void setup()
{
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000);

  //for (int i = 0; i < numOrbs; i++) { //loop to initiate OrbNode and set previous and next OrbNode
  //  o[i] = new OrbNode();
  //  if (i != 0) {
  //    o[i].previous = o[i-1];
  //  }
  //  if (i != numOrbs - 1) {
  //    o[i].next = o[i+1];
  //  }
  //}

  OrbNode o0 = new OrbNode();
  OrbNode o1 = new OrbNode();
  OrbNode o2 = new OrbNode();


  o0.next = o1;
  o1.previous = o0;
  o1.next = o2;
  o2.previous = o1;

  o = o0;
}//setup


void draw()
{
  background(255);
  displayMode();

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
  PVector gravity = orb.getGravity(earth,G_CONSTANT);

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

  //for (int i = 0; i < numOrbs; i++) {
  //  o[i].display();
  //}

  //PVector sf = o0.getSpring(o0.next, SPRING_LENGTH, SPRING_K);
  //o0.applyForce(sf);
  //sf = o1.getSpring(o1.previous, SPRING_LENGTH, SPRING_K);
  //o1.applyForce(sf);

  //o0.move(toggles[BOUNCE]);
  //o1.move(toggles[BOUNCE]);
}//draw




void keyPressed()
{
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == 'g') {
    toggles[GRAVITY] = !toggles[GRAVITY];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];
  }
  if (key == 'd') {
    toggles[DRAGF] = !toggles[DRAGF];
  }
  if (key == '=') {
    OrbNode n = new OrbNode(); //create new node
    n.next = o; //the head gets moved one space to make space for new node
    o.previous = n; //the empty position will be taken by the new node
    o = n; //update to a new head
  }
  if (key == '-') {
    o = o.next; //move everything to the next space so that the empty space would be set to null
    o.previous = null;
  }
  if (key == '1') {
    //new Gravity class
  } else if (key == '2') {
    //new Spring class
  } else if (key == '3') {
    //new Drag class
  } else if (key == '4') {
    // new Electric class
  } else if (key == '5') {
    // new Combo class (will extend from Spring, Gravity, and Electric)
  }
}


void displayMode()
{
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
