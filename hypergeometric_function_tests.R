# hypergeometric_function_tests.R - Bill White - 2/18/19
# https://en.wikipedia.org/wiki/Hypergeometric_distribution

library(ggplot2)

rm(list = ls())
source("hypergeometric_function.R")

# k is the number of observed successes
# N is the population size { 0, 1, 2, ...}
# K is the number of success states in the population { 0, 1, 2, ... N}
# n is the number of draws (i.e. quantity drawn in each trial) { 0, 1, 2, ... N}
k_s <- seq.int(from = 0, to = 60, by = 1)
K_s <- seq.int(from = 50, to = 70, by = 10)
n_s <- seq.int(from = 100, to = 300, by = 100)
N_s <- rep.int(x = 500, length(n_s))
raw_results <- amstat_hypergeometric(k = k_s, N = N_s, K = K_s, n = n_s)
plot_data <- do.call(rbind, raw_results)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("k") + ylab("PMF") +
  ggtitle(label = "Hypergeometric Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
