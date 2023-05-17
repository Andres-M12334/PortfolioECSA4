// Andres Montano | april 17th | Etch A Sketch

int x, y;
PImage pic;

void setup() {
  size(800, 658);
  x = width/2;
  y = height/2;
  background(128);
  pic = loadImage ("Etch.png");
}

void draw() {
  //background(#FFA0F6)
   image(pic,0,0);
  strokeWeight(int(random(2,10)));
  fill(int(random(50,200)),int(random(50,200)),int(random(50,200)));
}

void mousePressed() {
  saveFrame("line=######.png");
}

void keyPressed() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      moveUp(7);
    } else if (key == 's' || key == 'S') {
      moveDown(7);
    } else if (key == 'a' || key == 'A') {
      moveLeft(7);
    } else if (key == 'd' || key == 'D') {
      moveRight(7);
    }
  }
}

void moveRight(int rep) {
  for (int i=0; i<rep; i = i+1) {
    point(x+i, y);
  }
  x = x + rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i = i+1) {
    point(x-i, y);
  }
    x = x - rep;
}
void moveUp(int rep) {
  for (int i=0; i<rep; i = i+1) {
    point(x, y-i);
  }
    y = y-rep;
}
void moveDown(int rep) {
  for (int i=0; i<rep; i = i+1) {
    point(x, y+i);
  }
    y = y+ rep;
}
