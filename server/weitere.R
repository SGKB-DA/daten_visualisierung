output$ui_weitere <- renderUI({
  source(file.path("ui","weitere_dashboard.R"), local = T, encoding = "utf8")$value 
})



data_cluster = tribble(
  ~Cluster, ~Attribut_1, ~Attribut_2, ~Attribut_3, ~Attribut_4, ~Attribut_5, ~Name,
  1, 5, 4.5, 3, 1, 4, "Zielsegment",
  2, 2, 1.3, 4, 3.5, 3, "Segment 2",
  3, 1.6, 2.7, 3.5, 3, 1, "Nicht-Kunden"
)

cluster.names = data_cluster$Name
label.names = colnames(data_cluster[,c(2:6)])
df = as.list(setNames(data.frame(t(data_cluster[,c(2:6)])), cluster.names))

colors                      <- c(sgkb.farben$green, sgkb.farben$lightblue, sgkb.farben$yellow)

output$RadarChart           <- renderPlotly({         
  p <- plot_ly( type = "scatterpolar", mode = "lines+markers" ) %>%
    layout( showlegend = T, polar = list(radialaxis = list(visible = T, range = c(0,5)) ) )
  
  for (i in 1 :length(cluster.names)){
    cn <- cluster.names[i]
    p <- add_trace(p, r = c(df[[cn]], df[[cn]][1]),
                   theta = c(label.names, label.names[1]),
                   name = cn,
                   line = list(color = colors[i], width = 2),
                   marker = list(size = 5, color = colors[i], line  = list(color = sgkb.farben$grey, width  = 1.1)))
  }
  
  print(p)
  
})

output$radar_code <- renderPrint({
  cat('
      cluster.names = data_cluster$Name
label.names = colnames(data_cluster[,c(2:6)])
df = as.list(setNames(data.frame(t(data_cluster[,c(2:6)])), cluster.names))

colors                      <- c(sgkb.farben$green, sgkb.farben$lightblue, sgkb.farben$yellow)

output$RadarChart           <- renderPlotly({         
  p <- plot_ly( type = "scatterpolar", mode = "lines+markers" ) %>%
    layout( showlegend = T, polar = list(radialaxis = list(visible = T, range = c(0,5)) ) )
  
  for (i in 1 :length(cluster.names)){
    cn <- cluster.names[i]
    p <- add_trace(p, r = c(df[[cn]], df[[cn]][1]),
                   theta = c(label.names, label.names[1]),
                   name = cn,
                   line = list(color = colors[i], width = 2),
                   marker = list(size = 5, color = colors[i], line  = list(color = sgkb.farben$grey, width  = 1.1)))
  }
  
  print(p)
  
})
      '
      , sep = "\n")
})


output$radar_text <- renderText(
  "
    Ein Radarplot ist nützlich zur Darstellung von Clustern, beispielweise nach Anwendung eines <i>k-means</i> Algorithmus. Die Cluster unteteilen
    die User in verschiedene Gruppen, basierend auf bestimmten Attributen. Der Radarplot zeigt, welche Ausprägung diese Attribute bei den verschiedenen
    Gruppen durchschnittlich einnehmen. Der Radarplot ist vorallem nützlich, da meist Algorithmen die Cluster generieren. Durch die Betrachtung der Ausprägung
    im Radarplot können den Clustern interpretierbare Namen gegeben werden. Ebenfalls können einzelne Kunden danach im Cluster dargestellt werden.<br>
    In der Grafik ist sichtbar, dass das Zielsegment viel höhere Ausprägungen in den Attributen 1 und 2 hat. 
    
    "
)