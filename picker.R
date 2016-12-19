# -----------------------------------------------------------------------------
# file        : secret_picker.R
# description : randomly choose pairs of people to organize a secret santa
# -----------------------------------------------------------------------------


secret_picker <- function(people, nt) {

  # get number of participants
  n_people <- length(people)

  # flag used to control if forbidden associations are made
  flag      <- FALSE

  while (!flag) {
    # start main loop

    # initialize vectors
    givers    <- people
    receivers <- people
    output    <- list()

    i <- 1
    while (i <= n_people) {
      # start main loop to choose names

      # choose giver_i
      giver_i <- sample(x = givers, size = 1)

      if (i == n_people && receivers == givers ) {
        # if loop's last turn and two vectors are the same (i.e. the giver is the
        # receiver), reset the values to restart loop from the beginning
        i <- 0
        givers    <- people
        receivers <- people

        output <- list()

      } else {
        # else choose receiver_i
        while (1) {
          # while the receiver is equal the giver, repetedly choose a receiver
          receiver_i <- sample(x = receivers, size = 1)
          if (receiver_i != giver_i) {
            break
          }
        }

        # store the receiver and the giver within output list
        output[[i]] <- c(giver_i, receiver_i)

        # pop out receiver_i and giver_i from the main vectors so they cannot
        # be sampled again
        givers    <- givers[givers != giver_i]
        receivers <- receivers[receivers != receiver_i]
      }

      i <- i + 1
    }

    # now we verify if no forbidden association is made
    # set the control flag to TRUE
    flag <- TRUE

    # we check each element of output against each element of nt, if nt
    # specified
    if (!is.null(nt)) {
      for (i in 1:length(output)) {
        for (j in 1:length(nt)) {
          if (identical(sort(output[[i]]), sort(nt[[j]]))) {
            # if there is a match, we toggle the flag to FALSE and exit from the
            # inner loop
            flag <- FALSE
            break
          }
        }
        if (!flag) {
          # the flag is set to FALSE so we stop the outer loop and make another
          # run of the main while loop
          break
        }
      }
    }
  }

  # finally we convert the list into a data frame and output it
  output <-
    data.frame(matrix(unlist(output),
                      nrow  = length(output),
                      byrow = T),
               stringsAsFactors = FALSE)
  colnames(output) <- c("giver", "receiver")

  return(output)
}
