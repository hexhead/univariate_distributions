# error_function.R - Bill White - 3/11/19
# 
# In mathematics, the error function (also called the Gauss error function) 
# is a special function (non-elementary) of sigmoid shape that occurs in 
# probability, statistics, and partial differential equations describing 
# diffusion. 

source("gamma_incomplete_function.R")

amstat_error <- function(x_s) {
  x_results <- lapply(x_s, function(x) {
    nearinf <- 100
    t1 <- sqrt(pi / 2)
    t2 <- exp((x ^ 2) / 2)
    j_results <- lapply(1:nearinf, function(j) {
      (2 ^ j * factorial(j)) / 
        (factorial(2 * j + 1)) * x ^ (2 * j)
    })
    y <- (t1 * t2) - (x * sum(unlist(j_results)))
    data.frame(x = x, y = y, Parameters = "")
    
  })
  do.call(rbind, x_results)
}

amstat_error_stackexchange <- function(a, b, z, maxt = 5) {
  s <- 1:maxt
  a <- a + s
  b <- b + s
  ss <- 1
  for (i in s) {
    mt <- prod(a[1:i] / b[1:i])
    ss <- ss + mt * z ^ (2 * i) / factorial(i)
  }
  ss <- 2 * z / sqrt(pi) * exp(-z ^ 2) * ss

  data.frame(x = z, y = ss, Parameters = "")
}

amstat_error <- function(x_s) {
  x_results <- lapply(x_s, function(x) {
    nearinf <- 100
    t1 <- sqrt(pi / 2)
    t2 <- exp((x ^ 2) / 2)
    j_results <- lapply(1:nearinf, function(j) {
      (2 ^ j * factorial(j)) / 
        (factorial(2 * j + 1)) * x ^ (2 * j)
    })
    y <- (t1 * t2) - (x * sum(unlist(j_results)))
    data.frame(x = x, y = y, Parameters = "")
    
  })
  do.call(rbind, x_results)
}

# https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Error_function.html
amstat_error_generalized <- function(x_s) {
  x_results <- lapply(x_s, function(x) {
    t1 <- 1 / sqrt(pi)
    t2 <- amstat_gamma_incomplete(n_s = 1, x_s = x ^ 2)$y
    y <- t1 * t2
    data.frame(x = x, y = y, Parameters = "")
  }) 
  do.call(rbind, x_results)
}
