# negative_hypergeometric_function_tests.R - Bill White - 2/18/19
# https://www.wikiwand.com/en/Negative_hypergeometric_distribution
# https://www.wikiwand.com/en/Negative_hypergeometric_distribution
# N is the total number of elements {0, 1, 2, ...}
# K is total number of 'success' elements {0, 1, 2, ..., N}
# r is the number of failures when experiment is stopped {0, ...,  N - K}
# k is the number of successes when experiment is stopped

library(ggplot2)

source("negative_hypergeometric_function.R")

# ------------------------------------------------------------------
# N_s = 54 cards (#elements), 
# K_s = 13 hearts (#success elements), 
# r_s = 3 draws (#failures to stop)
# k_s = evaluate from 1 to 10 draws
# ------------------------------------------------------------------
# N_s <- c(54)
# K_s <- c(13)
# r_s <- c(10)
N_s <- c(54)
K_s <- c(13)
r_s <- c(10, 20, 30, 40)
k_s <- seq(from = 0, to = N_s - K_s, by = 1)
# ------------------------------------------------------------------
raw_results <- amstat_negative_hypergeometric(ks = k_s, 
                                              Ns = N_s, 
                                              Ks = K_s, 
                                              rs = r_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("Failures") + ylab("PMF") +
  ggtitle(label = "Negative Hypergeometric Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
