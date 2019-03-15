# frechet_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Fr%C3%A9chet_distribution
# 
# also known as inverse Weibull distribution, is a special case of the 
# generalized extreme value distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha - (0, inf)
# s_s - vector of numerics - s - scale (-inf, inf)
# m_s - vector of numerics - m - location of minimum 
amstat_frechet <- function(x_s, a_s, s_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(seq_along(a_s), function(i) {
      a <- a_s[i]
      s <- s_s[i]
      m <- m_s[i]
      t1 <- a / s
      t2 <- ((x - m) / s) ^ (-1 - a)
      t3 <- exp(-((x - m) / s) ^ -a)
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("alpha=%6.3f s=%6.3f m=%6.3f", a, s, m))
    })         
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
