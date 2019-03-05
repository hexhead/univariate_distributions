# gompertz_function_tests.R - Bill White - 3/4/19
# 
# # Parameters: 
# x_s - vector of numerics to evaluate (x values)
# e_s - vector of numerics - eta - shape > 0
# b_s - vector of numerics - scale > 0

library(ggplot2)

source("gompertz_function.R")

x_s <- seq(from = 0, to = 2, by = 0.1)
# e_s <- c(0.1, 2.0, 3.0, 1.0, 1.0)
# b_s <- c(1, 1, 1, 2, 3)
l_s <- c(2, 2, 2)
xi_s <- c(0.5, 1, 3)
raw_results <- amstat_gompertz(x_s = x_s, l_s = l_s, xi_s = xi_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Gompertz Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
