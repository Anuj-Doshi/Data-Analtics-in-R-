getwd()
setwd("C:/Users/Anuj/Downloads/Project")
setwd("C:/Users/student/Downloads/Project")
read=read.csv("googleplaystore1.csv")
readdf=data.frame(read)
#-------------Category-----------------
category=readline(prompt = "Enter a Category:-")
specific_cat=as.integer(readline(prompt = "Do You want to do specific analysis?[1 for Yes and 2 for no]:-"))
vect=c()
vect_app=c()
select_cat=switch (specific_cat,"Yes","No")
select_cat
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
      cats
      rat
      
      if(category==cats)
      {
        vect=c(vect,rat)
      }
      c_cat=c_cat+1
    }
  }
  png("Category For Specific.png")
  plot(vect)
  dev.off()
  vect
}
if(select_cat=="No")
{
  for(x in 1:nrow(readdf))
  {
    cats=readdf[x,"Category"]
    rat=readdf[x,"Rating"]
    if(category==cats)
    {
      vect=c(vect,rat)
    }
  }
  png("Category.png")
  plot(vect)
  dev.off()
}


#--------------Rating----------------
rating=readline(prompt = "Enter a Rating for analysis:-")
specific_rat=as.integer(readline(prompt = "Do You want to do specific analysis?[1 for Yes and 2 for no]:-"))
rat_vect=c()
app_vect=c()
specific_rat

select_rat=switch(specific_rat,"Yes","No")
select_rat
rat
if(select_rat=="Yes")
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
      
      rats=as.numeric(readdf[x,"Rating"])
    
      if(rating==rats)
      {
        app=toString(app)
        rat_vect=c(rat_vect,rats)
        app_vect=c(app_vect,app)
      }
      c=c+1
      
    }
      
  }
  
  png("Rating For Specific.png")
  barplot(rat_vect,names.arg = app_vect)
  dev.off()
}  
if(select_rat=="No")
{
  for(x in 1:nrow(readdf))
  {
    app=readdf[x,"App"]
    rats=as.numeric(readdf[x,"Rating"])
    if(rating==rats)
    {
      app=toString(app)
      rat_vect=c(rat_vect,rats)
      app_vect=c(app_vect,app)
    }
  }
  png("Rating.png")
  barplot(rat_vect,names.arg = app_vect,col=rainbow(length(rat_vect)))
  dev.off()
}
