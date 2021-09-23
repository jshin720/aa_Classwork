class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    return "#{self.color}-#{self.symbol}"
  end
  
  def symbol
    return self.color
  end

  def empty?
    return false
  end

  def valid_moves
     
  end

  def move_into_check?()
    
  end
end