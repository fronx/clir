options("repos"="http://cran.r-project.org")

is.installed <- function(pkg) {
  is.element(pkg, installed.packages()[,1])
}

if (is.installed("ggplot2") == FALSE) {
  install.packages("ggplot2")
}

if (is.installed("plyr") == FALSE) {
  install.packages("plyr")
}

if (is.installed("gridSVG") == FALSE) {
  install.packages("gridSVG")
}
