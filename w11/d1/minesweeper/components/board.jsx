import React from 'react'
import * as Minesweeper from './minesweeper'
import Tile from './tile'

class Board extends React.Component{
  constructor(props){
    //board object and updateGame passed in as props
    super(props);
  }
  render(){
    let board = this.props.board; 
    // this.props.updateGame
    const boardGrid = board.grid.map((row, i) => {
      return (row.map((tile, j) => {
        // console.log(tile);
        //TODO: define Tile component 
        
        return (<Tile tile={tile} updateGame={this.props.updateGame} key={`tile-${j}`}/> )
        
      }).unshift(<div className={i}>).concat(<div/>)
      )
    });

    // console.log(this.boardGrid)
    return (<div> 
      {boardGrid}
    </div>)
  }
}

export default Board; 