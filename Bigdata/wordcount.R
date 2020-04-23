install.packages("KoNLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)
####KoNLP 함수를 테스트####
extractNoun("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")
SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

####분석할 샘플데이터 로딩####
load("comments.RData")
load("score.RData")
length(comments)
length(score)
head(comments,10)
head(score,10)

sampledata <- comments[1:1000]
class(sampledata)


####형태소분석을 하기 위한 명사 분리####
data_list <- list()#댓글의 길이는 전부 다르기 때문에 분리된 명사의 개수가 모두 다름 ==> list를 이용한다.
for(i in 1:length(sampledata)){
  data <- SimplePos09(sampledata[i])
  data_list[[i]] <- data
}
data_list[[22]]
head(data_list,20)

#1. 리스트의 모든 요송 저장된 문자열을 /로 분할하는 작업 ==> sapply를 이용해 반복작업을 할 수 있다.
#2. 명사 N이 있는 문자열 가져오기 ==> "전화/N+하고/J"형태의 데이터이기 때문에 N앞에 있는 명사를 뽑는다.
#ex] sapply 예제
#     sapply(data.frame(test=c(1,2,3,4,5,6),
#                  test2=c(3,4,5,6,7,8)
#                ),#반복작업할 데이터
#       function(x){
#         x[1]
#       }#반복해서 적용할 함수
#       )
#리스트를 unlist를 사용하여 character로 변환하여 출력한다.
class(unlist(data_list))
wordlist <- sapply(str_split(unlist(data_list),"/"), function(x){
      x[1]
  })
class(wordlist)
head(wordlist,10)

#table함수를 이용해서 단어의 빈도수를 구하기
#table함수 : 벡터에 저장되어 있는 모든 단어들의 빈도수를 계산하여 변환
#             단어를 변수명으로 사용
tablewordlist <- table(wordlist)
tablewordlist
tablewordlist[89]
names(tablewordlist)

#분석한 데이터를 sort
sort(tablewordlist,decreasing = T)[1:100]
#분석결과 기준을 적용하여 정리 - 기준 : 한 글자 제외하기
nchar("글자수")
tablewordlist_result <- tablewordlist[nchar(names(tablewordlist))>1]
tablewordlist_result <- sort(tablewordlist_result,decreasing = T)[1:100]

#분석결과 저장되어 있는 tablewordlist_result의 값을
#단어와 숫자로 각각 저장
word <- names(tablewordlist_result)
count <- as.numeric(tablewordlist_result)
mycolor <- brewer.pal(n=8,name="RdYlBu")
wordcloud(words = word,freq = count,random.order = F,colors = mycolor,scale = c(5,1))

#RColorBrewer : 모든 색상의 파레트를 보여준다.
display.brewer.all(n=10,exact.n=F)
brewer.pal.info
display.brewer.all(type="div")
display.brewer.all(type="qual")
display.brewer.all(type="seq")
