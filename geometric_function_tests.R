# geometric_function_tests.R - Bill White - 2/14/19

library(ggplot2)

source("geometric_function.R")

# type 1 ----------------------------------------------------------------------
trial_probs <- c(0.2, 0.5, 0.8)
k_trials <- 1:10
plot_lists1 <- lapply(trial_probs, function(this_prob){
  raw_results <- amstat_geometric_trials(prob_success = this_prob, 
                                         k_trials_to_success = k_trials)
  data.frame(psuccess = as.factor(this_prob), raw_results)
})
plot_data1 <- do.call(what = rbind, args = plot_lists1)
plot_data1 <- data.frame(plot_data1, dist_type = "TrialsSuccess")

# type 2 ----------------------------------------------------------------------
k_trials <- c(0, k_trials)
plot_lists2 <- lapply(trial_probs, function(this_prob){
  raw_results <- amstat_geometric_fails(prob_success = this_prob, 
                                        k_failures_to_success = k_trials)
  data.frame(psuccess = this_prob, raw_results)
})
plot_data2 <- do.call(what = rbind, args = plot_lists2)
plot_data2 <- data.frame(plot_data2, dist_type = "Failures2Success")

# ggplot ----------------------------------------------------------------------
plot_data <- rbind(plot_data1, plot_data2)
plot_obj <- ggplot(plot_data, aes(x = plot_data$k_trials, 
                                  y = plot_data$probs)) +
  ggtitle("Geometric Distribution - Two Discrete Probability Distributions") +
  xlim(0, 10) + xlab("trials k") + 
  ylim(0.0, 1.0) + ylab("P(X = k)") +
  geom_point() + geom_line(aes(colour = plot_data$psuccess), size = 1) +
  facet_grid(. ~dist_type)
print(plot_obj)
