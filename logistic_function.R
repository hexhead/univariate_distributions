# logistic_function.R - Bill White - 3/4/19
#
# https://www.wikiwand.com/en/Logistic_distribution
# 
# Resembles the normal distribution in shape but has heavier tails (higher 
# kurtosis). The logistic distribution is a special case of the Tukey 
# lambda distribution.

# Parameters: 
# x_s - vector of numerics to evaluate (x values)
# l_s - vector of numerics - location - real
# s_s - vector of numerics - scale > 0
amstat_logistic <- function(x_s, l_s = (0), s_s = c(1)) {
  x_results <- lapply(x_s, function(x) {
    ls_results <- lapply(1:length(l_s), function(i) {
      l <- l_s[i]
      s <- s_s[i]
      y <- exp(-((x - l) / s)) / (s * (1 + exp(-((x - l) / s))) ^ 2)
      #print(sprintf("t1=%f t2=%f t3=%f y=%f", a, b, l, y))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("l=%4.2f s=%f", l, s))
    })
    do.call(rbind, ls_results)
  })
  do.call(rbind, x_results)
}
