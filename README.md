# Bayesian Loss Functions
This is an example from a Bayesian Statistics class on bayesian loss functions comparing the mean loss of different loss functions. This code checks three different loss functions including the square loss function, the check loss function and the identity 0-1 loss function. A model is chosen for these three loss functions and compares the results of taking the loss function average.

The gamma distribution is used to sample for the square loss function. The qgamma function is used for the check loss and the Poisson is used for the 0-1 loss function. The average loss is compared for these three different loss functions. The minimum loss function for the gamma with the square loss is equivalent to the variance of the gamma with is $\fran{\alpha}{\beta^2}$
