# =, <- 같은 것처럼 보이지만 <- 를 이용해서 변수에 데이터를 할당
a <- 100
b = 100
sqrt(9)
sqrt(x=9)#x는 함수의 매개변수로 인식
sqrt(x <- 9) #x라는 변수로 활용

#Vector : c함수 활용하기
myvector1 <- c(100,200,300) #Vector에서 c 활용법
myvector1
myvector1[1]
myvector1[2]
myvector2 <- c(10,20,30)
myvector1
myvector2
myvector1 + 20 #각 항을 각각 +20
myvector1 * 2
myvector1 + myvector2

mytext <- c("java","R","Hadoop","android")
mytext[1]
mytext[1,2] #안되는 이유 : matrix에서 사용하므로 벡터에서 쓸 수 없다.
mytext[c(1,2)]#벡터의 1번요소와 2번요소만 출력
mytext[c(1,3)]
mytext[c(1:3)]#1~3번 요소까지 선택
1:3
1:100
mytext[-1]#1번 요소 제외한 나머지
mytext[c(-1,-3)]#1번과 3번 제외한 나머지
mytext[c(-1:-3)]#1-3번 제외한 나머지
mytext[-c(1:3)]#같은 의미
mytext[c(T,T,F,F)]#TRUE자리를 의미하는 T로 표현된 요소만 도출된다.
#조건 넣기
mytext[mytext=="java"]#조건을 만족하는 요소만 출력하기
numlist <- 1:100#numlist변수에 1부터 100까지 저장
numlist
#나머지 연산
numlist %%2==0#'%%':나머지 구하기 - 1부터 100중 TRUE/FALSE 출력
numlist
#조건을 이용해 나머지 연산
numlist[numlist %%2==0]#짝수구하기
numlist[numlist %%2==1]#홀수구하기
#시퀀스 함수
numlist2 <- seq(1,10)
numlist2
#시퀀스 함수 조건주기
numlist2 <- seq(1,10,by = 2) #by : 간격을 지정하는 함수
numlist2

#다양한 벡터 함수
v1 <- c(70,80,90,100)
names(v1) #벡터에 이름 넣기
names(v1) <- c("국어","수학","영어","자바") #v1의 각 항목에 이름 삽입
v1
length(v1) #요소 개수 구하기
mean(v1) #요소의 평균 구하기
max(v1)
min(v1)

