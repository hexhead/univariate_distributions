# negative_binomial_function.R - Bill White - 2/21/19
# https://en.wikipedia.org/wiki/Negative_binomial_distribution
# "Pascal" for the case of an integer-valued stopping-time parameter r, 
# and use "Polya" for the real-valued case
# k is the numeric of support for the function (number of successes)
# r is the numeric vector of trials r of successes
# p is the numeric vector of probabilities of success [0, 1]
amstat_negative_binomial <- function(k, r, p) {
  results <- lapply(p, function(this_p) {
    this_p_results <- lapply(k, function(this_k) {
      this_r_results <- lapply(r, function(this_r) {
        data.frame(x = this_k, 
                   y = 
                     choose(this_r + this_k - 1, this_k) * 
                     ((1 - this_p) ^ this_r) * 
                     (this_p ^ this_k),
                   r = as.factor(this_r),
                   p = this_p)
      })
      do.call(rbind, this_r_results)        
    })
    do.call(rbind, this_p_results)
  })
  do.call(rbind, results)
}
