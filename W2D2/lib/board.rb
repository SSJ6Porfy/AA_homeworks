require "byebug"
class Board
  attr_accessor :cups, :current_player

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    stone_indexes = [6, 13]
    @cups = @cups.map.with_index do |cup, idx|
      stone_indexes.include?(idx) ? cup : [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    print raise 'Invalid starting cup' unless start_pos.between?(1,12)
  end

  def make_move(start_pos, current_player_name)
    stones = self[start_pos]
    self[start_pos] = []
    end_idx = start_pos
    until stones.empty?
      end_idx += 1
      next if current_player_name == @player1 && end_idx == 13
      next if current_player_name == @player2 && end_idx == 6
      end_idx -= 14 if end_idx == 14
      self[end_idx] << stones.pop
    end
    render
    next_turn(end_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif self[ending_cup_idx].size == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| self[i].empty? } || (7..12).all? { |i| self[i].empty? }
  end

  def winner
    if self[6].size == 6 && self[13].size == 6
      return :draw
    elsif self[6].size == 6
      return @player1
    elsif self[13].size == 6
      return @Player2
    end
    false
  end

  def [](pos)
    @cups[pos]
  end

  def []=(pos, value)
    @cups[pos] = value
  end
end

class Exception
end
