#############################
# Copy this to the R environment
# setwd("d:/gitprojects/stupics/data")
# setwd("d:/git/stupics/data")
#
# Run with
# source("coloranalysis.r")
#############################
dat = read.csv("colorhsb.csv", header = TRUE)
dat$pic = as.numeric(dat$pic)
dat$x = as.numeric(dat$x)
dat$y = as.numeric(dat$y)
dat$h = as.numeric(dat$h)
dat$s = as.numeric(dat$s)
dat$b = as.numeric(dat$b)
dat$feature = as.numeric(dat$feature)
str(dat)
summary(dat)

labs = c("bgnd", "shrt", "hair", "face", "tie",
        "lips",  "eyes")
clabs = c("Hue", "Saturation", "Brightness")
colors = rainbow(7)

for (cc in 1:3)
{
    pdf(file=paste(clabs[cc],".pdf",sep=""))
    plot(0,0,type="b",xlim=c(0,255),ylim=c(0,1.2),
     col="gray",main=paste("Distribution of", clabs[cc], "Values"),
     xlab=paste(clabs[cc]," intensity (0-255)"),
     ylab="Frequency")

for(f in 1:7)
{
   cat(f)
   dat2 = dat[dat$feature == f,]
   
   if(length(dat2$h) > 0)
   {

      if (cc == 1)
      { h1 = hist(dat2$h,plot = FALSE, breaks=25);}
      else if (cc == 2)
      { h1 = hist(dat2$s,plot = FALSE,breaks=25);}
      else if (cc == 3)
      { h1 = hist(dat2$b,plot = FALSE,breaks=25);}


      total = max(h1$counts)
      lines(h1$mids,h1$counts/total,col=colors[f],lwd=2)
      points(h1$mids,h1$counts/total,col=colors[f],lwd=2,
      pch=(c(13,14,15,16,17,18,19,20,21)[f]))
   }
}
legend(50,1.2,labs,fill=colors[1:8],ncol=4)
  dev.off()
}

