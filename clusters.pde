class  Cluster
{
  
  Cluster(PImage img, int pcnt)
  {
   
    // RGB axis
    stroke(100,100,200);
    line(60+100*pcnt, 350,35+100*pcnt,330);
    stroke(200,100,100);
    line(60+100*pcnt, 350,85+100*pcnt,330); 
    stroke(100,200,100);
     line(60+100*pcnt, 350,60+100*pcnt,300); 
   
     // HSB axis
    stroke(100,100,200);
    line(60+100*pcnt, 500,20+100*pcnt,480);
    stroke(200,100,100);
    line(60+100*pcnt, 500,60+100*pcnt,480); 
    stroke(100,200,100);
     line(60+100*pcnt, 500,60+100*pcnt,460); 
    
    for (int xx= 0; xx < img.width; xx++)
       for (int yy = 0; yy < img.height; yy++)
       {
         
         // Plotting picture
         color c = img.get(xx,yy);
         float scale = 100.0 /img.width ;
         float nx = (100 * pcnt) + (xx * scale); 
         float ny = scale * yy;
         stroke(c);
         point(int(nx),int(ny));
         
         // Plotting RGB
         float xr = red(c);
         float xg = green(c);
         float xb = blue(c);
         point(int(60 -.2*xb +.2*xr+100*pcnt),int(350 -.2*xb -.2*xr -.15*xg));
         
         // Plotting HSB Datapoints
         float yh = hue(c);
         float yb = brightness(c);
         float ys = saturation(c);
         stroke(c);
         point(int(60-.2*ys+.2*yh+100*pcnt),int(500-.2*ys -.2*yh -.2*yb)); 
       }
  }
}
