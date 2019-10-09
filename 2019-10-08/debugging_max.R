library(tidyverse)
library(here)

ipf_lifts <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-08/ipf_lifts.csv")

View(ipf_lifts)

#------------------------------------------------------- 
# count the number of rows in the data that exist total! 
#-------------------------------------------------------
  
ipf_meet_analysis <- ipf_lifts %>% 
  count(meet_name)
#------------------------------------------------------- 
# count the number of rows in the data that are NA 
#-------------------------------------------------------

ipf_NA_analysis <- ipf_lifts %>% 
  filter(is.na(best3deadlift_kg)) %>% 
  count(meet_name)

#------------------------------------------------------- 
# Now take the columns and subtract them.... somehow... 
#-------------------------------------------------------

diag <- full_join(ipf_NA_analysis,ipf_meet_analysis,by = "meet_name") %>% filter(n.x == n.y)

#------------------------------------------------------- 
# finally, pull out the vaiables that are -inf 
#-------------------------------------------------------
  

finally <- ipf_lifts %>% 
  filter(is.na(best3deadlift_kg)) %>% 
  count(meet_name)
