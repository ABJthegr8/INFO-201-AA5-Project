library("dplyr")
library("shiny")
library("plotly")
source("Scripts/filter.R")

Title <- "Female "

labels <- c("Male", "Female")

my.thingr <- function(input, output) {
  output$countryData <-
    data.temp <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == input$country, Series.Code == input$series)
    title <- data.temp$Series
    
}
females <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == "MEX", Series.Code == "IC.REG.DURS.FE")

female.mani <- select(females, -Series, -Series.Code, -Country.Name, -Country.Code, -NA_count)

males <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == "MEX", Series.Code == gsub("FE", "MA", females$Series.Code))

males.mani <- select(males, -Series, -Series.Code, -Country.Name, -Country.Code, -NA_count)

years <- c(1960:2017)

gender.together <- rbind(years, female.mani, males.mani)
colnames(complete) <- years
working <- data.frame(t(gender.together))
rownames(working) <- years
colnames(working) <- c("Years","Female", "Male")

gender.complete <- na.omit(working)

title <- females$Series

xaxis <- list(title = "",
              showline = TRUE,
              showgrid = FALSE,
              showticklabels = TRUE,
              linecolor = 'rgb(204, 204, 204)',
              linewidth = 2,
              autotick = FALSE,
              ticks = 'outside',
              tickcolor = 'rgb(204, 204, 204)',
              tickwidth = 2,
              ticklen = 5,
              tickfont = list(family = 'Arial',
                              size = 12,
                              color = 'rgb(82, 82, 82)'))

yaxis <- list(title = "",
              showgrid = FALSE,
              zeroline = FALSE,
              showline = FALSE,
              showticklabels = FALSE)

margin <- list(autoexpand = FALSE,
               l = 100,
               r = 100,
               t = 110)
a <- 0
b <- 0

if(gender.complete[1,1] ) {
  a <- 3
  b <- -3
}

Male1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = gender.complete[1,3],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Male', gender.complete[1,3], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)


Female1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = gender.complete[1,2] + 10,
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Female ', gender.complete[1,2], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(49,130,189, 1)'),
  showarrow = FALSE)

Male2 <- list(
  xref = 'paper',
  x = 0.95,
  y = gender.complete[nrow(gender.complete),3],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Male ', gender.complete[nrow(gender.complete),3], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(255,0,0,1)'),
  showarrow = FALSE)

Female2 <- list(
  xref = 'paper',
  x = 0.95,
  y = gender.complete[nrow(gender.complete),2] + 10,
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Female ', gender.complete[nrow(gender.complete),2], '%'),
  font = list(family = 'Arial',
              size = 16,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

p <- plot_ly(gender.complete, x = ~rownames(gender.complete)) %>%
  add_trace(y = ~Female, type = 'scatter', mode = 'lines', line = list(color = 'rgba(255,0,0,1)', width = 2))  %>%
  add_trace(y = ~Male, type = 'scatter', mode = 'lines', line = list(color = 'rgba(0, 128, 0, 1)', width = 4)) %>%
  add_trace(x = ~c(gender.complete[1,1], gender.complete[nrow(gender.complete),1]), y = ~c(gender.complete[1,2], gender.complete[nrow(gender.complete),2]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(67,67,67,1)', size = 8)) %>%
  add_trace(x = ~c(gender.complete[1,1], gender.complete[nrow(gender.complete),1]), y = ~c(gender.complete[1,3], gender.complete[nrow(gender.complete),3]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(49,130,189, 1)', size = 12)) %>%
  layout(title = females$Series, xaxis = xaxis, yaxis = yaxis, margin = margin,
         autosize = FALSE,
         showlegend = FALSE,
         annotations = Male1) %>%
  layout(annotations = Female1) %>%
  layout(annotations = Male2) %>%
  layout(annotations = Female2)