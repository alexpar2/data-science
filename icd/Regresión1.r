library(MASS)
?Boston
data("Boston")
modelo <- lm(medv ~ lstat, data = Boston)
summary(modelo)
Boston$lstat
plot(medv~age,Boston)

temp <- Boston
plotY <- function (x,y) {
plot(temp[,y]~temp[,x], xlab=paste(names(temp)[x]," X",x,sep=""),
ylab=names(temp)[y])
}
par(mfrow=c(3,4)) #Si margin too large => (2,3)
x <- sapply(1:(dim(temp)[2]-1), plotY, dim(temp)[2])
par(mfrow=c(1,1)


library(GGally)

ggpairs(Boston)

par(mfrow=c(3,3)) #Si margin too large => (2,3)
x <- sapply(c(1, 5, 6, 7, 8, 10, 11, 12, 13), plotY, dim(temp)[2])
par(mfrow=c(1,1))

fit1=lm(Boston$medv~Boston$lstat)
fit1

fit2=lm(medv~rm,data=Boston)
fit2

summary(fit1)
par(mfrow=c(2,1))
plot(medv~lstat,Boston)
abline(fit1,col="red")
confint(fit1)

summary(fit2)
plot(medv~rm,Boston)
abline(fit2,col="blue")
par(mfrow=c(1,1))
confint(fit2)

predict(fit1,data.frame(lstat=c(5,10,15)))
