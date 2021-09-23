module Slideable

  def horizontal_dirs
    
    return HORIZONTAL_DIRS
  
  end

  def diagonal_dirs
    
    return DIAGONAL_DIRS

  end

  def moves
    possible_dir = self.move_dirs
    possible_moves = []

    possible_dir.each do |moved_dir|
      possible_moves += grow_unblocked_in_dir(moved_dir)
    end
    possible_moves
  end

  private

  HORIZONTAL_DIRS = [[1, 0],[0, 1], [0, -1], [-1, 0]] 
  DIAGONAL_DIRS =[[1,1], [1,-1], [-1, -1], [-1, 1]]
  
  def move_dirs
    raise 'move error!!!'
  end

  def grow_unblocked_in_dir(dir)
    expanded_moves = []
    while self.board.valid_pos?(dir)
      updated = [self.pos[0] + dir[0], self.pos[1] + dir[1]]

      if self.board[updated].is_a?(Piece) && self.board[updated].color != self.color
        break
      end
        expanded_moves <<  updated
    end
    expanded_moves
  end

end