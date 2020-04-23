install.packages("N2H4")
library(N2H4)
library(stringr)
library(dplyr)
url <- "https://sports.news.naver.com/news.nhn?oid=477&aid=0000237139"
getAllComment(url) %>% select(userName, contents) -> mydata
mydata