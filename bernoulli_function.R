# bernoulli_function.R - Bill White - 1/28/19

# this function performs one Bernoulli trial at the probability specified
# the discrete probability distribution of a random variable which takes 
# the value 1 with probability p and the value 0 with probability q=1-p, 
# that is, the probability distribution of any single experiment that asks a
# yes–no question; the question results in a boolean-valued outcome, a single 
# bit of information whose value is success/yes/true/one with probability p and 
# failure/no/false/zero with probability q.
amstat_bernoulli <- function(n_trials = 1, prob = 0.5, n_success = 1) {
  p <- prob
  q = 1.0 - p  
  unlist(lapply(n_success, function(z) {
    (p ^ z) * (q ^ (1.0 - z))
  }))
}

amstat_bernoulli_gen <- function(n_trials = 1, p_success = 0.5, n_success = 1) {
  unlist(lapply(n_success, function(z) {
    ((1 - p_success) + (p_success * z)) ^ n_trials  
  }))
}
