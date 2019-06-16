getwd()
setwd("C:/Users/Anuj/Downloads/Project")
setwd("C:/Users/student/Downloads")
data_read=read.csv("googleplaystore1.csv")
df=as.data.frame(data_read)

#----------Head-----------
head(df)

#----------Tail-----------
tail(df)

#----------names----------
names(df)

#----------Factor--------
factor(df)

#----------Levels--------
levels(df)

#----------Structure-----
str(df)


#---------Histogram graph for Category---------------

install.packages("ggplot2")
library(ggplot2)

setwd("C:/Users/Anuj/Downloads/Project")

data_read=read.csv("Sample.csv")

df=as.data.frame(data_read)
cat=df$Category
cat=table(cat)

png("Histogram for category.png")

hist(cat,xlab = "Category",col = "lightsalmon",ylab ="Range")

dev.off()

#-----------Scatterplot For rating vs reviews---------

input=df[,c('Reviews','Rating')]
input

png(file = "Scatterplot rating vs reviews.png")

plot(x = input$Reviews,y = input$Rating,xlab = "Reviews",ylab = "Rating",main = "Reviews vs Rating")

dev.off()

#-----------Scatterplot For rating vs reviews---------

rat=c(df[[3]])
rat
rev=c(df[[4]])
rev
rat=rat[1:10]
rev=rev[1:10]
rev

png(file = "Scatterplot rating vs reviews-1.png")

plot(x = rat,y = rev,xlab = "Reviews",ylab = "Rating",main = "Reviews vs Rating")

dev.off()

#---------Boxplot For Rating vs Reviews-----------
rat=c(df[[3]])

png(file = "Boxplot For Rating vs Reviews.png")

boxplot(rat ~ rev, data = df, xlab = "Rating",ylab = "Reviews", main = "Boxplot For Rating vs Reviews")

dev.off()

#----------Barplot For Geners-----------
df=as.data.frame(data_read)
gen=df$Genres
gen
gen=table(gen)

gen=gen[1:10]
gen
gendf=data.frame(gen)
gendf
png("Barplot for Geners.png")

barplot(gen,xlab="Gener",ylab="Range",main="Barplot For Gener",col=rainbow(length(gen)),density = 100)
legend("topright",legend = (gendf$gen),fill=rainbow(10),cex=0.7)
dev.off()

#----------Barplot For Size-----------

data_read=read.csv("Sample.csv")
dataf=as.data.frame(data_read)
sizes=dataf$Size
sizes=sizes[1:10]

size=c(dataf$Size)
size=size[1:10]

sizedf=data.frame(sizes)
sizedf

png("Baplot for Size.png")
barplot(size,xlab="Size",ylab="Range",main="Barplot For Size(MB)",col=rainbow(length(size)),density = 100)
legend("topright",legend = (sizedf$sizes),fill=rainbow(10),cex=0.7)

dev.off()

#----------Barplot For Rating-----------
rat=c(df[[3]])

rat=rat[1:10]
rat

png(file="Barplot For Rating.png")

barplot(rat,xlab="Rating",ylab="Range",main="Barplot For Rating",names.arg=rat,col="palevioletred1")

dev.off()

#----------Barplot For Reviews-----------
revi=c(df[[4]])

revi=revi[1:10]
revi

png(file="Barplot For Reviews.png")

barplot(revi,xlab="Review",ylab="Range",main="Barplot For Reviews",names.arg=revi,col="palevioletred1",ylim =c(0,5000))

dev.off()

#-------------Line Chart Rating vs Category-----------------

rat=c(df[[3]])
cat=df$Category

rat=rat[1:10]
cat=cat[1:10]

png("Line Chart Rating vs Category.png")

plot(rat,cat,type="o", xlab="Rating",ylab="Categroy")
box()
axis(3)
axis(4)
axis(side=1,at=cat,labels = cat,tck=-0.5)

dev.off()

#--------------PIE CHART For Rating------------------

install.packages("plotrix")
library(plotrix)

rat=c(df[[3]])
rat=rat[1:10]

png("PIE Chart For Rating.png")

pie3D(rat,labels=rat,explode=0.1,main="Pie Chart of Countries ")
dev.off()

#--------------PIE CHART For Type(Paid And Free)------------------

install.packages("plotrix")
library(plotrix)

type=df$Type

type=type[1:10]
type
types=table(type)
png("PIE Chart For Type.png")

pie3D(types,labels=names(types),explode=0.1,main="Pie Chart of Type ")
dev.off()


#------------Numerical Description of Data----------------

setwd("C:/Users/Anuj/Downloads")

data_read=read.csv("googleplaystore1.csv")
df=as.data.frame(data_read)

#-----------Summary--------------
summary(df)

#----------Mean of Rating--------
rat=c(df[[3]])
rat=rat[1:10]
mean(rat)
median(rat)
sd(rat)
#----------Mean of Reviews--------

rev=c(df[[4]])
rev=rev[1:10]

mean(rev)
median(rev)
sd(rev)
#----------Meadian of Rating--------
rat=c(df[[3]])
rat=rat[1:10]

median(rat)
#----------Median of Reviews--------

rev=c(df[[4]])
rev=rev[1:10]

median(rev)

#----------Mode of Reviews--------

rev=c(df[[4]])
rev=rev[1:10]

mode(rev)

#---------Statistics of data-------

#-------Linear Regression---------

linear=lm(rat~rev)

print(linear)

print(summary(linear))

result=predict(linear)
result


#-------Normal Distribution(dnormal)-----

setwd("C:/Users/Anuj/Downloads/Project")
data_re=read.csv("Sample.csv")
dataf=as.data.frame(data_re)

rat=c(dataf[[3]])

rat=rat[1:10]
rat

me=mean(rat)
s=sd(rat)

x <- rat
y <- dnorm(x, mean= me, sd = s)

png(file = "dnorm.jpg")
plot(x,y,main="D-Norm")

dev.off()

#-------Normal Distribution(pnormal)-----
data_re=read.csv("Sample.csv")
dataf=as.data.frame(data_re)

rat=c(dataf[[3]])

rat=rat[1:10]
rat

me=mean(rat)
s=sd(rat)

x <- rat
y <- pnorm(x, mean= me, sd = s)

png(file = "pnorm.jpg")
plot(x,y,main="P-Norm")

dev.off()

#-------Normal Distribution(rnormal)-----
data_re=read.csv("Sample.csv")
dataf=as.data.frame(data_re)

rat=c(dataf[[3]])

rat=rat[1:10]
rat

me=mean(rat)
s=sd(rat)

x <- rat

y <- rnorm(x, mean= me, sd = s)

png(file = "rnorm.jpg")
plot(x,y,main="R-Norm")

dev.off()