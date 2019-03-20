# power_law_function_tests.R - Bill White - 5/20/19
# 
# https://www.wikiwand.com/en/Power_law#/Power-law_probability_distributions

# x_s - vector of numerics to evaluate (x values) (0, a)
# a_s - vector of numerics - alpha
# b_s - vector of numerics - beta

library(ggplot2)

source("power_law_function.R")

x_s <- seq(from = 0, to = 2, by = 0.01)
a_s <- c(0.25, 0.5)
b_s <- c(1, 2)
raw_results <- amstat_power_law(x_s = x_s, a_s = a_s, b_s = b_s) 
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Power Law Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
