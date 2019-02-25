# zipf_function.R - Bill White - 2/24/19

generalized_harmonic_number <- function(n, m, k_s) {
  sum(sapply(k_s, function(k) {
    1 / k ^ m    
  }))
}

amstat_zipf_wiki <- function(s_s, k_s) {
  n <- length(k_s)
  s_results <- lapply(s_s, function(s) {
    y_s <- (1 / k_s ^ s) / generalized_harmonic_number(n = n, m = s, k_s = k_s)
    data.frame(x = k_s, y = y_s, Parameter = s)
  })
  do.call(rbind, s_results)
}

amstat_zipf <- function(x_s, a_s) {
  n <- length(x_s)
  i <- 1:n
  a_results <- lapply(a_s, function(a) {
    constant_factor <- sum(1:n / i ^ a)
    x_results <- lapply(x_s, function(x) {
      y <- 1 / (x ^ a  * constant_factor) 
      data.frame(x = x, y = y, Parameters = paste("s =", a))
    })
    do.call(rbind, x_results)    
  })
  do.call(rbind, a_results)
}
