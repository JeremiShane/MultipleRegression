## MultiVar Regression 3

dim(hunger)
names(hunger)

fit <- lm(Numeric ~ Year, hunger)
summary(fit)$coef

lmF <- lm(Numeric ~ Year, hunger[hunger$Sex=="Female", ])
summary(lmF)$coef

lmF <- lm(Numeric[Sex=="Female"] ~ Year[Sex=="Female"],hunger)

lmM <- lm(Numeric[Sex=="Male"] ~ Year[Sex=="Male"],hunger)

lmBoth <- lm(Numeric~Year+Sex, hunger)
summary(lmBoth)

lmInter <- lm(Numeric ~ Year + Sex + Sex*Year, hunger)
summary(lmInter)