# nakagami_function_tests.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Nakagami_distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)]
# k_s - vector of numerics degrees of freedom > 0

library(ggplot2)

source("nakagami_function.R")

x_s <- seq(from = 0, to = 4, by = 0.05)
# m_s <- c(0.5, 1, 1, 1, 2, 2, 5)
# w_s <- c(1.0, 1, 2, 3, 1, 2, 1)
# https://reference.wolfram.com/language/ref/NakagamiDistribution.html
m_s <- c(1/3, 1/2, 3/2, 1/2, 1/2, 1/2)
w_s <- c(3, 3, 3, 1/2, 1, 3)
raw_results <- amstat_nakagami(x_s = x_s, m_s = m_s, w_s = w_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + ylim(0, 1.2) +
  ggtitle(label = "Nakagami Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
