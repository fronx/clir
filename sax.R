source('lib/cli.R', chdir=TRUE)
source('lib/ts_sax.R')

data <- unlist(lapply(
  unlist(strsplit(readLines('stdin'), ',')),
  as.integer
))

cardinality <- as.integer(commandArgs(TRUE)[1])

cat(
  paste(sax.encode(data, cardinality), "\n", sep='')
)

#
# echo "1,2,3,4,5,6,5,None,4,3,2,1"|clir sax.R 16
# # => bdgknpn_kgdb
#
# echo "1,2,3,4,5,7,7,6,5,2,2,3,4,6,90,7,7,5,3,2,3,5,6,NA,7"|clir sax.R 32
# # => llmnnpponllmnoFppnmlmno_p
#
