exam <- read.csv("csv_exam.csv")
exam

head(exam,n=10)#전체 레코드의 맨 '위'부터 정의한 개수만큼 가져오기(기본:6개)
tail(exam,n=5)#전체 레코드의 맨 '밑'에서부터 가져오기
#실제 뷰어로 보기
View(exam)
nrow(exam)#행개수
ncol(exam)#열개수
dim(exam)#행과 열 개수
class(exam)#타입 확인
str(exam)#구조 확인
summary(exam)#데이터 요약정보

#컬럼에 이름을 변경하기 - dplyr
install.packages("dplyr")
library("dplyr")
library("ggplot2")
exam <- rename(exam,eng=english)
exam

table(exam$eng)
qplot(exam$eng)
