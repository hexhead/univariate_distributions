# normal_standard_function.R - Bill White - 2/25/19
# 
# The simplest case of a normal distribution is known as the standard 
# normal distribution. This is a special case when mu = 0 and sigma = 1
# https://www.wikiwand.com/en/Normal_distribution
# https://www.wikiwand.com/en/Normal_distribution#/Standard_normal_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)

amstat_normal_standard <- function(x_s) {
  y_s <- (1 / (sqrt(2 * pi))) * (exp(((-1 / 2) * x_s ^ 2)) / sqrt(2 * pi))
  data.frame(x =  x_s, y = y_s, Parameters = "")
}
