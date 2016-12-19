people <- c("eric", "xavier", "guigui", "laura", "melanie", "chloe")

secret_picker <- function(people) {

  # get number of participants
  n_people <- length(people)

  # initialize vectors
  givers    <- people
  receivers <- people
  output    <- character(n_people)

  # start main loop to choose names
  for (i in 1:n_people) {

    # choose ith giver
    giver_i <- sample(x = givers, size = 1)

    if (i == n_people && receivers == givers ) {
      # if loop's last turn and two vectors are the same (i.e. the giver is the
      # receiver), reset the values to restart loop from the beginning
      i <- 1
      givers    <- people
      receivers <- people

      output <- character(n_people)
    } else {
      # else choose ith receiver
      while (1) {
        # while the receiver is equal the giver, choose a receiver
        receiver_i <- sample(x = receivers, size = 1)
        if (receiver_i != giver_i) {
          break
        }
      }

      # store the receiver and the giver within output vector
      output[i] <- paste(giver_i, "gives to", receiver_i)

      # pop out ith receiver and giver from the main vectors
      givers <- givers[givers != giver_i]
      receivers <- receivers[receivers != receiver_i]
    }
  }

  print(output)
}

secret_picker(people)
