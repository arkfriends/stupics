setwd("d:/git/stupics/data")
dat = read.csv("colorrgb.csv", header=TRUE)
str(dat)
summary(dat)
labs = c("bgnd", "shrt", "hair", "face", "tie",
         "hair",  "lips",  "eyes")
plot(0,0,type="b",xlim=c(0,255),ylim=c(0,35000))
colors = rainbow(10)
for(f in 1:7)
{
   cat(f)
   dat2 = dat[dat$feature == f,]
   if(length(dat2$r) > 0)
   {
      h1 = hist(dat2$r,plot = FALSE)
      lines(h1$mids,h1$counts,type="b",col=colors[f],lwd=2)
      points(h1$mids,h1$counts,type="b",col=colors[f],lwd=2)
   }
   legend(125,30,labs,fill=colors[1:8])
}

