library(tidyverse)

TrafficVolCounts1112 <- read_csv(file = "/Users/rgalowich/Documents/GitHub/cee345/Traffic_Volume_Counts__2011-2012_.csv")
names(TrafficVolCounts1112)[2] <- "Segment ID"
TrafficVolCounts1213 <- read_csv(file = "/Users/rgalowich/Documents/GitHub/cee345/Traffic_Volume_Counts__2012-2013_.csv")
TrafficVolCounts1418 <- read_csv(file = "/Users/rgalowich/Documents/GitHub/cee345/Traffic_Volume_Counts__2014-2018_.csv")

TrafficVolCounts <- rbind(TrafficVolCounts1112,TrafficVolCounts1213,TrafficVolCounts1418)

# Name to reassign 
names_only <- 
  TrafficVolCounts %>% 
  group_by(`Segment ID`) %>% 
  slice(1) %>% 
  select(`Segment ID`, `Roadway Name`, From, To)

# for each segment, average across dates, also add up all of the times for each one. 
TrafficVolCounts_mod <- TrafficVolCounts %>% 
  mutate(daily_sum = rowSums(TrafficVolCounts[8:31])) %>% 
  # sum both directions 
  group_by(`Segment ID`, Date) %>% 
  summarise(daily_sum_segment = sum(daily_sum)) %>% 
  ungroup() %>% 
  # average across dates observed 
  group_by(`Segment ID`) %>% 
  summarise(segment_average_sum = round(mean(daily_sum_segment))) %>%
  left_join(names_only) %>% 
  select(`Segment ID`,`Roadway Name`, From, To, segment_average_sum)

write_csv(TrafficVolCounts_mod, path = "/Users/rgalowich/Documents/GitHub/cee345/TrafficVolCounts_mod.csv")

