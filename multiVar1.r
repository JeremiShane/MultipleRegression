## MultiVar swirl

## https://github.com/DataScienceSpecialization/courses

pairs(swiss)

all <- lm(Fertility ~ ., data=swiss)
summary(all)

cor(swiss)
cor(swiss$Examination, swiss$Education)
cor(swiss$Agriculture, swiss$Education)

##function makelms() which generates a sequence of
##| five linear models. Each model has one more independent variable than the preceding
##| model, so the first has just one independent variable, Agriculture, and the last has
##| all 5.

## now to add a var that provides no new information

ec <- swiss$Examination+swiss$Catholic

pairs(swiss)

efit <- lm(Fertility ~ . + ec, data=swiss)

all$coefficients-efit$coefficients