# normal_generalized_function.R - Bill White - 3/14/19
# 
# https://www.wikiwand.com/en/Generalized_normal_distribution

source("gamma_function.R")

# ------------------------------------------------------------------------------
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics - mu - location (real)
# a_s - vector of numerics  - alpha - scale (pos real)
# b_s - vector of numerics  - beta - scale (pos real)
#
# Generalized Normal (version 1)
amstat_normal_generalized_v1 <- function(x_s, m_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(seq_along(m_s), function(i) {
      m <- m_s[i]
      a <- a_s[i]
      b <- b_s[i]
      t1 <- b / (2 * a * amstat_gamma(1 / b))
      t2 <- exp(-((abs((x - m) / a) ^ b)))
      y <-  t1 * t2
      data.frame(x = x, y = y, grp = "version 1",
                 Parameters = sprintf("mu=%6.3f alpha=%6.3f beta=%6.3f", 
                                      m, a, b))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}

# ------------------------------------------------------------------------------
# # Parameters:
# x_min - numeric - min x for plot x-axis
# x_max - numeric - max x for plot x-axis
# c_s - vector of numerics - chi - location (real)
# a_s - vector of numerics  - alpha - scale (pos real)
# k_s - vector of numerics  - kappa - sshape (real)
#
# Generalized Normal (version 2)
amstat_normal_generalized_v2 <- function(minx, maxx, c_s, a_s, k_s) {
  c_results <- lapply(c_s, function(chi) {
    a_results <- lapply(a_s, function(a) {
      k_results <- lapply(k_s, function(k) {
        if (k > 0) {
          #cat(k, "k > 0 x_s\n")
          x_s <- seq(from = minx, to = chi + (a / k), by = 0.1)
        } else {
          if (k == 0) {
            #cat(k, "k == 0 x_s\n")
            x_s <- seq(from = minx, to = maxx, by = 0.1)
          } else {
            # k < 0
            #cat(k, "k < 0 x_s\n")
            x_s <- seq(from = chi + (a / k), to = maxx, by = 0.1)
          }
        } 
        #print(x_s)
        x_results <- lapply(x_s, function(x) {
          y <- 0
          if (k == 0) {
            y <- (x - chi) / a
          } else {
            logarg <- 1 - (k * (x - chi)) / a
            if (logarg != 0) {
              y <- (-1 / k) * log(logarg)
            } else {
              #browser()
            }
          }
          phi_of_y <- dnorm(y, mean = 0, sd = 1)
          den <- a - (k * (x - chi))
          y <- 0
          if (den != 0) {
            y <-  phi_of_y / den
          }
          data.frame(x = x, y = y, grp = "version 2",
                     Parameters = sprintf("chi%6.3f alpha=%6.3f kappa=%6.3f", 
                                          chi, a, k))
        })
        do.call(rbind, x_results)
      })
      do.call(rbind, k_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, c_results)
}
