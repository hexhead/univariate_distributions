# burr_function_tests.R - Bill White - 3/17/19
#
# https://www.wikiwand.com/en/Burr_distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) - > 0
# c_s - vector of numerics - real > 0
# k_s - vector of numerics - real > 0

library(ggplot2)

source("burr_function.R")

x_s <- seq(from = 0.05, to = 3, by = 0.05)
c_s <- c(1, 1, 1, 2, 3, 0)
k_s <- c(1, 2, 3, 1, 1, 2)
raw_results <- amstat_burr(x_s = x_s, c_s = c_s, k_s = k_s)
print(head(raw_results))
plot_obj <- 
  ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 2) +
  ggtitle(label = "Burr (Type VII) Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
