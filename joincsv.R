library(tidyverse)


crashedge <- read_csv(file = "GitHub/cee345/CrashEdgeWeights.csv")

trafficvol <- read_csv(file = "GitHub/cee345/TrafficVolCounts_mod.csv") %>% 
  rename(SegmentID = `Segment ID`)

lionst <- read_csv(file = "GitHub/cee345/LION_Street_Data.csv")

crash_traffic_join <- lionst %>% 
  full_join(trafficvol, by = "SegmentID") %>%
  full_join(crashedge, by = "SegmentID")

crash_traffic_join$SegmentID %>% n_distinct()

crashedge %>% group_by(SegmentID) %>% summarise(count = n()) %>% arrange(desc(count))


crashedge %>% filter(SegmentID ==  79950) %>% View()


trafficvol %>% filter(SegmentID == 292830)

write_csv(crash_traffic_join, path = "GitHub/cee345/crash_traffic_join.csv")