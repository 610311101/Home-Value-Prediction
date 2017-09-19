library("dplyr");
library("magrittr");
setwd("C:/Users/Hou/Desktop/Home-Value-Prediction");
rm(list = ls());
Data <- read.csv("properties_2016.csv");
dim(Data);
colnames(Data)
is.na(Data) %>%sum()
##  1. 2985217# data.
##  2. 58 variable.
##  3. 75285362 missing.
##
Data %>% na.omit() %>% dim();
## No data is complete.
## ----
for( i in 1:58 ){
  if( i==1 ) misscount <- c();
  misscount <- c( misscount, Data[,i] %>% is.na() %>% sum() );
  names(misscount) <- 1:i;
}
misscount <- sort(misscount, decreasing = T);
##  There are 6th variable complete,
##  'parcelid','hashottuborspa','propertycountylandusecode',
##  'propertyzoningdesc','fireplaceflag','taxdelinquencyflag'.
##  => Only 'parcelid' is int, others are factor.
## ----
##  Make a complete data for start.
subData <- Data %>% select(
  parcelid, hashottuborspa, propertycountylandusecode,
  propertyzoningdesc,fireplaceflag,taxdelinquencyflag
);
head(subData)
## ----
##  renames variable 
subData$hashottuborspa %>% str();
levels(subData$hashottuborspa) <- c("false","true");
subData$fireplaceflag %>% str();
levels(subData$fireplaceflag) <- c("false","true");
subData$taxdelinquencyflag %>% str(); 
levels(subData$taxdelinquencyflag) <- c("N","Y");
subData %>% str();
saveRDS(subData,"subData.RDS")


