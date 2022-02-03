tabItem(
    tabName = 'korrelation' ,
    
    fluidRow(
      column(7,
             box(  width = 12, solidHeader = FALSE, 
                   title = "Korrelation in einem Scatterplot", collapsible = F,
                   plotlyOutput("korrelation_scatter")
             ),
             box(  id = "no_title",
                   width = 12, solidHeader = FALSE, 
                   title = NULL, headerBorder =  FALSE, collapsible = F,
                   htmlOutput( "korrelation_text_sub" )
             )
             ),
      
      column(5, 
             box(  width = 12, solidHeader = FALSE, 
                   title = "R-Code", collapsible = T, collapsed = T,
                   verbatimTextOutput("corr_scatter_code")
             )
             )
    ),
    
    
    fluidRow(
      column(7,
             box(  width = 12, solidHeader = FALSE, 
                   title = "Korrelationsmatrix ", collapsible = F,
                   plotOutput("korrelation_corr_plot")
             ),
             box(  id = "no_title",
                   width = 12, solidHeader = FALSE, 
                   title = NULL, headerBorder =  FALSE, collapsible = F,
                   htmlOutput( "corr_plot_text" )
             )
      ),
      
      column(5, 
             box(  width = 12, solidHeader = FALSE, 
                   title = "R-Code", collapsible = T, collapsed = T,
                   verbatimTextOutput("corr_plot_code")
             )
      )
    ),
    
    
    fluidRow(
      column(7,
             box(  width = 12, solidHeader = FALSE, 
                   title = "Lineare Regression ", collapsible = F,
                   plotlyOutput("regression_scatter")
             ),
             box(   id = "no_title", width = 12, solidHeader = FALSE, 
                   title = NULL, collapsible = T,
                   verbatimTextOutput("regression_summary")
             ),
             
             box(  id = "no_title",
                   width = 12, solidHeader = FALSE, 
                   title = NULL, headerBorder =  FALSE, collapsible = F,
                   htmlOutput( "regression_text" )
             )
      ),
      
      column(5, 
             box(  width = 12, solidHeader = FALSE, 
                   title = "R-Code", collapsible = T, collapsed = T,
                   verbatimTextOutput("regression_scatter_code")
             )
      )
    )
)
