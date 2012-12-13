source('lib/cli.R', chdir=TRUE)

input <- read.delim("stdin",
                    header=TRUE,
                    sep = "\t",
                    stringsAsFactors = FALSE)

xvar    <- commandArgs(TRUE)[2]
yvar    <- commandArgs(TRUE)[3]
zvar    <- commandArgs(TRUE)[4]

pdf(outfile, onefile = TRUE)

p <-
  ggplot(
    input,
    aes_string(x=xvar, y=yvar)
  ) +
  # scale_fill_gradientn(colours = rainbow(7), trans = "log") +
  scale_fill_gradient(low="green", high="red", trans = "log") +
  geom_tile(aes_string(fill=zvar)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
  # scale_y_continuous(limits = c(0, 200))

p <- apply_env_limits(p)

print(p)

# Example:
# cat $CLIR_HOME/samples/grid.tsv | ymin=1 ymax=10 clir grid.R example_grid.pdf date value num_people && clir-open example_grid.pdf
