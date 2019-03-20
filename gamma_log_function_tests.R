# gamma_log_function_tests.R - Bill White - 5/19/19
# 
# https://reference.wolfram.com/language/ref/LogGammaDistribution.html
# 
# x_s - vector of numerics to evaluate (x values) (mu, inf)
# a_s - vector of numerics - alpha shape > 0
# b_s - vector of numerics - beta shape > 0
# m_s - vector of numerics - mu location

library(ggplot2)

source("gamma_log_function.R")

# three scenarios from Wolfram site
x_s <- seq(from = 1, to = 6, by = 0.05)
a_s <- c(1, 1.5, 2.5)
b_s <- c(0.5)
m_s <- c(1)
raw_results1 <- amstat_gamma_log(x_s = x_s, a_s = a_s, b_s = b_s, m_s = m_s) 
raw_results1$Facet = "Case 1: Vary alpha shape"

a_s <- c(2)
b_s <- c(0.4, 0.6, 1)
m_s <- c(1)
raw_results2 <- amstat_gamma_log(x_s = x_s, a_s = a_s, b_s = b_s, m_s = m_s) 
raw_results2$Facet = "Case 2: Vary beta shape"

a_s <- c(1.5)
b_s <- c(2)
m_s <- c(1, 2, 3)
raw_results3 <- amstat_gamma_log(x_s = x_s, a_s = a_s, b_s = b_s, m_s = m_s) 
raw_results3$Facet = "Case 3: Vary mu location"

raw_results <- rbind(raw_results1, raw_results2, raw_results3)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 1) +
  ggtitle(label = "Log Gamma Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") + 
  facet_wrap(~Facet)
print(plot_obj)
