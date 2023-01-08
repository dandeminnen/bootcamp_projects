print("Let's play Rock-Paper-Scissors!")

score <- 0
round <- 0

repeat {
print("Please enter your turn:")
print("1. Rock, 2. Paper, 3. Scissors or 0. Quit")
player <- readLines("stdin", n=1)
bot <- sample(1:3, size=1)
if (player == 1 & bot == 1) {
    score <- score + 0
    round <- round + 1
    print("Rock = Rock")
    print("You tied.")
  } else if (player == 1 & bot == 2) {
    score <- score - 1
    round <- round + 1
    print("Paper covers Rock")
    print("You lose!")
  } else if (player == 1 & bot == 3) {
    score <- score + 1
    round <- round + 1
    print("Rock crushes scissors")
    print("You win!")
  } else if (player == 2 & bot == 1) {
    score <- score + 1
    round <- round + 1
    print("Paper covers Rock")
    print("You win!")
  } else if (player == 2 & bot == 2) {
    score <- score + 0
    round <- round + 1
    print("Paper = Paper")
    print("You tied.")
  } else if (player == 2 & bot == 3) {
    score <- score - 1
    round <- round + 1
    print("Scissors cut paper")
    print("You lose!")
  } else if (player == 3 & bot == 1) {
    score <- score - 1
    round <- round + 1
    print("Rock crushes scissors")
    print("You lose!")
  } else if (player == 3 & bot == 2) {
    score <- score + 1
    round <- round + 1
    print("Scissors cut paper")
    print("You win!")
  } else if (player == 3 & bot == 3) {
    score <- score + 0
    round <- round + 1
    print("Scissors = Scissors")
    print("You tied.")
  } else if (player == 0) {
    print(paste("Number of rounds:", round))
    print(paste("Score summary:", score))
    break
  } else {
    print("Invalid enter. Please enter 1. Rock, 2. Paper, 3. Scissors or 4. Quit")
  }
}
