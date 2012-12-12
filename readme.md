# R command line tools

R is really quite good at some things, but not so much at others. For example, you wouldn't necessarily want to use it to construct and parameterize SQL queries, but you do want to use it for quickly creating plots, no matter where the data is coming from exactly.

This collection of scripts is meant to make it easier to use R for what it is good at by utilizing the magic powers of the UNIX environment.

The general idea is: use whatever tool or programming language you like to fetch and prepare your data and then pipe that result into an R script.

## Setup

````
export CLIR_HOME=<wherever you put this repo>
export PATH=$PATH:$CLIR_HOME
````

Then run:

```bash
clir-init
```

## Examples

Run these to get an idea of what they do:

```bash
# create a histogram/density plot
cat $CLIR_HOME/samples/density.tsv |
  clir density.R example_density.pdf time &&
  clir-open example_density.pdf

# create a stacked histogram/density plot
cat $CLIR_HOME/samples/density.tsv |
  clir density_by_factor.R example_density_by_factor.pdf time cohort &&
  clir-open example_density_by_factor.pdf

# plot x over y
cat $CLIR_HOME/samples/plot.tsv |
  clir plot.R example_plot.pdf a b &&
  clir-open example_plot.pdf

# plot multiple lines
cat $CLIR_HOME/samples/multi_plot.tsv |
 clir plot.R example_multi_plot.pdf a b c &&
 clir-open example_multi_plot.pdf

# plot multiple lines with limits
cat $CLIR_HOME/samples/multi_plot.tsv |
  xmin=1 xmax=3 ymin=1 ymax=30 \
  clir plot.R example_multi_plot.pdf a b c &&
  clir-open example_multi_plot.pdf

# plot x over y in a scatterplot
cat $CLIR_HOME/samples/plot.tsv |
  clir scatterplot.R example_scatterplot.pdf a b &&
  clir-open example_scatterplot.pdf

# plot a colored grid (z over x and z)
cat $CLIR_HOME/samples/grid.tsv |
  ymin=1 ymax=10 \
  clir grid.R example_grid.pdf date value num_people &&
  clir-open example_grid.pdf
```
