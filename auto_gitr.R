# making awesome automations with Github Actions
# Beatriz Milz: https://beatrizmilz.github.io/rstudioconf2022/#/
# https://github.com/r-lib/actions/tree/v2/examples

# Research template
# https://www.serdarbalci.com/histopathology-template/Report.html#1_introduction


# https://support.rstudio.com/hc/en-us/articles/200532077?version=2022.02.3%2B492&mode=desktop
# https://www.geo.uzh.ch/microsite/reproducible_research/post/rr-rstudio-git/


# Packages:
remotes::install_github("thebioengineer/tidytuesdayR")
library(pacman)
p_load(usethis, tidyverse, janitor, lubridate, 
       tidytuesdayR, here, sf, 
       SmartEDA, dlookr, DataExplorer)

tdy <- today()
mdy <- "2022-08-02"
tuesdata <- tidytuesdayR::tt_load('2022-08-02')
tuesdata$frog

tt_load(2022, week=31)


frog <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-08-02/frog.csv')
frog |> view()


frog |> nrow()
frog |> count(Subsite)

# DataExplorer

create_report(frog)

# SmartEDA

SmartEDA::ExpReport(
  frog,
  op_file="Samp1.html")



# Dlooker

diagnose_web_report(frog)
diagnose_paged_report(frog)

frog |> 
 eda_web_report(
                 output_dir = "./", 
                 output_file = "frog_EDA.html", theme = "blue")


frog |> describe()
