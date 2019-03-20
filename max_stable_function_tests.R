# max_stable_function_tests.R - Bill White - 5/19/19
# 
# https://reference.wolfram.com/language/ref/LogGammaDistribution.html
# 
# x_s - vector of numerics to evaluate (x values) (mu, inf)
# m_s - vector of numerics - mu location > 0
# s_s - vector of numerics - sigma scale > 0
# e_s - vector of numerics - xi shape > 0

library(ggplot2)

source("max_stable_function.R")

# three scenarios from Wolfram site
x_s <- seq(from = -4, to = 4, by = 0.01)
m_s <- c(-1)
s_s <- c(2)
e_s <- c(-0.5, 0.5, 1.5)
raw_results1 <- amstat_max_stable(x_s = x_s, m_s = m_s, s_s = s_s, e_s = e_s) 
raw_results1$Facet = "Case 1: Vary xi"

m_s <- c(-1)
s_s <- c(0.5, 1, 1.2)
e_s <- c(1/2)
raw_results2 <- amstat_max_stable(x_s = x_s, m_s = m_s, s_s = s_s, e_s = e_s) 
raw_results2$Facet = "Case 2: Vary sigma"

m_s <- c(-1.5, 0.5, 1)
s_s <- c(2)
e_s <- c(0.5)
raw_results3 <- amstat_max_stable(x_s = x_s, m_s = m_s, s_s = s_s, e_s = e_s) 
raw_results3$Facet = "Case 3: Vary mu"

raw_results <- rbind(raw_results1, raw_results2, raw_results3)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Max Stable Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") + 
  facet_wrap(~Facet)
print(plot_obj)
