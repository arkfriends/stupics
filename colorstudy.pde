class ColorStudy
{
  PImage myimg;
  PImage mymask;
  
  ColorStudy(PImage img)
  {
    myimg = img;
    mymask = myimg;
  }
  
  ColorStudy(PImage img, PImage mask)
  {
    myimg = img;
    mymask = mask;
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
    PImage newimg = createImage(100, int(img.height * scale), RGB);

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
  
  void saveData(PImage img, String feature)
  {
    PrintWriter output;
    output = createWriter(feature + ".txt"); 

   output.println(feature);  // Write the coordinate to the file

  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  }
}
