# lomax_function.R - Bill White - 3/26/19
# 
# The Lomax distribution, conditionally also called the Pareto Type II 
# distribution, is a heavy-tail probability distribution used in business, 
# economics, actuarial science, queueing theory and Internet traffic modeling.
# It is named after K. S. Lomax. It is essentially a Pareto distribution that 
# has been shifted so that its support begins at zero.
# 
# ------------------------------------------------------------------------------
# AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
# k_s - vector of numerics kappas
# l_s - vector of numerics lambdas
amstat_lomax <- function(x_s, k_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    k_l_results <- lapply( seq_along(k_s), function(i) {
      k <- k_s[i]
      l <- l_s[i]
      # NOTE; rewritten to show relation to Pareto Type I
      y <- (k * (l ^ k)) / ((x + l) ^ (k + 1))
      data.frame(x = x, y = y, Parameters = sprintf("kappa=%5.2f lambda=%5.2f", k, l))
    })
    do.call(rbind, k_l_results)
  })
  do.call(rbind, x_results)
}

# ------------------------------------------------------------------------------
# Wikipedia:
# x_s - vector of numerics to evaluate (x values) > 0
# a_s - vector of numerics alphas - shape > 0 (real)
# l_s - vector of numerics lambdas - scale > 0 (real)
wiki_lomax <- function(x_s, a_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    k_l_results <- lapply( seq_along(a_s), function(i) {
      a <- a_s[i]
      l <- l_s[i]
      # Pareto Type II - Pareto shifted to include zero
      y <- (a / l) * ((1 + (x / l)) ^ (-(a + 1)))
      data.frame(x = x, y = y, Parameters = sprintf("alpha=%5.2f lambda=%5.2f", a, l))
    })
    do.call(rbind, k_l_results)
  })
  do.call(rbind, x_results)
}
