# cauchy_standard_function_tests.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Cauchy_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# x0_s = vector of numeric
# gamma_s - vector of numeric gamma

library(ggplot2)

source("cauchy_standard_function.R")

x_s <- seq(from = -5, to = 5, by = 0.1)
x0_s <- c(0, 0, 0, -2)
gamma_s <- c(0.5, 1, 2, 1)
raw_results <- amstat_cauchy_standard(x_s = x_s, 
                                      x0_s = x0_s, 
                                      gamma_s = gamma_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") + ylim(0, max(raw_results$y)) +
  ggtitle(label = "Cauchy (standard) Distribution, mean = 0, stddev = 1", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
