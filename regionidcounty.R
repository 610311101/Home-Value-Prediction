library("dplyr");
library("magrittr");
setwd("C:/Users/Hou/Desktop/Home-Value-Prediction");
rm(list = ls());
##  Focus on "regionidcounty".
variable <- read.csv("properties_2016.csv") %>% select(parcelid, regionidcounty);
nomissingData  <- readRDS("nomissingData.RDS");
##
##  Check parcelid is match.
sum( variable$parcelid != nomissingData$parcelid )
## ----
subData <- cbind(nomissingData, "regionidcounty" = variable$regionidcounty); 
head(subData);
##
##  Missing counts.
subData$regionidcounty %>% is.na() %>% sum();
subData$regionidcounty %>% table();
##  => look like factor.
## ----
##  Given hashottuborspa.
##  Case_1:
##  Given hashottuborspa is true,
##  then how is regionidcounty look like?
case_1 <- subData %>% na.omit() %>% filter( hashottuborspa == "true" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given hashottuborspa is true" );
case_1 / sum( case_1 );
case_1_feature <- data.frame(
  0.7067117,
  0,
  0.2932883
)
colnames(case_1_feature) <- c("1286givenhashottuborspa",
                              "2061givenhashottuborspa",
                              "3101givenhashottuborspa")
##
##  Case_2:
##  Given hashottuborspa is false,
##  then how is regionidcounty look like?
case_2 <- subData %>% na.omit() %>% filter( hashottuborspa == "false" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given hashottuborspa is false");
case_2 / sum( case_2 );
case_2_feature <- data.frame(
  0.23850183,
  0.07671978,
  0.68477840
)
colnames(case_2_feature) <- c("1286givenhashottuborspa",
                              "2061givenhashottuborspa",
                              "3101givenhashottuborspa");
## ----
##  replace NA by 0.
subData$regionidcounty[
  subData$regionidcounty %>% is.na()
] <- 0;
##  
##  regionidcounty replace to factor
regionidcounty <- subData$regionidcounty %>% as.factor();
regionidcounty <- model.matrix( ~ regionidcounty - 1 );
regionidcounty <- data.frame("parcelid" = subData$parcelid, regionidcounty);
head(regionidcounty)
##  ----
subData <- data.frame( "index" = 1:nrow(subData), subData);
feature <- rbind(
  cbind(
    subData %>% select(index, parcelid, hashottuborspa) %>% filter(hashottuborspa == "true"),
    case_1_feature
  ),
  cbind(
    subData %>% select(index, parcelid, hashottuborspa) %>% filter(hashottuborspa == "false"),
    case_2_feature
  )
)
feature <- feature[order(feature$index),];
feature <- cbind(
  feature %>% select(-index),
  regionidcounty
);
head(feature)
saveRDS(feature, "feature_1.RDS");
## ----
library("dplyr");
library("magrittr");
setwd("C:/Users/Hou/Desktop/Home-Value-Prediction");
rm(list = ls());
##  Focus on "regionidcounty.
variable <- read.csv("properties_2016.csv") %>% select(regionidcounty);
nomissingData  <- readRDS("nomissingData.RDS");
subData <- cbind(nomissingData, "regionidcounty" = variable$regionidcounty);
## ----
##  Given fireplaceflag.
##  Case_1:
##  Given fireplaceflag is true,
##  then how is regionidcounty look like?
case_1 <- subData %>% na.omit() %>% filter( fireplaceflag == "true" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given fireplaceflag is true" );
case_1 / sum( case_1 );
case_1_feature <- data.frame(
  0.9994189425,
  0.0001936858,
  0.0003873717
)
colnames(case_1_feature) <- c("1286givenfireplaceflag",
                              "2061givenfireplaceflag",
                              "3101givenfireplaceflag")
##
##  Case_2:
##  Given fireplaceflag is false,
##  then how is regionidcounty look like?
case_2 <- subData %>% na.omit() %>% filter( fireplaceflag == "false" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given fireplaceflag is false");
case_2 / sum( case_2 );
case_2_feature <- data.frame(
  0.2480633,
  0.0750693,
  0.6768674
)
colnames(case_2_feature) <- c("1286givenfireplaceflag",
                              "2061givenfireplaceflag",
                              "3101givenfireplaceflag");
##  ----
subData <- data.frame( "index" = 1:nrow(subData), subData);
feature <- rbind(
  cbind(
    subData %>% select(index, parcelid, fireplaceflag) %>% filter(fireplaceflag == "true"),
    case_1_feature
  ),
  cbind(
    subData %>% select(index, parcelid, fireplaceflag) %>% filter(fireplaceflag == "false"),
    case_2_feature
  )
)
feature <- feature[order(feature$index),];
feature <- feature %>% select(-index);
head(feature)
saveRDS(feature, "feature_2.RDS");





## ----
library("dplyr");
library("magrittr");
setwd("C:/Users/Hou/Desktop/Home-Value-Prediction");
rm(list = ls());
##  Focus on "regionidcounty.
variable <- read.csv("properties_2016.csv") %>% select(regionidcounty);
nomissingData  <- readRDS("nomissingData.RDS");
subData <- cbind(nomissingData, "regionidcounty" = variable$regionidcounty);
## ----
##  Given taxdelinquencyflag.
##  Case_1:
##  Given taxdelinquencyflag is Y,
##  then how is regionidcounty look like?
case_1 <- subData %>% na.omit() %>% filter( taxdelinquencyflag == "Y" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given taxdelinquencyflag is Y" );
case_1 / sum( case_1 );
case_1_feature <- data.frame(
  0.10971981,
  0.02309518,
  0.86718501
)
colnames(case_1_feature) <- c("1286giventaxdelinquencyflag",
                              "2061giventaxdelinquencyflag",
                              "3101giventaxdelinquencyflag")
##
##  Case_2:
##  Given taxdelinquencyflag is N,
##  then how is regionidcounty look like?
case_2 <- subData %>% na.omit() %>% filter( taxdelinquencyflag == "N" ) %>% 
  select(regionidcounty) %>% table(dnn = "Given taxdelinquencyflag is N");
case_2 / sum( case_2 );
case_2_feature <- data.frame(
  0.2520706,
  0.0759427,
  0.6719867
)
colnames(case_2_feature) <- c("1286giventaxdelinquencyflag",
                              "2061giventaxdelinquencyflag",
                              "3101giventaxdelinquencyflag");
##  ----
subData <- data.frame( "index" = 1:nrow(subData), subData);
feature <- rbind(
  cbind(
    subData %>% select(index, parcelid, taxdelinquencyflag) %>% filter(taxdelinquencyflag == "Y"),
    case_1_feature
  ),
  cbind(
    subData %>% select(index, parcelid, taxdelinquencyflag) %>% filter(taxdelinquencyflag == "N"),
    case_2_feature
  )
)
feature <- feature[order(feature$index),];
feature <- feature %>% select(-index);
head(feature)
saveRDS(feature, "feature_3.RDS");
