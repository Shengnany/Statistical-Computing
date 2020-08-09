markers<- read.table('http://www.ams.sunysb.edu/~pfkuan/Teaching/AMS597/Data/Markers.txt', header = T)
df <- data.frame(markers)
male <- subset(df, Gender == "1")
female <- subset(df, Gender == "2")


f = function(male,female){
  count =0
  for (i in 2:ncol(male)){
    a <- shapiro.test(female[,i])
    b <- shapiro.test(male[,i])
    if(a$p.value <0.005 | b$p.value <0.005){
      w <- wilcox.test(female[,i],male[,i])
      if(w$p.value < 0.05){
        count <- count +1
        print(paste("reject the null hypothesis in wilcox test for  M","with p-value",i))
      }
    }
    else{
    result <- (var.test(female[,i],male[,i]))
    if(result$p.value < 0.05){
    t<- t.test(female[,i],male[,i],alternative = "two.sided",var.equal = FALSE )
      if(t$p.value < 0.05){
        count <- count +1
        print(paste("reject the null hypothesis in unpooled variance t test for  M",i,"with p-value",t$p.value))
      }
    }
    else{
      t.test(female[,i],male[,i],alternative = "two.sided",var.equal = TRUE )
      if(t$p.value < 0.05){
        count <- count +1
        print(paste("reject the null hypothesis in pooled variance t test for  M","with p-value",i))
      }
    }
  }
  }
  print(paste(count," marker differ by gender at the significance level of 0.05."))
}