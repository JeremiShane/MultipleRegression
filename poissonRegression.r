# MultiVar Regression with Poisson / Counts

## lambda is expected rate
## the variance of a poisson process is same as its mean
## rpois(n, lambda)
var(rpois(1000, 50))
## as lambda increases poisson starts to look normal

## log of lambda is assumed to be a linear function of the predictors
## log(lambda) = b0 + b1*regressor(i.e. date)
## this implies that lambda is exponential in teh predictor/regressor
## exp(b1) would then represent the percentage growth of lambda

head(hits)
class(hits[,'date'])
as.integer(head(hits[,'date']))
mdl <- glm(visits ~ date, family="poisson", hits)
summary(mdl)
## Both coefficients are significant, being far more than two standard errors from zero
## The Residual deviance is also very significantly less than the Null, indicating a strong effect
## Recall that the difference between Null and Residual deviance is approximately chi-square with 1 degree of freedom.

## 95% confidence interval for exp(b1)
exp(confint(mdl, 'date'))

## to find out exact date of max visits
which.max(hits[,'visits'])
hits[704,]  ## in row 704

## is this a special day?  can 94-64 visits be attributed to normal traffic
## as estimated by our model?...we need value of lambda on Dec 4, 2012
lambda <- mdl$fitted.values[704]
## now find the 95th percintile of this distribution
qpois(.95, lambda)

## if we insist that the coefficient of log(visits+1) be equal
## to 1, we are predicting the log of mean visits from Simply Statistics as a 
## proportion of total visits: log(lambda/(visits+1)) = b0 + b1*date.

## glm's parameter, offset, has precisely this effect. It fixes the coefficient of the
## offset to 1. To create a model for the proportion of visits from Simply Statistics, we
## let offset=log(visits+1). Create such a Poisson model now and store it as a variable
## called mdl2.

mdl2 <- glm(formula = simplystats ~ date, family = poisson, data = hits, offset= log(visits + 1))
qpois(.95,mdl2$fitted.values[704])







