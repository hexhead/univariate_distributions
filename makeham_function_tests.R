# makeham_function_tests.R - Bill White - 3/4/19
# 
# https://reference.wolfram.com/language/ref/GompertzMakehamDistribution.html

library(ggplot2)

source("makeham_function.R")

# ------------------------------------------------------------------------------
# Parameters:
# x_s - vector of numerics to evaluate (x values) > 0
# l_s - vector of numerics - lambda
# xi_s -vector of numerics - xi
# t_s - vector of numerics - theta
# a_s - vector of numerics - alpha
# ------------------------------------------------------------------------------
x_s <- seq(from = 0, to = 1, by = 0.01)
l_s <- c(2)
xi_s <- c(1)
t_s <- c(0.1, 1, 2)
a_s <- c(2)
raw_results1 <- amstat_makeham(x_s = x_s, l_s = l_s, xi_s = xi_s, t_s = t_s, a_s = a_s)
raw_results1$Scenario <- "Varying theta"
# ------------------------------------------------------------------------------
l_s <- c(2)
xi_s <- c(1)
t_s <- c(0.1)
a_s <- c(0.1, 1, 2)
raw_results2 <- amstat_makeham(x_s = x_s, l_s = l_s, xi_s = xi_s, t_s = t_s, a_s = a_s)
raw_results2$Scenario <- "Varying alpha"
# ------------------------------------------------------------------------------
raw_results <- rbind(raw_results1, raw_results2)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + 
  ggtitle(label = "Makeham Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~Scenario)
print(plot_obj)
