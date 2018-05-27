void setupGUI() {
  controlP5 = new ControlP5(this);
  
  color activeColor = color(52, 95, 95);
  color foregroundColor = color(37, 89, 50);
  color captionTextColor = color(0, 0, 0);
  color valueTextColor = color(0, 0, 100);
  controlP5 = new ControlP5(this);

  // set color
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(100));
  controlP5.setColorForeground(foregroundColor);
  controlP5.setColorCaptionLabel(captionTextColor);
  controlP5.setColorValueLabel(valueTextColor);
  
  ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
  ctrl.setColorLabel(color(255));
  ctrl.close();
  
  sliders = new Slider[10];
  ranges = new Range[10];
  toggles = new Toggle[10];
  texts = new Textfield[10];

  int left = 0;
  int top = 5;
  int len = 300;
  int hei = 15;

  int si = 0;
  int ri = 0;
  int ti = 0;
  int fi = 0;
  int posY = 0;
  
  toggles[ti] = controlP5.addToggle("isCircle", isCircle, left+0, top+posY, 15, 15);
  toggles[ti++].setLabel("Draw Circle");
  sliders[si++] = controlP5.addSlider("polyNumSlider", 0, 100, left, top+posY+20, len, 15);
  texts[fi++] = controlP5.addTextfield("polyNumText", 0, top+posY+40, 50, 15);
  sliders[si++] = controlP5.addSlider("connectionAlpha", 0, 1000, left, top+posY+60, len, 15);
  sliders[si++] = controlP5.addSlider("lineWeight", 0, 2.0, left, top+posY+80, len, 15);
  sliders[si++] = controlP5.addSlider("wr", 0, 700, left, top+posY+100, len, 15);
  sliders[si++] = controlP5.addSlider("hr", 0, 700, left, top+posY+120, len, 15);
  ranges[ri++] = controlP5.addRange("ConnectRange", 0, 1000, minConnRadius, maxConnRadius, left, top+posY+140, len, 15);
  sliders[si++] = controlP5.addSlider("rotation", 0, 360, left, top+posY+160, len, 15);
  
  
  for (int i = 0; i < ti; i++) {
    toggles[i].setGroup(ctrl);
    toggles[i].setColorCaptionLabel(color(50));
    toggles[i].getCaptionLabel().getStyle().padding(4, 3, 3, 3);
    toggles[i].getCaptionLabel().getStyle().marginTop = -19;
    toggles[i].getCaptionLabel().getStyle().marginLeft = 18;
    toggles[i].getCaptionLabel().getStyle().marginRight = 5;
    toggles[i].getCaptionLabel().setColorBackground(0xFFffffff);
  }
  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].setId(i);
    sliders[i].getCaptionLabel().toUpperCase(true);
    sliders[i].getCaptionLabel().getStyle().padding(4, 3, 3, 3);
    sliders[i].getCaptionLabel().getStyle().marginTop = -4;
    sliders[i].getCaptionLabel().getStyle().marginLeft = 0;
    sliders[i].getCaptionLabel().getStyle().marginRight = -14;
    sliders[i].getCaptionLabel().setColorBackground(0xFFFFFFFF);
  }
  
  for (int i = 0; i < ri; i++) {
    ranges[i].setGroup(ctrl);
    ranges[i].getCaptionLabel().toUpperCase(true);
    ranges[i].getCaptionLabel().getStyle().padding(4, 3, 3, 3);
    ranges[i].getCaptionLabel().getStyle().marginTop = -4;
    ranges[i].getCaptionLabel().setColorBackground(0xFFFFFFFF);
  }
  
  for (int i = 0; i < fi; i++) {
    texts[i].setGroup(ctrl);
    texts[i].getCaptionLabel().toUpperCase(true);
    texts[i].getCaptionLabel().getStyle().padding(4, 3, 3, 3);
    texts[i].getCaptionLabel().getStyle().marginTop = -20;
    texts[i].getCaptionLabel().getStyle().marginLeft = 55;
    texts[i].getCaptionLabel().setColorBackground(0xFFFFFFFF);
  }
}

void drawGUI() {
  controlP5.show();
  controlP5.draw();
}

void hideGUI() {
  controlP5.hide();
}

public void polyNumSlider(int theValue) {
  polyNum = theValue;
  Textfield txt = ((Textfield)controlP5.getController("polyNumText"));
  txt.setValue(""+theValue);
}

public void polyNumText(String theValue) {
  int newVal = int(trim(theValue));
  println("text input: ", newVal);
  polyNum = newVal;
  Slider slider = ((Slider)controlP5.getController("polyNumSlider"));
  slider.setValue(newVal);
}

void controlEvent(ControlEvent theControlEvent) {
  guiEvent = true;

  //GUI = controlP5.getGroup("menu").isOpen();

  if (theControlEvent.isController()) {
    if (theControlEvent.getController().getName().equals("ConnectRange")) {
      float[] f = theControlEvent.getController().getArrayValue();
      minConnRadius = f[0];
      maxConnRadius = f[1];
    }
  }
}
