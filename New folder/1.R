getwd()
setwd("C:/Users/student/Downloads")
data=read.csv("googleplaystore.csv/googleplaystore.csv")
names(data)
nrow(data)
ncol(data)
#--------Barchart For Category------------------
data_frame=as.data.frame(data)
levels(data_frame)
cat=c(data_frame[2])
data=table(cat)
data
png("Category barchart.png")
barplot(data,main="Category",xlab="Category",ylab="price",beside = TRUE,col=c("purple","cyan"))
dev.off()
#----------------------------------------------

#--------Barchart for Total Rating-----------------
data_frame=as.data.frame(data)
rating=c(data_frame[3])
data=table(rating)
data

revies=c(data_frame[4])
df=data.frame(rating,revies)
newDF=data.frame(df$Reviews,df$Rating)
newDF