import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors'
import { receiveTodo } from '../../actions/todo_actions';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: todo => {
      console.log('container', todo);
      return dispatch(receiveTodo(todo));
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);