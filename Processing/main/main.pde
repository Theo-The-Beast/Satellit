JSONObject json;
JSONObject jay;

float angle;

Table table;
JSONArray values;

float r = 200;
float r2 = 50;

PImage earth;
PShape globe;
PShape Satellite;

float lat = -27.13784779;
float lon = -54.90529274;
float mag = 420;



void setup() {
  size(600, 600, P3D);
  earth = loadImage("earth.jpg");
  satellite();

  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);
  
   json = new JSONObject();
   json = loadJSONObject("https://www.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=DXTH2L-SQC8H5-PN6KMB-4KGP");
   
   

 //saveJSONArray(values, "data/new.json");
  
}



void draw() {
      background(51);
      textSize(30);
      text("Satellit: ISS DEB",20,40);
      textSize(20);
      text("Tryk på <- -> for at rotere kloden",150,580);

        translate((float) (width*0.5), (float)(height*0.5));

        rotateY(angle);



        lights();

        fill(200);

        noStroke();

        //sphere(r);

        shape(globe);

 

 tegnsatellit(json); 



  if (keyPressed && keyCode == RIGHT) {
    angle += 0.05;
  }
  if (keyPressed && keyCode == LEFT) {
    angle -= 0.05;
  }
  
}
  void tegnsatellit(JSONObject jay){
    
   JSONArray positions = json.getJSONArray("positions");

        JSONObject o = positions.getJSONObject(0);

        float lat = o.getFloat("satlatitude");

        float lon = o.getFloat("satlongitude");

        float theta = radians(lat);

        float phi = radians(lon) + PI;

        float x = r*1.3 * cos(theta) * cos(phi)-40;

        float y = -r*1.3 * sin(theta);

        float z = -r*1.3 * cos(theta) * sin(phi);

        PVector pos = new PVector(x, y, z);

        PVector xaxis = new PVector(1, 0, 0);

        float angleb = PVector.angleBetween(xaxis, pos);

        PVector raxis = xaxis.cross(pos);



    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    fill(255);
    box(10, 10, 10);
    popMatrix();
  
}



void satellite() {

 // translate(, ,);
  Satellite = createShape(SPHERE, r2);
}
