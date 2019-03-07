# skellum_function.R - Bill White - 3/6/19
#
# -----------------------------------------------------------------------------
# https://www.vosesoftware.com/riskwiki/skellumdistribution.php
# 
# * The Skellam distribution models the difference between two independent 
#   Poisson distributed variables as follows:
# * Skellam(λ1, λ2) = Poisson(λ1) - Poisson(λ2)
# * has a number of uses, essentially relating to the above formula. For example 
#   the difference in number of accidents (or murders, strikes, catastrophes, 
#   etc. – anything that occurs randomly in time) between, for example, 
#   two cities, two populations, two years, etc – where it is assumed that the 
#   expected rate of occurrence for the two variables are λ1 and λ2
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - 0 <= k <= n
# l1_s = vector of numeric - lambda1 > lambda 2
# l2_s - vector of numeric - > 0
# NOTE: uses modified bessel function of the first kind
vose_skellum <- function(x_s, l1_s, l2_s) {
  x_results <- lapply(x_s, function(x) {
    y_results <- lapply(seq_along(l1_s), function(i) {
      l1 <- l1_s[i]
      l2 <- l2_s[i]
      y <- 
        exp(-(l1 + l2)) * 
        ((l1 / l2) ^ (x / 2)) * 
        besselI(x = 2 * sqrt( l1 * l2), nu = x)
      # 2 * sqrt( l1 * l2)
      data.frame(x = x, y = y, 
                 Parameters = sprintf("λ1 = %1.0f λ2 = %1.0f", l1, l2))
    })
    do.call(rbind, y_results)
  })
  do.call(rbind, x_results)
}

