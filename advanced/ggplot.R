####그래프 패키지 설치####
install.packages("ggplot2")
library("ggplot2")
mydata <- c("java","spring","bigdata","android")
qplot(mydata)
qplot(data=mpg,x=hwy)
qplot(data=mpg,x=hwy,y=drv)
qplot(data=mpg,x=drv,y=hwy,geom = "line")#geom : 그래프의 종류 명시
qplot(data=mpg,x=drv,y=hwy,geom = "boxplot")
qplot(data=mpg,x=drv,y=hwy,geom = "boxplot",colour=drv)#colour : 범례표시
