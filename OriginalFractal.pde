float rot = 0;
int length = 1500;
public void setup() {
  //noFill();
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
}

public void draw() {
  background(0, 0, 0);
  pushMatrix();
  fractal(length, PI/2+rot);
  popMatrix();
  rot +=0.02;
  length += 20;
  if(length >= 5000) {
    length = 2222;
  }
}

public void fractal(int len, double offset) {
  if(len < 30) {
    pushMatrix();
    translate(500,500);
    rotate((float)offset);
    for(int i = 0; i < 6; i++) {
    petal(0, 0, 150, 45);
    rotate(PI/3);
    }
    popMatrix();
  } else {
    pushMatrix();
    translate(500,500);
    rotate((float)offset);
    fill((int)(Math.log(len)*40), 90, 80, 80);
    for(int i = 0; i < 6; i++) {
    petal(0, 0, len, 45);
    rotate(PI/3);
    }
    popMatrix();
    fractal(2*len/3, offset+PI/6);
  }
}

public void petal(int x, int y, int len, double angle) {
  int endX = (int)(len * Math.cos(angle));
  int endY = (int)(len * Math.sin(angle));
  float bPtX1 = (float)((endX-x)/3*Math.cos(PI/6));
  float bPtY1 = (float)((endY-y)/3*Math.sin(PI/9));
  float bPtX2 = (float)(2*(endX-x)/3*Math.cos(PI/9));
  float bPtY2 = (float)(2*(endY-y)/3*Math.sin(2*PI/9));
  float bPtX3 = (float)(2*(endX-x)/3*Math.cos(5*PI/9));
  float bPtY3 = (float)(2*(endY-y)/3*Math.sin(8*PI/9));
  float bPtX4 = (float)((endX-x)/3*Math.cos(3*PI/6));
  float bPtY4 = (float)((endY-y)/3*Math.sin(PI));
  beginShape();
  vertex(x, y);
  bezierVertex(x+bPtX1, y+bPtY1, x+bPtX2, y+bPtY2,endX, endY);
  bezierVertex(x+bPtX3, y+bPtY3, x+bPtX4, y+bPtY4, x, y);
  endShape();
  
}
