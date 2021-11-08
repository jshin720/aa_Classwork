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
    let content; 
    if (tile.bombed){
      content = '\u1F4A3'
    } else if (tile.flagged){
      content = '\u2690'
    } else if (tile.adjacentBombCount() > 0){
      content = tile.adjacentBombCount(); 
    } else {
      content = ' ';
    }
    return (<div className="Tile" onClick={this.handleClick} flagged={tile.flagged.toString()} bombed={tile.bombed.toString()} revealed={tile.explored.toString()}>
      {content}
    </div>);
  }

}

export default Tile; 