# uniform_discrete_function.R - Bill White - 2/21/19
# 
# https://www.wikiwand.com/en/Discrete_uniform_discrete_distribution
# symmetric probability distribution whereby a finite number of values are equally 
# likely to be observed; every one of n values has equal probability 1/n.
# Included for completeness.
amstat_uniform_discrete <- function(a, b) {
  if (b < a) stop(paste("b", b, "must be greater than a", a))
  n <- b - a + 1
  data.frame(x = a:b, y = 1 / n, Parameters = paste("a =", a, "b =", b, "n =", n))
}
