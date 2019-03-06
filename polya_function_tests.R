# polya_function_tests.R - Bill White - 2/26/19
# 
# https://www.encyclopediaofmath.org/index.php/P%C3%B3lya_distribution
## See also: negative binomial and exponential distributions.
# 
# Parameters:
# k_s - vector of numerics to evaluate (x values) - 0 <= k <= n
# n_s - vector of integer n's for range of x-axis 1.2...
# p_s = vector of numeric - 0 < p_s < 1 
# g_s - vector of numeric  gamma > 0

library(ggplot2)

source("polya_function.R")

n <- 6
n_s <- seq(from = 1, to = n, by = 1)
p_s <- c(0.1, 0.25, 0.5, 0.9)
g_s <- c(3, 3, 3, 3)
raw_results <- amstat_polya(n_s = n_s, p_s = p_s, g_s = g_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() +
  xlab("k") + ylab("PDF") +
  ggtitle(label = "Polya Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~grp)
print(plot_obj)
