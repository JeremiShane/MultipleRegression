# Multi Regression with binary outcomes

## odds
## if p is probability, odds is p/(1-p)

ravenData

## log(p/(1-p)) = b0 + b1*REGRESSOR
## Logistic Regression is to find best b0 and b1
## the best b0 and b1 maximize the likelihood of the actual record
## we can convert the log(odds)/logit to probability p

## glm logistic regression
mdl <- glm(ravenWinNum ~ ravenScore, family="binomial", data=ravenData)

## predict for scores lower than observed
lodds <- predict(mdl, data.frame(ravenScore=c(0, 3, 6)))
## convert logodds to probabilities
exp(lodds)/(1+exp(lodds))
## this model is not good at predictions with low game scores
## checkout summary and the standard error of the coefficients
summary(mdl)
## both of the estimated coefficients are within 2 standard errors of zero
## a 95% confidence interval is roughly 2 standard erros either side of the coefficient
## The coefficients estimate log odds as a linear function of points scored.

## to get the 95% confidence interval of b0 and b1
exp(confint(mdl))
## What is the 2.5% confidence bound on the odds of winning with a score of 0 points?
## notice is very close to 0 which is more realistic than 16/84 odds of winning
## with score of 0

## the lower bound of 2.5% b1 says we decrease likelyhood of winning slightly 
## with every point scored which is not realistic either

## the glm version of ANOVA might suggest that we won't do much worse by 
## ignoring scores altogether

## linear regression minimizes the squared difference between predicted and
## actual.  i.e. minimizes variance of the residual.  if an additional
## regressor reduces the residual's variance, the predictor is deemed important.
## deviance extends this idea to generalized linear regression using negative
## log likelihoods in place of variance.
## to see analysis of deviance use anova(mdl)
anova(mdl)
## the null hypothesis is that the coefficient of ravenScore is zero.  to
## confidently reject this hypothesis we would want the deviance of RavenScore
## to be larger than the 95th percentile of chi-square distribution with
## one degree of freedom (2 parmaters - 1 parameter)
qchisq(0.95, 1)
## ravenScore adds little to no value, let's test this
mdl0 <- glm(ravenWinNum ~ 1, binomial, ravenData)
anova(mdl, mdl0)


