# muth_function_tests.R - Bill White - 3/26/19

library(ggplot2)

source("muth_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) 0 < x < 1
# k_s - vector of numerics - kappa 0 < k <= 1
x_s <- seq(from = 0, to = 3, by = 0.01)
k_s <- c(0.2, 0.5, 1)
raw_results <- amstat_muth(x_s = x_s, k_s = k_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Muth Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
