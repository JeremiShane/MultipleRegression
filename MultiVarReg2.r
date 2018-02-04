## MultiVar2 Regression Models

data("InsectSprays")
boxplot()

dim(InsectSprays)
head(InsectSprays,15)

##we've created 6 arrays with just the count data for each
##| spray. The arrays have the names sx, where x is A,B,C,D,E or F

sB

summary(InsectSprays[,2])  ## second column

##  In this lesson we'll consider multilevel factor levels and how we interpret linear
## models of data with more than 2 factors.

sapply(InsectSprays, class)  ## use sapply to find class of each column

fit <- lm(count ~ spray, InsectSprays)
summary(fit)$coef
est <- summary(fit)$coef[,1]  ## store the estimate column of the array
mean(sA)
mean(sB)  ## the means are the same as the coefficient estimates

## another model, but ommit the intercept
nfit <- lm(count ~ spray - 1, InsectSprays)
summary(nfit)$coef

## relevel the levels of the factor to change the reference group
spray2 <- relevel(InsectSprays$spray, "C")
fit2 <- lm(count ~ spray2, InsectSprays)
mean(sC)

## The slides show the details of this but here we'll demonstrate by calculating the
## spray2B t value.  Subtract fit's sprayC coefficient (fit$coef[3]) from sprayB's
## (fit$coef[2]) and divide by the standard error which we saw was 1.6011. The result is
## spray2B's t value. Do this now.
(fit$coef[2]-fit$coef[3]) / 1.6011
