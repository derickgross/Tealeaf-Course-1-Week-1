# blackjack.rb

=begin
1.  Intro, capture player name
2.  Create a deck of cards (hash with keys as suit names, and values in arrays)
3.  Determine card values (case statement)
4.  Store current card value
5.  Compare card value to 21

=end

puts "Welcome to blackjack!  What is your name?"

player_name = gets.chomp

suits = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
cards = ['2','3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suits)

deck.shuffle!

player_hand = []
dealer_hand = []

player_hand << deck.pop
dealer_hand << deck.pop
player_hand << deck.pop
dealer_hand << deck.pop

puts "#{player_name}'s cards are #{player_hand[0][0]} of #{player_hand[0][1]} and #{player_hand[1][0]} of #{player_hand[1][1]}"
puts "The dealer's cards are #{dealer_hand[0][0]} of #{dealer_hand[0][1]} and #{dealer_hand[1][0]} of #{dealer_hand[1][1]}"

def calculate_hand_value(hand)
  hand_value = 0
  hand.each do |card|
    case card[0]
      when '2'
      hand_value += 2
      when '3'
      hand_value += 3
      when '4'
      hand_value += 4
      when '5'
      hand_value += 5
      when '6'
      hand_value += 6
      when '7'
      hand_value += 7
      when '8'
      hand_value += 8
      when '9'
      hand_value += 9
      when '10'
      hand_value += 10
      when 'J'
      hand_value += 10
      when 'Q'
      hand_value += 10
      when 'K'
      hand_value += 10
      when 'A'
      hand_value += 11
    end   
  end
=begin
  while hand_value > 21 # accounting for variable ace value.  In the event that two aces are dealt, value will be 2 instead of 12
    if hand.include?('A')
      hand_value -= 10
    end
  end
=end
  hand_value
end

puts "#{player_name}'s hand value is #{calculate_hand_value(player_hand).to_s}"
puts "Dealer's hand value is #{calculate_hand_value(dealer_hand).to_s}"
puts "What would you like to do?  1. hit  2. stay"
answer = gets.chomp

while answer == "1"
  new_card = deck.pop
  player_hand << new_card
  puts "You were dealt the #{new_card[0]} of #{new_card[1]}"
  if calculate_hand_value(player_hand) > 21
    puts "#{player_name}, your hand value is now #{calculate_hand_value(player_hand)}.  You bust!"
    answer = "0"
  elsif calculate_hand_value(player_hand) == 21
    puts "Blackjack!  You win!"
    answer = "0"
  else
    puts "Your hand value is now #{calculate_hand_value(player_hand)}.  What would you like to do?  1. hit  2. stay"
    answer = gets.chomp
  end
end

if calculate_hand_value(player_hand) < 21
  while calculate_hand_value(dealer_hand) < calculate_hand_value(player_hand)
    puts "Dealer hits."
    new_card = deck.pop
    dealer_hand << new_card
    puts "Dealer was dealt the #{new_card[0]} of #{new_card[1]}"
  end
  if calculate_hand_value(dealer_hand) == 21
    puts "Blackjack- dealer wins."
  elsif calculate_hand_value(dealer_hand) > 21
    puts "Dealer busts- you win!"
  else
    puts "House rules- dealer's hand value of #{calculate_hand_value(dealer_hand)} beats #{player_name}'s hand value of #{calculate_hand_value(player_hand)}.  Dealer wins."
  end
end
