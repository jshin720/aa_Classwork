require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable
  def symbol
    return :Q
  end

  protected
  def move_dirs
    self.diagonal_dirs + self.horizontal_dirs
  end
end