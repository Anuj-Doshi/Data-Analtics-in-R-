install.packages("RMySQL")
install.packages("RMariaDB")
library(DBI)

con=dbConnect(RMySQL::MySQL(),host="localhost",user="root",password="",dbname="rproject")
con

read_data=read.csv("googleplaystore1.csv")
data_frame=as.data.frame(read_data)

data=dbWriteTable(con,"PlayStore",data_frame)


fetch=dbSendQuery(con,"Select max(Installs),Category from Playstore group by Installs")
dbFetch(fetch)

fetch=dbSendQuery(con,"Select max(Installs),Genres from Playstore group by Installs")
dbFetch(fetch)

fetch=dbSendQuery(con,"Select max(Installs),App from Playstore group by Installs desc limit 10")
dbFetch(fetch)

fetch=dbSendQuery(con,"Select max(Size),App from Playstore group by Size desc limit 1")
dbFetch(fetch)

fetch=dbSendQuery(con,"Select max(Reviews),App,count(*) from Playstore group by Reviews limit 10")
dbFetch(fetch)
