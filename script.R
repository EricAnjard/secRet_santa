# -----------------------------------------------------------------------------
# file        : script.R
# description : shows how to run the secret_picker() function
# -----------------------------------------------------------------------------

# create a vector with participants
people <- c("dark vador",
            "palpatine",
            "obiwan kenobi",
            "yoda",
            "bill adama",
            "anubis",
            "teal'c")

# create a list of tuples of people that cannot be together (for example, dartk
# vador and palpatine should be together, or they might destroy the galaxy...)
not_together <- list(c("dark vador", "palpatine"),
                     c("teal'c", "anubis"))

# source the function
source("picker.R")

# get the result in output
output <- secret_picker(people, not_together)
