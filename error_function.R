# error_function.R - Bill White - 3/11/19
# 
# In mathematics, the error function (also called the Gauss error function) 
# is a special function (non-elementary) of sigmoid shape that occurs in 
# probability, statistics, and partial differential equations describing 
# diffusion. 

source("gamma_function.R")
source("gamma_incomplete_function.R")

# -----------------------------------------------------------------------------
# for x_s > 0
# https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Error_function.html
# # Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 
# n_s - vector of numerics - selects generalized error function E_n(x)
amstat_error_en_x <- function(x_s, n_s) {
  n_results <- lapply(n_s, function(n) {
    x_results <- lapply(x_s, function(x) {
      t1 <- 1 / sqrt(pi)
      t2 <- as.numeric(amstat_gamma(n))
      one_over_n <- 1 / n
      g_1_n <- amstat_gamma(one_over_n)
      g_i_n_x <- as.numeric(amstat_gamma_incomplete(n_s = one_over_n, x_s = x ^ n)$y)
      t3 <- g_1_n - g_i_n_x
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, Parameters = sprintf("n=%2.0f", n))
    })
    do.call(rbind, x_results)
  })
  do.call(rbind, n_results)
}

# -----------------------------------------------------------------------------
# for x_s > 0
# https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Error_functio.html
amstat_error_erf_x <- function(x_s) {
  x_results <- lapply(x_s, function(x) {
    one_over_sqrt_pi <- 1 / sqrt(pi)
    g_i <- amstat_gamma_incomplete(1 / 2, x ^ 2)$y
    y <- 1 - (one_over_sqrt_pi * g_i)
    data.frame(x = x, y = y, Parameters = "")
  })
  do.call(rbind, x_results)
}

# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
amstat_error1 <- function(x_s) {
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

# -----------------------------------------------------------------------------
# https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Error_function.html
# Notable cases are:
#
# E0(x) is a straight line through the origin:
# \textstyle E_{0}(x)={\frac {x}{e{\sqrt {\pi }}}}
# E2(x) is the error function, erf(x).
amstat_error_generalized <- function(x_s, n_s) {
  n_results <- lapply(n_s, function(n) {
    x_results <- lapply(x_s, function(x) {
      infinity <- 100
      t1 <- factorial(n) / sqrt(pi)
      t2 <- sum(unlist(lapply(0:infinity, function(p) {
          ((-1) ^ p) * (x ^ (n * p + 1)) / ((n * p + 1) * factorial(p))
      })))
      y <- t1 * t2
      data.frame(x = x, y = y, Parameters = sprintf("n = %5.2f", n))
    }) 
    do.call(rbind, x_results)
  })
  do.call(rbind, n_results)
}

# Abramowitz and Stegun 7.1.6
amstat_error_as <- function(z_s) {
  infinity <- 100
  z_results <- lapply(z_s, function(z) {
    sum_term <- sum(unlist(lapply(0:infinity, function(n) {
      divisor <- prod(unlist(lapply(0:n, function(i) 2 * i + 1)))
      ((2 ^ n) / divisor) * z ^ (2 * n + 1)
    })))
    y <- (2 / sqrt(pi)) * exp(-(z ^ 2)) * sum_term
    data.frame(x = z, y = y, Parameters = "")
  })
  do.call(rbind, z_results)
}
