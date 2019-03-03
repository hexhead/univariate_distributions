# logarithmic_function.R - Bill White - 2/23/19
# https://www.wikiwand.com/en/Logarithmic_distribution
# Parameters	0 < p < 1
# Support	k in {1,2,3, ... ))
# A Poisson compounded with Log(p)-distributed random variables 
amstat_logarithmic <- function(p_s = c(0.5), k_s = c(1, 2, 3)) {
  p_results <- lapply(p_s, function(p) {
    k_results <- lapply(k_s, function(k) {
      f_x_p_k <- (-1 / log(1 - p)) * ((p ^ k) / k)
      data.frame(x = k,
                 y = f_x_p_k,
                 Parameters = paste("p =", p))
    })
    do.call(rbind, k_results)
  })
  do.call(rbind, p_results)
}
