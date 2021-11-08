export class Board {
  constructor(gridSize, numBombs) {
    this.gridSize = gridSize;
    this.grid = [];
    this.numBombs = numBombs;
    this.generateBoard();
    this.plantBombs();
  }

  generateBoard() {
    for (let i = 0; i < this.gridSize; i++) {
      this.grid.push([]);
      for (let j = 0; j < this.gridSize; j++) {
        const tile = new Tile(this, [i, j]);
        this.grid[i].push(tile);
      }
    }
  }

  onBoard(pos) {
    return (
      pos[0] >= 0 && pos[0] < this.gridSize &&
      pos[1] >= 0 && pos[1] < this.gridSize
    );
  }

  plantBombs() {
    let totalPlantedBombs = 0;
    while (totalPlantedBombs < this.numBombs) {
      const row = Math.floor(Math.random() * (this.gridSize - 1));
      const col = Math.floor(Math.random() * (this.gridSize - 1));

      let tile = this.grid[row][col];
      if (!tile.bombed) {
        tile.plantBomb();
        totalPlantedBombs++;
      }
    }
  }

  lost() {
    let lost = false;
    this.grid.forEach(row => {
      row.forEach(tile => {
        if (tile.bombed && tile.explored) {
          lost = true;
        }
      });
    });
    return lost;
  }

  won() {
    let won = true;
    this.grid.forEach(row => {
      row.forEach(tile => {
        if (tile.flagged === tile.revealed || tile.flagged !== tile.bombed) {
          won = false;
        }
      });
    });
    return won;
  }
}
