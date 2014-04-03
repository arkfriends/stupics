class  Cluster
{
  
  Cluster(PImage img, int pcnt)
  {
    // Picture
    image(img,pcnt * 160, 0);
    
    // RGB axis
    stroke(100,100,200);
    line(80+160*pcnt, 350,55+160*pcnt,330);
    stroke(200,100,100);
    line(80+160*pcnt, 350,105+160*pcnt,330); 
    stroke(100,200,100);
     line(80+160*pcnt, 350,80+160*pcnt,300); 
   
     // HSB axis
    stroke(100,100,200);
    line(80+160*pcnt, 500,60+160*pcnt,480);
    stroke(200,100,100);
    line(80+160*pcnt, 500,100+160*pcnt,480); 
    stroke(100,200,100);
     line(80+160*pcnt, 500,80+160*pcnt,460); 
    
    for (int xx=pcnt * 160; xx < pcnt * 160 + img.width; xx++)
       for (int yy = 0; yy < img.height; yy++)
       {
         
         // Plotting RGB Datapoints
         color c = get(xx,yy);
         float x = red(c);
         float y = green(c);
         float z = blue(c);
         stroke(c);
         point(int(80 -.2*z +.2*x+160*pcnt),int(350 -.2*z -.2*x -.15*y));
         
         // Plotting HSB Datapoints
         y = hue(c);
         y = brightness(c);
         z = saturation(c);
         stroke(c);
         point(int(80-.2*z+.2*x+160*pcnt),int(500-.2*z -.2*x -.2*y)); 
       }
  }
}
