require "pry"

#welcome user
def welcome
  puts "Welcome to the Blackjack Table"
end

#generate random number between 1 and 11
def deal_card
  return rand(1..11)
end

#displays card total
def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

#ask for user input for hit or stay
def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

#accept user input
def get_user_input
  return gets.strip.chomp
end

#output end message of game
def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

#deal player two cards and display total
def initial_round
  total = deal_card + deal_card
  display_card_total(total)
  return total
end

#see whether player wants to hit or not
def hit?(total)
  prompt_user
  choice = get_user_input
  if choice == 's'
    return total
  elsif choice == 'h'
    total += deal_card
  else
    invalid_command
    return hit?(total)
  end
  return total
end

#output message if invalid command enetered
def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

#run game
def runner
  welcome
  total = initial_round
  #binding.pry
  until total > 21 do
    total = hit?(total)
    display_card_total(total)
    #binding.pry
  end
  end_game(total)
end
    
