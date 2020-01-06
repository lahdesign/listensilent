import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape shp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(1000,600);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  shp = RG.loadShape("listen_silent.svg");
  shp = RG.centerIn(shp, g);
  // Enable smoothing
  smooth();
}

void draw(){
  // Clean frame
  background(0);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  // Draw the group of shapes
  fill(255);
  stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  shp.draw();
  
  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  points = shp.getPoints();
  strokeJoin(BEVEL);
  
  // If there are any points
  if(points != null){
    //noFill();
    stroke(255, 255, 255);
    beginShape();
    for(int i=0; i<points.length/2; i++){
      strokeWeight(.1);
      vertex(points[i].x, points[i].y);
      vertex(points[i+points.length/2].x, points[i+points.length/2].y);
    }
    endShape();
  
    fill(0);
    stroke(0);
    strokeWeight(1);
    for(int i=0; i<points.length; i++){
      ellipse(points[i].x, points[i].y,5,5);  
    }
  }
}
