install.packages("plotly")
library(plotly)

getwd()
setwd("C:/Users/Anuj/Downloads/Project")
sample=read.csv("googleplaystore1.csv")

clean=na.omit(sample)
sample

data=read.csv("Sample.csv")

df=data.frame(data)

#----------Pie Chart for Ratio of application which are free and paid-----------
type=df$Type
types=table(type)
types
dftype=data.frame(types)
dftype

png("ration for free and paid.png")
plot_ly(dftype,labels =dftype$type, values =dftype$Freq, type = 'pie') %>%
  layout(title = 'Application ratio which are free and paid',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

dev.off()

#---------Pie Chart For Category-------------

cat=df$Category
cate=table(cat)
cate
dfcate=data.frame(cate)
dfcate  
plot_ly(labels = dfcate$cat, values =dfcate$Freq) %>%
  add_pie(hole = 0.6) %>%
  layout(title = "Category",  showlegend = F,
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

#----------Bar chart for Rating-----

rat=df$Rating
cate=df$Category
plot_ly(df, x = cate, y = rat, type = 'bar', name = 'Review') %>%
  layout(yaxis = list(title = 'Count'), barmode = 'group')

#----------Bar chart for Review-----
rev=df$Reviews
plot_ly(df, x = cate, y = rev, type = 'bar', name = 'Review') %>%
  layout(yaxis = list(title = 'Review'), barmode = 'group')


#----------Line plot for review------------

p <- plot_ly(df, x = c(1:60), y =df$Rating, type = 'scatter', mode = 'lines')
p

#--------
cate=df$Category
cates=table(cate)
plot_ly(df, x = cate, y = cates, type = 'bar', name = 'Category') %>%
  layout(yaxis = list(title = 'Count'), barmode = 'group')




#-----------------Category vs rating vs reviews-----------------

cat=readdf$Category
cat=cat[1:10]

rat=readdf$Rating
rat=rat[1:10]

rev=readdf$Reviews
rev=rev[1:10]
y <-cat
x_rating <- rat
x_reviews <- rev
data <- data.frame(y, x_rating, x_reviews)
png("Category.png")
p1 <- plot_ly(x = data$x_rating, y = ~reorder(y, data$x_rating), name = 'Category rating percentage',
              type = 'bar', orientation = 'h',
              marker = list(color = 'rgba(50, 171, 96, 0.6)',
                            line = list(color = 'rgba(50, 171, 96, 1.0)', width = 1))) %>%
  layout(yaxis = list(showgrid = FALSE, showline = FALSE, showticklabels = TRUE, domain= c(0, 0.85)),
         xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE)) %>%
  add_annotations(xref = 'x1', yref = 'y',
                  x = data$x_rating * 2.1 + 3,  y = y,
                  text = paste(round(data$x_rating, 2), '%'),
                  font = list(family = 'Arial', size = 12, color = 'rgb(50, 171, 96)'),
                  showarrow = FALSE)

p2 <- plot_ly(x = data$x_reviews, y = ~reorder(y,data$x_reviews), name = 'Category reviews percentage',
              type = 'scatter', mode = 'lines+markers',
              line = list(color = 'rgb(128, 0, 128)')) %>%
  layout(yaxis = list(showgrid = FALSE, showline = TRUE, showticklabels = FALSE,
                      linecolor = 'rgba(102, 102, 102, 0.8)', linewidth = 2,
                      domain = c(0, 0.85)),
         xaxis = list(zeroline = FALSE, showline = FALSE, showticklabels = TRUE, showgrid = TRUE,
                      side = 'top', dtick = 25000)) %>%
  add_annotations(xref = 'x2', yref = 'y',
                  x = data$x_reviews, y = y,
                  text = paste(data$x_reviews, 'M'),
                  font = list(family = 'Arial', size = 12, color = 'rgb(128, 0, 128)'),
                  showarrow = FALSE)

p <- subplot(p1, p2) %>%
  layout(title = 'Each Category have rating vs reviews criteria',
         legend = list(x = 0.029, y = 1.038,
                       font = list(size = 10)),
         margin = list(l = 100, r = 20, t = 70, b = 70),
         paper_bgcolor = 'rgb(248, 248, 255)',
         plot_bgcolor = 'rgb(248, 248, 255)') %>%
  add_annotations(xref = 'paper', yref = 'paper',
                  x = -0.14, y = -0.15,
                  text = paste('OECD (2015), Household savings (indicator), Household net worth (indicator). doi: 10.1787/cfc6f499-en (Accessed on 05 June 2015)'),
                  font = list(family = 'Arial', size = 10, color = 'rgb(150,150,150)'),
                  showarrow = FALSE)
p
dev.off()
