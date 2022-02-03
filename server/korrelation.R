output$ui_korrelation <- renderUI({
  source(file.path("ui","korrelation_dashboard.R"), local = T, encoding = "utf8")$value 
})

ols_fit <- lm(dataLoad$cars$mpg ~ dataLoad$cars$hp)

output$korrelation_scatter <- renderPlotly({
  
  plot_ly(
    x = ~ dataLoad$cars$hp,
    y = ~ dataLoad$cars$mpg,
    type = "scatter",
    mode = "markers",
    name = "",
    marker = list(
      size = 10,
      color = sgkb.farben$green
    )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      xaxis = list(title = "hp"),
      yaxis = list(title = "mpg")
    )   %>%
    config(displayModeBar = F)
  
})

output$corr_scatter_code <- renderPrint({
  cat('plot_ly(
    x = ~ dataLoad$cars$hp,
    y = ~ dataLoad$cars$mpg,
    type = "scatter",
    mode = "markers",
    name = "",
    marker = list(
      size = 10,
      color = sgkb.farben$green
    )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      xaxis = list(title = "hp"),
      yaxis = list(title = "mpg")
    )   %>%
    config(displayModeBar = F)'
      , sep = "\n")
})

output$korrelation_text_sub <- renderText(
    "
    Im Unterschied zum Zeit-Scatter-Plot ist in diesem Scatter-Plot eine nummerische Variable auf der x- & y-Achse.
    Ein Scatter-Plot dieser Art erlaubt einen grafischen Eindruck, ob eine Korrelation zwischen zwei Variablen vorliegt.
    <br>
    Korrelation (als statistisches Mass) gibt an, wie stark sich zwei Variablen in die gleiche Richtung bewegen. Eine hohe Korrelation liegt vor, 
    wenn (relativ zum Durchschnitt) hohe Ausprägungen einer Variable mit hohen Ausprägungen der zweiten Variablen einhergehen.
    Im Scatter-Plot trit dies auf, wenn die Punkte sich ungefähr auf einer diagonalen Linie befinden.
    <br>
    
              Achtung: Korrelation sollte nicht fälschlicherweise als Kausalität interpretiert werden.
              Eine hohe Korrelation kann womöglich durch eine kausale Beziehung erfolgen, es ist 
              aber ebenfalls möglich, dass beide Variablen den selben Auslöser haben oder die 
              Korrelation rein zufällig entsteht.
              "
)

output$korrelation_corr_plot <- renderPlot({
  mat <- cor(dataLoad$cars[c("mpg","disp", "hp", "qsec", "gear")])
  corrplot(mat)
  
})

output$corr_plot_code <- renderPrint({
  cat('corrplot(mat)'
      , sep = "\n")
})

output$corr_plot_text <- renderText(
  "
    Ein Korrelationsplot ist eine Matrix deren einzelnen Elemente die Korrelation zwischen den Variablen in der 
    korrespondierenden Spalte und Zeile darstellt. <br>
    Ein Korrelationsplot ist nützlich wenn Korrelationen zwischen verschiedenen Variablen betrachtet werden müssen,
    beispielsweise in der Erkundungsphase der Datenanalyse. Die diagonale (von links oben nach rechts unten) hat immer zwingend
    den Wert 1.  <br>
    Im Beispiel lässt sich erkennen, dass mehr HP (Pferdestärke) negativ Korreliert ist mit MPG (Miles per Gallon):
    Ein Auto mit mehr Leistung verbraucht mehr Benzin.
    
    "
)


output$regression_scatter <- renderPlotly({
  
  plot_ly(
    x = ~ dataLoad$cars$hp,
    y = ~ fitted(ols_fit),
    type = "scatter",
    name = "Regressionslinie",
    mode = "lines",
    line = list( color = sgkb.farben$yellow )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      xaxis = list(title = "hp"),
      yaxis = list(title = "mpg")
    )   %>%
    add_trace(x = ~ dataLoad$cars$hp, y = ~ dataLoad$cars$mpg, name = "Scatter", mode = "markers",
              marker = list(color = sgkb.farben$green, size = 10), inherit = F) %>%
    config(displayModeBar = F)
    
  
})

output$regression_scatter_code <- renderPrint({
  cat('  plot_ly(
    x = ~ dataLoad$cars$hp,
    y = ~ fitted(ols_fit),
    type = "scatter",
    name = "Regressionslinie",
    mode = "lines",
    line = list( color = sgkb.farben$yellow )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      xaxis = list(title = "hp"),
      yaxis = list(title = "mpg")
    )   %>%
    add_trace(x = ~ dataLoad$cars$hp, y = ~ dataLoad$cars$mpg, name = "Scatter", mode = "markers",
              marker = list(color = sgkb.farben$green, size = 10), inherit = F) %>%
    config(displayModeBar = F)'
      , sep = "\n")
})

output$regression_summary <- renderPrint(
  summary(ols_fit)
)

output$regression_text <- renderText(
    "
    Eine lineare Regression versucht mathematische eine gerade Linie zwischen den Punkten in einem Scatterplot
    so einzufügen, dass der geringste Abstand zu allen Punkten vorliegt. <br>
    Im Gegensatz zur Korrelationsanalyse kann man eine multi-variate Regression einsetzten. 
    Das Ziel ist es hierbei, die Ausprägung einer Zielvariable (y) anhand mehrer Erklärvariablen (x1, x2, ...) zu erklären.
    Die graphische Darsellung erschwert sich, jedoch können Statistiken zur Regression interessante Einblicke ermöglichen.
    <br>
    Der <b>Regressionskoeffizient</b> gibt an um wie viel sich die Zielvariable (y) erhöht,
    wenn die wählbare Variable (x_i) um eine Einheit erhöht wird. In unserem Beispiel führt eine Erhöhung der Pferdestärke um
    eine Einheit um eine Abnahme der Miles per Gallon von 0.068. <br>
    Der <b>p-Wert</b> (in R als <i>'Pr(>|t|)'</i> angegeben) des Koeffizienten gibt an, wie <i>statistisch signifikant</i> 
    dieser Wert ist.     Umso tiefer der p-Wert  umso wahrscheinlicher besteht der 
    statistische Zusammenhang zwischen den beiden Variablen. Die drei Sterne neben dem P-Wert dienen zu Veranschaulichung
    und bedeuten, dass der p-Wert sehr tief ist und der Koeffizient dementsprechend statistisch signifikant.<br>
    Als weiteres Mass kann das <b>Bestimmtheitsmass (R^2)</b> herbeigezogen werden.
    Das Bestimmtheitsmass sagt aus, wie viel Prozent der Variation in der Zielvariable (y) durch 
    die erklärende(n) Variable(n) (x) erklärt werden kann. Circa 60% der Variation des Benzinverbrauchs zwischen 
    den Autos in unserem Beispiel kann durch die Motorleistung erklärt werden.
    
    "
)