## package optparse
* make_option, declare options, their flags, types, default values and help messages
* OptionParser, read the arguments passed to the R script and parse_args to parse them according to what has been declared 

```
#!/usr/bin/env Rscript
library("optparse")

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL, help="dataset file name", metavar="character"),
  make_option(c("-o", "--out"), type="character", default="out.txt", help="output file name [default=%default]", 
            metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

```
