# RPS-app.rb - Basic rock paper scissors app

puts "Rock Paper Scissors battle!  What will you throw? [rock, paper, scissors]"
user_choice = gets.chomp

while user_choice != "rock" && user_choice != "paper" && user_choice != "scissors"
  puts "You can't wage a Rock Paper Scissors battle with #{user_choice}.  Please choose rock, paper or scissors:"
  user_choice = gets.chomp
end

random_number = rand(3)

opponent_choice = ""

if random_number == 0
  opponent_choice = "rock"
elsif random_number == 1
  opponent_choice = "paper"
else
  opponent_choice = "scissors"
end

case
when user_choice == opponent_choice
  puts "You both chose #{user_choice}!  It's a tie!"
when user_choice == "rock" && opponent_choice == "paper"
  puts "Your opponent chose paper, and paper covers rock!  You lose!"
when user_choice == "rock" && opponent_choice == "scissors"
  puts "Your opponent chose scissors, and your rock smashed them to bits!  You win!"
when user_choice == "paper" && opponent_choice == "rock"
  puts "Your opponent chose rock!  You neatly wrap that rock in your paper, and give it to your opponent as an early birthday gift.  You win!"
when user_choice == "paper" && opponent_choice == "scissors"
  puts "Your opponent chose scissors, and scissors cut paper.  You lose!"
when user_choice == "scissors" && opponent_choice == "rock"
  puts "Your opponent chose rock, which beats your scissors.  You lose!"
when user_choice == "scissors" && opponent_choice == "paper"
  puts "Your opponent chose paper, and you cut that paper into celebratory confetti.  You win!"
end