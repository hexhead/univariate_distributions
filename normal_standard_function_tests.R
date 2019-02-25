# normal_standard_function_tests.R - Bill White - 2/25/19
# 
# The simplest case of a normal distribution is known as the standard 
# normal distribution. This is a special case when mu = 0 and sigma = 1
# https://www.wikiwand.com/en/Normal_distribution
# https://www.wikiwand.com/en/Normal_distribution#/Standard_normal_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)

library(ggplot2)

source("normal_standard_function.R")

x_s <- seq(from = -5, to = 5, by = 0.1)
raw_results <- amstat_normal_standard(x_s = x_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") + ylim(0, max(raw_results$y)) +
  ggtitle(label = "Normal (standard) Distribution, mean = 0, stddev = 1", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
