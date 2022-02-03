output$ui_fluss <- renderUI({
  source(file.path("ui","fluss_dashboard.R"), local = T, encoding = "utf8")$value 
})



# Sankey -----------------------------

minZeit         <- as.Date("2020-10-12")
maxZeit         <- as.Date("2020-12-14")
data            <- dataLoad$onboarding
journey         <- colSums(data[which(as.Date(data$Tag) >= minZeit & as.Date(data$Tag)  <= maxZeit), 
                                - match(c("Tag"), names(data))], na.rm = T)


output$ovhPlot <- renderPlotly({
  total <- journey["Start"]
  plot_ly(
    type            = "sankey",
    orientation     = "h",
    node            = list(
      label       = c("Landingpage", #0
                      "Schritt 1", #1
                      "Schritt 2", #2
                      "Bestätigung", #3
                      "Abbruch"), #4
      color       = c(sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$yellow),
      pad         = 15,
      thickness   = 25,
      line        = list(color = sgkb.farben$grey, width = 0.5)
    ),
    
    link = list (
      source = c(0,0,  1,1, 2,2),
      target = c(1,4,  2,4, 3,4),
      value  = c(journey["Step_1"],
                 journey["Start"] - journey["Step_1"],
                 
                 journey["Step_2"],
                 journey["Step_1"] - journey["Step_2"],
                 
                 journey["Step_3"],
                 journey["Step_2"] - journey["Step_3"]
      ),
      
      label  = c(paste0(round(journey["Step_1"]/total*100, 2), "%"),
                 paste0(round((journey["Start"] - journey["Step_1"])/total*100, 2), "%"),
                 
                 paste0(round(journey["Step_2"]/total*100, 2), "%"),
                 paste0(round((journey["Step_1"] - journey["Step_2"])/total*100, 2), "%"),
                 
                 paste0(round(journey["Step_3"]/total*100, 2), "%"),
                 paste0(round((journey["Step_2"] - journey["Step_3"])/total*100, 2), "%")
      ),
      
      color  = c(sgkb.farben$lightblue, sgkb.farben$lightgrey,
                 sgkb.farben$lightblue, sgkb.farben$lightgrey,
                 sgkb.farben$lightblue, sgkb.farben$lightgrey)
    )
  ) %>% layout( font = list( size = 10 ) ) %>%   config(displayModeBar = F)
})



output$ovhPlot_func <- renderPrint({
  cat('plot_ly(
    type            = "sankey",
    orientation     = "h",
    node            = list(
      label       = c("Landingpage", #0
                      "Schritt 1", #1
                      "Schritt 2", #2
                      "Bestätigung", #3
                      "Abbruch"), #4
      color       = c(sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$lime,
                      sgkb.farben$yellow),
      pad         = 15,
      thickness   = 25,
      line        = list(color = sgkb.farben$grey, width = 0.5)
    ),
    
    link = list (
      source = c(0,0,  1,1, 2,2),
      target = c(1,4,  2,4, 3,4),
      value  = c(journey["Step_1"],
                 journey["Start"] - journey["Step_1"],
                 
                 journey["Step_2"],
                 journey["Step_1"] - journey["Step_2"],
                 
                 journey["Step_3"],
                 journey["Step_2"] - journey["Step_3"]
      ),
      
      label  = c(paste0(round(journey["Step_1"]/total*100, 2), "%"),
                 paste0(round((journey["Start"] - journey["Step_1"])/total*100, 2), "%"),
                 
                 paste0(round(journey["Step_2"]/total*100, 2), "%"),
                 paste0(round((journey["Step_1"] - journey["Step_2"])/total*100, 2), "%"),
                 
                 paste0(round(journey["Step_3"]/total*100, 2), "%"),
                 paste0(round((journey["Step_2"] - journey["Step_3"])/total*100, 2), "%")
      ),
      
      color  = c(sgkb.farben$lightblue, sgkb.farben$lightgrey,
                 sgkb.farben$lightblue, sgkb.farben$lightgrey,
                 sgkb.farben$lightblue, sgkb.farben$lightgrey)
    )
  ) %>% layout( font = list( size = 10 ) ) %>%   config(displayModeBar = F)'
  , sep = "\n")
})



# Sunburst -----------------------------
plot = add_shiny(htmlwidgets::onRender(
  sunburst(dataLoad$sunburst, withD3 = T),
  "
    function(el,x){
    // check legend
    d3.select(el).select('.sunburst-togglelegend').property('checked',true);
    // simulate click
    d3.select(el).select('.sunburst-togglelegend').on('click')();
    }
    "))

output$sunburst_rda <- renderSunburst({
  
  plot
  
})





output$sunburst_func <- renderPrint({
  cat("
      add_shiny(htmlwidgets::onRender(
  sunburst(dataLoad$sunburst, withD3 = T),
  '
      function(el,x){
        // check legend
        d3.select(el).select('.sunburst-togglelegend').property('checked',true);
        // simulate click
        d3.select(el).select('.sunburst-togglelegend').on('click')();
      }
      '))

      "
      , sep = "\n")
})

