require_relative "piece"
require_relative "slideable"

class Bishop < Piece
  include Slideable
  def symbol
    return :B
  end

  protected
  def move_dirs
    self.diagonal_dirs
  end
end