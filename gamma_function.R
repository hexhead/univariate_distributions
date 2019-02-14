# gamma_function.R - Bill White - 1/19/19
# https://www.mathworks.com/help/matlab/ref/gamma.html
# https://rosettacode.org/wiki/Gamma_function#R

# ----------------------------------------------------------------------------
# methods
stirling <- function(z) {
  sqrt(2 * pi / z) * (exp(-1) * z) ^ z
}

nemes <- function(z) {
  sqrt(2 * pi / z) * (exp(-1) * (z + (12 * z - (10 * z) ^ -1) ^ -1)) ^ z
}

lanczos <- function(z) {
  if (length(z) > 1) {
    sapply(z, lanczos)
  } else {
    g <- 7
    p <-
      c(
        0.99999999999980993,
        676.5203681218851,
        -1259.1392167224028,
        771.32342877765313,
        -176.61502916214059,
        12.507343278686905,-0.13857109526572012,
        9.9843695780195716e-6,
        1.5056327351493116e-7
      )
    z <- as.complex(z)
    if (Re(z) < 0.5) {
      pi / (sin(pi * z) * lanczos(1 - z))
    } else {
      z <- z - 1
      x <- p[1] + sum(p[-1] / seq.int(z + 1, z + g + 1))
      tt <- z + g + 0.5
      sqrt(2 * pi) * tt ^ (z + 0.5) * exp(-tt) * x
    }
  }
}

spouge <- function(z, a = 49) {
  if (length(z) > 1) {
    sapply(z, spouge)
  } else {
    z <- z - 1
    k <- seq.int(1, a - 1)
    ck <-
      rep(c(1,-1), len = a - 1) / factorial(k - 1) * (a - k) ^ (k - 0.5) * exp(a - k)
    (z + a) ^ (z + 0.5) * exp(-z - a) * (sqrt(2 * pi) + sum(ck / (z + k)))
  }
}

# front end to implementations of the gamma function
amstat_gamma <- function(z, method="builtin") {
  return_values <- z
  method_found <- FALSE
  if (method == "spouge") {
    return_values <- spouge(z)
    method_found <- TRUE
  }
  if (method == "nemes") {
    return_values <- nemes(z)
    method_found <- TRUE
  }
  if (method == "stirling") {
    return_values <- stirling(z)
    method_found <- TRUE
  }
  if (method == "lanczos") {
    return_values <- lanczos(z)
    method_found <- TRUE
  }
  if (method == "builtin") {
    return_values <- gamma(z)
    method_found <- TRUE
  }
  if (!method_found) {
    warning(paste("Method [ ", method, " ] not found, returing original vector"))
  }
  return_values
}
