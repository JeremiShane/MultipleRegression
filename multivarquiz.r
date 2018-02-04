## MultiVar Quiz 3

Consider the mtcars
## data set. Fit a model with mpg as the outcome that considers number of cylinders
## as a factor variable and weight as confounder. Now fit a second model with mpg 
## as the outcome model that considers the interaction between number of cylinders 
## (as a factor variable) and weight. Give the P-value for the likelihood ratio 
## test comparing the two models and suggest a model using 0.05 as a type I error 
## rate significance benchmark.

fit3 <- lm(mpg ~ factor(cyl)*wt, data = mtcars)
summary(fit3)$coef
summary(fit3)

fit1 <- lm(formula = mpg ~ factor(cyl) + wt, data = mtcars)
summary(fit1)

anova(fit1, fit3)

## Consider the mtcars
## data set. Fit a model with mpg as the outcome that 
## includes number of cylinders as a factor variable and weight inlcuded in the 
## model as

fit <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit)


## 5 Give the hat diagonal for the most influential point
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit5 <- lm(y~x)
influence(fit5)$hat


## 6 Give the slope dfbeta for the point with the highest hat value.
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit6 <- lm(y~x)
influence.measures(fit5)







