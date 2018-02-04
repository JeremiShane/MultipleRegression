## MultiVar Residuals Diagnostics and Variation

fit <- lm(y~x, out2)
plot(fit, which=1)  ## diagnostic residuals vs. fit

fitno <- lm(y~x, out2[-1,])  ## without influential outlier
plot(fitno, which=1)

## to see change induced by exclusion of outlier
coef(fit) - coef(fitno)
## dfbeta is this calculation
head(dfbeta(fit)) 

##When a sample is included in a model, it pulls the regression line closer to itself
##(orange line) than that of the model which excludes it (black line.) Its residual, the
##difference between its actual y value and that of a regression line, is thus smaller
##in magnitude when it is included (orange dots) than when it is omitted (black dots.)
##The ratio of these two residuals, orange to black, is therefore small in magnitude for
##an influential sample. For a sample which is not influential the ratio would be close
##to 1. Hence, 1 minus the ratio is a measure of influence, near 0 for points which are
##not influential, and near 1 for points which are.

##This measure is sometimes called influence, sometimes leverage, and sometimes hat
##value. Since it is 1 minus the ratio of two residuals, to calculate it from scratch we
##must first obtain the two residuals. The ratio's numerator (orange dots) is the
##residual of the first sample of the model we called fit. The model fitno, which
##excludes this sample, also excludes its residual, so we will have to calculate its
##value. This is easily done. We use R's predict function to calculate fitno's predicted
##value of y and subtract it from the actual value. Use the expression resno <- out2[1,
##"y"] - predict(fitno, out2[1,]) to do the calculation.

resno <- out2[1,"y"] - predict(fitno, out2[1,])
1-resid(fit)[1]/resno  ## calculate the influence of outlier
## this is the same as hat values
head(hatvalues(fit))

##We'll consider standardized residuals first. To begin, calculate the sample standard
##deviation of fit's residual by dividing fit's deviance, i.e., its residual sum of
##squares, by the residual degrees of freedom and taking the square root. Store the
##result in a variable called sigma.

## the sample standard deviation of fit's residual
sigma <- sqrt(deviance(fit)/df.residual(fit))
## calculate fit's standardized residual
rstd <- resid(fit)/(sigma*sqrt(1-hatvalues(fit)))
## or
head(cbind(rstd, rstandard(fit)))
## a scale location plot shows sqrt of standardized residuals against fitted
plot(fit, which=3)

## diagnostic qqplot
plot(fit, which=2)

## the sample standard deviation of fit's(without outlier) residual
sigma1 <- sqrt(deviance(fitno)/df.residual(fitno))

## calculate the studentized residual for the outlier sample
resid(fit)[1]/(sigma1*sqrt(1-hatvalues(fit)[1]))
## or 
head(rstudent(fit))
##Studentized residuals, (sometimes called externally Studentized residuals,) estimate
##the standard deviations of individual residuals

# Cooks Distance tells how much a given sample changes a model
## the distance in predicted values between fit and fitno
dy <- predict(fitno, out2) - predict(fit, out2)

## calculate cooks distance
## sum of squares of dy divided by 2 x sigma squared
sum(dy^2)/(2*sigma^2)
cooks.distance(fit)[1]
plot(fit, which=5)


