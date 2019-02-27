# students_t_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Student%27s_t-distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# v_s - vector of numerics degrees of freedom

library(ggplot2)

source("students_t_function.R")

x_s <- seq(from = -4, to = 4, by = 0.05)
v_s <- c(1, 2, 5, 100)
raw_results <- amstat_students_t(x_s = x_s, v_s = v_s)
head(raw_results)
# NOTE: ylim(0, 0.5) used below to match Wikipedia plot, 
# so we get get some ggplot warnings; increase ylim's second value
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Students's t-distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
