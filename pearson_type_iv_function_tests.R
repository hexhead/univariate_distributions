# pearson_type_iv_function_tests.R - Bill White - 2/26/19
#
# https://www.wikiwand.com/en/Pearson_distribution
# Case 1: negative discriminant: The Pearson type IV distribution.
# * If the discriminant of the quadratic function is negative
#   (b_{1}^{2}-4b_{2}b_{0}<0), it has no real roots.
# * The normalizing constant involves the complex Gamma function (Γ) and
#   the Beta function (B).
# * unnormalized:
#   (1 + x ^ 2)-m * x * exp(-v atan(x))
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha - scale > 0
# m_s - vector of numerics - m - shape > 1/2
# v_s - vector of numerics - v - shape - skewness
# l_s - vector of numerics - lambda - location

library(ggplot2)

source("pearson_type_iv_function.R")

x_min <- 0.51
x_s <- seq(from = x_min, to = 4, by = 0.05)
a_s <- c(1, 2, 3)
# m > 1 / 2
m_s <- c(x_min)
v_s <- c(1, 2, 3)
l_s <- c(x_min, 2)
raw_results <- amstat_pearson_type_iv(x_s = x_s, m_s = m_s, a_s = a_s, 
                                      v_s = v_s, l_s = l_s)
head(raw_results)
# NOTE: ylim(0, 0.5) used below to match Wikipedia plot, 
# so we get get some ggplot warnings; increase ylim's second value
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() +   xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type IV", subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") + 
  geom_vline(xintercept = l_s, lty = 2)
print(plot_obj)
