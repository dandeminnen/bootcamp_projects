print("Welcome to our app!")

# Question 01
print("What's your name?: ")
user_name <- readLines("stdin", n=1)
print(paste("Hi!", user_name))

# Question 02
print("What do you want to do today?")
print("1. Order pizza, 2. Quit")
action <- readLines("stdin", n=1)
if (action == 1) {
# Question 03
		print("What kind of pizza do you want?")
    print("1. Pepporoni")
    print("2. Hawaiian")
    print("3. Extreme Cheese")
    print("4. Seafood Deluxe")
    print("5. BBQ Chicken")
    print("6. Tom Yum Kung")
    print("7. Vegetarian")
    flavor <- readLines("stdin", n=1)
    if (flavor == 1) {
      flavor <- "Pepporoni"
    } else if (flavor == 2) {
      flavor <- "Hawaiian"
    } else if (flavor == 3) {
      flavor <- "Extreme cheese"
    } else if (flavor == 4) {
      flavor <- "Seafood Deluxe"
    } else if (flavor == 5) {
      flavor <- "BBQ Chicken"
    } else if (flavor == 6) {
      flavor <- "Tom Yum Kung"
    } else if (flavor == 7) {
      flavor <- "Vegetarian"
    } else {
      print("Please try again.")
    }
  print(paste("Your order is", flavor, "pizza."))
} else {
		print("Quit")
    quit()
}

# Question 04
print("Now, Let's pick your favorite crust.")
print("1. Crispy Thin, 2. Soft Pan, 3. Cheese Stuffed")
crust <- readLines("stdin", n=1)
if (crust == 1) {
  crust <- "crispy thin"
} else if (crust == 2) {
  crust <- "soft pan"
} else if (crust == 3) {
  crust <- "cheese stuffed"
} else {
  print("Please try again.")
}
print(paste("Your order is", crust, flavor, "pizza."))

# Question 05
print("Next, What size do you prefer?")
print("1. small (4 slides)")
print("2. medium (6 slides)")
print("3. large (8 slides)")
size <- readLines("stdin", n=1)
if (size == 1) {
  size <- "small"
} else if (size == 2) {
  size <- "medium"
} else if (size == 3) {
  size <- "large"
} else {
  print("Please try again.")
}
print(paste("Your order is", size, crust, flavor, "pizza."))

# Question 06
print("Choose your quantity")
quantity <- readLines("stdin", n=1)
if (quantity == 1) {
  print(paste("Your order is", quantity, size, crust, flavor, "pizza."))
} else if (quantity >= 1) {
  print(paste("Your order is", quantity, size, crust, flavor, "pizzas."))
} else {
  print("Please try again.")
}

# Question 07
print("Would you like anything else?")
print("1. Yes, 2. No")
choice <- readLines("stdin", n=1)
if (choice == 1) {
# Question 08
  print("Chosse your appertizer.")
  print("1. Chicken Nuggets, 2. Cheese Sticks, 3. Garlic Bread")
  appertizer <- readLines("stdin", n=1)
  if (appertizer == 1) {
    appertizer <- "chicken nuggets"
    print("Your appertizer is chicken nuggets.")
  } else if (appertizer == 2) {
    appertizer <- "cheese sticks"
    print("Your appertizer is cheese sticks.")
  } else if (appertizer == 3) {
    appertizer <- "garlic bread"
    print("Your appertizer is garlic bread.")
  } else {
    print("-")
  }
} else if (choice == 2) {
    print("Let's check out.")
} else {
  print("Please try again.")
}

# Question 09
print("Please confirm your order.")
if (quantity == 1 & choice == 1) {
  print(paste("K.", user_name, "'s order:", quantity, size, crust, flavor, "pizza and", appertizer, "as a appertizer."))
} else if (quantity == 1 & choice == 2) {
  print(paste("K.", user_name, "'s order:", quantity, size, crust, flavor, "pizza."))
} else if (quantity >= 1 & choice == 1) {
  print(paste("K.", user_name, "'s order:", quantity, size, crust, flavor, "pizzas and", appertizer, "as a appertizer."))
} else if (quantity >= 1 & choice == 2) {
  print(paste("K.", user_name, "'s order:", quantity, size, crust, flavor, "pizzas."))
} else {
  print("-")
}
print("1. Yes, 2. No")
confirm <- readLines("stdin", n=1)
if (confirm == 1) {
# Question 10
  print("Choose delivery option")
  print("1. Home Delivery, 2. Pickup at Store")
  delivery <- readLines("stdin", n=1)
  if (delivery == 1) {
    delivery <- "Home Delivery"
  } else if (delivery == 2) {
    delivery <- "Pickup at Store"
  }
  print(paste("Your delivery option:", delivery))

# Question 11
  print("Select your payment method.")
  print("1. Cash, 2. Credit Card, 3. QR Code")
  payment <- readLines("stdin", n=1)
  if (payment == 1) {
    payment <- "Cash"
  } else if (payment == 2) {
    payment <- "Credit Card"
  } else if (payment == 3) {
    payment <- "QR Code"
  }
  print(paste("Your payment method:", payment))
  print("Thank you for your order. Have a nice day! :D")
  quit()
} else {
  print("Cancelled")
  quit()
}
