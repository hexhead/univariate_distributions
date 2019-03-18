# kumaraswamy_function_tests.R - Bill White - 3/17/19
#
# https://www.wikiwand.com/en/Kumaraswamy_distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) - [0, 1]
# a_s - vector of numerics - shape real > 0
# b_s - vector of numerics - shape real > 0

library(ggplot2)

source("kumaraswamy_function.R")

x_s <- seq(from = 0.01, to = 0.99, by = 0.01)
a_s <- c(0.5, 5.0, 1.0, 2.0, 2.0)
b_s <- c(0.5, 1.0, 3.0, 2.0, 5.0)
raw_results <- amstat_kumaraswamy(x_s = x_s, a_s = a_s, b_s = b_s)
print(head(raw_results))
plot_obj <- 
  ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 2.8) +
  ggtitle(label = "Kumaraswamy Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
