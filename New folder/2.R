getwd()
setwd("C:/Users/student/Downloads")
data=read.csv("googleplaystore.csv/sample.csv")
data_frame=as.data.frame(data)

ra=c(data_frame[3])
data=table(ra)
data
png("Category barchart.png")
barplot(data,main="Category",xlab="Rating",beside = TRUE,col=c("purple","cyan"))
dev.off()