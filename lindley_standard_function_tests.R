# lindley_standard_function_tests.R - Bill White - 3/3/19
# 
# https://reference.wolfram.com/language/ref/LindleyDistribution.html
# 
# [δ] represents a statistical distribution supported on the interval
# and parametrized by a positive real number δ (called a "shape parameter") 
# that determines the overall behavior of its probability density function
# 
# standard Lindley distribution
# Parameters: 
# x_s - vector of numerics to evaluate (x values) >= 0
# d_s - vector of numerics - delta - any positive real number

library(ggplot2)

source("lindley_standard_function.R")

x_s <- seq(from = 0, to = 8, by = 0.1)
d_s <- c(0.4, 0.6, 1.0)
raw_results <- amstat_lindley_standard(x_s = x_s, d_s = d_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") +
  ggtitle(label = "Standard Lindley Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
