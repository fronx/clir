source('lib/cli.R', chdir=TRUE)

input <- read.delim("stdin",
                    header=TRUE,
                    sep = "\t",
                    stringsAsFactors = FALSE)

args <- commandArgs(TRUE)
xvar <- args[2]
yvar <- args[3]

pdf(outfile, onefile = TRUE)

p <- ggplot(input, aes_string(x=xvar))

if (is.na(args[4])) {
  p <- p + geom_line(aes_string(y=yvar))
} else {
  zvar <- args[4]
  p <- p + geom_line(aes_string(y=yvar, colour=zvar))
}

p <- apply_env_limits(p)

print(p)

# Examples:
# cat $CLIR_HOME/samples/plot.tsv | clir plot.R example_plot.pdf a b && clir-open example_plot.pdf
# cat $CLIR_HOME/samples/multi_plot.tsv | clir plot.R example_multi_plot.pdf a b c && clir-open example_multi_plot.pdf
# cat $CLIR_HOME/samples/multi_plot.tsv | xmin=1 xmax=3 ymin=1 ymax=30 clir plot.R example_multi_plot.pdf a b c && clir-open example_multi_plot.pdf
