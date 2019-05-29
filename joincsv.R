library(tidyverse)


crashedge <- read_csv(file = "GitHub/cee345/CrashEdgeWeights.csv")

trafficvol <- read_csv(file = "GitHub/cee345/TrafficVolCounts_mod.csv") %>% 
  rename(SegmentID = `Segment ID`)



crash_traffic_join <- crashedge %>% full_join(trafficvol, by = "SegmentID")


write_csv(crash_traffic_join, path = "GitHub/cee345/crash_traffic_join.csv")
