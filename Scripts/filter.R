library(dplyr)
library(knitr)
library("ggplot2")
library(plotly)

countries.a.l <- read.csv('../Data/250e7195-27cb-4e86-a87c-6856a3fa54e9_Data.csv',stringsAsFactors = FALSE)
countries.l.z <- read.csv('../Data/eae414b7-55b2-4c9b-b63f-ed07e4a90bc8_Data.csv',stringsAsFactors = FALSE)
countries <- rbind(countries.a.l, countries.l.z)

countries <- mutate(countries, NA_count = rowSums(is.na(countries)))

countries.filtered.10 <- filter(countries, NA_count < 10)
countries.filtered.48 <- filter(countries, NA_count < 48)
colnames(countries.filtered.10)[1] <- ("Series")
colnames(countries.filtered.48)[1] <- ("Series")

unique(countries.filtered.48$Series)

countries.filtered.48.summary.by.country <- group_by(countries.filtered.48, Country.Name) %>% 
  summarise(count=n())

countries.filtered.48.summary.by.series <- group_by(countries.filtered.48, Series) %>% 
  summarise(count=n())