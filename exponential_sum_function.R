# exponential_sum_function.R - Bill White - 03/11/19
# 
# http://mathworld.wolfram.com/ExponentialSumFunction.html

# Parameters:
# n -integer - 
# x  numeric - x-axis values
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

amstat_exponential_sum <- function(n, x) {
    k_results <- lapply(0:n, function(k) {
      (x ^ k) / factorial(k)
    })
    y <- sum(unlist(k_results))
    y
}
