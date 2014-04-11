class PicList
{
  String[] filenames = { "a","b","c"};
  int currentPic;

  PicList()
  {
    java.io.File folder = new java.io.File(dataPath(""));
 
    java.io.FilenameFilter jpgFilter = new java.io.FilenameFilter() {
        boolean accept(File dir, String name) {
          return name.toLowerCase().endsWith(".jpg");
        }
    };
    filenames = folder.list(jpgFilter);
    currentPic = 0;
  } 
 
 boolean morePics()
 {
      if (currentPic < filenames.length)
         return(true);
      else
         return(false);
 }
          
 
 PImage nextPic()
 {
   if (morePics())
   {
       print("Processing: ");
       println(filenames[currentPic]);
       PImage img;
       img = loadImage(filenames[currentPic]);
       currentPic++;
       return(img); 
   }
   else
   {   return(null); }
 }
 
 String picName()
 {
   String[] name = split(filenames[currentPic-1],".jpg");
   return(name[0]);
 }
 
 PImage picMask()
 {
   String filename = picName() + ".png";
    PImage img;
    img = loadImage(filename);
    return(img);
 }   
}



