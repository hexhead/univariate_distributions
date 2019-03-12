# error_function_tests.R - Bill White - 3/11/19

# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 

library(ggplot2)

source("error_function.R")

x_s <- seq(from = 0, to = 3, by = 0.1)
raw_results <- amstat_error_generalized(x_s = x_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("x") + ylab("erf(x)") +
  ggtitle(label = "Error (erf) distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)

# y_s <- amstat_error_stackexchange(0.2, 0.25, x_s)
# plot(x_s, y_s, type = 'l')
