require "onetwodixie/version"

module Onetwodixie

class Onetwodixie
  @@valid_choices = ["r", "p", "s", "1", "2"]

  def initialize
    @computer_choice = ["r", "s", "p"].sample
  end

  def game_mode_input
    print "One or Two Players? (Type 1 or 2) > " 
    input = gets.chomp.downcase
    input if valid_choice?(input)
  end

  def game_setup
    case game_mode_input
    when "1"
      @player_one_choice = player_input
      @player_two_choice = @computer_choice
      @player_one = "Player"
      @player_two = "Computer"
      decide_outcome
    when "2"
      puts "Player 1..."
      @player_one_choice = player_input
      @player_one = "Player 1"
      puts "Player 2..."
      @player_two_choice = player_input
      @player_two = "Player 2"
      decide_outcome 
    else 
      puts "Invalid Input!"     
    end    
    
  end

  def player_input
    print "Choose (R)ock, (P)aper, (Scissors), or (Quit) > "
    input = gets.chomp.downcase
    input if valid_choice?(input)
  end

  def valid_choice?(input)
    if input == "q"
      return true
    elsif @@valid_choices.include?(input)
      return true
    else
      return false
    end
  end

  def expand_choice(ltr)
    words = ["rock", "paper", "scissors"]
    (words.select { |word| word[0] == ltr }).join.capitalize
  end

  def decide_outcome
    case 
      when @player_one_choice == "r" && @player_two_choice == "s"
        print_winner(@player_one_choice, @player_two_choice)
      when @player_one_choice == "s" && @player_two_choice == "p" 
        print_winner(@player_one_choice, @player_two_choice)
      when @player_one_choice == "p" && @player_two_choice == "r"
        print_winner(@player_one_choice, @player_two_choice)
      when @player_one_choice == @player_two_choice
        puts "Its a tie!"
      when @player_one_choice == "q"
        puts "Game Over! :("
      when @player_one_choice == nil
        puts "Invalid Input!"
      else
        print_winner(@player_two_choice, @player_one_choice)
    end
  end

  def print_winner(winner, loser)

    puts "#{expand_choice(winner)} beats #{expand_choice(loser)}!"
    puts "#{@player_one} Wins!" if winner == @player_one_choice
    puts "#{@player_two} Wins!" if winner == @player_two_choice
    
  end
  
end


end
