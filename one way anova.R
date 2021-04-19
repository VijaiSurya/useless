#### Oneway ANOVA
bank = read.csv("BankChurners.csv")
#View(bank)
bnk <- subset(bank , select = c(Customer_Age , Marital_Status))
View(bnk)
#########
### how to perform the one-way analysis of variance
#########
### we will check whether there is a difference between the three groups
#########
### Basic assumptions:
# the dependent variable is normally distributed in all groups
# the dependent variable does not present important outliers in any group
# the group variances are equal*
### we are going to check only the assumptions marked with an asterisk (*)
##########
### to check the assumption of equality of variances
require(car)
leveneTest(bnk$Customer_Age, bnk$Marital_Status)
##########
### run the one-way ANOVA using the aov function
### if the group variances are equal
aov1 = aov(Customer_Age~Marital_Status, data=bnk)
summary(aov1)
### if the group variances are NOT equal, we run the Welch test
oneway.test(Customer_Age~Marital_Status, data=bnk, var.equal=F)
##########
### how to perform the simple (post-hoc) comparisons
### Tukey HSD for equal variances
TukeyHSD(aov1) # you must get aov1 first
### Bonferroni, also for equal variances
pairwise.t.test(bnk$Customer_Age, bnk$Marital_Status, p.adjust.method = "bonferroni")
### post-hoc tests for unequal variances do not seem to be available in R 
