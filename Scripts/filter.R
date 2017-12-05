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

countries.filtered.48.edu <- filter(countries.filtered.48, Series.Code == "SE.PRM.TENR.FE" | Series.Code == "SE.PRM.TENR.MA"
                                  | Series.Code == "SE.SEC.CMPT.LO.FE.ZS" | Series.Code == "SE.SEC.CMPT.LO.MA.ZS"
                                  | Series.Code == "SE.PRM.NINT.FE.ZS" | Series.Code == "SE.PRM.NINT.MA.ZS"
                                  | Series.Code == "SE.PRM.PRS5.FE.ZS" | Series.Code == "SE.PRM.PRS5.MA.ZS"
                                  | Series.Code == "SE.PRM.CMPT.FE.ZS" | Series.Code == "SE.PRM.CMPT.MA.ZS"
                                  | Series.Code == "SE.SEC.PROG.FE.ZS" | Series.Code == "SE.SEC.PROG.MA.ZS"
                                  | Series.Code == "SE.PRM.CMPL.FE.ZS" | Series.Code == "SE.PRM.CMPL.MA.ZS"
                                  | Series.Code == "SE.SCH.LIFE.FE" | Series.Code == "SE.SCH.LIFE.MA")

countries.filtered.48.edu.summary.by.country <- group_by(countries.filtered.48.edu, Country.Name) %>% 
  summarise(count=n())

countries.filtered.48.edu.morocco <- filter(countries.filtered.48.edu, Country.Name == "Morocco")

countries.filtered.48.edu.employ1 <- filter(countries.filtered.48, Series.Code == "SE.PRM.TENR.FE" | Series.Code == "SE.PRM.TENR.MA"
                                    | Series.Code == "SE.SEC.CMPT.LO.FE.ZS" | Series.Code == "SE.SEC.CMPT.LO.MA.ZS"
                                    | Series.Code == "SE.PRM.NINT.FE.ZS" | Series.Code == "SE.PRM.NINT.MA.ZS"
                                    | Series.Code == "SE.PRM.PRS5.FE.ZS" | Series.Code == "SE.PRM.PRS5.MA.ZS"
                                    | Series.Code == "SE.PRM.CMPT.FE.ZS" | Series.Code == "SE.PRM.CMPT.MA.ZS"
                                    | Series.Code == "SE.SEC.PROG.FE.ZS" | Series.Code == "SE.SEC.PROG.MA.ZS"
                                    | Series.Code == "SE.PRM.CMPL.FE.ZS" | Series.Code == "SE.PRM.CMPL.MA.ZS"
                                    | Series.Code == "SE.SCH.LIFE.FE" | Series.Code == "SE.SCH.LIFE.MA"
                                    
                                    | Series.Code == "SL.EMP.SELF.FE.ZS" | Series.Code == "SL.EMP.SELF.MA.ZS"
                                    | Series.Code == "IC.REG.COST.PC.FE.ZS" | Series.Code == "IC.REG.COST.PC.MA.ZS"
                                    | Series.Code == "IC.REG.PROC.FE" | Series.Code == "IC.REG.PROC.MA"
                                    | Series.Code == "IC.REG.DURS.FE" | Series.Code == "IC.REG.DURS.MA"
                                    )

countries.filtered.48.edu.employ1.by.country <- group_by(countries.filtered.48.edu.employ1, Country.Name) %>% 
  summarise(count=n())

countries.filtered.48.employ1 <- filter(countries.filtered.48,  Series.Code == "SL.EMP.SELF.FE.ZS" | Series.Code == "SL.EMP.SELF.MA.ZS"
                                            | Series.Code == "IC.REG.COST.PC.FE.ZS" | Series.Code == "IC.REG.COST.PC.MA.ZS"
                                            | Series.Code == "IC.REG.PROC.FE" | Series.Code == "IC.REG.PROC.MA"
                                            | Series.Code == "IC.REG.DURS.FE" | Series.Code == "IC.REG.DURS.MA"
)

countries.filtered.48.employ1.by.country <- group_by(countries.filtered.48.employ1, Country.Name) %>% 
  summarise(count=n())