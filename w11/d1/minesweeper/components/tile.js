export class Tile {
  constructor(board, pos) {
    this.board = board;
    this.pos = pos;
    this.bombed = false;
    this.explored = false;
    this.flagged = false;
  }

  adjacentBombCount() {
    let bombCount = 0;
    this.neighbors().forEach(neighbor => {
      if (neighbor.bombed) {
        bombCount++;
      }
    });
    return bombCount;
  }

  explore() {
    if (this.flagged || this.explored) {
      return this;
    }

    this.explored = true;
    if (!this.bombed && this.adjacentBombCount() === 0) {
      this.neighbors().forEach(tile => {
        tile.explore();
      });
    }

  }

  neighbors() {
    const adjacentCoords = [];
    Tile.DELTAS.forEach(delta => {
      const newPos = [delta[0] + this.pos[0], delta[1] + this.pos[1]];
      if (this.board.onBoard(newPos)) {
        adjacentCoords.push(newPos);
      }
    });

    return adjacentCoords.map(coord => this.board.grid[coord[0]][coord[1]]);
  }

  plantBomb() {
    this.bombed = true;
  }

  toggleFlag() {
    if (!this.explored) {
      this.flagged = !this.flagged;
      return true;
    }

    return false;
  }
}

Tile.DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
[0, 1], [1, -1], [1, 0], [1, 1]];
