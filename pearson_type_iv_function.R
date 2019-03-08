# pearson_type_iv_function.R - Bill White - 3/7/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 1: negative discriminant: The Pearson type IV distribution.
# * If the discriminant of the quadratic function is negative
#   (b_{1}^{2}-4b_{2}b_{0}<0), it has no real roots.
# * The normalizing constant involves the complex Gamma function (Γ) and
#   the Beta function (B).
# * unnormalized:
#   (1 + x ^ 2)-m * x * exp(-v atan(x))
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha - scale > 0
# m_s - vector of numerics - m - shape > 1/2
# v_s - vector of numerics - v - shape - skewness
# l_s - vector of numerics - lambda - location

source("beta_function.R")
source("gamma_function.R")

amstat_pearson_type_iv <- function(x_s, a_s, m_s, v_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <-  lapply(m_s, function(m) {
      v_results <- lapply(v_s, function(v) {
        a_results <- lapply(a_s, function(a) {
          # normalizing constant nc
          nc1 <- (amstat_gamma(z = m + ((v / 2) * 0 + 1i), method = "stirling") / 
                    amstat_gamma(z = m, method = "stirling")) ^ 2
          one_half <- 1 / 2
          nc2 <- nc1 / (a * amstat_beta(m - one_half, one_half))
          nc <- Re(nc1 / nc2)
          l_results <- lapply(l_s, function(l) {
            # terms of parametric equation
            parameters <- sprintf("alpha=%2.0f m=%2.0f v=%2.0f lambda=%2.0f", 
                                  a, m, v, l)
            xla <- (x - l) / a
            t1 <- (1 + (xla  ^ 2)) ^ -m
            t2 <- exp(-v * atan(xla))
            y <-  nc * t1 * t2
            data.frame(x = x, y = y, Parameters = parameters)
          })         
          do.call(rbind, l_results)
        })         
        do.call(rbind, a_results)
      })         
      do.call(rbind, v_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
