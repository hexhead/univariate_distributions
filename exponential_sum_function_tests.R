# exponential_sum_function_tests.R - Bill White - 3/11/19
# 
# http://mathworld.wolfram.com/ExponentialSumFunction.html

# Parameters:
# x_s - vector of numerics x-axis values - x = [-inf, inf]
# n - integer
# 
# NOTE: missing rows warning is expected due to y-axis limits

library(ggplot2)

source("exponential_sum_function.R")

x_s <- seq(from = -4, to = 1, by = 0.1)
n_s <- 1:5
plot_list <- lapply(n_s, function(n) {
  amstat_exponential_sum(x_s = x_s, n = n)  
})
raw_results <- do.call(rbind, plot_list)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("x") + ylim(-1, 2) + ylab("exp_n(x") +
  ggtitle(label = "Exponential Sum Function", 
          subtitle = "exp_n(x)") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
