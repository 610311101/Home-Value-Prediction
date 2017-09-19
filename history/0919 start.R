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
Data %>% select( airconditioningtypeid ) %>% na.omit() %>% table();
## airconditioningtypeid
##      1  3      5    9     11   12     13 
## 742364  7   8795   19   1818   59  58457 
## => There are 742364# data airconditioningtypeid is 1.
##
Data %>% select( architecturalstyletypeid ) %>% na.omit() %>% table();
## architecturalstyletypeid
##   2    3    5    7    8   10   21   27 
## 201   58   19 5251  380    1  150    1 
## => There are 5251# data architecturalstyletypeid is 7.
##
Data %>% select( bathroomcnt ) %>% na.omit() %>% table() %>% sort();
## bathroomcnt
##      0       4     2.5       1       3       2
## 116614  132076  206856  499330  629351 1218664
## => bathroom# 


v1 <- Data %>% select( structuretaxvaluedollarcnt ) %>% na.omit();
v1$structuretaxvaluedollarcnt %>% sort() %>% head(200000) %>% hist(breaks =300)




