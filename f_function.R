# f_function.R - Bill White - 3/5/19
# 
# https://www.wikiwand.com/en/F-distribution
#
# Fisher–Snedecor distribution (after Ronald Fisher and George W. Snedecor) 
# arises frequently as the null distribution of a test statistic, most notably 
# in the analysis of variance (ANOVA), e.g., F-test
# 
# Pearson type VI distribution is a beta prime distribution or F-distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - real > 0
# d1_s = vector of numeric degrees of freedom positive integers (floats ok)
# d2_s - vector of numeric degrees of freedom positive integers (floats ok)

source("beta_function.R")

amstat_f <- function(x_s, d1_s, d2_s) {
  x_results <- lapply(x_s, function(x) {
    y_results <- lapply(seq_along(d1_s), function(i) {
      d1 <- d1_s[i]
      d2 <- d2_s[i]
      t1 <- 1 / amstat_beta(d1 / 2, d2 / 2)
      t2 <- (d1 / d2) ^ (d1 / 2)
      t3 <- x ^ ((d1 / 2) - 1)
      t4 <- (1 + ((d1 / d2) * x)) ^ (-((d1 + d2) / 2))
      y <- t1 * t2 * t3 * t4
      data.frame(x = x, y = y, 
                 Parameters = sprintf("d1 = %2.0f d2 = %2.0f", d1, d2))
    })
    do.call(rbind, y_results)
  })
  do.call(rbind, x_results)
}
