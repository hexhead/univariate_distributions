# polya_function_tests.R - Bill White - 2/26/19
# 
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/Polya.pdf
#
# Polya distribution (from http://www.math.wm.edu/˜leemis/chart/UDR/UDR.html)
# The shorthand X ∼ Polya(n, p, β) is used to indicate that the random variable
# X has the Polya distribution with parameters n, p, and β. A Polya random variable X with
# parameters n, p, and β
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - real > 0
# n_s - vector of integer n's for range of x-axis 1.2...
# p_s = vector of numeric - 0 < p_s < 1 
# b_s - vector of numeric > 0

library(ggplot2)

source("polya_function.R")

n <- 12
x_s <- seq(from = 0, to = n, by = 1)
n_s <- seq(from = 1, to = n, by = 1)
p_s <- c(0.1, 0.25, 0.5, 0.9)
b_s <- c(2, 2, 2, 2)
raw_results <- amstat_polya(x_s = x_s, p_s = p_s, b_s = b_s, n_s = n_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Polya Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~grp)
print(plot_obj)
