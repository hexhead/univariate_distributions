# power_series_function.R - Bill White - 3/1/19
# 
# https://www.wikiwand.com/en/Power_series#
# 
# Parameters: a * c ^ x
# x_s - vector of numerics to evaluate (x values)
# c_s - vector of numerics - exponents, c > 0
# a_s - vector of numerics - a coefficent of c

Ac <- function(c, x_s, a_s) {
  sum(unlist(lapply(seq_along(x_s), function(x) {
    a_s[x] * c ^ x_s[x]
  })))
}

amstat_power_series <- function(x_s, c_s, a_s) {
  c_results <- lapply(c_s, function(c) {
    x_results <- lapply(x_s, function(x) {
      a_results <- lapply(a_s, function(a) {
        A_c <- Ac(c = c, x_s = x_s, a_s = a_s)
        # print(sprintf("x = %f, A(c) = %f", x, A_c))
        # print(paste("a_s[x]=", a_s[x], ", c=", c, "x_s[x]=", x_s[x]))
        y <- (a_s[x] * (c ^ x_s[x])) / A_c
        # print(sprintf("x = %f, A(c) = %f, y = %f", x, A_c, y))
        data.frame(x = x, y = y, Parameters = sprintf("c=%4.2f", c))
      })
      do.call(rbind, a_results)
    })
    do.call(rbind, x_results)
  })
  do.call(rbind, c_results)
}
