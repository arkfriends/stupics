class  Cluster
{
  PImage myimg;
  
  Cluster(PImage img)
  {
    myimg = img;
  }
  
  PImage makegray(PImage img)
  {
     for (int xx= 0; xx < img.width; xx++)
       for (int yy = 0; yy < img.height; yy++)
           img.set(xx,yy,color(50,50,50));
     return(img);
  }
  
  PImage showpic()
  {          // Plotting picture
    float scale = 100.0 /myimg.width ;
    PImage newimg = createImage(100, int(myimg.height * scale), RGB);
    
    for (int xx= 0; xx < myimg.width; xx++)
    {
      float nx = scale * xx; 
      for (int yy = 0; yy < myimg.height; yy++)
       {
         color c = myimg.get(xx,yy);
         float ny = scale * yy;
         newimg.set(int(nx),int(ny),c);
       }
    }
    return(newimg);    
  }
  
  
  PImage showRGB()
  {          // Plotting RGB scatterplot
    float scale = 100.0 /myimg.width ;
    PImage newimg = createImage(100, int(myimg.height * scale), RGB);

    // Gray background
    for (int xx= 0; xx < newimg.width; xx++)
       for (int yy = 0; yy < newimg.height; yy++)
           newimg.set(xx,yy,color(204,204,204));

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
    PImage newimg = createImage(100, int(myimg.height * scale), RGB);
  
    
    // Gray background
    for (int xx= 0; xx < newimg.width; xx++)
       for (int yy = 0; yy < newimg.height; yy++)
           newimg.set(xx,yy,color(204,204,204));
    
     // HSB axis
     
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
}
