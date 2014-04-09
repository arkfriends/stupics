PrintWriter output;

PicList plist;
int count;

void setup()
{
  output = createWriter("coloranalysis.txt"); 
  plist = new PicList();
  frameRate(1);
  size(1000, 600);
  count = 0;
}

void draw()
{
  if (plist.morePics())
  {
    PImage img = plist.nextPic();
    Cluster cl = new Cluster(img,count);
    count = count+ 1;
  }
  else
    noLoop();
    output.flush(); // Writes the remaining data to the temp file
    output.close();
}


