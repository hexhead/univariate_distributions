# normal_log_function.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Log-normal_distribution
# 
# * continuous probability distribution of a random variable whose logarithm 
#   is normally distributed
# * takes only positive real values
# * occasionally referred to as the Galton distribution
# * distribution is the maximum entropy probability distribution for a 
#   random variate X for which the mean and variance of ln(X) are specified
# * process is the statistical realization of the multiplicative product of 
#   many independent random variables, each of which is positive
# * distribution is the maximum entropy probability distribution for a 
#   random variate X for which the mean and variance of ln(X) are specified
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics for the averages (mu's)
# v_s - vector of numerics for  variances

amstat_normal_log <- function(x_s, m_s, v_s) {
  s_s <- sqrt(v_s)
  x_results <- lapply(x_s, function(x) {
    m_v_results <- lapply(seq_along(m_s), function(i) {
      normalizer <- 1 / (x * s_s[i] * sqrt((2 * pi)))
      y <-  normalizer * exp(-(((log(x) - m_s[i]) ^ 2) / (2 * v_s[i])))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("mu = %6.3f, sd^2= %6.3f", 
                                      m_s[i], v_s[i]))
    })         
    do.call(rbind, m_v_results)
  })
  do.call(rbind, x_results)
}
