# cauchy_log_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Log-Cauchy_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s = vector of numeric - mu
# s_s - vector of numeric - sigma

library(ggplot2)

source("cauchy_log_function.R")

x_s <- seq(from = 0, to = 8, by = 0.05)
m_s <- c(0, 1, 0, 0, 1)
s_s <- c(1, 1, 2, 0.5, 0.5)
raw_results <- amstat_cauchy_log(x_s = x_s, m_s = m_s, s_s = s_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PMF") + 
  ggtitle(label = "Cauchy (log) Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
