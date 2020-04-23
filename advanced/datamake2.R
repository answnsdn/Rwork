test1 <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu=c(77,56,99,100,99))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final_jumsu=c(77,56,99,100,99))
test1
test2
#두 개의 data 열 방향으로 합치기 : left_join(data1,data2,by="기준(키)")
final_data <- left_join(test1,test2,"id")
final_data
#data.frame을 이용해 문자를 삽입하면 구조가 Factor타입이므로 문제가 생길수 있다. 
#        ==> StringAsFactor=F로 통해 chr로 바꾼다.
namedata <- data.frame(class=c(1,2,3,4,5),teacher=c("kim","lee","park","jang","hong"),stringsAsFactors = F)
str(namedata)
exam_new <- left_join(exam,namedata,"class")
exam_new

groupA <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu=c(77,56,99,100,99))
groupB <- data.frame(id=c(6,7,8,9,10),
                    mid_jumsu=c(77,56,99,100,99))
#bind_rows : 행방향으로 데이터 합치기
groupTotal <- bind_rows(groupA,groupB)
groupTotal
####p.150 예제####
mpg %>% group_by(class) %>% 
        summarise(avg=mean(city))
mpg %>% group_by(class) %>% 
    summarise(avg=mean(city)) %>% 
    arrange(desc(avg))
mpg %>% group_by(manufacturer) %>% summarise(hwyavg=mean(highway)) %>%  arrange(desc(hwyavg)) %>% head(3)
mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>% summarise(compact=n()) %>% arrange(desc(compact))
####p.157 예제####
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F
                   )
fuel
head(mpg)
joinmpg <- left_join(fuel,mpg,"fl")
head(joinmpg)
joinmpg %>% select(model,fl,price_fl) %>% head(5)
