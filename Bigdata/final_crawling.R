####모두의 광장 10페이지까지 모든 게시글 크롤링하기####
#1. 모든 페이지의 title,hit,url,content 추출하기
#2. crawl_result.csv, crawl_result.RData 저장
#3. mongodb 저장(300개 저장)
#4. for,if문 활용

library("stringr")
library("mongolite")

#mongodb 저장하기
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")
#크롤링데이터 불러오기
first_url <- "https://www.clien.net/service/group/community?&od=T31&po="
final_crawl_datalist <- NULL
for(i in 0:9){
  final_url <- paste0(first_url,i)
  final_url <- readLines(final_url,encoding = "UTF-8")
  final_url
  #데이터 필터링하기 - title
  final_title <- final_url[str_detect(final_url,"subject_fixed")]
  final_title <- str_extract(final_title,"(?<=\">).*(?=</span>)")
  final_title
  #데이터 필터링하기 - hit
  final_hit <- final_url[str_detect(final_url,"<span class=\"hit\">")]
  final_hit <- str_extract(final_hit,"(?<=\">).*(?=</span>)")[-1]
  final_hit
  #데이터 필터링하기 - url
  filter_url <- final_url[which(str_detect(final_url,"subject_fixed"))-3]
  filter_url
  filter_url <- str_extract(filter_url,"(?<=href=\").*(?=data-role)")
  filter_url
  filter_url <- str_sub(filter_url,end = -3)#필요없는 문자열 잘라내기 : "end= -3"으로 뒤에서 3개를 잘라낸다.
  filter_url
  filter_url <- paste0("https://www.clien.net",filter_url)#사이트 주소 더하기
  filter_url
  
  
  #url을 이용해 내용 추출
  contentlist <- NULL
  filter_content <- NULL
  for(page in 1:length(filter_url)){
    contentdata <- readLines(filter_url[page],encoding = "UTF-8")
    contentdata
    start <- which(str_detect(contentdata,"post_content"))
    end <- which(str_detect(contentdata,"post_ccls"))
    
    filter_content <- contentdata[start:end]
    filter_content
    filter_content <- paste(filter_content,collapse = "")
    filter_content <- gsub("<.*?>","",filter_content)#gsub(지울부분,지운부분 대체할내용,지울 데이터 이름)
    filter_content <- gsub("\t|&nbsp;","",filter_content)
    filter_content
    #기존의 저장되어 있던 contentlist 내용에 추가
    contentlist <- c(contentlist,filter_content)
    contentlist
    cat("\n",page)
    final_crawl_data <- cbind(final_title,final_hit, filter_url,contentlist)
    
    
  }
  
  final_crawl_data
  final_crawl_datalist <- rbind(final_crawl_datalist,final_crawl_data)
  final_crawl_datalist
  
  
}
final_crawl_datalist

#저장하고 몽고DB 출력
write.csv(final_crawl_datalist,"crawl_result.csv")
save(final_crawl_datalist,file = "crawl_result.RData")    

if(con$count()>0){
  con$drop()
}    
  final_mongo_data <- data.frame(final_crawl_datalist)
  con$insert(final_mongo_data)
  class(final_mongo_data)
  