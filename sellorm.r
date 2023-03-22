#!/usr/bin/env Rscript --vanilla
library(methods)
library(argparser)

p <- arg_parser("The Sorting Hat")
# Add a positional argument
p <- add_argument(p, "name", help="Name of the person to sort")
# Add a debug flag
p <- add_argument(p, "--debug", help="enable debug mode", flag=TRUE)
# Add a short output flag
p <- add_argument(p, "--short", help="output only the house", flag=TRUE)
# Add a pretty printing flag
p <- add_argument(p, "--pretty", help="pretty print the output", flag=TRUE)
argv <- parse_args(p)


# function to display debug output
debug_msg <- function(...){
  if (isTRUE(argv$debu)){
    cat(paste0("DEBUG: ",...,"\n"))
  }
}

debug_msg("Debug option is set")

debug_msg("Your name is - ", argv$name)

houses <- c("0" = "Hufflepuff",
            "1" = "Gryffindor",
            "2" = "Ravenclaw",
            "3" = "Slytherin",
            "4" = "Hufflepuff",
            "5" = "Gryffindor",
            "6" = "Ravenclaw",
            "7" = "Slytherin",
            "8" = "Hufflepuff",
            "9" = "Gryffindor",
            "a" = "Ravenclaw",
            "b" = "Slytherin",
            "c" = "Hufflepuff",
            "d" = "Gryffindor",
            "e" = "Ravenclaw",
            "f" = "Slytherin"
            )

name_hash <- digest::sha1(tolower(argv$name))

debug_msg("The name_hash is - ", name_hash)

house_index <- substr(name_hash, 1, 1)

debug_msg("The house_index is - ", house_index)

house <- houses[house_index]

pretty_print <- function(...){
  if (isTRUE(argv$pretty)){
    debug_msg("Pretty printing is enabled")
    cli::cat_boxx(...)
  } else {
    debug_msg("Pretty printing is not enabled")
    cat(...,"\n")
  }
}

if ( isTRUE(argv$short)){
  pretty_print(house)
} else {
  pretty_print(paste0("Hello ", argv$name, ", you can join ", house, "!"))
}
