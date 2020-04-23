set.seed(1221)#100은 key값 - 실행한 랜덤수를 찾아가게 해준다.
a <- sample(1:10,size=3,replace = T)#replace: FALSE일 때 중복 안함 / TRUE일 때 중복 가능
a
#if문의 역할을 하는 함수 - ifelse
set.seed(1221)
ifdf <- data.frame(mynum=1:6,
                   myval=sample(c("spring","bigdata","android"),size = 6,replace = T)
                   )
ifdf
#myval의 값이 spring이면 프로젝트 완료, bigdata이면 할꺼야 출력
for(i in 1:nrow(ifdf)){
  if(ifdf[i,"myval"]=="spring"){
    ifdf[i,"info"] <- "프로젝트 완료"
  }else{
    ifdf[i,"info"] <- "할꺼야"
  }
}
ifdf
#함수를 이용해 반복하기- info2
ifdf[,"info2"] <- ifelse(ifdf$myval=="spring","쉽다","아니다")
ifdf
#조건이 두 개 이상일 때 처리하기
ifdf[,"info3"] <- ifelse(ifdf$myval=="spring","쉽다",ifelse(ifdf$myval=="bigdata","머신세팅","device세팅"))
ifdf


