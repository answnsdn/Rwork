install.packages("mongolite")
library("stringr")
library("mongolite")

#mongoDB에 저장하기 위해서는 크롤링해야 한다.
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")

url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
url_data <- readLines(url,encoding = "UTF-8")#크롤링할 사이트의 인코딩 방식에 맞게 세팅한다.
url_data
####크롤링한 데이터의 정보 확인####
#class(url_data)
#length(url_data)
#head(url_data)
#tail(url_data)
url_data[200]


####데이터 필터링 : title####
#1. str_detect를 이용해서 웹페이지 전체에서 필요한 데이터("menu-list") 추출
  #조건에 만족하는 데이터를 필터링
  filter_data <- url_data[str_detect(url_data,"subject_fixed")-3]#str_detect(패턴을 검사할 문자열,패턴):T/F로 나타내준다
  filter_data
#2. 추출한 데이터 전체에서 내가 필요한 문자열만 추출
  #후방,전방 탐색 정규 표현식
  title <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
  title
####데이터 필터링 : hit####
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
hit_data  
hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]#제일 위의 공지사항의 hit를 빼기 위함함
hit

####데이터 필터링 : url####
which(str_detect(url_data,"subject_fixed"))#str_detect로 뽑아낸 TRUE값의 위치를 리턴한다.
myurl <- url_data[which(str_detect(url_data,"subject_fixed"))]
myurl
url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_val
url_val <- str_sub(url_val,end = -3)#필요없는 문자열 잘라내기 : "end= -3"으로 뒤에서 3개를 잘라낸다.
url_val
url_val <- paste0("https://www.clien.net",url_val)#사이트 주소 더하기
url_val

####csv파일로 생성####
final_data <- cbind(title,hit,url_val)
final_data
write.csv(final_data,"crawl_data.csv")
save(final_data,file = "crawl_data.RData")#csv파일보다 로딩속도가 빠름
####mongodb에 저장하기####
if(con$count()>0){
  con$drop()
}
con$insert(final_data)
class(final_data)#matrix이기 때문에 mongodb에 저장x => dataframe으로 변환해야함.
final_data <- data.frame(final_data)
class(final_data)
con$insert(final_data)
