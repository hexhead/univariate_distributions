# logistic_exponential_function.R - Bill White - 3/24/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
# a - lower limit x
# b - upper limit x
# 
amstat_logistic_exponential <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(a_s, function(a) {
      b_results <- lapply(b_s, function(b) {
        n1 <- a * b
        n2 <- (exp(a * x) - 1) ^ (b - 1)
        n3 <- exp(a * x)
        num <- n1 * n2 * n3
        den <- (1 + (exp(a * x) - 1) ^ b) ^ 2
        y <- num / den
        data.frame(x = x, y = y, Parameters = paste("a =", a, "b =", b))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
