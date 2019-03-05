# gompertz_function.R - Bill White - 3/4/19
#
# https://www.wikiwand.com/en/Gompertz_distribution
# https://reference.wolfram.com/language/ref/GompertzMakehamDistribution.html
# 
# * often applied to describe the distribution of adult lifespans by 
#   demographers and actuaries
# * model the failure rates of computer codes
# * individual-level simulation for customer lifetime value modeling
# *  network theory, particularly the Erdős–Rényi model, the walk length of 
# a random self-avoiding walk (SAW) is distributed according to the 
# Gompertz distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values)
# e_s - vector of numerics - location - eta  shape > 0
# b_s - vector of numerics - scale > 0
amstat_gompertz <- function(x_s, l_s, xi_s) {
  x_results <- lapply(x_s, function(x) {
    ls_results <- lapply(1:length(l_s), function(i) {
      l <- l_s[i]
      xi <- xi_s[i]
      # y <- b * e * exp(b * x) * exp(e) * exp(-(e * exp(b * x)))
      y <- (exp(x * l + (1 - exp((x * l))) * xi)) * (l * xi)
      data.frame(x = x, y = y, 
                 Parameters = sprintf("l=%4.2f xi=%4.2f", l, xi))
    })
    do.call(rbind, ls_results)
  })
  do.call(rbind, x_results)
}
