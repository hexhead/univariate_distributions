# gamma_function_tests.R - Bill White - 1/20/19

source("gamma_function.R")

# ----------------------------------------------------------------------------
# Checks
z <- (1:10) / 3
all.equal(gamma(z), stirling(z))             # Mean relative difference: 0.07181942
all.equal(gamma(z), nemes(z))                # Mean relative difference: 0.003460549
all.equal(as.complex(gamma(z)), lanczos(z))  # TRUE
all.equal(gamma(z), spouge(z))               # TRUE

# ----------------------------------------------------------------------------
# plot
results <- data.frame(
  z = z,
  stirling = stirling(z),
  nemes = nemes(z),
  lanczos = Re(lanczos(z)),
  spouge = spouge(z),
  builtin = gamma(z)
)

all_z <- c(results$stirling, 
           results$nemes,
           Re(results$lanczos),
           results$spouge,
           results$builtin)
all_z[is.nan(all_z)] <- 0
max_z <- max(all_z)
min_z <- min(all_z)

series_labels <- c('stirling', 'nemes', 'lanczos', 'spouge', 'builtin')
series_colors <- c('blue', 'magenta', 'red', 'green', 'black')
series_pchs <- rep(16, 5)
series_types <- rep('b', 5)

plot(results$z, results$stirling, 
     xlab = 'Vector of Domain Values z', 
     ylab = 'Gamma Value for Input z', ylim = c(min_z, max_z),
     main = 'Methods for Computing gamma Function', 
     type = series_types[1], pch = series_pchs[1], col = series_colors[1])
points(results$z, results$nemes, 
       type = series_types[2], 
       pch = series_pchs[2], 
       col = series_colors[2])
points(results$z, results$lanczos, 
       type = series_types[3], 
       pch = series_pchs[3], 
       col = series_colors[3])
points(results$z, results$spouge, 
       type = series_types[4], 
       pch = series_pchs[4], 
       col = series_colors[4])
points(results$z, results$builtin, 
       type = series_types[5], 
       pch = series_pchs[5], 
       col = series_colors[5])
legend('top', title = 'method',
       legend = series_labels, 
       col = series_colors, 
       pch = series_pchs)
