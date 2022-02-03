tabItem( 
    tabName = 'fluss' ,
    
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Sankey", collapsible = F,
            plotlyOutput("ovhPlot"),
            footer = "Der Sankey Plot zeigt einen Ablauf bei dem Benutzer:innen verschiedene Entscheidungen fällen. 
            Sehr nützlich, wenn es darum geht zu betrachten, wo Kunden abspringen.
            Sollte vor allem für lineare Abläufe verwendet werden. Wenn die Benutzer:in zwischen mehreren Ebenen hin und her springen kann (zirkuläre Nutzung),
            sollten andere Plots, wie z.B. ein Chord Diagramm oder ein Sunburst Plot verwendet werden."
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "Sankey - R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("ovhPlot_func")
      )
    ),
    
    
    fluidRow(
      box(  width = 7, solidHeader = FALSE, 
            title = "Sunburst", collapsible = F,
            sunburstOutput("sunburst_rda", width = "100%", height = "400px"),
            footer = "Der Sunburst Plot zeigt ebenfalls ein Ablauf von Schritten, wobei nicht alle Nutzende die selbe Reihenfolge durchlaufen.
            User können zwischen verschiedenen Ebenen hin- und herspringen. Im Beispiel rufen die meisten User zuerst den Übersichtstab auf,
            einige hingegen starten mit dem Tab Einzahlungen und gehen dann auf den Übersichtstab. Dieser Plot ist sinnvoll für eine Mustererkennung,
            um Hypothesen über das Kundenverhalten aufzustellen. Werden oft zwei Schritte nacheinander aufgefüht kann das auf mögliche Synerigen hindeuten."
      ),
      
      box(  width = 5, solidHeader = FALSE, 
            title = "Sunburst - R-Code", collapsible = T, collapsed = T,
            verbatimTextOutput("sunburst_func")
      )
    ),
)
