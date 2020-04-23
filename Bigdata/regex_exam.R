#정규표현식 or 문자열을 이용한 작업
install.packages("stringr")
library("stringr")
#패턴
mytext <- "    test$uuuuu"
mytext2 <- "https://cran.r-project.org/"
#패턴 실행하기
str_extract(mytext2,".+(:)")#":"를 포함한 앞의 모든 문자 출력
str_extract(mytext2,".+(?=:)")#":"를 제외한 앞의 모든 문자 출력 ==> "전방탐색(?=)"
str_extract(mytext,".+(?=\\$)")#"$"를 문자로 인식시키기 위해 \\를 사용 <==> 원래 $는 
str_extract(mytext,"(?<=\\$).*")#==>"후방탐색(?<=)

#문자열 관련 함수
#paste : 벡터를 연결해서 하나의 문자열로 생성
#paste() : 여러 개를 연결
str <- c("java","hadoop","R","mongodb")
paste(str,collapse = ",")
paste0(mytext,mytext2)
gsub("u","s",mytext)#문자열을 치환할 때 사용
data <- gsub("u","",mytext)#문자열을 치환하여 잘라내기
str_trim(data)#띄어쓰기를 없앤다.

