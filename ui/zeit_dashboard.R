tabItem( 
    tabName = 'zeit' ,
    
    fluidRow(
      box(  width = 6, solidHeader = FALSE, 
            title = "Scatter Plot (1-Dimensional) ", collapsible = F,
            plotlyOutput("scatter"),
            footer = "Der Scatter Plot wird in erster Linie verwendet wenn Entwicklungen über eine Zeitdauer dargestellt werden.
            Der Scatterplot, im Gegensatz zum Lineplot, ist nützlicher bei höherer Volatilität und wenn die genaue Zahl pro Datum relevant ist.
            Aus Übersichtlichkeitsgründen sollte die Zeitdauer eingeschränkt werden. 
            Bei täglichen Observationen limitieren wir auf 180 Tage, bei monatlichen Observationen auf ein Jahr."
      ),
      
      box(  width = 6, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("scatter_function")
      )
    ),
    
    fluidRow(
      box(  width = 6, solidHeader = FALSE, 
            title = "Scatter Plot (2 Traces) ", collapsible = F,
            plotlyOutput("scatter_2")
      ),
      
      box(  width = 6, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("scatter_2_func")
      )
    ),
    
    fluidRow(
      box(  width = 6, solidHeader = FALSE, 
            title = "Line Plot (2 Traces) ", collapsible = F,
            plotlyOutput("lineplot_2"),
            footer = "Ein Lineplot ist nützlich für eine Entwicklung von Zahlen, die stetig nach oben geht.
            Ein Beispiel ist die Anzahl eindeutige Nutzer:innen, die sich für eine App registriert haben. Ein Scatterplot sollte nicht 
            verwendet werden, da die genaue Zahl pro Datum irrelevant ist. Die Entwicklung und der heutige Stand sind entscheidend."
      ),
      
      box(  width = 6, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("lineplot_2_func")
      )
    ),
    
    fluidRow(
      box(  width = 6, solidHeader = FALSE, 
            title = "Scatter Plot inkl. Trend", collapsible = F,
            plotlyOutput("scatter_trend"),
            footer = "Der Scatter Plot inklusive Trend-Smoothing erlaubt es bei sehr volatilen Daten (grosse Schwankungen) 
            einfacher grobe Entwicklungen und Trends zu erkennen. Die genauen Daten sollten immer im Hintergrund sichtbar sein,
            da das Trend-Smoothing ansonsten irreführend sein kann."
      ),
      
      box(  width = 6, solidHeader = FALSE, 
            title = "", collapsible = T, collapsed = T,
            verbatimTextOutput("scatter_trend_func")
      )
    )


)
