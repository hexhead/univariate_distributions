# pearson_type_vii_function.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 1, negative discriminant: The Pearson type VII distribution
# Pearson type VII distribution subsumes the standard Student's t-distribution
# and also the standard Cauchy distribution.
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# l_s - vector of numerics - lambda - location - mean
# s_s - vector of numerics - sigma - scale - standard deviation
# Parameter m in Type IV skewness, here == 0
# g2_s - vector of numerics - gamma_2 - excess kurtosis
#
# Changes from Type IV
# v_s - vector of numerics - v - shape - skewness SET TO ZERO!
# m_s - vector of numerics - m - shape - kurtosis
#       has computed value in function,see wiki > 5/2, see computed value below

source("beta_function.R")

amstat_pearson_type_vii <- function(x_s, l_s = c(0), s_s = c(1), g2_s = c(0.1)) {
  x_results <- lapply(x_s, function(x) {
    g2_results <-  lapply(g2_s, function(g2) {
      s_results <- lapply(s_s, function(s) {
        # normalizing constant nc
        # yes, there is a reason for setting a variable to 1
        # compare Pearson Tyoe IV
        nc1 <- 1
        m <- (5 / 2) + (3 / g2)
        a <- s * sqrt((2 * m) - 3)
        one_half <- 1 / 2
        nc2 <- nc1 / (a * amstat_beta(m - one_half, one_half))
        nc <- Re(nc1 / nc2)
        l_results <- lapply(l_s, function(l) {
          # terms of parametric equation
          parameters <- sprintf("lambda=%4.2f sigma=%4.2f gamma_2=%4.2f", l, s, g2)
          xla <- (x - l) / a
          t1 <- (1 + (xla  ^ 2)) ^ -m
          y <-  nc * t1
          data.frame(x = x, y = y, Parameters = parameters)
        })         
        do.call(rbind, l_results)
      })
      do.call(rbind, s_results)
    })         
    do.call(rbind, g2_results)
  })
  do.call(rbind, x_results)
}

# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# Support: (-∞ < x < ∞)
amstat_pearson_type_vii_howto <- function(x_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      y <-  (1 + x ^ 2) ^ -m
      data.frame(x = x, y = y, Parameters = sprintf("m=%4.2f", m))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}

