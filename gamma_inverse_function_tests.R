# gamma_inverse_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Inverse-gamma_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s = vector of numeric alpha shape
# b_s - vector of numeric beta scale

library(ggplot2)

source("gamma_inverse_function.R")

x_s <- seq(from = 0, to = 3, by = 0.02)
a_s <- c(1, 2, 3, 3)
b_s <- c(1, 1, 1, 0.5)
raw_results <- amstat_gamma_inverse(x_s = x_s, a_s = a_s, b_s = b_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") +
  ggtitle(label = "Gamma Inverse Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
