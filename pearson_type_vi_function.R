# pearson_type_vi_function.R - Bill White - 3/8/19
#
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson type VI distribution is 
# a beta prime distribution or F-distribution.
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# x ^ m2 * (1 + x) ^ -m1 - support (0 ≤ x < ∞)
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)
# m1_s - vector of numerics - m1
# m2_s - vector of numerics - m2

amstat_pearson_type_vi <- function(x_s, m1_s, m2_s) {
  x_results <- lapply(x_s, function(x) {
    m1_results <-  lapply(m1_s, function(m1) {
      m2_results <-  lapply(m2_s, function(m2) {
        y <- (x ^ m2) * ((1 + x) ^ -m1)
        data.frame(x = x, y = y, 
                   Parameters = sprintf("m1=%6.2f m1=%6.2f", m1, m2))
      })         
      do.call(rbind, m2_results)
    })
    do.call(rbind, m1_results)
  })
  do.call(rbind, x_results)
}
