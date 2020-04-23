
library("ggplot2")
midwest
midwet <- as.data.frame(midwest)
midwet
?midwest
midwest <- rename(midwet,total=poptotal)
head(midwest)
midwest <- rename(midwest, asian=popasian)
head(midwest)
midwest$percent <- (midwest$asian/midwest$total)*100
head(midwest)
qplot(midwest$county,midwest$percent,geom = "line")
midwest$LS <- ifelse(midwest$percent>sum(midwest$percent)/nrow(midwest),"large","small")
head(midwest)
table(midwest$LS)
qplot(midwest$LS) 
