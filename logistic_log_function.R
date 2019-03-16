# logistic_log_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Log-logistic_distribution
# 
# * used in survival analysis as a parametric model for events whose rate 
#   increases initially and decreases later
# * used in hydrology to model stream flow and precipitation
# * in economics as a simple model of the distribution of wealth or income
# * in networking to model the transmission times of data considering both 
#   the network and the software
# * the probability distribution of a random variable whose logarithm has 
#   a logistic distribution
# * similar in shape to the log-normal distribution but has heavier tails
# * An alternative parametrization is given by the pair \mu ,s in analogy 
#   with the logistic distribution:
#   \mu =\ln(\alpha )
#   s=1/\beta 
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha - scale
# b_s - vector of numerics - beta - shape
amstat_logistic_log <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(seq_along(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      x_over_a <- x / a
      b_over_a <- b / a
      num <- b_over_a * (x_over_a ^ (b - 1))
      den <- (1 + (x_over_a ^ b)) ^ 2
      y <- num / den
      data.frame(x = x, y = y, 
                 Parameters = sprintf("alpha=%4.2f beta=%f", a, b))
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
