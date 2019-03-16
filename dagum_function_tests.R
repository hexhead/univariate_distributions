# dagum_function_tests.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Dagum_distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) > 0
# a_s - vector of numerics - a - shape > 0
# b_s - vector of numerics - b - scale > 0
# p_s - vector of numerics - p - shape > 0

library(ggplot2)

source("dagum_function.R")

num_params <- 5

x_s <- seq(from = 0, to = 5, by = 0.05)
a_s <- c(0.5, 1, 2, 3, 4)
b_s <- rep(1, num_params)
p_s <- rep(1, num_params)
raw_results1 <- amstat_dagum(x_s = x_s, a_s = a_s, b_s = b_s, p_s = p_s)
grp1 <- sprintf("b=%3.1f, p=%3.1f", b_s[1], p_s[1])
raw_results1$grp <- grp1
print(head(raw_results1))

a_s <- rep(2, num_params)
b_s <- c(0.5, 1, 2, 3, 4)
p_s <- rep(1, num_params)
raw_results2 <- amstat_dagum(x_s = x_s, a_s = a_s, b_s = b_s, p_s = p_s)
grp2 <- sprintf("a=%3.1f, p=%3.1f", a_s[1], p_s[1])
raw_results2$grp <- grp2
print(head(raw_results2))

a_s <- rep(2, num_params)
b_s <- rep(1, num_params)
p_s <- c(0.5, 1, 2, 3, 4)
raw_results3 <- amstat_dagum(x_s = x_s, a_s = a_s, b_s = b_s, p_s = p_s)
grp3 <- sprintf("a=%3.1f, b=%3.1f", a_s[1], b_s[1])
raw_results3$grp <- grp3
print(head(raw_results3))

all_results <- rbind(raw_results1, raw_results2, raw_results3)
plot_obj <- ggplot(all_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "Dagum Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_grid(~grp)
print(plot_obj)
