# power_series_function_tests.R - Bill White - 3/1/19
# 

library(ggplot2)

source("power_series_function.R")

x_s <- 1:6
c_s <- 1:6
a_s <- c(1, 2, 3, 4, 5, 6)
raw_results <- amstat_power_series(x_s = x_s, c_s = c_s, a_s = a_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Power Series Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
