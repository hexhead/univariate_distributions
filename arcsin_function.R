# arcsin_function.R - Bill White - 03/10/19
# 
# Parameters
# x_s - vector of numeric - x-axis values -1 < x < 1
# 
# From page 81 of the Handbook of Mathematical Functions, by 
# Milton Abramowitz and Irene Stegun:

# arcsin(x) = (π / 2) - √(1 - x) * (a0 + a1 x + a2 * x ^2 + a3 ∗ x ^ 3)

amstat_arcsin <- function(x_s) {
  # y <- 1 / (pi * sqrt(x_s * (1 - x_s)))
  # y <- (choose(2 * n, n) * x ^ (2 * n  + 1)) / (4 ^ n * (2 * x + 1))
  x_results <- lapply(x_s, function(x) {
    a0 <- 1.5707288
    a1 <- -0.2121144
    a2 <- 0.0742610
    a3 <- -0.0187293
    xx <- abs(x)
    y = (pi / 2) - sqrt(1 - xx) * 
      (a0 + a1 * xx + a2 * xx * xx + a3 * xx * xx * xx)
    y = y * sign(x)
    data.frame(x = x, y = y)
  })
  do.call(rbind, x_results)
}
