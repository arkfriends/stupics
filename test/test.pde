PImage img;

void setup() {
  size(400,400);
  img = loadImage("rock.jpg");
   image(img, 0, 0);
}

void draw() {
   rect(0,0,20,20);
}
