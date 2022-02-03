output$ui_haeufigkeit <- renderUI({
  source(file.path("ui","haeufigkeit_dashboard.R"), local = T, encoding = "utf8")$value 
})



df <- dataLoad$zeit
mtcars <- dataLoad$cars
df_nutzer_kat <- dataLoad$nutzer_kategorie


# Barplot ------------------------
sgkb.create_barplot <-  function(x, y, show_y_ticks = FALSE, ### anschauen, 
                                 x_axis_title = "", y_axis_title = "", name = "") {
  plot_ly(x = x,
          y = y,
          type = "bar",
          orientation = "v",
          text = y,
          textposition = "outside",
          cliponaxis = FALSE,
          marker = list(color = sgkb.farben$green)
  ) %>%
    layout(
      xaxis = list(title = x_axis_title),
      yaxis = list(title = y_axis_title, showticklabels = show_y_ticks)
    ) %>%
    config(displayModeBar = F)
}


#Beispiel
output$barplot <- renderPlotly({sgkb.create_barplot(x = df_nutzer_kat$Alterskategorie, y = (df_nutzer_kat$maennlich+df_nutzer_kat$weiblich), y_axis_title = "", show_y_ticks = FALSE)})
output$barplot_func <- renderPrint({
    cat('sgkb.create_barplot <-  function(x, y, show_y_ticks = FALSE, ### anschauen, 
                                 x_axis_title = "", y_axis_title = "", name = "") {
  plot_ly(x = x,
          y = y,
          type = "bar",
          orientation = "v",
          text = y,
          textposition = "outside",
          cliponaxis = FALSE,
          marker = list(color = sgkb.farben$green)
  ) %>%
    layout(
      xaxis = list(title = x_axis_title),
      yaxis = list(title = y_axis_title, showticklabels = show_y_ticks)
    ) %>%
    config(displayModeBar = F)
}
  '
      , sep = "\n")
})


# Double Barplot -----------------------------------------
sgkb.create_double_barplot <-  function(x,y1,y2, show_y_ticks = FALSE, 
                                        name_trace_y1 = "", name_trace_y2 = "",
                                        xtitle = "", ytitle = "", title = "") {
    plot_ly( x = ~ x, y = ~ y1,
      type = "bar", orientation = "v",
      name = name_trace_y1, text = y1,
      textposition = "inside", cliponaxis = FALSE,
      marker = list( color = sgkb.farben$green )
    ) %>%
      layout( xaxis = list(title = xtitle), yaxis = list(title =  ytitle, showticklabels = show_y_ticks)) %>%
      config(displayModeBar = F) %>%
      add_trace( y =  ~ y2, text = y2,
        name = name_trace_y2, marker = list(color = sgkb.farben$skyblue) )
  }




# Beispiel
output$double_barplot <-renderPlotly({
  sgkb.create_double_barplot(x = df_nutzer_kat$Alterskategorie, y1 = df_nutzer_kat$maennlich, y2 = df_nutzer_kat$weiblich,
                             name_trace_y1 = "maennlich", name_trace_y2 = "Weiblich")
})  

output$double_barplot_func <- renderPrint({
  cat('sgkb.create_double_barplot <-  function(x,y1,y2, show_y_ticks = FALSE, 
                                              name_trace_y1 = "", name_trace_y2 = "",
                                              xtitle = "", ytitle = "", title = "") {
    plot_ly( x = ~ x, y = ~ y1,
             type = "bar", orientation = "v",
             name = name_trace_y1, text = y1,
             textposition = "inside", cliponaxis = FALSE,
             marker = list( color = sgkb.farben$green )
    ) %>%
      layout( xaxis = list(title = xtitle), yaxis = list(title =  ytitle, showticklabels = show_y_ticks)) %>%
      config(displayModeBar = F) %>%
      add_trace( y =  ~ y2, text = y2,
                 name = name_trace_y2, marker = list(color = sgkb.farben$skyblue) )
  }
  '
  , sep = "\n")
})

# Barplot horizontal ----------------
sgkb.create_horizontal_barplot <-
  function(x, y, x_axis_title = "", y_axis_title = "") {
    plot_ly(
      x = x,
      y = reorder(y, x),
      type = "bar",
      orientation = "h",
      text = reorder(y, x),
      textposition = "auto",
      marker = list(
        color = sgkb.farben$green
      )
    ) %>%
      layout(yaxis = sgkb.ax, xaxis = list(title = x_axis_title)) %>%  config(displayModeBar = F)
  }

output$barplot_horizontal <- renderPlotly({
  sgkb.create_horizontal_barplot(y = mtcars[1:5,]$name, x = mtcars[1:5,]$mpg, x_axis_title = "mpg")
})

output$barplot_h_func <- renderPrint({
  cat('sgkb.create_horizontal_barplot <-
  function(x, y, x_axis_title = "", y_axis_title = "") {
    plot_ly(
      x = x,
      y = reorder(y, x),
      type = "bar",
      orientation = "h",
      text = reorder(y, x),
      textposition = "auto",
      marker = list(
        color = sgkb.farben$green
      )
    ) %>%
      layout(yaxis = sgkb.ax, xaxis = list(title = x_axis_title)) %>%  config(displayModeBar = F)
  }
  '
      , sep = "\n")
})


# Barplot horizontal stacked-------------------
sgkb.create_stacked_barplot <- function(x1, x2, y, name_trace_x1 ="", name_trace_x2 ="", text_position = "auto", x_axis_title = ""){
  plot_ly(
    x = ~ x1,
    y = ~ reorder(y, x1),
    name = name_trace_x1,
    type = "bar",
    orientation = "h",
    text = y,
    textposition = text_position,
    marker = list(
      color = sgkb.farben$green
    )
  ) %>%
    add_trace(
      x = ~ x2,
      name = name_trace_x2,
      text = "",
      width = 0.6,
      marker = list(
        color = sgkb.farben$yellow
      )
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1.1,
        orientation = "h"
      ),
      yaxis = sgkb.ax,
      xaxis = list(title = x_axis_title),
      barmode = "overlay"
    ) %>%
    config(displayModeBar = F)
}

output$barplot_stacked <- renderPlotly({
  sgkb.create_stacked_barplot(mtcars$disp[1:8],mtcars$hp[1:8],mtcars$name[1:8], text_position = "outside",
                              name_trace_x1 = "Disp", name_trace_x2 = "HP")
})

output$barplot_stacked_func <-  renderPrint({
    cat('sgkb.create_stacked_barplot <- function(x1, x2, y, name_trace_x1 ="", name_trace_x2 ="", text_position = "auto", x_axis_title = ""){
  plot_ly(
    x = ~ x1,
    y = ~ reorder(y, x1),
    name = name_trace_x1,
    type = "bar",
    orientation = "h",
    text = y,
    textposition = text_position,
    marker = list(
      color = sgkb.farben$green
    )
  ) %>%
    add_trace(
      x = ~ x2,
      name = name_trace_x2,
      text = "",
      width = 0.6,
      marker = list(
        color = sgkb.farben$yellow
      )
    ) %>%
    layout(
      legend = list(
        x = 0.01,
        y = 1.1,
        orientation = "h"
      ),
      yaxis = sgkb.ax,
      xaxis = list(title = x_axis_title),
      barmode = "overlay"
    ) %>%
    config(displayModeBar = F)
}
  '
        , sep = "\n")
  })