# pareto_generalized_function.R - Bill White - 5/19/19
# 
# https://www.wikiwand.com/en/Generalized_Pareto_distribution

# Parameters:
# x_s - vector of numerics to evaluate (x values)
# g_s - vector of numerics - gamma - location
# k_s - vector of numerics - kappa - shape
# s_s - vector of numerics - sigma - scale
amstat_pareto_generalized <- function(x_s, g_s, k_s, s_s) {
  x_results <- lapply(x_s, function(x) {
    g_results <- lapply(seq_along(g_s), function(i) {
      g <- g_s[i]
      k <- k_s[i]
      s <- s_s[i]
      # from AMSTAT 2008 paper
      t1 <- g + (k / (x + s))
      t2 <- (1 + (x / s)) ^ (-k)
      t3 <- exp(-g * x)
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("gamma=%4.2f kappa=%4.2f sigma=%4.2f", 
                                      g, k, s))
    })
    do.call(rbind, g_results)
  })
  do.call(rbind, x_results)
}
