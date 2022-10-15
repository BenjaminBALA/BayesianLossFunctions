set.seed(123)
a <- 20

for (i in 1:a ){
  y <- rgamma(a, 15, 3)
  loss <- (a-y[a])^2
  loss_optimal <- (15/3 - y)^2
}
mean(loss_optimal)
min <- 15/3^2
mean(loss_optimal)- min

q=.75
if (y[a] > a) {
  loss <- q*(y[a]-a)
} else {
  loss <- (1-q)*(a-y[a])
}
mean(loss)
x <- qgamma(q, 15, 3)
if (y[a] > x) {
  loss2 <- q*(y[a]-x)
} else {
  loss2 <- (1-q)*(x-y[a])
}
mean(loss2)
#The optimal action is when q is the inverse of the CDF for Y
a <- 20
y <- rpois(a, 5.3)
if (y[a] != a){
  newvalue = 1
  loss <- c(loss, newvalue)  
} else {
  loss <- c(loss, 0)
}
y
loss
mean(loss)
a <- floor(5.3)
y <- rpois(20, a)
if (y[a] != a){
  newvalue = 1
  loss <- c(loss, newvalue)  
}
y
loss
mean(loss)