# f_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/F-distribution
#
# Fisher–Snedecor distribution (after Ronald Fisher and George W. Snedecor) 
# arises frequently as the null distribution of a test statistic, most notably 
# in the analysis of variance (ANOVA), e.g., F-test
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - real > 0
# d1_s = vector of numeric degrees of freedom positive integers (floats ok)
# d2_s - vector of numeric degrees of freedom positive integers (floats ok)

library(ggplot2)

source("f_function.R")

x_s <- seq(from = 0.02, to = 5, by = 0.01)
d1_s <- c(1, 2, 5, 10, 100)
d2_s <- c(1, 1, 2, 1, 100)
raw_results <- amstat_f(x_s = x_s, d1_s = d1_s, d2_s = d2_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Fisher–Snedecor Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
