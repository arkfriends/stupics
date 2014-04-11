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
    Cluster cl = new Cluster(img,mask);
    image(cl.showPic(),100 * count, 0);
    fill(0,102,153);
    text(plist.picName(),5+100 * count,130);
    image(cl.showRGB(),100 * count, 130);
    image(cl.showHSB(),100 * count, 260);
    image(cl.showMask(),100 * count, 390);
    count++;
  }

//  output.flush(); // Writes the remaining data to the temp file
//  output.close();
  noLoop();
}

