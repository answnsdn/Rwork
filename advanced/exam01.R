#ggplot2패키지에서 제공되는 mpg데이터 분석
####step1. mpg를 dataframe으로 변경####
install.packages("ggplot2")
library("ggplot2")
mpg <- as.data.frame(mpg)
mpg
####step2. mpg의 정보를 출력####
head(mpg,n=10)
tail(mpg,n=10)
#행, 열 개수 위에서 10개, 밑에서 10개 출력
####step3. mpg의 컬럼명을 변경####
library("dplyr")
mpg <- rename(mpg,cty=city)
mpg <- rename(mpg,hwy=highway)
mpg
mpg <- rename(mpg,city=cty,highway=hwy)
mpg
#cty => city, hwy => highway
####step4. 파생변수 생성하기####
# total컬럼을 추가 => cty와 hwy의 합 구하기
# avg컬럼을 추가 => cty와 hwy의 평균 구하기
mpg$total <- mpg$city+mpg$highway
mpg$avg <- (mpg$city+mpg$highway)/2
mpg
####step5. 생성된 total을 가지고 요약정보 확인####
summary(mpg$total)
####step6. info컬럼 추가####
#total값을 이용해서 평가 - 30이상이면 pass, fail
nrow(mpg)
  mpg[,"info"] <- ifelse(mpg$total>=30,"pass","fail")
mpg
  #total값을 이용해서 평가 - 40이상이면 A, 35이상 B, 30이상 C, 나머지 D
G <- mpg$total
  mpg[,"grade"] <- ifelse(G>=40,"A",ifelse(G>=35,"B",ifelse(G>=30,"C","D")))
mpg
