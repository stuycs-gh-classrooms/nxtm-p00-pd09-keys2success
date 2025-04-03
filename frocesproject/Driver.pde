int NUM_ORBS = 3;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

float E_CONSTANT = 20;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int TELECTRIC = 4;
boolean[] toggles = new boolean[5];

int GRAV = 0;
int SPRING = 1;
int DRAGS = 2;
int ELECTRIC = 3;
int COMBO = 4;
boolean[] sim = new boolean[5];

String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "Electric"};
String[] simDisplay = {"Orbit", "Spring", "Drag", "Electric", "Combo"};

FixedOrb earth;
OrbNode o;

Spring s;
Gravity g;
Electric e;
Combo c;


void setup()
{
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000, 20);
  g = new Gravity();
  sim[GRAV] = true;
}//setup


void draw()
{
  background(255);
  displayMode();

  if (s != null) {
    s.boing(G_CONSTANT);
  } else if (g != null) {
    g.orbit();
  } else if (e != null) {
    e.electric();
  } else if (c != null) {
    c.startSim();
  }
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
  if (key == 'e') {
    toggles[TELECTRIC] = !toggles[TELECTRIC];
  }
  if (key == '=' || key =='+') {
    if (sim[SPRING]) {
      s.addS();
    } else if (sim[GRAV]) {
      g.addS();
    } else if (sim[ELECTRIC]) {
      e.addS();
    } else if (sim[COMBO]) {
      c.addS();
    }
  }
  if (key == '-') {
    if (sim[SPRING]) {
      s.removeS();
    } else if (sim[GRAV]) {
      g.removeS();
    } else if (sim[ELECTRIC]) {
      e.removeS();
    } else if (sim[COMBO]) {
      c.removeS();
    }
  }
  if (key == '1') {
    //new Gravity class
    sim[SPRING] = sim[ELECTRIC] = sim[COMBO] = false;
    sim[GRAV] = true;
    s = null;
    e = null;
    c = null;
    g = new Gravity();
  } else if (key == '2') {
    sim[ELECTRIC] = sim[GRAV] = sim[COMBO] = false;
    sim[SPRING] = true;
    g = null;
    e = null;
    c = null;
    s = new Spring(SPRING_LENGTH, SPRING_K);
    //s.display();
  } else if (key == '3') {
    //new Drag class
  } else if (key == '4') {
    sim[GRAV] = sim[COMBO] = sim[SPRING] = false;
    sim[ELECTRIC] = true;
    s = null;
    g = null;
    c = null;
    e = new Electric(E_CONSTANT);
    // new Electric class
  } else if (key == '5') {
    sim[GRAV] = sim[SPRING] = sim[ELECTRIC] = false;
    sim[COMBO] = true;
    s = null;
    g = null;
    e = null;
    c = new Combo(SPRING_LENGTH,SPRING_K,G_CONSTANT,E_CONSTANT,50);
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
  
  //displaying simulation types
  int c = 0;
  boolean active = false;
  for (int s = 0; s < sim.length; s++) {
    if (sim[s] && !active) {
      fill(0,255,0);
      active = true;
    } else {
      fill(255,0,0);
    }
    
    float t = textWidth(simDisplay[s]);
    rect((width/2)+15+c,0,t+8,20);
    fill(0,0,255);
    text(simDisplay[s],(width/2)+c+21,2);
    c += t+5;
  }
}//display
