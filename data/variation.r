#############################
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
dat$h = as.numeric(dat$h)
dat$s = as.numeric(dat$s)
dat$b = as.numeric(dat$b)
dat$feature = as.numeric(dat$feature)
str(dat)
summary(dat)

names = c("bette", "ek", "gan", "garfield", "pim",
        "rock",  "rod", "suvimon", "tree", "weerana")
clabs = c("Hue", "Saturation", "Brightness")
colors = rainbow(11)


for (cc in 1:3)
{
    pdf(file=paste(clabs[cc],"var.pdf",sep=""))
    plot(0,0,type="b",xlim=c(0,255),ylim=c(0,1.2),
     col="gray",main=paste("Variation in the Distribution of", clabs[cc], "Values"),
     xlab=paste(clabs[cc]," intensity (0-255)"),
     ylab="Frequency")
cat(clabs[cc],":\n")    
f = 4
dat1 = dat[dat$feature == f,]    
for(pic in 1:10)
{
   cat(pic," ")
   dat2 = dat1[dat1$pic == pic,]  
   
   
   if(length(dat2$h) > 0)
   {

      if (cc == 1)
      { h1 = hist(dat2$h,plot = FALSE, breaks=25);
        cat("h =",mean(dat2$h),"(",sd(dat2$h),")\n");
      }
      else if (cc == 2)
      { h1 = hist(dat2$s,plot = FALSE,breaks=25);
        cat("s =",mean(dat2$s),"(",sd(dat2$s),")\n");
      }
      else if (cc == 3)
      { h1 = hist(dat2$b,plot = FALSE,breaks=25);
        cat("b =",mean(dat2$b),"(",sd(dat2$b),")\n");
      }


      total = max(h1$counts)
      lines(h1$mids,h1$counts/total,col=colors[pic],lwd=2)
      points(h1$mids,h1$counts/total,col=colors[pic],lwd=2,
      pch=pic)
   }
}
legend(25,1.2,names[1:10],fill=colors[1:10],ncol=5)
  dev.off()
}

