
PicList plist;
int count;

void setup()
{
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
    Cluster cl = new Cluster(img,count++);
  }
  else
    noLoop();
}


