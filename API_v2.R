library(ggmap)

crashedge
from_add <- do.call(rbind,
                  lapply(1:nrow(crashedge),
                     function(i)revgeocode(as.numeric(crashedge[i,2:3]))))

to_add <-  do.call(rbind,
               lapply(1:nrow(crashedge),
                      function(i)revgeocode(as.numeric(crashedge[i,4:5]))))

revgeofile <- cbind(crashedge, result, to)

write_csv(revgeofile, path = "GitHub/cee345/revgeocoded.csv")
