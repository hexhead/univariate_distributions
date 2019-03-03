# exponential_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Exponential_distribution
#
# describes the time between events in a Poisson point process, i.e., 
# a process in which events occur continuously and independently at a 
# constant average rate
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0 - inf)
# l_s = vector of numeric lambas - rate parameter > 0

library(ggplot2)

source("exponential_function.R")

x_s <- seq(from = 0.1 , to = 5, by = 0.1)
l_s <- c(0.5, 1, 1.5)
plot_data <- amstat_exponential(x_s = x_s, l_s = l_s)
print(head(plot_data, n = 10))

plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Exponential Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
