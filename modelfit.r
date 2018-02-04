# underfitting and overfitting

# Simple process for model fit testing
## 1. ANOVA
## 2. test model residuals for normality with shapiro.test
#######################################

x1c <- simbias()
apply(x1c, 1, mean) ## find the mean of each row
## see x1hist() in fitting.r which illistrates the coefficient bias caused by ommitting
## variables.  the actual coefficient of x1 is 1 and yet we see our means are 
## far from 1 in both examples.

## see bogus() in fittng.r which illustrates adding many bogus regressors
## can push a model toward a perfect fit

## adding random regressors decreases deviance.  but these are not significant.  
## need to take into account adding regressors reduces residual degrees of 
## freedom.  ANOVA is a useful way to quantify the significanc of 
## additional regressors

fit1 <- lm(Fertility ~ Agriculture, swiss)
fit3 <- lm(Fertility ~ Agriculture + Examination + Education, swiss)

# Use ANOVA to assess the value of the 2 additional regressors.
## Null hypothesis is that the added regressors are not significant

anova(fit1, fit3)
## in this example the null hypothesis is rejected at .001 level, indicating
## that at least one of the 2 additional regressors is significant
## based on right tailed F-test, Pr(>F), applied to an F-value

## an F statistic is the ratio of 2 sums of squares divided by their 
## respective degrees of freedom
## if the 2 scaled sums are independent and centrally chi-squared distributed
## with the same variance, the statistic will have an F distribution
## with parameters given by the two degrees of freedom.  In this case the 2 sums are
## residual sums of squares which have mean zero hence our centrally chi-squared
## provided the residuals themselves are normally distributed.  the two relavent
## sums are given in the RSS(Residual sums of squares) column

deviance(fit3)  ## calculates residual sums of squares

## how to calculate the f value
d <- deviance(fit3)/43
## calculate the numerator
n <- (deviance(fit1) - deviance(fit3))/2
n/d ## f value

# p value ... now to calculate the p value which is probability that a value
## of n/d or larger would be drawn from an F distribution which has 
## parameters 2 and 43
pf(n/d, 2, 43, lower.tail=FALSE)

## based on a small p value, a false regection of the null hypothesis is unlikely
## we are confident that fit3 is better than fit1. 
## ANOVA is sensitive to the assumption that model residuals are approximately normal
## if they are not then we could get a small p value for that reason
## so we should test normality of the residuals
# Shapiro-Wilk test . normality is the null hypothesis
shapiro.test(fit3$residuals)
## a p value of 0.336 fails to reject the null hypothesis of normality

## now to look at ANOVA with more models
anova(fit1, fit3, fit5, fit6)



