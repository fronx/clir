#
# SAX: Symbolic Aggregate approXimation
# http://homepages.abdn.ac.uk/yaji.sripada/pages/teaching/CS4031/information/SAX.pdf
#
# iSAX
# http://www.cs.ucr.edu/~eamonn/iSAX.pdf
#

sax.breakpoints <- function (n) {
  round(sapply((1:n)/n, qnorm), 3)
}

ts.normalize <- function (time_series) {
  ts = na.omit(time_series)
  (time_series - mean(ts)) / sd(ts)
}

sax.na <- '_'

sax.alphabet <- function (n) {
  substr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 1, n)
}

breakpoints_index <- function (x, breakpoints) {
  if (is.na(x)) {
    -1
  } else {
    index <- length(breakpoints) + 1
    for (i in (1:length(breakpoints))) {
      if (x < breakpoints[i]) {
        index <- i
        break
      }
    }
    index
  }
}

sax.encode <- function(time_series, cardinality=32, alphabet=sax.alphabet(cardinality)) {
  time_series = ts.normalize(time_series)
  breakpoints = sax.breakpoints(cardinality)
  paste(
    sapply(
      time_series,
      function(x) {
        idx = breakpoints_index(x, breakpoints)
        if (idx > 0) substr(alphabet, idx, idx) else sax.na
      }
    ),
    collapse=''
  )
}

###
  # source("r/ts_sax.R")
  # data = c(1,2,3,4,5,7,7,6,5,2,2,3,4,6,90,7,7,5,3,2,3,5,6,NA,7)
  # sax.encode(data) # => "llmnnpponllmnoFppnmlmno_p"
###
