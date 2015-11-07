class Mastermind
  attr_accessor :guess, :answer

  def initialize
    @answer = generate_answer
    get_intro
    eval_intro
  end

  def generate_answer
    colors = %w(r b g y)
    color_collection = [colors.sample, colors.sample, colors.sample, colors.sample].join
  end

  def get_intro
    puts "Welcome to Mastermind.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def eval_intro
    input = gets.strip
      case input
        when 'play', 'p' then play
        when 'instructions', 'i' then instructions
        when 'quit', 'q' then quit
      else
        initialize
      end
    end
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    take_turn
  end

  def instructions
    puts "I will generate a sequence with four elements made up of different colors. Your job is
    to guess the correct sequence in as few turns as possible. I will give you hints each turn
    to help you narrow it down. To play, press p or type play. To quit, press q or type quit."
    eval_intro
  end

  def quit
    puts "Thanks for playing."
    exit!
  end

  def take_turn
    @guess_counter = 0
    until @guess == ('q' || 'quit') || (correct_guess)
      @guess = gets.strip.downcase
      if @guess == ('q' || 'quit')
        quit
      elsif @guess == ('c' || 'cheat')
        print_secret_code
        puts "Cheater! But go ahead if you must."
      elsif @guess.length < 4
        puts "Guess must be 4 characters. Guess again."
      elsif @guess.length > 4
        puts "Guess must be 4 characters. Guess again."
      elsif correct_guess
        end_game_flow
      elsif (@guess.length == 4) && (!correct_guess)
        puts "#{@guess} has #{correct_elements} matching elements with
         #{correct_placement} in the correct positions. You've taken #{@guess_counter} guesses.
          Guess again."
      end
      @guess_counter += 1
    end
  end
