library(shiny)
library(plotly)
source("Scripts/filter.R")
my.ui <- navbarPage(
  
  # Application title
  "Gender Inequality Statistics",
  tabPanel("Report",
           strong(h1("Gender Inequality Report")),

             mainPanel(
               plotlyOutput("Report")
             )
  ),
  tabPanel("Interactive Data",
           sidebarLayout(
             sidebarPanel(
               #Adding select input to choose from quantities
               selectInput('country', "Choose The Country", 
                           choices = list("Morocco" = "MAR",
                                          "Korea" = "KOR",
                                          "Mexico"="MEX",
                                          "Argentina"="ARG",
                                          "Spain"="ESP",
                                          "Colombia"="COL",
                                          "Malaysia"="MYS",
                                          "Israel"="ISR"
                                          
                           )
                           
               ), #Adding Slider To Select Series           
               selectInput("series",
                           "Choose Series",
                           choices=list("Enrollment In Primary School"="SE.PRM.TENR.FE",
                                        "Persistence To Grade 5(%)"="SE.PRM.PRS5.FE.ZS",
                                        "Primary Completion Rate"="SE.PRM.CMPT.FE.ZS",
                                        "Progression To Secondary School"="SE.SEC.PROG.FE.ZS",
                                        "Lower Secondary Completion"="SE.SEC.CMPT.LO.FE.ZS",
                                        #"Expected Years Of Schooling"="SE.SCH.LIFE.FE",
                                        "Self Employed"="SL.EMP.OWAC.FE.ZS",                      
                                        "Salaried Workers"="SL.EMP.WORK.FE.ZS",
                                        #"Percentage of Labour Force"="SL.TLF.TOTL.FE.ZS",
                                        "Buisness Startup Procedures"="IC.REG.PROC.FE",
                                        "Cost To Start Buisness"="IC.REG.COST.PC.FE.ZS",
                                        "Time Required To Start A Buisness"="IC.REG.DURS.FE",
                                        "Unemployment"="SL.UEM.TOTL.FE.ZS",
                                        "Youth Unemployment Rate"="SL.UEM.1524.FM.ZS",         
                                        "Vulnerable Employment"="SL.EMP.VULN.FE.ZS"))
             ),
             
             
             #Show a plot of the generated distribution
             mainPanel(
               plotlyOutput("country.graph")
             )
           )
  ),  tabPanel("About",
               strong(h1("Gender Inequality Statistics")),
               p("This website is the final project for INFO 201 at University of Washington. In this project,
                 we obtained grade distributions from all University of Washington classes between 2010 and 2016 
                 and made several charts to analyze and visualize various trends in the data. The website itself 
                 was made in R with various libraries including DPLYR, Plotly, and Shiny. We hope that UW students
                 will be able to use this data to inform themselves about the many departments, classes, and professors
                 at the University and ultimately use this information to make better decisions for their future."),
               
               strong(h2("Where is the data from?")),
       
                 paste("The data used for this project was from the World Bank's data hosting platform"),
               a("Data Bank.",href="http://databank.worldbank.org/data/reports.aspx?source=gender-statistics"),
               
               
               strong(h2("Who made the website?")),
               p("Abhijay Kumar"),
                p("Emmanuel Munoz"),
                 p("Nalin Gupta"),
               mainPanel(
                
               )
  )
)





shinyUI(my.ui)

