import Board from './board'
import Tile from './tile'
import React from 'react'

class Game extends React.Component{
  constructor(props){
    super(props);
    //Grid size and numBombs are required args
    let board = new Board();
    this.state = {
      board: board
    }
  }

  //how will we get user input
  updateGame(){
    //Changes tiles
    //We can access tiles through the this.state.board.grid[][]
    //if given tile explore it 
    //otherwise toggle flag 
  }


//
  render(){
    return (<div> 
      <a>{board = } </a>
    </div>)
  }
}
