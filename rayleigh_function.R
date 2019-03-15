# rayleigh_function.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Rayleigh_distribution
# 
# * essentially a chi distribution with two degrees of freedom
# * naturally arises is when wind velocity is analyzed in two dimensions;
#   wind speed (vector magnitude) will be characterized by a 
#   Rayleigh distribution
# * random complex numbers whose real and imaginary components are 
#   independently and identically distributed Gaussian with equal variance 
#   and zero mean ... the absolute value of the complex number is 
#   Rayleigh-distributed
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)
# s_s - vector of numerics - sigma - scale > 0
amstat_rayleigh <- function(x_s, a_s, s_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    s_results <- lapply(s_s, function(s) {
      y <- (x / (s ^ 2)) * exp(-((x ^ 2) / (2 * (s ^ 2))))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("sigma=%6.3f", s))
    })         
    do.call(rbind, s_results)
  })
  do.call(rbind, x_results)
}
