import * as Minesweeper from './minesweeper'
import React from 'react'
import Board from './board'

class Game extends React.Component {
  constructor(props){
    super(props);
    //Grid size and numBombs are required args
    let board = new Minesweeper.Board(9, 9);
    this.state = {
      board: board
    }
    this.updateGame = this.updateGame.bind(this);
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
    <Board board={this.state.board} updateGame={this.updateGame}/>
    </div>)
  }
}

export default Game;