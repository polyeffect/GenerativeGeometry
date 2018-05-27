class Polygon {
  int n;
  float cx, cy, w, h, sa;

  float lineWeight = 1.0;
  color lineColor = color(255);
  //color lineColor = color(0, 150, 184);
  float lineAlpha = 120;
  float connectionAlpha = 500;
  float minConnRadius, maxConnRadius;
  float connectionRamp = 6;

  PVector[] polygonPoints = new PVector[0];

  boolean isCircle = true;

  Polygon(int _n, float _cx, float _cy, float _w, float _h, float _sa) {
    this.n = _n;
    this.cx = _cx;
    this.cy = _cy;
    this.w = _w;
    this.h = _h;
    this.sa = _sa;

    calculatePolugonPoints();
  }

  void calculatePolugonPoints() {
    polygonPoints = new PVector[n];

    float angle = TWO_PI / n;

    w = w / 2.0;
    h = h / 2.0;

    //beginShape();
    for (int i = 0; i < n; i++) {
      float x = cx + w * cos(sa + angle * i);
      float y = cy + h * sin(sa + angle * i);

      //vertex(x, y);

      polygonPoints[i] = new PVector(x, y);
    }
    //endShape(CLOSE);
  }

  void drawPolygon() {
    float d, a;

    strokeWeight(lineWeight);
    strokeCap(ROUND);

    for (int i = 0; i < polygonPoints.length; i++) {
      for (int j = 0; j < i; j++) {
        PVector p1 = polygonPoints[i];
        PVector p2 = polygonPoints[j];

        d = PVector.dist(p1, p2);
        a = pow(1/(d/connectionAlpha+1), 1);

        if (minConnRadius < d && d <= maxConnRadius) {
          stroke(lineColor, a*lineAlpha);
          line(p1.x, p1.y, p2.x, p2.y);
        }
      }
    }
    
    if(isCircle) ellipse(cx, cy, w*2, h*2);
    
  }
}
