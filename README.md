### cee345



# LION data 

Retrieved from the NYC Open Data website, filtered by roadway type - filtered to only include "RW_TYPE" or roadway types Street (1), Highway (2), Bridge (3), Tunnel (4). 


## TrafficVolumeCounts_mod.csv 
This document contains the traffic volume data from NYC Open Data, summed over time of day, as well as travel direction (i.e. eastbound vs. westbound), and averaged over the days that traffic volume was observed on that roadway, if applicable. 


## crash_traffic_join.csv

Joined crash data and traffic flow data by segmentID, preserving all rows - ie. rows where there was no entry for traffic flow, but entries for crashes, or vice versa. 
