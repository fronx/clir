options(debug=Sys.getenv("DEBUG") == "1")
options(warn=-1)
options(error=function() { sink(stderr()); traceback(2); sink() })

suppressPackageStartupMessages(library(ggplot2))
library(scales)

outfile <- paste('out', commandArgs(TRUE)[1], sep='/')

apply_env_limits <- function(p) {
  if ((Sys.getenv("xmin") != "") && (Sys.getenv("xmax") != "")) {
    p <- p +
      scale_x_continuous(
        limits = c(
          as.double(Sys.getenv("xmin")),
          as.double(Sys.getenv("xmax"))
        )
      )
  }

  if ((Sys.getenv("ymin") != "") && (Sys.getenv("ymax") != "")) {
    p <- p +
      scale_y_continuous(
        limits = c(
          as.double(Sys.getenv("ymin")),
          as.double(Sys.getenv("ymax"))
        )
      )
  }
  p
}
