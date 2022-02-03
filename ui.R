
if( Sys.info()[1] == 'Windows'){baseSystem <<- "windows" }else( baseSystem <<- "linux")

if(baseSystem == 'windows'){
wd   <- file.path( "H:", "Documents", "git", "plot_repo")
setwd(wd)
}

wd <<- getwd()
    
source("init.R")
source(file.path("dataLoad","dataload_base.R"))


sidebar <- dashboardSidebar(
    sidebarMenu( id = "sidebarmenu",
        menuItem("Startseite", tabName = "startseite", icon = icon("dashboard")),
        
        menuItem("Veränderung über Zeit", tabName = "zeit", icon = icon("clock")) ,
        
        menuItem("Häufigkeit", tabName = "haeufigkeit", icon = icon("chart-bar")),
        
        menuItem("Fluss", tabName = "fluss", icon = icon("stream")),
        
        menuItem("Zusammenhang zwischen Variablen", tabName = "korrelation", icon = icon("chart-line")),
        
        menuItem("Weitere Plots", tabName = "weitere", icon = icon("chart-line"))
    )
)

body <- dashboardBody(
    tags$script(HTML("
        var openTab = function(tabName){
          $('a', $('.sidebar')).each(function() {
            if(this.getAttribute('data-value') == tabName) {
              this.click()
            };
          });
        }
      ")),
    
    tags$head(tags$style('#no_title .box-header{ display: none }')),
    
    tabItems(
        tabItem(tabName = "startseite",
                p("Willkommen auf dem Plot Repository des SGKB Customer Data Analytics Teams"),
                
                fluidRow(
                    box(title = "Veränderungen über Zeit",
                        onclick = "openTab('zeit')", 
                            status = "success",
                            solidHeader = F,
                            collapsible = F,
                            width = 5,
                            fluidRow(column(width = 12, align = "center",
                                            img(src = "zeit.png", width = 200), style = "text-align: center;")),
                            fluidRow(column(width = 12, htmlOutput( "veraenderung_zeit_text" )))
                        ),
                        
                    box(title = "Häufigkeit",
                        onclick = "openTab('haeufigkeit')", 
                        status = "success",
                        solidHeader = F,
                        collapsible = F,
                        width = 5,
                        fluidRow(column(width = 12, align = "center",
                                        img(src = "haufigkeit.png", width = 200), style = "text-align: center;")),
                        fluidRow(column(width = 12, htmlOutput( "haeufigkeit_text" )))
                    ),
                    
                    box(title = "Fluss",
                        onclick = "openTab('fluss')", 
                        status = "success",
                        solidHeader = F,
                        collapsible = F,
                        width = 5,
                        fluidRow(column(width = 12, align = "center",
                                        img(src = "fluss.png", width = 200), style = "text-align: center;")),
                        fluidRow(column(width = 12, htmlOutput( "fluss_text" )))
                    ),
                    
                    box(title = "Zusammenhang zwischen Variablen",
                        onclick = "openTab('korrelation')", 
                        status = "success",
                        solidHeader = F,
                        collapsible = F,
                        width = 5,
                        fluidRow(column(width = 12, align = "center",
                                        img(src = "korrelation.png", width = 200), style = "text-align: center;")),
                        fluidRow(column(width = 12, htmlOutput( "korrelation_text" )))
                    ),
                )
        ),
        
        tabItem( tabName = "zeit",
                 uiOutput("ui_zeit")
        ),
        
        tabItem( tabName = "haeufigkeit",
                 uiOutput("ui_haeufigkeit")
        ),
        
        tabItem( tabName = "fluss",
                 uiOutput("ui_fluss")
        ),
        
        tabItem( tabName = "korrelation",
                 uiOutput("ui_korrelation")
        ),
        
        tabItem( tabName = "weitere",
                 uiOutput("ui_weitere")
        )
    )
)

# Put them together into a dashboardPage
dashboardPage(
    dashboardHeader(title = "SGKB Plot Repository"),
    skin = "green-light",
    sidebar,
    body
)
