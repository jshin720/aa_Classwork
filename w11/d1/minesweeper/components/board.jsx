import React from 'react'
import * as Minesweeper from './minesweeper'

class Board extends React.Component{
  constructor(props){
    //board object and updateGame passed in as props
    super(props);
  }
  render(){
    let board = this.props.board; 
    this.props.updateGame
    let boardGrid = board.grid.map((el, i) => {
      let row = el.map((tile, j) => {
        //TODO: define Tile component 
        <Tile tile={new Minesweeper.Tile(this.props.board, [i,j])} updateGame={this.props.updateGame} key={i,j}/>
      });
      <div key={i}>
        {row}
      </div>
    });


    return (<div> 
      {boardGrid}
    </div>)
  }
}

export default Board; 