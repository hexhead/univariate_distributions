# hyperbolic_secant_function.R - Bill White - 3/26/19
#
# The hyperbolic secant distribution shares many properties with the standard
# normal distribution: it is symmetric with unit variance and zero mean, median
# and mode, and its pdf is proportional to its characteristic function. However,
# the hyperbolic secant distribution is leptokurtic; that is, it has a more
# acute peak near its mean, and heavier tails, compared with the standard normal
# distribution.
# 
# Johnson et al. (1995, p147) places this distribution in the context of a class
# of generalised forms of the logistic distribution, but use a different
# parameterisation of the standard distribution compared to that here. Ding
# (2014) shows three occurrences of the Hyperbolic secant distribution in
# statistical modeling and inference.
#
# Losev (1989) has proposed to consider the hyperbolic secant as the symmetrical
# case for a more general asymmetric distribution {\displaystyle h(x)={\frac
# {1}{\exp(ax)+\exp(-bx)))}.
# 
# ------------------------------------------------------------------------------
# AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
amstat_hyperbolic_secant <- function(x_s, k_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    # via Euler!
    y <- 2 / (exp(x) + exp(-x))
    data.frame(x = x, y = y, Parameters = "")
  })
  do.call(rbind, x_results)
}
