### to detect the outliers, we get the standardized residuals

fm = read.csv("book1.csv")
View(fm)
fm1 <- subset(fm , IntGoals > 0)
View(fm1)
fit <- lm(IntGoals~Finishing+Technique, data = fm1)
summary(fit)
res <- residuals(fit)
zres <- scale(res)
View(zres)


## click column header to sort zres decreasing order. Check how Goamany values >3 to find outlier
## we have 0 value >3.



### to check the independence of errors we use the Durbin-Watson test

##require(car)
##durbinWatsonTest(fit)

## autocorrelation coefficient = zero is null hypothesis of  Durbin-Watson test
## pvalue 0.056 so we accept the null hypothesis
require(lmtest)
dwtest(fit)

### to check for multicollinearity we compute the VIF
### (variance inflation factor)
### first we create a new data frame with the independent variables only


x <- data.frame(fm1$Finishing , fm1$IntGoals)
##View(x)

require(usdm)

vif(x)

## both vif < 10. So no multicollinearity in data



### to check for homoskedasticity, we must plot the
### residuals against the fitted (predicted) test score values
### we will use ggplot for that


require(ggplot2)

pred <- fitted(fit)

dat <- data.frame(pred, res)
View(dat)
ggplot()+geom_point(data=dat, aes(x=res, y=pred))

##if dots in scatter plot tends to distribute uniformly, with out 
## clustering on one side, we have homoskedasticity




### finally, we check for the normality of the residuals
shapiro.test(res)


