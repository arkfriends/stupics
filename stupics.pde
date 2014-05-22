PicList plist;
PrintWriter output;   
int count;

void setup()
{
  output = createWriter("data/coloranalysis.csv");  
  plist = new PicList();
  frameRate(1);
  size(1000, 600);
  count = 0;
  
  while (plist.morePics())
  {
    ColorStudy cl = new ColorStudy(count, 
                       plist.nextPic(), plist.picMask(),
                       plist.picName());
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
    cl.saveData();
    count++;
  }

  output.flush(); // Writes the remaining data to the file
  output.close();
  noLoop();
}

