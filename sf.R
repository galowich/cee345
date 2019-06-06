library(tidyverse)
library(sf)
library(sp)
library(fuzzyjoin)
library(rgdal)
library(raster)
library(tidyverse)

revgeo <- read_csv(file = "GitHub/cee345/revgeocoded.csv") %>% 
  rename(lat = LATITUDE, long = LONGITUDE, street = `ON STREET NAME`) %>%
  mutate(number = str_extract(add, "\\d+")) %>% filter(BOROUGH == "BRONX") %>% 
  group_by(lat, long) %>% 
  summarise(
    n_person = sum(`NUMBER OF PERSONS INJURED`),
    n_ped = sum(`NUMBER OF PEDESTRIANS INJURED`)) %>% 
  ungroup()

lion_st <- read_csv(file = "GitHub/cee345/LION_bronx_only.csv") %>%
  rename(long = LongFrom, lat = LatFrom) 
  



fuzzy_left_join(revgeo, lion_st, 
                by=c("lat"="lat", "long"="long"),
                match_fun=list(`>=`, `<=`))
