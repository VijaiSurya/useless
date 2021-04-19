##Randomly distributed NAs
library(mlbench)
library(help = "mlbench")

data("Soybean")
View(Soybean)

str(Soybean)
head(Soybean)

so=na.omit(Soybean) #remove rows containing NAs
head(so)

so2=Soybean[complete.cases(Soybean), ] #only retain non-NA rows
head(so2)

## replace NAs with 0
soy=Soybean

soy[is.na(soy)]<-0
head(soy)

## replace missing values with average values
Soybean$hail <- as.numeric(Soybean$hail)

meanHail=mean(Soybean$hail,na.rm=T)
meanHail
# remove NAs while computing mean of Ozone
#with na mean value will be na

soy.fix=ifelse(is.na(Soybean$hail),meanHail,Soybean$hail)
soy.fix
summary(soy.fix)

##visualize the patterns of NAs
library(mice)

soy2=Soybean
md.pattern(soy2)

#111 observations with no values

library(VIM) #visualize the pattern of NAs

mp <- aggr(soy2, col=c('navyblue','yellow'),
           numbers=TRUE, sortVars=TRUE,
           labels=names(soy2), cex.axis=.7,
           gap=3, ylab=c("Missing data","Pattern"))

#72.5% observations in the entire data have no missing values
#22.9% missing values in Ozone

#impute
#500 iterataions of predictive mean mapping for imputing
#5 datasets
im_soy<- mice(soy2, m=5, maxit = 10, method = 'pmm', seed = 500)

#50 iterataions of predictive mean mapping for imputing

summary(im_soy)

im_soy$imp$Hail #values imputed in ozone

#get back the completed dataset u
completedData <- complete(im_soy,1)
head(completedData)




