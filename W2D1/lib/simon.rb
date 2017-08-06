class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts '------------------Simon Says The Sequence is-----------------'
    puts @seq.join(" ")
    puts '--------------------------------------------------------------'
    sleep(2)
    system("clear")
  end

  def require_sequence
    puts '--------------------------Simon Says-------------------------'
    puts "Enter a guess! Color choices are red, blue, yellow & green."
    puts "Example entry: 'red blue red yellow'"
    guess = gets.chomp.split(" ")
    @game_over = true unless guess == @seq
  end

  def add_random_color
    @seq << %w(red blue yellow green).sample
  end

  def round_success_message
    puts "Congrats! On to level #{@sequence_length + 1}!"
  end

  def game_over_message
    puts 'You lost!'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

a = Simon.new
a.play
