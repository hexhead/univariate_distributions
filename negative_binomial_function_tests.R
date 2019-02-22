# negative_binomial_function_tests.R - Bill White - 2/21/19
# https://en.wikipedia.org/wiki/Negative_binomial_distribution

library(ggplot2)

source("negative_binomial_function.R")

# k is the numeric of support for the function (number of successes)
# r is the numeric vector of trials r of successes
# p is the numeric vector of probabilities of success [0, 1]
k_s <- seq.int(from = 1, to = 25, by = 1)
r_s <- c(1, 2, 3, 4, 5 ,10, 20, 40)
#p_s <- c(0.1, 0.25, 0.33, 0.5, 0.75, 0.875)
p_s <- c(0.1, 0.25, 0.5, 0.75, 0.9)
plot_data <- amstat_negative_binomial(k = k_s, r = r_s, p = p_s)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = r)) + 
  geom_point() + geom_line() + xlab("k") + ylab("PMF") +
  ggtitle(label = "Negative Binomial Distribution NB(r, p)", 
          subtitle = "Probability Mass Function") +
  facet_wrap(.~p)
print(plot_obj)
