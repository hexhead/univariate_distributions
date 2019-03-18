# burr_function.R - Bill White - 3/18/19
#
# https://www.wikiwand.com/en/Burr_distribution
# 
# The Burr Type XII distribution or simply the Burr distribution[1] is a 
# continuous probability distribution for a non-negative random variable. It 
# is also known as the Singh–Maddala distribution[2] and is one of a number of 
# different distributions sometimes called the "generalized log-logistic 
# distribution". It is most commonly used to model household income.
# 
# Note when c = 1, the Burr distribution becomes the Pareto Type II (Lomax) 
# distribution. When k = 1, the Burr distribution is a special case of the 
# Champernowne distribution, often referred to as the Fisk distribution.
# 
# The Burr Type XII distribution is a member of a system of continuous 
# distributions introduced by Irving W. Burr (1942), which comprises 12 
# distributions.
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) - > 0
# c_s - vector of numerics - real > 0
# k_s - vector of numerics - real > 0
amstat_burr <- function(x_s, c_s, k_s) {
  x_results <- lapply(x_s, function(x) {
    c_results <- lapply(1:length(c_s), function(i) {
      c <- c_s[i]
      k <- k_s[i]
      t1 <- c * k
      num <- x ^ (c - 1)
      den <- (1 + x ^ c) ^ (k + 1)
      t2 <- num / den
      y <- t1 * t2
      data.frame(x = x, y = y, 
                 Parameters = sprintf("c=%2.0f k=%2.0f", c, k))
    })
    do.call(rbind, c_results)
  })
  do.call(rbind, x_results)
}
