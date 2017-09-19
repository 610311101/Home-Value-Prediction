library("dplyr");
library("magrittr");
setwd("C:/Users/Hou/Desktop/Home-Value-Prediction");
rm(list = ls());
Data <- read.csv("properties_2016.csv");
##
##  fips, latitude, longitude, 
##  propertylandusetypeid, rawcensustractandblock,
##  regionidcounty,
##  are the same missing 11437# data.
index <- 1:nrow(Data);
Data <- data.frame(index, Data)
subData <- Data %>% 
  select(
    index, fips, latitude, longitude,
    propertylandusetypeid, rawcensustractandblock,
    regionidcounty
  )
##  => If missing one of them, then others are missing two.

