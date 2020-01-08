class TrackedObject {
  color rectCol;
  color textCol;

  String text;

  int locX = height;
  int locY = width;
  float angle=0;
  int size=60;
  int rad=10;

TrackedObject(String t) {

  rectCol=color(255);
  textCol=color(10);

  text=t;
}

void draw() {
  fill(rectCol);
  noStroke();

  pushMatrix();
  translate(locX, locY);
  rotate(angle);
  ellipse(0, 0, size, size);
  popMatrix();

  fill(textCol);
  text(text, locX, locY);
}

void setPos(int x, int y) {
  locX=x; 
  locY=y;
}

public int getX(int x) {
  return x;
}

public int getY(int y) {
  return y;
}


void shiftPos(int dx, int dy) {
  locX+=dx; 
  locY+=dy;
}

void setAngle(float a) {
  angle=a;
}

void setValue(String v) {
  text = v;
}
}