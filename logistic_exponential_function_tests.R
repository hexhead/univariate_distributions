# logistic_exponential_function_tests.R - Bill White - 3/24/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
# a - lower limit x
# b - upper limit x

library(ggplot2)

source("logistic_exponential_function.R")

x_s <- seq(from = 0, to = 3, by = 0.01)
a_s <- c(1)
b_s <- c(0.5, 1, 2, 4, 8)
raw_results <- amstat_logistic_exponential(x_s = x_s, a_s = a_s, b_s = b_s)
plot_data <- raw_results
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Logistic Exponential Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_continuous(name = "Parameters")
print(plot_obj)
