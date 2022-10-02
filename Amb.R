library(glmnet)
library(ISLR)
wine <- na.omit(wine)
x <- model.matrix(price ~.,wine)[,-1]
y <- wine$price
lasso.mod <- glmnet(x, y, alpha = 1)
dim(coef(lasso.mod))
lasso.mod$lambda[40]
coef(lasso.mod)[,40]
lasso.mod$lambda[60]
coef(lasso.mod)[,60]
set.seed(1)
train <- sample(1: nrow(x), nrow(x)/2)
test <- (- train)
x.train <- x[train]
y.train <- y[train]
y.test <- y[test]
cv.out <- cv.glmnet(x[train,], y[train], alpha = 1)
plot(cv.out)
bestlam = cv.out$lambda.min
bestlam
out <- glmnet(x, y, alpha = 1)
predict(out, type = "coefficients", s = bestlam)[1:7 ,]
yhat <- predict(out, s = bestlam, newx = x[test ,])
mse <- mean((y[test] - yhat)^2)
mse
ypr <- predict(cv.out, s = bestlam, newx = x[test ,])
coef(cv.out)
final <- cbind(y.test, ypr)
# Checking the first six obs
head(final)
ypred <- predict(out, s = bestlam, newx = x)
#find SST and SSE
sst <- sum((y - mean(y))^2)
sse <- sum((ypred - y)^2)

#find R-Squared
rsq <- 1 - sse/sst
rsq
