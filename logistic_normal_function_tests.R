# logistic_normal_function_tests.R - Bill White - 3/17/19
#
# https://www.wikiwand.com/en/Logit-normal_distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) - (0, 1)
# s_s - vector of numerics - squared scale - real
# m_s - vector of numerics - location - real

library(ggplot2)

source("logistic_normal_function.R")

x_s <- seq(from = 0.01, to = 0.99, by = 0.01)
s_s <- c(0.32, 0.56, 1, 1.78, 3.16)
m_s <- rep(0, length(s_s))
raw_results1 <- amstat_logistic_normal(x_s = x_s, s_s = s_s, m_s = m_s)
raw_results1$Group <- sprintf("location %d", m_s[1])
head(raw_results1)

m_s <- rep(1, length(s_s))
raw_results2 <- amstat_logistic_normal(x_s = x_s, s_s = s_s, m_s = m_s)
raw_results2$Group <- sprintf("location %d", m_s[1])
head(raw_results2)

raw_results <- rbind(raw_results1, raw_results2)
plot_obj <- 
  ggplot(raw_results, aes(x = x, 
                          y = y, 
                          colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 7) +
  ggtitle(label = "Logistic Normal Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~Group)
print(plot_obj)
