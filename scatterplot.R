source('lib/cli.R', chdir=TRUE)

input <- read.delim("stdin",
                    header=TRUE,
                    sep = "\t",
                    stringsAsFactors = FALSE)

xvar  <- commandArgs(TRUE)[2]
yvar  <- commandArgs(TRUE)[3]

pdf(outfile, onefile = TRUE)

print(
  ggplot(input, aes_string(x=xvar, y=yvar)) +
    geom_point()
)

# Example:
# cat $CLIR_HOME/samples/plot.tsv | clir scatterplot.R example_scatterplot.pdf a b && clir-open example_scatterplot.pdf
