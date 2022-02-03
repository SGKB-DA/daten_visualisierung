
options(shiny.maxRequestSize= 30*1024^2)

server <- function(input, output, session) {
    

    output$veraenderung_zeit_text <- renderText({
            "Diese Grafiken zeigen Veränderungen über (kurze) Zeitspannen dar. 
            Meist handelt es sich um Veränderungen in einer täglichen Frequenz.
            <br>
            <br>
            <b>Beispiele:</b> Anzahl Logins pro Tag
            "
        })
    

    output$haeufigkeit_text <- renderText({
        "Häufigkeitsverteilungen zeigen auf, wie oft bestimmte Elemente vorkommen. 
        Die Verteilungen zeigen auf, wie ungleich Gruppen verteilt sind.
        <br>
        <br>
        <b>Beispiele:</b> Kategorisierung von Usergruppen nach Alter/Geschlecht"
    })
    

    
    output$fluss_text <- renderText({
        "Fluss-Diagramme zeigen Änderungen von einem Status zum nächsten auf. 
        Nützlich sind sie, wenn eine Abfolge von Schritten betrachtet wird, wobei bei jedem Schritt verschiedene Ergebnisse möglich sind.
        <br>
        <br>
        <b>Beispiele:</b> Verhalten im App-Onboarding. Bei welchem Punkt springen User ab?"
    })

    output$korrelation_text <- renderText({
        "Um den Zusammenhang zwischen mehreren Variablen zu analysieren liegen mehrere statistische Verfahren vor.
        Werden zwei Variablen in Betracht gezogen, so ist eine simple lineare Regression oder eine Korrelationsanalyse anwendbar. <br>
        Korrelation beschreibt, wie stark zwei Werte eine ähnliche Ausprägung annehmen.
        Eine hohe Korrelation würde bedeuten, dass ein verhältnismässig hoher Wert der ersten Variabel, mit einem
        verhältnismässig ähnlich hohen Wert der zweiten Variabel einhergeht.<br>
        <br>
        <b>Beispiele:</b> --"
    })
    
    observeEvent(input$sidebarmenu, {
        
        if(input$sidebarmenu %in% c("zeit")){
            source(file.path("server","zeit.R"), local = T, encoding = "utf8")$value
        }
        
        if(input$sidebarmenu == "fluss"){
            source(file.path("server","fluss.R"), local = T, encoding = "utf8")$value
        }
        
        if(input$sidebarmenu == "haeufigkeit"){
            source(file.path("server","haeufigkeit.R"), local = T, encoding = "utf8")$value
        }
        
        if(input$sidebarmenu == "korrelation"){
            source(file.path("server","korrelation.R"), local = T, encoding = "utf8")$value
        }
        
        
        if(input$sidebarmenu == "info"){
            source(file.path("server","info.R"), local = T, encoding = "utf8")$value
        }
        
        if(input$sidebarmenu == "weitere"){
            source(file.path("server","weitere.R"), local = T, encoding = "utf8")$value
        }
        
    })



}

