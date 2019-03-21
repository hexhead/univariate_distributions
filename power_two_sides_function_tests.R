# power_two_sides_function_tests.R - Bill White - 5/20/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# n - exponent
# a - lower limit x
# m - midpoint/cutoff x
# b - upper limit x

library(ggplot2)

source("power_two_sides_function.R")

x_s <- seq(from = 0, to = 1, by = 0.01)
n <- 4
a <- 0.25
m <- 0.4
b <- 0.75
raw_results <- amstat_power_two_sides(x_s = x_s, n = n, a = a, m = m, b = b) 
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Two-Sided Power Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
