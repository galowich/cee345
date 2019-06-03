library(tidyverse)
library(sf)
library(sp)
library(fuzzyjoin)
library(rgdal)
library(raster)

revgeo <- read_csv(file = "GitHub/cee345/revgeocoded.csv") %>% 
  rename(lat = LATITUDE, long = LONGITUDE, street = `ON STREET NAME`) %>%
  mutate(number = str_extract(add, "\\d+")) %>% filter(BOROUGH == "BRONX")

View(revgeo)
lion_st <- read_csv(file = "GitHub/cee345/LION_Street_Data.csv") %>%
  rename(start = FromRight, end = ToRight)



left_join(revgeo, lion_st, by = c("street" = "Street")) %>% 
fuzzy_left_join(lion_st, 
                by=c("number"="start", "number"="end"),
                match_fun=list(`>=`, `<=`))
