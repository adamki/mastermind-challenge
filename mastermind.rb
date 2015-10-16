
class Mastermind

  attr_accessor :guesses

  def initialize
    @guesses = 0
    color= %w(r g b y)
    $answer = color.shuffle!
  end

  def self.get_intro
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @player_response = gets.chomp.downcase
    eval_intro_response
  end

  def self.eval_intro_response
    if @player_response == "p" || @player_response == "play"
      start_game
    elsif @player_response == "i" || @player_response == "instructions"
      print_instructions
      start_game
    elsif @player_response == "q" || @player_response == "quit"
      exit_game
    else
      puts "try again"
    end
  end

  def self.print_instructions
    puts "....here are instructions....here are instructions....here are instructions"
  end

  def self.start_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    guess = gets.chomp.chars
    eval_answer(guess)
  end

  def self.exit_game
    exit!
  end

  def self.eval_answer(guess)
    guess.sort!
    $answer.sort!

    if guess == $answer
      puts "You Win an are amazing"
      exit_game
    end

    correct = 0
    incorrect = 0
    
    4.times do |i|
      if $answer.include?(i)
        correct += 1
        guess.shift
      else
        incorrect += 1
        guess.shift
      end
    end
    summary
  end

  def self.summary
    puts "Congratulations! You guessed the sequence #{$answer}and it took #{@guesses} geusses."
  end
end


if __FILE__==$0
  Mastermind.new
  Mastermind.get_intro
end
