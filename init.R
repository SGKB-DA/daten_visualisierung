
if(baseSystem == 'windows'){
    
    RSTUDIO_DISABLE_PACKAGES = 1
    options(scipen=10000, width = 150)
    
    path <- "T:/Appl/DigitalBanking/R_4_1_0_Repo/libary"
    path <- "P:/Org/058_Zentralsitz/S/Sd/Strategie/Data_Analytics/CASES/UTILS/R_LIBRARIES/library_4-1-0/"
    
    library(shiny, lib.loc = path)
    library(crayon, lib.loc = path)
    library(backports, lib.loc = path)
    library(vctrs, lib.loc = path)
    library(pillar, lib.loc = path)
    library(withr, lib.loc = path)
    library(ggplot2, lib.loc = path)
    library(shinydashboard, lib.loc = path)
    library(plotly, lib.loc = path)
    library(NLP, lib.loc = path)
    library(tm, lib.loc = path)
    library(RColorBrewer, lib.loc = path)
    library(wordcloud, lib.loc = path)
    library(memoise, lib.loc = path)
    library(DT, lib.loc = path)
    library(RODBC, lib.loc = path)
    library(yaml, lib.loc = path)
    library(crosstalk, lib.loc = path)
    library(sourcetools,lib.loc = path)
    library(shinyjs, lib.loc = path)
    library(shinyalert, lib.loc = path)
    library(utf8, lib.loc = path)
    library(bindrcpp, lib.loc = path)
    library(readxl, lib.loc = path)
    library(fansi, lib.loc = path)
    library(utf8, lib.loc = path)
    library(cli, lib.loc = path)
    library(farver, lib.loc = path)
    library(dplyr, lib.loc = path)
    library(htmltools, lib.loc = path)
    library(stringr, lib.loc = path)
    library(shinydashboardPlus, lib.loc = path)
    library(apputils, lib.loc = path)
    library(treemapify, lib.loc = path)
    library(purrr, lib.loc = path)
    library(V8, lib.loc = path)
    library(tidyr, lib.loc = path)
    library(bslib, lib.loc = path)
    library(d3r, lib.loc = path)
    library(corrplot, lib.loc = path)
    library(sunburstR, lib.loc = path)
    


    # RODBC Connection String
    conn.KBDA_Hubble.prd    <- "DRIVER=SQL Server;SERVER=KBDWH_PRD;Trusted_Connection=Yes;DATABASE=KBDA_Hubble"
    conn_hubble             <<- odbcDriverConnect(conn.KBDA_Hubble.prd)
    
    query.select        <<- "SELECT * FROM KBDA_Hubble.dbo." 
    
    # conn.KBDataAnalyticsRepo.prd <- "DRIVER=SQL Server;SERVER=KBDWH_PRD;Trusted_Connection=Yes;DATABASE=KBDigitalBanking_Repository"
    # conn_repo                    <<- odbcDriverConnect(conn.KBDataAnalyticsRepo.prd)
    
    
}

if(baseSystem == 'linux'){
    library(shiny)
    library(crayon)
    library(backports)
    library(vctrs)
    library(pillar)
    library(withr)
    library(ggplot2)
    library(shinydashboard)
    library(plotly)
    library(NLP)
    library(tm)
    library(RColorBrewer)
    library(wordcloud)
    library(memoise)
    library(DT)
    library(RODBC)
    library(yaml)
    library(crosstalk)
    library(sourcetools)
    library(shinyjs)
    library(shinyalert)
    library(bindrcpp)
    library(readxl)
    library(fansi)
    library(utf8)
    library(cli)
    library(farver)
    library(dplyr)
    library(stringr)
    library(shinydashboardPlus)
    library(apputils)
    library(treemapify)
    library(purrr)
    library(V8)
    library(tidyr)
    library(d3r)
    library(sunburstR)
 
    
    

}


## SGKB Farben ##
sgkb.farben <<- list(
    darkred = '#801637',
    red = '#E21C1A',
    darkred = '#811F38',
    lachs = '#F7C7A0',
    lime = '#d1eea2',
    yellow = '#f6af00',
    lightblue = '#9fd7d7',
    skyblue = '#459DD2',
    teal = '#00a0a0',
    green = '#008751',
    grey = '#3a3a3a',
    lightgrey = '#E3E3E3',
    white = '#F2F2F2',
    darkblue = '#003296',
    darkgreen = '#004328',
    brightgreen = '#89C824'
    
)


sgkb.ax <<- list(
    title          = "",
    zeroline       = FALSE,
    showline       = FALSE,
    showticklabels = FALSE,
    showgrid       = FALSE
)


keep.Vars <<- 'sgkb.farben|wd|dataLoad|sgkb.ax|query.select|keep.Vars'


