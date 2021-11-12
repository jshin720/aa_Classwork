import React from "react";


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: new Date().getTime(),
      title: '',
      body: '',
      done: false
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();

    let todo = this.state;

    this.props.receiveTodo(todo);
    // console.log(todo)
    this.setState(
      {
      id: new Date().getTime(),
      title: '',
      body: '',
      done: false
     }
    )
  }

  updateTitle(e) {
    // console.log(this.state)
    this.setState ({
      title: e.target.value
    })
  }

  updateBody(e) {
    this.setState({
      body: e.target.value
    })
  }

  render() {
    return ( <>
        <h1>Create a new Todo</h1>
        <form onSubmit={this.handleSubmit} >
        <label>Title
          <input type="text" onChange={this.updateTitle} value={this.state.title} />
        </label>
        <label>Body
          <input type="text" onChange={this.updateBody} value={this.state.body} />
        </label>
        <input type="submit" value="SUBMIT"/>
        </form>
      </>
    );
  }


}


export default TodoForm;