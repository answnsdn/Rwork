csv_exam <- read.csv("csv_exam.csv")
csv_exam
result_exam <- data.frame(csv_exam)
result_exam
result <- result_exam[result_exam$science>=80,]
result
#coutrow <- c(1:nrow(result)) nrow : 행개수 구하는 함수
#coutrow
#for (i in countrow) {
#for문을 안쓰더라도 각 행을 결과값이 출력된다.
  result$total <- result$math+result$english+result$science
  result$avg <- result$total/3
  #}
  result

write.csv(result,file = "CSVExam.csv") 