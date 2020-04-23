#데이터프레임 기초
#matrix로 정의된 데이터를 dataframe으로 변경하는 작업
dataframeMat1 <- matrix(1:15,ncol = 3,byrow =T)
dataframeMat1
dataframeMat2 <- data.frame(dataframeMat1)
dataframeMat2
dataframeMat1[,1]
dataframeMat2[,1]
dataframeMat1 <- as.character(dataframeMat1[,1])#1열의 데이터를 문자형으로 변환
dataframeMat1
#str함수 - dataframe내부의 데이터형을 볼 수 있는 함수
str(dataframeMat1)
dataframeMat2[,1] <- as.character(dataframeMat1[,1])
str(dataframeMat2)
#"$"를 이용해서 열의 이름을 접근할 수 있다.
dataframeMat2$x1
#dataframe에 열 추가하기
dataframeMat2$x4 <- c(10,20,30,40,50)
dataframeMat2
dataframeMat2$x4 <- 10
dataframeMat2
dataframeMat2$x4 <- "문자형"
dataframeMat2
#필요한 곳에서 dataframe을 다시 matrix로 변환
dataframeMat2 <- as.matrix(dataframeMat1)
dataframeMat2
