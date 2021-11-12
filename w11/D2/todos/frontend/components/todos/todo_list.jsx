import React from "react";
import TodoListItem from './todo_list_item'
import TodoForm from "./todo_form";


export default (props) => {
  return (
    <div>
      <ul>
        <TodoListItem props={props}/>
      </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  )
}