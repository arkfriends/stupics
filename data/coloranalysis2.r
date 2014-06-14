# Color analysis: R statistical analysis
#########################################
# Copy this to the R environment
# setwd("d:/gitprojects/stupics/data")
setwd("d:/git/stupics/data")
#
# Run with
# source("coloranalysis.r")
#############################
dat = read.csv("coloranalysis.csv", header = TRUE, stringsAsFactors=FALSE)

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
  max = 0
  
  for(f in 1:7)
  {
    dat2 = dat[dat$feature == f,]
    
    
      if (cc == 1)
      { h1 = hist(dat2$r,plot = FALSE, breaks=seq(0,255,3));}
      else if (cc == 2)
      { h1 = hist(dat2$g,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 3)
      { h1 = hist(dat2$b,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 4)
      { h1 = hist(dat2$h,plot = FALSE, breaks=seq(0,255,3));}
      else if (cc == 5)
      { h1 = hist(dat2$s,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 6)
      { h1 = hist(dat2$v,plot = FALSE,breaks=seq(0,255,3));}
      
      m = max(h1$counts) / sum(h1$counts)
      if(m > max)
      { max = m; }  
  }
    
 #png(file=paste(clabs[cc],".png",sep=""))
  # plot(0,0,type="b",xlim=c(0,255),ylim=c(0,1.2*max),
  #     col="gray",main=paste("Distribution of", clabs[cc], "Intensities"),
  #     xlab=paste(clabs[cc]," intensity (0-255)"),
  #     ylab="Frequency")
  
#  legend(50,1.2*max,labs,fill=colors[1:7],ncol=4)
  
 
  for(f in 1:7)
  {
    # cat(f,"\n")
    dat2 = dat[dat$feature == f,]
        
    if(length(dat2$r) > 0)
    {   
      
      if (cc == 1)
      { h1 = hist(dat2$r,plot = FALSE, breaks=seq(0,255,3));}
      else if (cc == 2)
      { h1 = hist(dat2$g,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 3)
      { h1 = hist(dat2$b,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 4)
      { h1 = hist(dat2$h,plot = FALSE, breaks=seq(0,255,3));}
      else if (cc == 5)
      { h1 = hist(dat2$s,plot = FALSE,breaks=seq(0,255,3));}
      else if (cc == 6)
      { h1 = hist(dat2$v,plot = FALSE,breaks=seq(0,255,3));}
      
      l = length(h1$counts)
      y = h1$counts
      x = h1$mids

      x[l + 1] = (2 * x[l]) - x[l - 1]
      if (cc == 4)
      { 
        if (x[l+1] > 250)
        {  y[l + 1] = y[1]; }
        else
        {  y[l + 1] = 0; }
      }
      else
      {  y[l + 1] = 0 }
      
      
    
     cat(cc,f,x,"\n")
     cat(cc,f,y,"\n")
 #     lines(x,y/total,col=colors[f],lwd=2)
#      points(x,y/total,col=colors[f],lwd=2,
#             pch=(c(13,14,15,16,17,18,19,20,21)[f]))
    }
  }
#  dev.off()
}


