int s = 5; //displacement s
int xCoordinate =  200; //xCoordinate of circle
int yCoordinate =  390; //yCoordinate of circle
color colour;

void setup() {
  size(400, 400);
}

void draw() {
  drawEllipse();
  drawFinishLine();
  drawPath();
  checkOutOfBounds();
}

void drawEllipse() {//draws red dot,checks if  game is completed and creates a border
  noStroke();
  background(252);
  fill(255, 0, 0);
  ellipse(xCoordinate, yCoordinate, 10, 10);
  if (yCoordinate>400) {   //bottom border
    yCoordinate=yCoordinate-15;
  }

  if (yCoordinate<15) {//ends game when the dot "crosses" finish line
    exit();
  }
}

void checkOutOfBounds() {
  colour = checkColour(); //colour = return of checkColour
  boolean outOfBounds = false;
  if (colour == (-16777216)) { //check if x and y Coords are black
    outOfBounds = true;
  }
  if (outOfBounds == true) {//resets the location of dot when it touches of  black wall
    reset();
  }
}

void drawPath() { //draws path
  fill(0);
  rect(0, 0, 190, 100);
  rect(210, 0, width, 80);
  rect(0, 100, 350, 100);
  rect(370, 80, width, height);
  rect(0, 200, 100, 100);
  rect(120, 220, width, 80);
  rect(0, 100, 100, height);
  rect(100, 320, 90, height);
  rect(210, 300, width, height);
}

void drawFinishLine() {
  noStroke();
  for (int i=0; i < 4; i++)
  {
    for (int j=47; j<53; j++)
    {
      if ((i + j + 1) % 2 == 0)
        fill(255);
      else
        fill(0);
      rect(j*4, i*4, 4, 4);
    }
  }
}  

void reset() { //set ellipse position back to start
  xCoordinate = 200;
  yCoordinate = 390;
}

color checkColour() {//return color to variable colour
  colour = get(xCoordinate, yCoordinate);
  print(colour);
  return colour;
}

void keyPressed() {   //Movement of ellipse up,down,left,right
  if (keyCode==UP) {
    yCoordinate=yCoordinate-s;
  } else if (keyCode==DOWN) {
    yCoordinate=yCoordinate+s;
  } else if (keyCode==RIGHT) {
    xCoordinate=xCoordinate+s;
  } else if (keyCode==LEFT) {
    xCoordinate=xCoordinate-s;
  }
}
