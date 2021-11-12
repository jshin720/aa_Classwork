import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './frontend/store/store'
import { receiveTodo, receiveTodos, removeTodo } from './frontend/actions/todo_actions'
import { receiveStep, receiveSteps, removeStep } from './frontend/actions/step_actions'
import Root from './frontend/components/root'
import { allTodos } from './frontend/reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
  window.allTodos = allTodos;
  const store = configureStore()
  ReactDOM.render(<Root store={store} />, document.getElementById("root"))
  
  window.store = store;
  // window.receiveTodo = receiveTodo;
  // window.receiveTodos = receiveTodos;
  // window.removeTodo = removeTodo;
  // window.receiveStep = receiveStep;
  // window.receiveSteps = receiveSteps;
  // window.removeStep = removeStep;
});