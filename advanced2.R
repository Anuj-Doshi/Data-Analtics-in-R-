getwd()
setwd("C:/Users/Anuj/Downloads/Project")
data_read=read.csv("googleplaystore1.csv")
readdf=as.data.frame(data_read)
library(sqldf)

print("1.Analysis by Category") 
print("2.Analysis by Rating")

choose=as.integer(readline(prompt = "Please Insert it's index Value only.Like(1,2):-"))
choose
choose_switch=switch(choose,"Category","Rating")

if(choose_switch=="Category")
{
  print("1.To see how many category")
  print("2.To do specific category analysis")
  print("3.For Creating Graph")
  choose1=as.integer(readline(prompt = "Please Insert it's index Value only.Like(1,2):-"))
  choose_switch1=switch (choose1,"See","Analysis","Graph")
  
  if(choose_switch1=="See")
  {
    
    sq_see=data_read$Category
    sq_see=sqldf("select count(Category) from readdf")    
    print(sq_see)
  }
  if(choose_switch1=="Analysis")
  {
    cat=readline(prompt = "Enter Category for analysis:-")
    print("1.To see it's rating")
    print("2.To see it's review")
    print("3.To see it's application name")
    
    choose2=as.integer(readline(prompt = "Please Insert it's index Value only.Like(1,2,3):-"))
    
    choose_switch2=switch(choose2,"Rat","Rev","App")
    
    if(choose_switch2=="Rat")
    {
        
        sq1=sqldf(sprintf("select App,Rating from readdf where Category='%s'",cat))
        print(sq1)
    }
    if(choose_switch2=="Rev")
    {
        sq2=sqldf(sprintf("select App,Reviews from readdf where Category='%s'",cat))
        print(sq2)
    }
    if(choose_switch2=="App")
    {
        sq3=sqldf(sprintf("select App from readdf where Category='%s'",cat))
        print(sq3)
    }
  }
  if(choose_switch1=="Graph")
  {
    cat=readline(prompt = "Enter Category for analysis:-")
    specific_cat=as.integer(readline(prompt = "Do You want to do specific analysis?[1 for Yes and 2 for no]:-"))
    
    vect=c()
    vect_app=c()
    select_cat=switch (specific_cat,"Yes","No")
    select_cat
    if(select_cat=="Yes")
    {
      number_cat=as.integer(readline(prompt = "Enter A Value for a analysis:-"))
      number_cat
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
          
          if(cat==cats)
          {
            vect=c(vect,rat)
          }
          c_cat=c_cat+1
        }
      }
      
      png("Category For Specific.png")
      plot(vect)
      dev.off()
      print("See a Category For Specific.png file in your device")
    }
    if(select_cat=="No")
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
      png("Category.png")
      plot(vect)
      dev.off()
      print("See a Category.png file in your device")
    }
    
  }
}

if(choose_switch=="Rating")
{
  print("1.To see how many Rating")
  print("2.To do specific Rating analysis")
  print("3.For Creating Graph")
  choose3=as.integer(readline(prompt = "Please Insert it's index Value only.Like(1,2,3):-"))
  choose_switch3=switch (choose3,"See","Analysis","Graph")
  
  if(choose_switch3=="See")
  {
    
    sq_see1=sqldf("select Rating from readdf")    
    print(sq_see1)
  }
  if(choose_switch3=="Analysis")
  {
    rat=readline(prompt = "Enter Rating for analysis:-")
    print("1.To see it's category")
    print("2.To see it's review")
    print("3.To see it's application name")
    
    choose4=as.integer(readline(prompt = "Please Insert it's index Value only.Like(1,2,3):-"))
    
    choose_switch3=switch(choose4,"cat","Rev","App")
    
    if(choose_switch3=="cat")
    {
      
      sq3=sqldf(sprintf("select App,Category from readdf where Rating='%s'",rat))
      print(sq3)
    }
    if(choose_switch3=="Rev")
    {
      sq4=sqldf(sprintf("select App,Reviews from readdf where Rating='%s'",rat))
      print(sq4)
    }
    if(choose_switch3=="App")
    {
      sq4=sqldf(sprintf("select App from readdf where Rating='%s'",rat))
      print(sq4)
    }
  }
  if(choose_switch3=="Graph")
  {
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
      print("See a Rating For Specific.png file in your device")
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
      print("See a Rating.png file in your device")
    }
    
  }
}


