####외부데이터 읽어오기####

####csv파일읽기####
read.csv("01_csv.csv")
#readLines를 이용하면 데이터가 커도 어떤 구성인지 확인하기 편하다.
dfimport <- readLines("01_csv.csv",n=3)
dfimport
strsplit(dfimport,split = ",")
#csv파일이므로 ","로 구분되어 있지만 사용자가 원하는 구분자를 적용해서 작성한 문자열인 경우
#01_csv.csv를 읽은 내용을 가공하여 데이터프레임 작성
dfcsv <- data.frame(num=1:3,
                    mydata=dfimport,
                    stringsAsFactors = F)
dfcsv
dfcsv$mydata #컬럼안에 문자열이 ","가 추가
#","로 분리는 되지만 list로 결과가 리턴되어 불편
strsplit(dfcsv$mydata,split = ",")[[1]]
strsplit(dfcsv$mydata,split = ",")[[2]]

#"splitstackshape" 패키지-cSplit를 이용해 데이터 분리하기
#하나의 컬럼 안에 구분자로 텍스트(",")가 구성된 경우 분리
install.packages("splitstackshape")
library("splitstackshape")
dfcsv2 <- cSplit(indt = dfcsv,
                 splitCols = "mydata",
                 sep = ",")
dfcsv2
#class를 통해 dfcsv2의 데이터 형태를 확인하면 "data.table" "data.frame" 2가지 다 가지고 있다. => 하나로 만들어줘야함
class(dfcsv2)
#타입 변경하기 - as의 함수들을 이용해서 변경 : ~~가 아닌 것을 ~~로 변경한다는 의미로 as를 쓴다.
dfcsv2 <- as.data.frame(dfcsv2)#data.table속성을 data.frame속성으로 변경
class(dfcsv2)
class(dfcsv2$num)
class(dfcsv2$mydata_1)
class(dfcsv2$mydata_2)
class("dd")
str(dfcsv2)#전체 데이터 구조를 확인
#Factor 데이터 구조 : 순서와 명목형
#1,2,3,...의 값이 어떤 순서를 의미하는 경우 : 컬럼의 데이터가 순서형
#class 컬럼 1,2,3,4,...:순서를 의미하지 않고 1반,2반,3반
#Factor타입을 char타입으로 
dfcsv2$mydata_1 <- as.character(dfcsv2$mydata_1)
str(dfcsv2)
for(i in 2:ncol(dfcsv2)){
  dfcsv2[,i] <- as.character(dfcsv2[,i])
}
str(dfcsv2)

####tsv파일읽기####
#tab으로 구분된 파일(\t)
df3 <- read.delim("02_tsv.txt",sep="\t")
head(df3)

####xlsx파일읽기####
install.packages("readxl")
library("readxl")
dfxlsx <- read_xlsx("07_xlsx.xlsx")
dfxlsx
####xml파일읽기####
install.packages("XML")
library("XML")
dfxml <- xmlTreeParse("03_xml.xml")
dfxml
dfxml <- xmlRoot(dfxml)#Root : root element의 하위 element만 추출
dfxml
#xml에 있는 모든 태그의 name과 value를 추출
  #apply : for문과 동일한 역할(반복작업)
dfxml <- xmlSApply(dfxml,function(x){
  xmlSApply(x,xmlValue)
})
dfxml
class(dfxml)
dfxml <- data.frame(t(dfxml),row.names = NULL)
class(dfxml)
dfxml
