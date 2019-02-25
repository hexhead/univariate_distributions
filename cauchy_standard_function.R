# cauchy_standard_function.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Cauchy_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# x0_s = vector of numeric
# gamma_s - vector of numeric gamma
amstat_cauchy_standard <- function(x_s, x0_s, gamma_s) {
  x_results <- lapply(x_s, function(x) {
    x0_gamma_results <- lapply(1:length(x0_s), function(i) {
      y <- 1 / ((pi * gamma_s[i]) * 
                  (1 + ((x - x0_s[i]) / gamma_s[i]) ^ 2))
      data.frame(x = x, 
                 y = y, 
                 Parameters = sprintf("x0 = %6.3f gamma = %6.3f", 
                                      x0_s[i], gamma_s[i]))
    })
    do.call(rbind, x0_gamma_results)
  })
  do.call(rbind, x_results)
}
