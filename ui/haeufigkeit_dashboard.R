tabItem( 
    tabName = 'haeufigkeit' ,
    
    
    ## ersetzen durch besseres BEispiel, das nicht sortiert wird
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Barplot", collapsible = F,
            plotlyOutput("barplot"),
            footer = "Der Barplot wird verwendet um Anzahlen pro Kategorie zu unterscheiden. 
            Der Vertikale Barplot sollte verwendet werden, wenn es um eine Zählung geht (die Y-Achse ist die Anzahl Obsevationen pro Kategorie der X-Achse)
            und die Kategorisierung der X-Achse eine natürliche Sortierung hat (z.B. Alter)"
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("barplot_func")
      )
    ),
    
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Doppelter Barplot", collapsible = F,
            plotlyOutput("double_barplot"),
            footer = "Gibt es verwandte Kategorien, so kann man mit einem doppelten Barplot diese direkt vergleichen. 
            Die Übersicht sinkt stark, wenn mehr als zwei Kategorien nebeneinander dargestellt werden"
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("double_barplot_func")
      )
    ),
    
    
    
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Horizontaler Barplot", collapsible = F,
            plotlyOutput("barplot_horizontal"),
            footer = "Der horizontale Barplot ist v.a. nützlich, wenn es darum geht zu erkennen, welche Kategorie 
            am häufigsten vorkommt. Dementsprechend sollte die Reihenfolge der Kategorien auf der Y-Achse nach der
            Menge auf der X-Achse sortiert sein."
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("barplot_h_func")
      )
    ),
    
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Horizontaler Barplot (Stacked)", collapsible = F,
            plotlyOutput("barplot_stacked"),
            footer = "Mit einem stacked Barplot können Anteile dargestellt werden, 
            zusätzlich zum absoluten Betrag. Dies ist nützlich, wenn eine Zahl am Ausschlagkräftigsten ist 
            (z.B. die Anzahl Nutzer pro Alterskategorie), aber zusätzliche Aufteilungen innerhalb der Kategorie 
            ebenfalls nutzenstiftend sein können (z.B. Geschlechtsaufteilung).
            Sollte nur verwendet werden, wenn die innere Zahl strikt kleiner ist als die äussere."
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("barplot_stacked_func")
      )
    ),
)
