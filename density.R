source('lib/cli.R', chdir=TRUE)

input <- read.delim("stdin",
                    header=TRUE,
                    sep = "\t",
                    stringsAsFactors = FALSE)

xvar      <- commandArgs(TRUE)[2]

pdf(outfile, onefile = TRUE)

print(
  update_labels(
    ggplot(
      input,
      aes_string(x=xvar)
    ) +
    geom_histogram(
      aes(y=..density..),
      colour="lightgray",
      fill="lightgray"
    ) +
    geom_density(),
    list(x=xvar)
  )
)

# Example:
# cat $CLIR_HOME/samples/density.tsv | clir density.R example_density.pdf time && clir-open example_density.pdf
