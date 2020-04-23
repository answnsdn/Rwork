#dataframe 만들기
eng <- c(100,99,90)
math <- c(100,99,100)
mydf1 <- data.frame(eng,math)
mydf1
mydf1 <- data.frame(eng,math)
#"$"를 이용해서 이름별 평균구하기
mean(mydf1$eng)
mean(mydf1$math)
#dataframe 직접 정의하기
mydf2 <- data.frame(eng=c(100,100,100),m=c(90,99,80))
mydf2
product <- c("사과","딸기","수박")
price <- c(1800,1500,3000)
count <- c(24,38,13)
frame <- data.frame(product,price,count)
frame
str(frame)
colnames(frame$product) <- c("제품")#이렇게 쓸 수 없다.
colnames(frame) <- c("제품","가격","판매량")#이렇게 써야함
str(frame)
frame
mean(frame$price)
mean(frame$count)
frame <- t(frame)#행과 열 바꾸기
frame
제품 <- c("사과","딸기","수박")
제품품
제품
frame <- data.frame(제품)
frame
#기본적으로 c를 이용하면 열 데이터 출력 ==> 행 데이터로 바꾸기
frame <- t(frame)
frame