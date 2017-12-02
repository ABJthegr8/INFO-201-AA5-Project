library(dplyr)

countries.l.z<-read.csv("eae414b7-55b2-4c9b-b63f-ed07e4a90bc8_Data.csv",stringsAsFactors = FALSE)

countries.l.z<-mutate(countries.l.z,NA_count = rowSums(is.na(countries.l.z)))

new.country<-filter(countries.l.z,NA_count<48)
unique(new.country$Series.Name)


grouped.by.country<-new.country %>%
                  group_by(Country.Name) %>% 
              summarise(count=n())
