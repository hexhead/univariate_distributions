# negative_binomial_function.R - Bill White - 2/21/19
# https://en.wikipedia.org/wiki/Negative_binomial_distribution
# k is the numeric of support for the function (number of successes)
# r is the numeric vector of trials r of successes
# p is the numeric vector of probabilities of success [0, 1]
amstat_negative_binomial <- function(k, r, p) {
  results <- lapply(k, function(x) {
    data.frame(x = x, 
               y = choose(r + x - 1, x) * ((1 - p) ^ r) * (p ^ x),
               r = as.factor(r),
               p = as.factor(p),
               grp = paste(as.factor(r), as.factor(p)))
  })
  do.call(rbind, results)
}
