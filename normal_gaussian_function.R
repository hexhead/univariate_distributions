# normal_gaussian_function.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Normal_distribution
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics for the averages (mu's)
# s_s - vector of numerics for standard deviations
# v_s - vector of numerics for  variances

amstat_normal_gaussian <- function(x_s, m_s, v_s) {
  x_results <- lapply(x_s, function(x) {
    m_v_results <- lapply(seq_along(m_s), function(i) {
        y <- (1 / sqrt(2 * pi * v_s[i]) * exp(-1 / 2 * ((x - m_s[i]) ^ 2)))
        data.frame(x = x, 
                   y = y, 
                   Parameters = paste("mu", m_s[i], " sd=", v_s[i]))
      })         
      do.call(rbind, m_v_results)
  })
  do.call(rbind, x_results)
}
