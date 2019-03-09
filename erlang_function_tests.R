# erlang_function_tests.R - Bill White - 3/9/19
# 
# https://www.wikiwand.com/en/Erlang_distribution
# 
# The parameter k is called the shape parameter, and the parameter \lambda  
# is called the rate parameter.

# An alternative, but equivalent, parametrization uses the scale parameter \mu , 
# which is the reciprocal of the rate parameter (i.e., mu =1/\lambda ):
# 
# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 
# k_s - vector of numerics number - k positive real
#       is called the shape parameter > 0 positive integers
# l_s - vector of numerics lambda - rate >= 0

# Calculated if necessary:
# u_s - vector of numerics mu - 1 / lambda - scale >= 0

library(ggplot2)

source("erlang_function.R")

x_s <- seq(from = 0, to = 20, by = 0.1)
k_s <- c(1, 2, 3, 5, 7, 9, 1)
l_s <- c(2.0, 2.0, 2.0, 1.0, 0.5, 1.0, 1.0)
raw_results <- amstat_erlang(x_s = x_s, k_s = k_s, l_s = l_s, 
                             use_alternative = TRUE)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("x") + ylab("PDF") + ylim(0, 1) +
  ggtitle(label = "Erlang distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
