# normal_standard_function.R - Bill White - 2/25/19
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)

amstat_normal_standard <- function(x_s) {
  y_s <- (1 / (sqrt(2 * pi))) * (exp(((-1 / 2) * x_s ^ 2)) / sqrt(2 * pi))
  data.frame(x =  x_s, y = y_s, Parameters = "")
}
