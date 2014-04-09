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
    line(80+160*pcnt, 500,60+160*pcnt,490); // s
    stroke(200,100,100);
    line(80+160*pcnt, 500,100+160*pcnt,490);  // b
    stroke(100,200,100);
     line(80+160*pcnt, 500,80+160*pcnt,460); // h
    
    for (int xx= pcnt * 160; xx < pcnt * 160 + img.width; xx++)
       for (int yy = 0; yy < img.height; yy++)
       {
         
         // Plotting RGB Datapoints
         color c = get(xx,yy);
         float xr = red(c);
         float xb = green(c);
         float xg = blue(c);
         stroke(c);
         point(int(80 -.2*xg +.2*xr+160*pcnt),int(350 -.2*xg -.2*xr -.15*xb));
         
         // Plotting HSB Datapoints
         float yh = hue(c);
         float yb = brightness(c);
         float ys = saturation(c);
         stroke(c);
         point(int(80-.2*ys+.2*yh+160*pcnt),int(500-.1*ys -.1*yh -.2*yb)); 
         output.println(str(pcnt) + ", " + xx + ","+ yy +", "+
	       xr +"," + xg + "," + xb + ", " +
	       yh +"," + yb + "," + ys );
	 
       }
  }
}
