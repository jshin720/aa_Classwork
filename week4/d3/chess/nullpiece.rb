require 'singleton'
require_relative 'Piece'


class NullPiece < Piece
  
  include Singleton

  def initialize
    @color = :_
  end

  def moves
    return []
  end

  def empty?
    return true
  end

  def symbol
    return :_
  end
end