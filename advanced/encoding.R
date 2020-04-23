#패키지, 라이브러리 설치
install.packages("data.table")
library("data.table")

df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],#letters : a-z까지 알파벳을 출력한다.
                 mydata3=c("이민호","android","한글!@#$","test","한글"))
df
#주석4개로 추가하면 작업표시줄처럼 쓸 수 있다.
####파일write#### 
write.csv(df,"encoding_test.csv",row.names = F)
write.csv(df,"encoding_test_euckr.csv",row.names = F,fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = F,fileEncoding = "cp949")
write.csv(df,"encoding_test_utf8.csv",row.names = F,fileEncoding = "utf8")

####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv",encoding = "UTF-8")#readLines : 깨지는 파일의 내용을 읽을 수 있다.

#data.table - dataframe보다 강력하다.
dftable <- fread("encoding_test_utf8.csv")
head(dftable)

#인코딩함수
Encoding(dftable$mydata3) = "UTF-8"
head(dftable)
dftable
