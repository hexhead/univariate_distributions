# lindley_extended_function_tests.R - Bill White - 3/1/19
# 

library(ggplot2)

source("lindley_extended_function.R")

x_s <- seq(from = 0.1, to = 5, by = 0.1)
a_s <- c(0.4, -1.8, 0.2, -3.5, 1.0)
b_s <- c(1.2, 0.5, 1.2, 0.2, 1.0)
l_s <- c(1, 0.9, 1.2, 0.6, 1.0)
raw_results <- amstat_lindley_extended(x_s = x_s, 
                                       a_s = a_s, 
                                       b_s = b_s, 
                                       l_s = l_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + ylim(0, 0.7) +
  ggtitle(label = "Extended Lindley Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
