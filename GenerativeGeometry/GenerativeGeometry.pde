import controlP5.*;
import processing.pdf.*;
import java.util.Calendar;

/* variables */
//----- polygon -----//
Polygon polygon;
int polyNum = 12;
int wr = 500, hr = 500;
float rotation = 1.0;
float connectionAlpha = 500;
float lineWeight = 1.0;
float minConnRadius = 0, maxConnRadius = 200;
boolean isCircle = true;

//----- control P5 -----//
ControlP5 controlP5;

boolean GUI = false;
boolean guiEvent = false;
boolean showGUI = false, isHideGUI = false;

Slider[] sliders;
Toggle[] toggles;
Range[] ranges;
Textfield[] texts;

//----- Image output -----//
boolean savePDF = false, isEndRecord = false;
boolean saveOneFrame = false;
int qualityFactor = 3;


void setup() {
  size(1000, 1000);
  frameRate(60);
  //noLoop();
  background(0);
  noFill();
  smooth();


  setupGUI();
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
  background(0);

  polygon = new Polygon(polyNum, width/2, height/2, wr, hr, radians(rotation));
  
  polygon.connectionAlpha = this.connectionAlpha;
  polygon.lineWeight = this.lineWeight;
  polygon.minConnRadius = this.minConnRadius;
  polygon.maxConnRadius = this.maxConnRadius;
  polygon.isCircle = this.isCircle;
  
  polygon.drawPolygon();
  
  // image output
  if(savePDF == true) {
    endRecord();
    savePDF = false;
  }
}

void mousePressed() {
}

void keyReleased() {
  /* Save frame */
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); // save as .png image
  if (key=='p' || key == 'P') savePDF = true;

  /* GUI */
  //if (key=='m' || key=='M') { // show/hide menu
  //  showGUI = controlP5.getGroup("menu").isOpen();
  //  showGUI = !showGUI;
  //}

  //if (showGUI) controlP5.getGroup("menu").open();
  //else controlP5.getGroup("menu").close();

  //if (key=='h' || key=='H') {
  //  isHideGUI = !isHideGUI;
  //}

  //if (isHideGUI) hideGUI();
  //else drawGUI();
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
