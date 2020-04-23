#행렬 기본
matrix(1:15)
#ncol : 열개수 표시,기본적으로 행방향 데이터 출력
mymat1 <- matrix(1:15,ncol = 3)
mymat1
mymat1 <- matrix(1:15,ncol = 3,byrow =T)#byrow : 열방향으로 데이터 출력
mymat1
#matrix에서 원하는 값을 추출하기
mymat1[2,2] #행,열
mymat1[3,3]
mymat1[1,c(1:3)]
mymat1[1,1:3]
mymat1[1,]#1행의 모든 열 출력하기
mymat1[,1]#1열의 모든 행 출력하기
mymat1[-c(1,3),]#1,3행을 뺀 데이터 출력
mymat1[c(1,3),]
mymat1[2:4,2:3]
#cbind - 열(column)추가하기
cbind(mymat1,c(1,11,111))#값이 부족하면 값이 반복됨.
#rbind - 행(row)추가하기
addmymat1 <- rbind(mymat1,c(1,11,111))
addmymat1 
#행렬에 이름주기
colnames(mymat1) <- c("a","b","c")
mymat1
rownames(mymat1) <- c("1","2","3","4","5")
mymat1
mean(mymat1)#평균구하기
#예제
m1 <- matrix(c(80,90,70,100),nrow=1,ncol=4,byrow = T)
m1
cbind(m1,c(80,99,78,72))
m1
rbind(m1,c(80,99,78,72))
rbind(m1,c(90,78,82,78))
m1 <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90),nrow=4,ncol=4,byrow=T)
m1
colnames(m1) <- c("국어","영어","과학","수학")
ㅡ1
m1
rownames(m1) <- c("kim","lee","hong","jang")
m1
avg_name <- matrix(c(mean(m1[,1]),mean(m1[,2]),mean(m1[,3],mean[,4])))
avg_name
avg_name <- matrix(mean(m1[,1]))
avg_name
avg_name <- matrix(mean(m1[,1]),mean(m1[,2]),nrow = 1,ncol = 4)
avg_name
avg_name <- matrix(c(mean(m1[,1]),mean(m1[,2])),nrow = 1,ncol = 4)
avg_name
avg_name <- matrix(c(mean(m1[,1]),mean(m1[,2]),mean(m1[,3]),mean(m1[,4])),nrow = 1,ncol = 4)
avg_name
avg_subject <- matrix(c(mean(m1[1,]),mean(m1[2,]),mean(m1[3,]),mean(m1[4,])),nrow = 1,ncol = 4)
avg_subject
row <- c(80,90,70,100)
row
row2 <- c(80,99,78,72)
row2
row3 <- c(90,78,82,78)
row4 <- c(99,89,78,90)
m1 <- matrix(c(row,row2,row3,row4),nrow = 4,ncol = 4,byrow=T)
m1
avg_subject <- c(matrix(mean(m1[1,]),mean(m1[2,]),mean(m1[3,]),mean(m1[4,]),nrow = 1,ncol = 4))
avg_subject
