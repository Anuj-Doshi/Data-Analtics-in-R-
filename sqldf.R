getwd()
setwd("C:/Users/Anuj/Downloads/Project")

read=read.csv("Sample.csv")

readdf=data.frame(read)
readdf$

library(sqldf)

sqldf("select Reviews from readdf order by Reviews desc")
sqldf("select Rating from readdf order by Rating desc")


hprice=sqldf("select App,max(Price) from readdf order by Price")
hprice
lprice=sqldf("select App,max(Price) from readdf order by Price")
lprice

rev=sqldf("select App,max(Reviews) from readdf order by Reviews")
rev

rat=sqldf("select App,max(Rating) from readdf order by Rating")
rat

size=sqldf("select App,Size from readdf order by Size")
size

library(plotly)
png("Check.png")
plot_ly(readdf,x=c(1:10),y=hprice ,name = 'trace 0', type = 'scatter', mode = 'lines')%>%
  add_trace(y = lprice, name = 'trace 2', mode = 'markers')

dev.off()
hprice