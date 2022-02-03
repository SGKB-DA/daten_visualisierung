output$ui_zeit <- renderUI({
  source(file.path("ui","zeit_dashboard.R"), local = T, encoding = "utf8")$value 
})

df <- dataLoad$zeit

sgkb.create_scatter <- function(datum, y, x_axis_title = "Tag", y_axis_title = "", datum_range = c(max(as.Date(df$datum))-180, max(as.Date(df$datum))), 
                                y_range = c(min(y),max(y)), name_trace = "") {
  plot_ly(
    x = ~ datum,
    y = ~ y,
    type = 'scatter',
    mode = 'lines+markers',
    line = list(color = sgkb.farben$teal),
    name = name_trace,
    marker = list(
      size = 5,
      color = sgkb.farben$teal,
      line  = list(color = sgkb.farben$grey, width  = 1.1)
    )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = 'h'
      ),
      xaxis = list(title = x_axis_title, range = datum_range,
                   type = 'date', tickformat = "%d %B<br>%Y"),
      yaxis = list(title = y_axis_title, range = y_range)
    )   %>%
    config(displayModeBar = F)
}

#Beispiel
output$scatter <- renderPlotly({
              sgkb.create_scatter(dataLoad$zeit$Datum, dataLoad$zeit$Y)
                                })
output$scatter_function <- renderPrint({
    cat('
  sgkb.create_scatter <- function(datum, y, x_axis_title = "Tag", y_axis_title = "", datum_range = c(max(as.Date(df$Tag))-180, max(as.Date(df$Tag))), 
                                y_range = c(min(y),max(y)), name_trace = "") {
  plot_ly(
    x = ~ datum,
    y = ~ y,
    type = "scatter",
    mode = "lines+markers",
    line = list(color = line_colour_1),
    name = name_trace,
    marker = list(
      size = 5,
      color = line_colour_1,
      line  = list(color = sgkb.farben$grey, width  = 1.1)
    )
  ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      xaxis = list(title = x_axis_title, range = datum_range,
                   type = "date", tickformat = "%d %B<br>%Y"),
      yaxis = list(title = y_axis_title, range = y_range)
    )   %>%
    config(displayModeBar = F)
}
  '
      , sep = "\n")
})




## Scatter Plot 2 Traces ---------------------
sgkb.create_scatter_2_traces <- function(datum,y1,y2,name_y1 = "",name_y2="", 
                                         x_axis_title = "Tag", 
                                         y_range = c( min(y1), max(y1) ),
                                         y_axis_title = "",
                                         datum_range = c(max(as.Date(datum)-180),
                                                                           max(as.Date(datum)))){
  plot_ly(
    x = ~ as.Date(datum),
    y = ~ y1,
    type = "scatter",
    mode = "lines+markers",
    line = list(color = sgkb.farben$teal),
    name = name_y1,
    marker = list(
      size = 5,
      color = sgkb.farben$teal,
      line  = list(color = sgkb.farben$grey, width  = 1.1)
    )
  ) %>%
    add_lines(
      y = ~ y2,
      type = "scatter",
      mode = "lines+markers",
      line = list(color = sgkb.farben$yellow, dash = "dash"),
      name = name_y2,
      marker = list(
        size = 5,
        color = sgkb.farben$yellow,
        line  = list(color = sgkb.farben$grey, width  = 1.1)
      )
    ) %>%
    layout(
      legend = list(
        x = 0.01,    y = 100,    orientation = "h"
      ),
      yaxis = list(title = y_axis_title, range = y_range),
      xaxis = list(title = x_axis_title, range = datum_range)
    ) %>%
    config(displayModeBar = F)
}

# Beispiel
output$scatter_2 <- renderPlotly({
  sgkb.create_scatter_2_traces(datum = as.Date(df$Datum), y1 = df$Y, y2 = df$Y2, 
                               name_y1 = "Eröffnungen", name_y2 = "Saldierungen", y_axis_title = "Anzahl",
                               datum_range = c((max(as.Date(df$Datum))-180), max(as.Date(df$Datum)))) 
}) 

output$scatter_2_func <- renderPrint({
  cat('sgkb.create_scatter_2_traces <- function(datum,y1,y2,name_y1 = "",name_y2="", x_axis_title = "Tag", 
                                               y_axis_title = "", y_range = c(min(y),max(y)),
                                               datum_range = c(max(as.Date(datum)-180),max(as.Date(datum)))){
    plot_ly(
      x = ~ as.Date(datum),
      y = ~ y1,
      type = "scatter",
      mode = "lines+markers",
      line = list(color = sgkb.farben$teal),
      name = name_y1,
      marker = list(
        size = 5,
        color = sgkb.farben$teal,
        line  = list(color = sgkb.farben$grey, width  = 1.1)
      )
    ) %>%
      add_lines(
        y = ~ y2,
        type = "scatter",
        mode = "lines+markers",
        line = list(color = sgkb.farben$yellow, dash = "dash"),
        name = name_y2,
        marker = list(
          size = 5,
          color = sgkb.farben$yellow,
          line  = list(color = sgkb.farben$grey, width  = 1.1)
        )
      ) %>%
      layout(
        legend = list(
          x = 0.01,
          y = 1,
          orientation = "h"
        ),
        yaxis = list(title = y_axis_title),
        xaxis = list(title = x_axis_title, range = datum_range)
      ) %>%
      config(displayModeBar = F)
  }'
  , sep = "\n")
})


# Scatter incl Trend --------------------
sgkb.create_scatter_trend_plot <- function(datum,y,name_trace ="",x_axis_title = "",y_axis_title = "",
                                           datum_range = c(min(as.Date(datum)),max(as.Date(datum)))){
  plot_ly(
    x = ~ as.Date(datum),
    y = as.numeric(unlist(supsmu(as.Date(datum), y)[2])),
    type = "scatter",
    mode = "lines",
    line = list(color = sgkb.farben$teal, width = 2),
    name = paste(name_trace, "Trend")
  ) %>%
    add_lines(
      y = y,
      type = "scatter",
      mode = "lines",
      opacity = 0.3,
      line = list(color = sgkb.farben$teal, dash = "dash"),
      name = name_trace
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      yaxis = list(title = y_axis_title),
      xaxis = list(title = x_axis_title, range = datum_range)
    ) %>%
    config(displayModeBar = F)
}


output$scatter_trend <- renderPlotly({
  sgkb.create_scatter_trend_plot(datum = df$Datum, y = df$Y, name = "Eröffnungen")
}) 

output$scatter_trend_func <- renderPrint({
  cat('sgkb.create_scatter_trend_plot <- function(datum,y,name_trace ="",x_axis_title = "",y_axis_title = "",
                                           datum_range = c(min(as.Date(datum)),max(as.Date(datum)))){
  plot_ly(
    x = ~ as.Date(datum),
    y = as.numeric(unlist(supsmu(as.Date(datum), y)[2])),
    type = "scatter",
    mode = "lines",
    line = list(color = sgkb.farben$teal, width = 2),
    name = paste(name_trace, "Trend")
  ) %>%
    add_lines(
      y = y,
      type = "scatter",
      mode = "lines",
      opacity = 0.3,
      line = list(color = sgkb.farben$teal, dash = "dash"),
      name = name_trace
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      yaxis = list(title = y_axis_title),
      xaxis = list(title = x_axis_title, range = datum_range)
    ) %>%
    config(displayModeBar = F)
}'
      , sep = "\n")
})

### Lineplot 2 Traces
sgkb.create_lineplot_2_traces <- function(datum,y1,y2,name_y1,name_y2, x_axis_title = "Tag", 
                                          y_axis_title = "", datum_range = c(min(as.Date(datum)),max(as.Date(datum)))){
  plot_ly(
    x = ~ as.Date(datum),
    y = ~ y1,
    type = "scatter",
    mode = "lines",
    line = list(color = sgkb.farben$teal, width = 2),
    name = name_y1
  ) %>%
    add_lines(
      y = ~ y2,
      type = "scatter",
      mode = "lines",
      line = list(color = sgkb.farben$yellow, width = 2),
      name = name_y2
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      yaxis = list(title = y_axis_title),
      xaxis = list(title = x_axis_title, range = datum_range)
    ) %>%
    config(displayModeBar = F)
}



df_2 = df[130:144,]
df_2$Y = cumsum(df_2$Y)
df_2$Y2 = cumsum(df_2$Y2)

output$lineplot_2 <- renderPlotly({
  sgkb.create_lineplot_2_traces(datum = df_2$Datum, y1 = df_2$Y, y2 = df_2$Y2, 
                                name_y1 = "Alle User", name_y2 = "Aktive User")
})

output$lineplot_2_func <- renderPrint({
  cat('sgkb.create_lineplot_2_traces <- function(datum,y1,y2,name_y1,name_y2, x_axis_title = "Tag", 
                                          y_axis_title = "", datum_range = c(min(as.Date(datum)),max(as.Date(datum)))){
  plot_ly(
    x = ~ as.Date(datum),
    y = ~ y1,
    type = "scatter",
    mode = "lines",
    line = list(color = sgkb.farben$teal, width = 2),
    name = name_y1
  ) %>%
    add_lines(
      y = ~ y2,
      type = "scatter",
      mode = "lines",
      line = list(color = sgkb.farben$yellow, width = 2),
      name = name_y2
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1,
        orientation = "h"
      ),
      yaxis = list(title = y_axis_title),
      xaxis = list(title = x_axis_title, range = datum_range)
    ) %>%
    config(displayModeBar = F)
}'
      , sep = "\n")
})
