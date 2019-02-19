# geometric_function.R - Bill White - 2/14/19

# used for modeling the number of trials k up to and including the first success
amstat_geometric_trials <- function(prob_success = 0.5, 
                                    k_trials_to_success = c(1, 2, 3, 4)) {
  k_probs <- (1 - prob_success) ^ (k_trials_to_success - 1) * prob_success
  data.frame(k_trials = as.integer(k_trials_to_success), probs = k_probs)
}

# used for modeling the number of failures until the first success
amstat_geometric_fails <- function(prob_success = 0.5, 
                                   k_failures_to_success = c(0, 1, 2, 3)) {
  k_probs <- (1 - prob_success) ^ k_failures_to_success * prob_success
  data.frame(k_trials = as.integer(k_failures_to_success), probs = k_probs)
}
