# symmetric_dirichlet_function_tests.R - Bill White - 2/24/19
# 
# https://www.wikiwand.com/en/Dirichlet_distribution
# K <= 2 - number of categories
# a_s - numeric vector of alpha a1 ... aK
# Support: x_i in (0,1) and sum x_i == 1

library(ggplot2)

source("symmetric_dirichlet_function.R")

# number of categories
K = 6
# make K random alphas
x1 <- matrix(rbeta(100 * 3, 2, 2), ncol = K)
x1 <- sweep(x1, 1, rowSums(x1), FUN = "/")
print(sum(colMeans(x1)))
x_s <- sort(colMeans(x1))
print(x_s)
# evaluation points for plot
#a_s <- seq(from = 0.5, to = 3, by = 0.5)
#a_s <- rep(1, K)
a_s <- c(10, 25, 25, 40)
plot_data <- amstat_dirichlet(x_s = x_s, a_s = a_s)
print(head(plot_data, n = 10))

plot_obj <- ggplot(plot_data, aes(x = x, y = y), colour = Parameters) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Dirichlet Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
