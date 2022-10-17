set.seed(123) #Setting the seed is necessary when using random data for simulating the rgamma function
a <- 20 #This is the action variable that ranges from 1 to 20

#This is a loop to calculate the square loss of the gamma function with various action amounts
for (i in 1:a ){
  y <- rgamma(a, 15, 3)
  loss <- (a-y[a])^2
  loss_optimal <- (15/3 - y)^2
}

mean(loss_optimal) #Taking the average loss with the optimal action which is the mean alpha/beta
min <- 15/3^2 #the minimum loss occurs at alpha/beta^2 which is also equal to the variance of a beta
mean(loss_optimal)- min #The difference between these two should be approximately 0 on average

q=.75 #Hyperparameter that is fixed to take a mixure of the two different distributions
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
y <- rpois(a, 5.3) #Simulate a Poisson with lambda eqaul to 5.3
if (y[a] != a){
  newvalue = 1
  loss <- c(loss, newvalue)  
} else {
  loss <- c(loss, 0)
}
#This code uses the identity fuction in order to check to see if the Poisson distribution is different that the value a and returns a 1 if the values are the same and a 0 if the values are different
mean(loss)
a <- floor(5.3) #This takes the floor of the Poisson parameter and checks to see if it is different than the value a
y <- rpois(20, a)
if (y[a] != a){
  newvalue = 1
  loss <- c(loss, newvalue)  
}

mean(loss)
