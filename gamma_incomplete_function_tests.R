# gamma_incomplete_function_tests.R - Bill White - 03/09/19
#
# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 
# n_s - vector of numerics - integer scale

library(ggplot2)

source("gamma_incomplete_function.R")

x_s <- seq(from = 0, to = 40, by = 0.1)
n_s <- c(1, 2, 5, 10, 20)
raw_results <- amstat_gamma_incomplete(n_s = n_s, x_s = x_s, location = 'lower')
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("z") + ylab("PDF") +
  ggtitle(label = "Incomplete Gamma Function P(a, z)", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
