# weibull_function_tests.R - Bill White - 2/22/19
# https://en.wikipedia.org/wiki/Weibull_distribution
# where k > 0 is the shape parameter, λ > 0 is the scale parameter.
# interpolates between the exponential distribution (k = 1) and 
# the Rayleigh distribution (k = 2 and \lambda = \sqrt{2}\sigma [2]).
# --------------------------------------------------------------------
# https://www.wikiwand.com/en/Discrete_Weibull_distribution
# x_values - numeric vector of x vaklues to evalute
# alphas - scale - numeric vector greater tha zero
# betas - shape - numeric vector greater tha zero
# https://reference.wolfram.com/language/ref/WeibullDistribution.html
# 
library(ggplot2)

source("weibull_function.R")

x_s <- seq(from = 0, to = 5, by = 0.1)
a_s <- c(0.5, 2, 4)
b_s <- c(1, 2, 4)
plot_data <- amstat_discrete_weibull(x_values = x_s, 
                                     alphas = a_s, 
                                     betas = b_s, 
                                     u = 0)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Discrete Weibull Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
