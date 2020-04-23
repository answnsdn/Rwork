library("stringr")
library("mongolite")

load(file = "crawl_data.RData")
final_data
final_data[2,3]
#1번 글의 url 저장 후 인코딩 방식 세팅
exam_url <- final_data[2,3]
exam_url <- readLines(exam_url,encoding = "UTF-8")
exam_url
  #데이터 필터링 첫 번째 방식식
  filter_exam <- exam_url[(str_detect(exam_url,"<p>"))]
  filter_exam
   
  #추출한 데이터에서 내가 필요한 내용만 추출(정규표현식)
  content <- str_extract(filter_exam,"(?<=p>).*(?=</p>)")
  content
  #벡터 데이터 하나로 합치기
  content <- paste(content,collapse = "")
  content

#데이터 필터링 다른방식
start <- which(str_detect(exam_url,"post_content"))
end <- which(str_detect(exam_url,"post_ccls"))
filter_plus_exam <- exam_url[start:end]
filter_plus_exam
#데이터 정제하기
#1. 리턴방식이 벡터이므로 한 개로 합치기
filter_plus_exam <- paste(filter_plus_exam,collapse = "")
filter_plus_exam
#2. 불필요한 기호나 태그 없애기
#태그 없애기
filter_plus_exam <- gsub("<.*?>","",filter_plus_exam)#gsub(지울부분,지운부분 대체할내용,지울 데이터 이름)
#탭키와 띄어쓰기 없애기
filter_plus_exam <- gsub("\t|&nbsp;","",filter_plus_exam)
filter_plus_exam
