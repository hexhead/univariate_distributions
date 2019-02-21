# binomial_function_tests.R - Bill White - 2/18/19
# https://en.wikipedia.org/wiki/Binomial_distribution

library(ggplot2)

source("binomial_function.R")

# k is the number of observed successes (support)
# n is the number of draws (i.e. quantity drawn in each trial) { 0, 1, 2, ... N}
# p is the numeric vector of probabilities of success [0, 1]
k_s <- seq.int(from = 0, to = 40, by = 1)
n_s <- c(20, 20, 40)
p_s <- c(0.5, 0.7, 0.5)
raw_results <- amstat_binomial(k = k_s, n = n_s, p = p_s)
plot_data <- do.call(rbind, raw_results)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("k") + ylab("PMF") +
  ggtitle(label = "Binomial Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
