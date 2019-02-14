# bernoulli_function_tests.R - Bill White - 1/28/19
# 2008amstat.pdf

source("bernoulli_function.R")

n <- 10
prob_success <- 0.5
z <- 0:3
bernoulli_dist1 <- amstat_bernoulli(prob = prob_success, n_trials = n, n_success = z)
# the Bernoulli distributon is special case of Binomial distribution with n-1
bernoulli_dist2 <- dbinom(x = z, prob = prob_success, size = length(z))
all.equal(bernoulli_dist1, bernoulli_dist2)
print(bernoulli_dist1)
print(bernoulli_dist2)
plot(z, bernoulli_dist2, type = 'l', col = 'red', lwd = 2,
       xlim = c(0.0, 1.0), ylim = c(0, 1),
       xlab = "", ylab = "", main = "Bernoulli Numbers")
points(z, bernoulli_dist1, type = 'l', col = 'blue', lwd = 2)

bernoulli_gen <- amstat_bernoulli_gen(n_trials = n, p_success = prob_success, n_success = z)
plot(z, bernoulli_gen, type = 'l', col = 'red', lwd = 2,
     xlab = "", ylab = "", main = "Bernoulli Probability Generating Function")
