import React from "react"

export default (props) => {
  return <>
    {
      props.props.todos.map(todo => <li key={todo.id} >Title: {todo.title}</li>)
    }
  </>
}