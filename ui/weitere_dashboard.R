tabItem( 
    tabName = 'weitere' ,
      
      fluidRow(
        column(7,
               box(  width = 12, solidHeader = FALSE, 
                     title = "Radar Plot ", collapsible = F,
                     plotlyOutput("RadarChart")
               ),
               box(  id = "no_title",
                     width = 12, solidHeader = FALSE, 
                     title = NULL, headerBorder =  FALSE, collapsible = F,
                     htmlOutput( "radar_text" )
               )
        ),

        
        box(  width = 5, solidHeader = FALSE, 
              title = "R-Code", collapsible = T, collapsed = T,
              verbatimTextOutput("radar_code")
        )
        
      )
      
)
    

