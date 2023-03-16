#!/usr/bin/env Rscript --vanilla
library(methods)
library(argparser)

p <- arg_parser("Command Line Models")
p <- add_argument(p, "model", help="Model formula")
p <- add_argument(p, "data", help="Data file")
argv <- parse_args(p)



data=read.csv(argv$data)
summary(lm(argv$model, data))



