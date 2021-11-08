import React from 'react'

class Tile extends React.Component{
  constructor(props){
    //tile object, updateGame function, key [i,j]
    super(props);
    this.handleClick = this.handleClick.bind(this);

  }

  //reveal if a tile if bomb, flagged, number, or empty 
  //.explore, .bombed (?), adjacent

  handleClick(e){
    e.preventDefault();
    this.props.updateGame(this.props.tile);
  }

  render(){
    let tile = this.props.tile;
    if (tile.bombed){
      //Game over 
    } else if (tile.flagged){
      //Render a flag 
    } else if (tile.adjacentBombCount() > 0){
      //Render a number for count 
    } else {
      //Render an empty square 
    }
    return (<div className="Tile" onClick={this.handleClick}>
      
    </div>);
  }

}

export default Tile; 