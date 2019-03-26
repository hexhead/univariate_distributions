# hyperbolic_secant_function_tests.R - Bill White - 3/26/19
# 
library(ggplot2)

source("hyperbolic_secant_function.R")

# AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
x_s <- seq(from = -4, to = 4, by = 0.1)
raw_results <- amstat_hyperbolic_secant(x_s = x_s)
plot_data <- raw_results
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Hyperbolic Secant Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_continuous(name = "Parameters")
print(plot_obj)
