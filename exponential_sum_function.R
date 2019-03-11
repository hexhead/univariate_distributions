# exponential_sum_function.R - Bill White - 03/11/19
# 
# http://mathworld.wolfram.com/ExponentialSumFunction.html

# Parameters:
# x_s - vector of numerics x-axis values - x = [-inf, inf]
# n_s - vector of numerics - integer
# 
# https://www.wikiwand.com/en/Exponential_sum
# 
# In mathematics, an exponential sum may be a finite Fourier series (i.e. 
# a trigonometric polynomial), or other finite sum formed using the 
# exponential function, usually expressed by means of the function
# e(x) = exp(2 * pi * i * x)
# Therefore, a typical exponential sum may take the form
# 
# {\displaystyle \sum _{n}e(x_{n}),}
# 
# summed over a finite sequence of real numbers x_{n}.

amstat_exponential_sum <- function(x_s, n_s) {
  x_results <- lapply(x_s, function(x) {
    n_results <- lapply(n_s, function(n) {
      k_results <- lapply(0:n, function(k) {
        (x ^ k) / factorial(k)
      })
      y <- sum(unlist(k_results))
      data.frame(x = x, y = y, Parameters = sprintf("%2.0f", n))
    })
    do.call(rbind, n_results)
  })
  do.call(rbind, x_results)
}
