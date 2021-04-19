#tr = read.csv("dataset.csv")
#View(tr)
#new_data <- subset(tr,  NationID==796 , select = c(IntGoals, U21Goals))
#View(new_data)
#new_data1  <- as_tibble(tr)
#new_data1
#new_data1 %>% filter(NationID == 1649)
#View(new_data1)

#nw = read.csv("Datafiniti_Mens_Shoe_Prices.csv")
#View(nw)
##x <- as.numeric(nw$prices.amountMax)
##nw1 <-subset(nw , select = c(prices.isSale , x)
#view(nw1)

bank = read.csv("BankChurners.csv")
View(bank)
bnk <- subset(bank , select = c(Gender , Dependent_count))
View(bnk)
require(car)
leveneTest(bnk$Dependent_count, bnk$Gender)
### to compute the t test, we use the t.test function
### if the group variances are equal
t.test(bnk$Dependent_count~bnk$Gender, var.equal=T)
### if the group variances are NOT equal we will execute the Welch test
t.test(bnk$Dependent_count~bnk$Gender, var.equal=F)

