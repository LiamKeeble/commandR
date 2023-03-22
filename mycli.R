#!/usr/bin/env Rscript --vanilla
library(methods)
library(argparser)

p <- arg_parser("Command Line Models")
p <- add_argument(p, "model", help="Model formula")
p <- add_argument(p, "data", help="Data file")
p <- add_argument(p, "family", help="Family, e.g. binomial")
argv <- parse_args(p)


data=read.csv(argv$data)

if (argv$family == "binomial") {

	summary(glm(argv$model, data, family = argv$family))

} else if (argv$family == "poisson") {

	summary(glm(argv$model, data, family = argv$family))
} else {

	summary(lm(argv$model, data))

}





