library("dplyr")
library("shiny")
library("plotly")
source("Scripts/filter.R")

my.server <- function(input, output) {
  output$country.graph <- renderPlotly( {
    females <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == input$country, Series.Code == input$series)
    female.mani <- select(females, -Series, -Series.Code, -Country.Name, -Country.Code, -NA_count)

    males <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == input$country, Series.Code == gsub("FE", "MA", females$Series.Code))
    
    males <- filter(countries.filtered.48.edu.employ.good.data, Country.Code == input$country, Series.Code == gsub(".FE", ".MA", females$Series.Code))
    males.mani <- select(males, -Series, -Series.Code, -Country.Name, -Country.Code, -NA_count)

    years <- c(1960:2017)
    
    gender.together <- rbind(years, female.mani, males.mani)
   # colnames(complete) <- years
    working <- data.frame(t(gender.together))
   #  rownames(working) <- years
    # colnames(working) <- c("Years","Female", "Male")
    
    gender.complete <- na.omit(working)
    
    if(input$series=="SL.UEM.1524.FM.ZS") {
      gender.complete$X3 <- 100 - gender.complete$X2
    }
    
    title <- gsub(", female", "", females$Series)
    
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
    c <- 0
    d <- 0
    if(gender.complete$X2==gender.complete$X3){
      a <- 3
      b <- -3
      c <- 3
      d <- -3
    }
    
    Male1 <- list(
      xref = 'paper',
      yref = 'y',
      x = 0,
      y = gender.complete[1,3] + b,
      xanchor = 'right',
      yanchor = 'middle',
      text = ~paste('Male', round(gender.complete[1,3],digits = 1)),
      font = list(family = 'Arial',
                  size = 16,
                  color = 'rgba(0, 128, 0, 1)'),
      showarrow = FALSE)
    
    
    Female1 <- list(
      xref = 'paper',
      yref = 'y',
      x = 0,
      y = gender.complete[1,2] + a,
      xanchor = 'right',
      yanchor = 'middle',
      text = ~paste('Female ', round(gender.complete[1,2],digits=1)),
      font = list(family = 'Arial',
                  size = 16,
                  color = 'rgba(255,0,0,1)'),
      showarrow = FALSE)
    
    Male2 <- list(
      xref = 'paper',
      x = 0.95+0.05,
      y = gender.complete[nrow(gender.complete),3] + d,
      xanchor = 'left',
      yanchor = 'middle',
      text = paste('Male ', round(gender.complete[nrow(gender.complete),3],digits = 1)),
      font = list(family = 'Arial',
                  size = 16,
                  color = 'rgba(0, 128, 0, 1)'),
      showarrow = FALSE)
    
    Female2 <- list(
      xref = 'paper',
      x = 0.95+0.05,
      y = gender.complete[nrow(gender.complete),2] + c,
      xanchor = 'left',
      yanchor = 'middle',
      text = paste('Female ', round(gender.complete[nrow(gender.complete),2],digits = 1)),
      font = list(family = 'Arial',
                  size = 16,
                  color = 'rgba(255,0,0,1)'),
      showarrow = FALSE)
    
    p <- plot_ly(gender.complete, x = ~gender.complete$X1) %>%
      add_trace(y = ~X2, type = 'scatter', mode = 'lines', line = list(color = 'rgba(255,0,0,1)', width = 2))  %>%
      add_trace(y = ~X3, type = 'scatter', mode = 'lines', line = list(color = 'rgba(0, 128, 0, 1)', width = 4)) %>%
      #add_trace(x = ~c(gender.complete[1,1], gender.complete[nrow(gender.complete),1]), y = ~c(gender.complete[1,2], gender.complete[nrow(gender.complete),2]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(67,67,67,1)', size = 8)) %>%
      #add_trace(x = ~c(gender.complete[1,1], gender.complete[nrow(gender.complete),1]), y = ~c(gender.complete[1,3], gender.complete[nrow(gender.complete),3]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(49,130,189, 1)', size = 12)) %>%
      #add_trace(x = ~c(X1[1], X1[nrow(gender.complete)]), y = ~c(X2[1], X2[nrow(gender.complete)]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(67,67,67,1)', size = 8)) %>%
      #add_trace(x = ~c(X1[1], X1[nrow(gender.complete)]), y = ~c(X3[1], X3[nrow(gender.complete)]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(49,130,189, 1)', size = 12)) %>%
      layout(title = gsub("male vs female to male youth unem","female to male youth unem",gsub("female","male vs female",gsub(", female", "", females$Series))), xaxis = xaxis, yaxis = yaxis, margin = margin,
             autosize = FALSE,
             showlegend = FALSE,
             annotations = Male1) %>%
      layout(annotations = Female1) %>%
      layout(annotations = Male2) %>%
      layout(annotations = Female2)
    
    return(p)
    
  })
  
    
}

shinyServer(my.server)


