// PrintWriter output;

PicList plist;
int count;

void setup()
{
//  output = createWriter("data/coloranalysis.txt"); 
  plist = new PicList();
  frameRate(1);
  size(1000, 600);
  count = 0;
  
  while (plist.morePics())
  {
    PImage img = plist.nextPic();
    PImage mask = plist.picMask();
    ColorStudy cl = new ColorStudy(img,mask);
    image(cl.showPic(),100 * count, 0);
    fill(0,102,153);
    text(plist.picName(),5+100 * count,130);
    image(cl.showHSB(),100 * count, 220);
    image(cl.showRGB(),100 * count, 120);
//    test the hand drawn mask
//    image(cl.showMask(),100 * count, 340);
// Demonstrate that the mask works: 
//  Mask colors:  red = face green=tie, black = hair; white = shirt
    image(cl.show(cl.extractFeature(color(0,0,0))),100* count,340);
    image(cl.show(cl.extractFeature(color(255,255,0))),100* count,335);
    image(cl.show(cl.extractFeature(color(255,0,255))),100* count,345);
    image(cl.show(cl.extractFeature(color(0,255,0))),100* count,390);
    image(cl.show(cl.extractFeature(color(255,0,0))),100* count,390);
    count++;
  }

//  output.flush(); // Writes the remaining data to the temp file
//  output.close();
  noLoop();
}

