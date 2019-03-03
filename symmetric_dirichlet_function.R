# symmetric_dirichlet_function.R - Bill White - 2/24/19
# https://www.wikiwand.com/en/Dirichlet_distribution

source("gamma_function.R")

# A common special case is the symmetric Dirichlet distribution, 
# where all of the elements making up the parameter vector 
# alpha have the same value.
# concentration is a scalar for special case where all alphas the same
# the expansion form of Beta distribution for K>2
amstat_symmetric_dirichlet <- function(x_s, concentration) {
  if (class(concentration) != 'numeric' && length(concentration) > 1) {
    stop("Concentration must be a numeric scalar")
  } else {
    cat("Symmetric dirichlet concentration parameter =", concentration, "\n")
  }
  K <- length(x_s)
  b <- amstat_gamma(concentration * K, method = 'builtin') /
       (amstat_gamma(concentration, method = 'builtin') ^ K)
  cat(sprintf("concentration = %f K = %d b = %f\n\n", concentration, K, b))
  products <- 1
  K_results <- lapply(1:K, function(K) {
    x <- x_s[K]
    products <- products * (x ^ (concentration - 1))
    cat(sprintf("BEFORE x = %f y = products = %f\n", x, products))
    products <- products * b
    cat(sprintf("AFTER  x = %f y = products = %f\n\n", x, products))
    data.frame(x = x_s[K], y = Re(products), 
               Parameters = paste("concentration =", concentration))
  })
  do.call(rbind, K_results)
}

B <- function(K, alphas) {
  # fine B for 1 / B(alpha)
  b1 <- 1
  b1 <- sum(sapply(1:K, function(i) {
    b1 * amstat_gamma(alphas[i])
  }))
  b2 <- amstat_gamma(sum(unlist(lapply(1:K, function(i) {
    alphas[i]
  }))))
  b <- b1 / b2
  cat("b1 =", b1, "b2 =", b, "b =", b, "\n")
  b
}

amstat_dirichlet <- function(x_s, a_s) {
  if (all(a_s == a_s[1])) {
    cat("Detected equal alphas: running amstat_symmetric_dirichlet\n")
    results <- amstat_symmetric_dirichlet(x_s, a_s[1])
    return(results)
  }
  if (sum(x_s) != 1) {
    stop("Sum of x's must equal 1")
  }
  K <- length(x_s)
  b_constant <- 1 / B(K, a_s)
  x_results <- lapply(1:K, function(i) {
    x <- x_s[i]
    # product formula
    total <- 1
    product_results <- lapply(1:K, function(j) {
      total * (x_s[j] ^ (a_s[j] - 1))
    })
    cat(sprintf("b_constant = %6.3f total = %6.3f", b_constant, total), "\n")
    y <- b_constant * total
    #cat("y =", y, "\n")
    data.frame(x = x, y = y, Parameters = sprintf(""))
  })
  do.call(rbind, x_results)
}
