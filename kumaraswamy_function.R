# kumaraswamy_function.R - Bill White - 3/17/19
#
# https://www.wikiwand.com/en/Kumaraswamy_distribution
# 
# In probability and statistics, the Kumaraswamy's double bounded distribution
# is a family of continuous probability distributions defined on the interval
# [0,1]. It is similar to the Beta distribution, but much simpler to use
# especially in simulation studies due to the simple closed form of both its
# probability density function and cumulative distribution function. This
# distribution was originally proposed by Poondi Kumaraswamy for variables that
# are lower and upper bounded.
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) - [0, 1]
# a_s - vector of numerics - real > 0
# b_s - vector of numerics - real > 0
amstat_kumaraswamy <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(1:length(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      t1 <- a * b * (x ^ (a - 1))
      t2 <- (1 - (x ^ a)) ^ (b - 1)
      y <- t1 * t2
      data.frame(x = x, y = y, 
                 Parameters = sprintf("a=%3.1f b=%3.1f", a, b))
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
