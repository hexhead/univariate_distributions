# students_t_function.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Student%27s_t-distribution
# 
# Pearson Type II Curve is used in computing the table of significant 
# correlation coefficients for Spearman's rank correlation coefficient 
# when the number of items in a series is less than 100 (or 30, 
# depending on some sources). After that, the distribution mimics a 
# standard Student's t-distribution. For the table of values, certain 
# values are used as the constants in the previous equation
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# v_s - vector of numerics degrees of freedom

source("gamma_function.R")

amstat_students_t <- function(x_s, v_s) {
  x_results <- lapply(x_s, function(x) {
    v_results <- lapply(v_s, function(v) {
      # break it down into steps for debugging
      s1 <- amstat_gamma((v + 1) / 2)
      s2 <- sqrt(v * pi) * amstat_gamma(v / 2)
      s3 <- (1 + ((x ^ 2) / v)) ^ (-((v + 1) / 2))
      y <- (s1 / s2) * s3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("v = %2d", v))
    })         
    do.call(rbind, v_results)
  })
  do.call(rbind, x_results)
}
