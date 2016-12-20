# -----------------------------------------------------------------------------
# file        : script.R
# author      : Xavier Laviron
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

# create a vector containing emails of participants, it must be the same order
# as the list of participants
mails <- c("dark.vador@darkside.com",
           "emperor@darkside.com",
           "obi_wan.kenobi@jedi_order.com",
           "yoda@jedi_order.com",
           "bill_adama@galactica.com",
           "anubis@goa_uld.com",
           "teal_c@chulak.com")

# create a list of tuples of people that cannot be together (for example, dark
# vador and palpatine should not be together, or they might destroy the
# galaxy...)
not_together <- list(c("dark vador", "palpatine"),
                     c("teal'c", "anubis"))

# source the function
source("secret_picker.R")

# enter here your mail address and your password
sender <- "santa_claus@christmas.org"
passwd <- "santa_claus_password"

# get the results by email
secret_picker(people  = people,
              nt      = not_together,
              mails   = mails,
              sender  = sender,
              passwd  = passwd)

# get the results on-screen
secret_picker(people  = people,
              nt      = not_together)
