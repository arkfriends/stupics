// Color analysis of an image with a corresponding mask to 
// identify the following key features of the image:
// ID  Desc,  Mask rgb
// -------------------------------------------------
// 1, "bgnd",  0,0,255
// 2, "shrt",  255,255,255
// 3, "hair",  0,0,0
// 4, "face",  255,0,0
// 5, "tie",   0,255,0
// 6, "lips",  255,255,0
// 7, "eyes",  255,0,255
///////////////////////////////////////////////////  

class ColorStudy
{
  PImage myimg;
  PImage mymask;
  String myname;
  Integer myID;
  
  ColorStudy(PImage img)
  {
    myimg = img;
    mymask = myimg;
    myname = "????";
    myID = -1;
  }
  
  ColorStudy(PImage img, PImage mask)
  {
    myimg = img;
    mymask = mask;
    myname = "????";
    myID = -1;
  }  
  
  ColorStudy(Integer picnumber, PImage img, PImage mask, String name)
  {
    myimg = img;
    mymask = mask;
    myname = name;
    myID = picnumber;
  } 
  
  PImage makegray(PImage img)
  {
     for (int xx= 0; xx < img.width; xx++)
       for (int yy = 0; yy < img.height; yy++)
           img.set(xx,yy,color(204,204,204,1));

     return(img);
  }
  
  PImage showPic()
  {
     return(show(myimg));
  }
  
  PImage showMask()
  {
    return(show(mymask));
  }
  
  PImage show(PImage img)
  {
    // Plotting picture
    float scale = 100.0 /img.width ;
    PImage newimg = makegray(createImage(100, int(img.height * scale), ARGB));

    for (int xx= 0; xx < img.width; xx++)
    {
      float nx = scale * xx; 
      for (int yy = 0; yy < img.height; yy++)
       {
         color c = img.get(xx,yy);
        
         float ny = scale * yy;
         newimg.set(int(nx),int(ny),c);
       }
    }
    return(newimg);    
  }
  
  
  
  PImage showRGB()
  {          // Plotting RGB scatterplot
    float scale = 100.0 /myimg.width ;
    PImage newimg = makegray(createImage(100, int(myimg.height * scale), ARGB));

    // RGB axis
    for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(.15*PI)), 
           int(newimg.height - i * sin(.15*PI)),
           color(0,0,250));
           
    for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(.5*PI)), 
           int(newimg.height - i * sin(.5*PI)),
           color(0,250,0));
           
    for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(.95*PI)), 
           int(newimg.height - i * sin(.95*PI)),
           color(250,0,0)); 

    for (int xx= 0; xx < myimg.width; xx++)
       for (int yy = 0; yy < myimg.height; yy++)
       {
         
         color c = myimg.get(xx,yy);
         
         float xr = red(c)/4.0;
         float xg = green(c)/4.0;
         float xb = blue(c)/4.0;
         newimg.set(int(50 + xr*cos(.95*PI) + xg *cos(.5*PI) + xb*cos(.15*PI)),
          int(newimg.height -xr*sin(.95*PI) - xg *sin(.5*PI) - xb*sin(.15*PI)), c);
       }  

    return(newimg);
  }
  
  PImage showHSB()
  {          // Plotting RGB scatterplot
    float scale = 100.0 /myimg.width ;
    PImage newimg = makegray(createImage(100, int(myimg.height * scale), ARGB));
     
   for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(0.15*PI)), 
           int(newimg.height - i * sin(0.15*PI)),
           color(0,0,250));
           
    for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(.5*PI)), 
           int(newimg.height - i * sin(.5*PI)),
           color(0,250,0));
           
    for (int i = 0; i < 50; i++)
      newimg.set(int(50.0 + i * cos(.95*PI)), 
           int(newimg.height - i * sin(.95*PI)),
           color(250,0,0)); 
               
    for (int xx= 0; xx < myimg.width; xx++)
       for (int yy = 0; yy < myimg.height; yy++)
       {
         color c = myimg.get(xx,yy);
         
         // Plotting HSB Datapoints
         float yh = hue(c)/4;
         float yb = brightness(c)/4;
         float ys = saturation(c)/4;
         newimg.set(int(50 + ys*cos(.95*PI) + yb *cos(.5*PI) + yh*cos(.15*PI)),
          int(newimg.height -ys*sin(.95*PI) - yb *sin(.5*PI) - yh*sin(.15*PI)), c);
       }
    return(newimg);
  }  
  
  PImage extractFeature(color maskColor)
  {
     PImage newimg = makegray(createImage(myimg.width, myimg.height, ARGB));
    
    for (int xx= 0; xx < newimg.width; xx++)
       for (int yy = 0; yy < newimg.height; yy++)
           if (mymask.get(xx,yy) == maskColor)
           {
              newimg.set(xx,yy,myimg.get(xx,yy));
           }         
    return(newimg);
  }
  
  void saveData()
  {
    Integer feature = 0;
    output.println("pic,x,y,r,g,b,h,s,v,feature");
    for (int xx= 0; xx < myimg.width; xx++)
       for (int yy = 0; yy < myimg.height; yy++)
       {
             color f = mymask.get(xx,yy);
   
  // "bgnd", "shrt", "hair", "face", "tie",  "lips",  "eyes"
  
              if ( f == color(0,0,255))
              { feature = 1; }
              else if ( f == color(255,255,255))
              { feature = 2; }
              else if ( f == color(0,0,0))
              { feature = 3; }
              else if ( f == color(255,0,0))
              { feature = 4; }
              else if ( f == color(0,255,0))
              { feature = 5; }
              else if ( f == color(255,255,0))
              { feature = 6; }
              else if ( f == color(255,0,255))
              { feature = 7; }
              else 
              { feature = 0; }
              
              if (feature > 0)
              {
                color c = myimg.get(xx,yy);
                output.print(myID); 
                output.print(",");
                output.print(xx); 
                output.print(",");
                output.print(yy); 
                output.print(",");
                output.print(int(red(c)));
                output.print(",");
                output.print(int(green(c)));
                output.print(",");
                output.print(int(blue(c)));
                output.print(",");
                output.print(int(hue(c))); 
                output.print(",");
                output.print(int(saturation(c))); 
                output.print(",");
                output.print(int(brightness(c))); 
                output.print(",");
                output.println(feature); 
              }
           }            
  }
}
