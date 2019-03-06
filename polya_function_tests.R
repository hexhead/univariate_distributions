# polya_function_tests.R - Bill White - 2/26/19
# 
# Test the Polya implementations by comparing ggplot to web site references.

library(ggplot2)

source("polya_function.R")

# -----------------------------------------------------------------------------
# https://www.encyclopediaofmath.org/index.php/P%C3%B3lya_distribution
# See also: negative binomial and exponential distributions.
# Parameters:
# k_s - vector of numerics to evaluate (x values) - 0 <= k <= n
# n_s - vector of integer n's for range of x-axis 1.2...
# p_s = vector of numeric - 0 < p_s < 1 
# g_s - vector of numeric  gamma > 0
n_s <- c(5, 10, 15, 20)
p_s <- c(0.05, 0.1, 0.25, 0.5)
g_s <- rep(0.1, length(p_s))
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

# -----------------------------------------------------------------------------
# https://www.vosesoftware.com/riskwiki/Polyadistribution.php
# Poisson(Gamma(a,b)) = Pólya(a, b)
# Parameters:
# x_s - vector of numerics to evaluate (x values) - 0,1,2...
# a_s - vector of numeric - alpha > 0
# b_s = vector of numeric - beta > 0
x_s <- seq(from = 0, to = 30, by = 1)
a_s <- c(0.5, 1.5, 6.6)
b_s <- c(22, 10, 2.5)
raw_results_vose <- vose_polya(x_s = x_s, a_s = a_s, b_s = b_s)
head(raw_results_vose)
plot_obj_vose <- ggplot(raw_results_vose, aes(x = x, y = y, 
                                              colour = Parameters)) + 
  geom_point() + geom_line() +
  xlab("k") + ylab("PMF") +
  ggtitle(label = "Vose Polya Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj_vose)
