Data <- read.csv("properties_2016.csv") 
str(Data)
fips <- Data %>% select(fips);
latitude  <- Data %>% select(latitude);
longitude <- Data %>% select(longitude);
propertylandusetypeid <- Data %>% select(propertylandusetypeid);
rawcensustractandblock <- Data %>% select(rawcensustractandblock);

saveRDS(fips, "fips.RDS");
saveRDS(latitude, "latitude.RDS");
saveRDS(longitude, "longitude.RDS");
saveRDS(propertylandusetypeid, "propertylandusetypeid.RDS");
saveRDS(rawcensustractandblock, "rawcensustractandblock.RDS");
