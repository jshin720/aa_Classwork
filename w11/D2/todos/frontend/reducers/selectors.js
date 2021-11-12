export const allTodos = (state) => {
  let todoArray = Object.values(state.todos)
  return todoArray
}