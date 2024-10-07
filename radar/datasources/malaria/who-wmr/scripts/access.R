remotes::install_github("uct-masha/whowmr")
source(here::here("scripts/utils.R")) # 
library(whowmr)
malariaDeaths <- whowmr::wmr2017$wmr2017j
e8FrontlineCountries <- c("Botswana", "Swaziland", "Namibia", "South Africa")
dir.create(here::here("datasets/malaria/who-wmr/data"), showWarnings = F, recursive=T)
malariaDeaths |>
  dplyr::filter(`Country/area` %in% e8FrontlineCountries) |>
  write.csv(here::here("datasets/malaria/who-wmr/data/wmr2017j.csv"), row.names = FALSE)
