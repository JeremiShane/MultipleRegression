# Variance Inflation Factors

data(swiss)
head(swiss)

mdl <- lm(Fertility ~ ., swiss)
vif(mdl)
mdl2 <- lm(Fertility ~ Agriculture + Education + Catholic + Infant.Mortality, swiss)
vif(mdl2)
## variance inflation is the square of standard error inflation

## Warning - excluding correlated regressors could bias coefficient estimates of 
## regressors with which it is correlated