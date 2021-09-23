require_relative "slideable"
require_relative "piece"
class Rook < Piece
  include Slideable
  def symbol
    return :R
  end

  protected
  def move_dirs
    self.horizontal_dirs
  end
  
end