
# devtools used to install things from git
# Install devtools from CRAN
# install.packages("devtools")
# Or the development version from GitHub:
install.packages("pak")
pak::pak("r-lib/devtools")

# rstudio themes
rstudioapi::addTheme("https://raw.githubusercontent.com/dracula/rstudio/master/dracula.rstheme", apply = TRUE)
