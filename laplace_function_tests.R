# laplace_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Lapalce_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s = vector of numeric means (location)
# b_s - vector of numeric parameter b > 0 scale

library(ggplot2)

source("laplace_function.R")

x_s <- seq(from = -10, to = 10, by = 0.1)
m_s <- c(0, 0, 0, -5)
b_s <- c(1, 2, 4, 4)
raw_results <- amstat_laplace(x_s = x_s, m_s = m_s, b_s = b_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") + ylim(0, max(raw_results$y)) +
  ggtitle(label = "Laplace Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
