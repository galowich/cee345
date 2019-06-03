library(ggmap)
library(lubridate)

original_collisions <- read_csv(file = "Desktop/NYPD_Motor_Vehicle_Collisions.csv") %>% 
  mutate(DATE = mdy(DATE)) %>% 
  filter(year(DATE) == 2018)


add <- do.call(rbind,
                  lapply(1:nrow(original_collisions),
                     function(i)revgeocode(as.numeric(original_collisions[i,6:5]))))


## separate street #, name boro, zip 
revgeofile <- cbind(original_collisions, add)

write_csv(revgeofile, path = "GitHub/cee345/revgeocoded.csv")
