getwd()
setwd("C:/Users/Admin/Downloads")
data=read.csv("sample.csv")

data_frame=as.data.frame(data)
cat=c(data_frame[2])
rat=c(data_frame[3])
rat

data=table(unlist(rat,cat))
data

png("Rating.png")
barplot(data,main="Category",xlab="Category",ylab="price",beside = FALSE,col=c("purple","cyan"),space = 1,las=2)
dev.off()



#--------------PIE CHART------------------

install.packages("plotrix")
library(plotrix)
data_frame=as.data.frame(data)

rat=c(data_frame[[3]])
cat=data_frame$Category
cat
rat=rat[1:10]
cat=cat[1:10]
rats=table(rat)
rats
gen
png("PIE.png")

pie3D(rat,labels=rat,explode=0.1,main="Pie Chart of Countries ")
dev.off()

#-------------Line Chart-----------------

rat=c(data_frame[[3]])
cat=data_frame$Category
cat
rat=rat[1:10]
cat=cat[1:10]

xrange=
xrange
yrange=range(cat)
png("line.png")

plot(rat,cat,type="o", xlab="Rating",ylab="Categroy")
box()
axis(3)
axis(4)
axis(side=1,at=cat,labels = cat,tck=-0.5)
dev.off()

