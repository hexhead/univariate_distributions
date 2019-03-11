# arcsin_function_tests.R - Bill White - 3/9/19

# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 

library(ggplot2)

source("arcsin_function.R")

x_s <- seq(from = -1, to = 1, by = 0.02)
raw_results <- amstat_arcsin(x_s = x_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y)) + 
  geom_point() + geom_line() +
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Arcsin distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
