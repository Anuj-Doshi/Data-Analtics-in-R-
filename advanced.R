getwd()
setwd("C:/Users/Anuj/Downloads/Project")

read=read.csv("googleplaystore1.csv")
readdf=data.frame(read)
#-------------Category-----------------
cat=readline(prompt = "Enter a Category:-")
spec_cat=as.integer(readline(prompt = "Do You want to do specific analysis?[1 for Yes and 0 for no]:-"))
vect=c()
select_cat=switch (spec,"Yes","No")
if(select_cat=="Yes")
{
  number_cat=as.integer(readline(prompt = "Enter A Value for a analysis:-"))
  c_cat=0
  for(x in 1:nrow(readdf))
  {
    if(c_cat==number_cat)
    {
      break;
    }
    else
    {
      cats=readdf[x,"Category"]
      rat=readdf[x,"Rating"]
      if(cat==cats)
      {
        vect=c(vect,rat)
      }
      c_cat=c_cat+1
    }
  }
  print(vect)
  plot(vect)
}
if(select=="No")
{
  for(x in 1:nrow(readdf))
  {
    cats=readdf[x,"Category"]
    rat=readdf[x,"Rating"]
    if(cat==cats)
    {
      vect=c(vect,rat)
    }
  }
  vect
  plot(vect)
  
}

#--------------Rating----------------
rat=readline(prompt = "Enter a Rating for analysis:-")
spec=as.integer(readline(prompt = "Do You want to do specific analysis?[1 for Yes and 0 for no]:-"))
rat_vect=c()
rat
select=switch (spec,"Yes","No")
select
if(select=="Yes")
{
  number=as.integer(readline(prompt = "Enter A Value for a analysis:-"))
  c=0
  for(x in 1:nrow(readdf))
  {
    if(c==number)
    {
      break;
    }
    else
    {
      app=readdf[x,"App"]
      rats=readdf[x,"Rating"]
      if(rat==rats)
      {
        rat_vect=c(rat_vect,app)
      }
      c=c+1
    }
  }
  plot(rat_vect)
}  
if(select=="No")
{
  for(x in 1:nrow(readdf))
  {
    app=readdf[x,"App"]
    rats=readdf[x,"Rating"]
    if(rat==rats)
    {
      rat_vect=c(rat_vect,app)
    }
  }
  plot(rat_vect)
}


#----------Current Version-------------

current=as.integer(readline(prompt = "Enter a Category:-"))
print("1.Current Version Above")
print("2.Current Version Below")
print("3.Specific")
spec_cur=as.integer(readline(prompt = "Enter Your Choice:-"))
vect_cur=c()
select_cur=switch (spec_cur,"1","2","3")
readdf$CurrentVer>=as.numeric_version(current)
if(select_cur=="1")
{
  library(sqldf)
  sqldf(sprintf("select App from readdf where CurrentVer>='%s'",current))
  
}
if(select=="No")
{
  for(x in 1:nrow(readdf))
  {
    cats=readdf[x,"Category"]
    rat=readdf[x,"Rating"]
    if(cat==cats)
    {
      vect=c(vect,rat)
    }
  }
  vect
  plot(vect)
  
}
num=as.integer(1.0)
num

s=readdf$Current.Ver

