import React from "react";


class Clock extends React.Component{
  constructor(props){
    super(props)
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this)
  }

  tick(){
    this.setState({time: new Date()});
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }


  render(){
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    return (
      <div>
        {`${hours} : ${minutes} : ${seconds}`}
      </div>
    )
  }
}

export default Clock