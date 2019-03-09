# erlang_function.R - Bill White - 3/9/19
# 
# https://www.wikiwand.com/en/Erlang_distribution
# 
# The parameter k is called the shape parameter, and the parameter \lambda  
# is called the rate parameter.

# An alternative, but equivalent, parametrization uses the scale parameter \mu , 
# which is the reciprocal of the rate parameter (i.e., mu =1/\lambda ):
# 
# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 
# k_s - vector of numerics number - k positive real
#       is called the shape parameter > 0 positive integers
# l_s - vector of numerics lambda - rate >= 0

# Calculated if necessary:
# u_s - vector of numerics mu - 1 / lambda - scale >= 0
# 
# When the scale parameter \mu  equals 2, the distribution simplifies to 
# the chi-squared distribution with 2k degrees of freedom. It can therefore 
# be regarded as a generalized chi-squared distribution for even numbers 
# of degrees of freedom.
# 
# Because of the factorial function in the denominator, the Erlang 
# distribution is only defined when the parameter k is a positive integer. 
# In fact, this distribution is sometimes called the Erlang-k distribution 
# (e.g., an Erlang-2 distribution is an Erlang distribution with k=2). The 
# gamma distribution generalizes the Erlang distribution by allowing k to be 
# any positive real number, using the gamma function instead of the 
# factorial function.

amstat_erlang <- function(x_s, k_s, l_s, use_alternative = FALSE) {
  x_results <- lapply(x_s, function(x) {
    kx_results <- lapply(seq_along(k_s), function(i) {
      k <- k_s[i]
      l <- l_s[i]
      if (use_alternative) {
        # use mu scale x, u >- 0
        u <- 1 / l
        y <- ((x ^ (k - 1)) * exp(-x / u)) / ((u ^ k) * factorial(k - 1))
        data.frame(x = x, y = y, Parameters = sprintf("k=%4.2f u=%4.2f", k, u))
      } else {
        # use lambda rate - x, l >= 0
        y <- (((l ^ k) * (x ^ (k - 1)) * exp(-l * x))) / factorial(k - 1)
        data.frame(x = x, y = y, Parameters = sprintf("k=%4.2f l=%4.2f", k, l))
      }
    })         
    do.call(rbind, kx_results)
  })
  do.call(rbind, x_results)
}
