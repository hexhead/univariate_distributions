# uniform_continuous_function_tests.R - Bill White - 3/20/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# a - lower limit x
# b - upper limit x

library(ggplot2)

source("uniform_continuous_function.R")

x_s <- seq(from = 0, to = 10, by = 0.1)
a <- 2
b <- 4
raw_results <- amstat_uniform_continuous(x_s = x_s, a = a, b = b)
plot_data <- raw_results
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = 
            sprintf("Uniform Continuous Distribution, Parameters: a = %2.0f,  b = %2.0f", 
                    a, b), 
          subtitle = "Probability Density Function") +
  scale_fill_continuous(name = "Parameters")
print(plot_obj)
