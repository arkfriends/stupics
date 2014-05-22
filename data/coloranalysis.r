# Color analysis: R statistical analysis
#########################################
# Copy this to the R environment
# setwd("d:/gitprojects/stupics/data")
# setwd("d:/git/stupics/data")
#
# Run with
# source("coloranalysis.r")
#############################
dat = read.csv("coloranalysis.csv", header = TRUE)
dat$pic = as.numeric(dat$pic)
dat$x = as.numeric(dat$x)
dat$y = as.numeric(dat$y)
dat$r = as.numeric(dat$r)
dat$g = as.numeric(dat$g)
dat$b = as.numeric(dat$b)
dat$h = as.numeric(dat$h)
dat$s = as.numeric(dat$s)
dat$v = as.numeric(dat$v)
dat$feature = as.numeric(dat$feature)
str(dat)
summary(dat)

labs = c("bgnd", "shrt", "hair", "face", "tie",
         "lips",  "eyes")
clabs = c("Red", "Green", "Blue","Hue","Saturation","Brightness")
# colors = rainbow(7)
colors = c("#CC0000CC","#CC6600CC",
           "#ccCC00CC","#009900CC",
           "#00CCCCCC", "#0000CCCC",
           "#6600CCCC", "#CC00CCCC")

for (cc in 1:6)
{
  pdf(file=paste(clabs[cc],".pdf",sep=""))
  plot(0,0,type="b",xlim=c(0,255),ylim=c(0,1.2),
       col="gray",main=paste("Distribution of", clabs[cc], "Intensities"),
       xlab=paste(clabs[cc]," intensity (0-255)"),
       ylab="Frequency")
  
 
  for(f in 1:7)
  {
    cat(f)
    dat2 = dat[dat$feature == f,]
    

      for(z in 1:10)
      {
        dat3 = dat2[dat2$pic == z,]
        
        if(length(dat3$r) > 0)
        {   
      
      if (cc == 1)
      { h1 = hist(dat3$r,plot = FALSE, breaks=20);}
      else if (cc == 2)
      { h1 = hist(dat3$g,plot = FALSE,breaks=20);}
      else if (cc == 3)
      { h1 = hist(dat3$b,plot = FALSE,breaks=20);}
      else if (cc == 4)
      { h1 = hist(dat3$h,plot = FALSE, breaks=20);}
      else if (cc == 5)
      { h1 = hist(dat3$s,plot = FALSE,breaks=20);}
      else if (cc == 6)
      { h1 = hist(dat3$v,plot = FALSE,breaks=20);}
      
      l = length(h1$counts)
      y = h1$counts
      x = h1$mids

      x[l + 1] = (2 * x[l]) - x[l - 1]
      if (cc == 6)
      { 
        if (x[l+1] > 250)
        {  y[l + 1] = y[1]; }
        else
        {  y[l + 1] = 0; }
      }
      else
      {  y[l + 1] = 0 }
      
      total = max(y)
      lines(x,y/total,col=colors[f],lwd=3)
      points(x,y/total,col=colors[f],lwd=3,
             pch=(c(13,14,15,16,17,18,19,20,21)[f]))
    }
    }
  }
  legend(50,1.2,labs,fill=colors[1:7],ncol=4)
  dev.off()
}
