Q
class Mastermind
  attr_reader :player_response

  def initialize
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @player_response = gets.chomp.downcase
  end

  def self.eval_intro_response
    require 'pry'; binding.pry
    if @player_response == "p"
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,
      (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
    elsif @player_response == "i"
      puts "here are instructions"
    elsif @player_response == "q"
      puts "thanks for playing."
      exit!
    else
      puts "try again"
    end
  end


end


if __FILE__==$0
  Mastermind.new
  Mastermind.eval_intro_response
end
