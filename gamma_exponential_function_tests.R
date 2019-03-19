# gamma_exponential_function_tests.R - Bill White - 3/17/19
# 
# https://reference.wolfram.com/language/ref/ExpGammaDistribution.html
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) -
#       defined on the set of real numbers
# k_s - vector of numerics - kappa -shape real > 0 height
# t_s - vector of numerics - theta -scale > 0 steepness
# m_s - vector of numerics - mu - horizontal location of the "peak" 
#       (i.e. absolute maximum)

library(ggplot2)

source("gamma_exponential_function.R")

x_s <- seq(from = -5, to = 5, by = 0.05)
k_s <- c(0.25, 1, 2)
t_s <- rep(2, length(k_s))
m_s <- rep(1, length(k_s))
raw_results <- amstat_gamma_exponential(x_s = x_s, 
                                        k_s = k_s, 
                                        t_s = t_s, 
                                        m_s = m_s)
print(head(raw_results))
plot_obj <- 
  ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Exponential Gamma Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
