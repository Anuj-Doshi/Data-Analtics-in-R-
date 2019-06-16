getwd()
data_read=read.csv("Sample.csv")
dataf=as.data.frame(data_read)
sizes=dataf$App
sizes=sizes[1:10]

size=c(dataf$Size)
size=size[1:10]

sizedf=data.frame(sizes)
sizedf

png("Baplot for Size.png")
barplot(size,xlab="Size",ylab="Range",main="Barplot For Size(MB)",col=rainbow(length(size)),density = 100)
legend("topright",legend = (sizedf$sizes),fill=rainbow(10),cex=0.7)
dev.off()


