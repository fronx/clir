source('lib/cli.R', chdir=TRUE)

input <- read.delim("stdin",
                    header=TRUE,
                    sep = "\t",
                    stringsAsFactors = FALSE)

xvar      <- commandArgs(TRUE)[2]
factorvar <- commandArgs(TRUE)[3]

pdf(outfile, onefile = TRUE)

print(
  update_labels(
    qplot(
      get(xvar),
      ..density..,
      data=input,
      geom="density",
      fill=get(factorvar),
      position="stack"
    ),
    list(x=xvar, fill=factorvar)
  )
)

# Example:
# cat $CLIR_HOME/samples/density.tsv | clir density_by_factor.R example_density_by_factor.pdf time cohort && clir-open example_density_by_factor.pdf
