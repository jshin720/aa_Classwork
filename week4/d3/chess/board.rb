require_relative 'piece'

class Board
  attr_reader :rows
  def self.make_board
    Array.new(8) {Array.new(8)}
  end

  def initialize
    @rows = Board.make_board

  end

  def pieces
    self.rows[0].each.with_index { |ele, i| self.rows[0][i] = Piece.new } 
    self.rows[1].each.with_index { |ele, i| self.rows[1][i] = Piece.new } 

    self.rows[6].each.with_index { |ele, i| self.rows[6][i] = Piece.new } 
    self.rows[7].each.with_index { |ele, i| self.rows[7][i] = Piece.new } 
  end

  def [](pos)
    row, col = pos
    self.rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.rows[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos
    if (row > 8 || col > 8) || (row < 0 || col < 0)
      return false
    else 
      return true
    end
  end

  def move_piece(start_pos, end_pos)
    if !valid_pos?(end_pos)
      raise "Position is not valid!"
    elsif self[start_pos] == nil
      raise "No piece here!"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end
end