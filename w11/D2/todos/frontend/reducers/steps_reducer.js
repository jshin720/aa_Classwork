import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";


let initialStep = {
  1: { // this is the step with id = 1
    id: 1,
      title: 'walk to store',
        done: false,
          todo_id: 1
  },
  2: { // this is the step with id = 2
    id: 2,
      title: 'buy soap',
        done: false,
          todo_id: 1
  }
}

const stepsReducer = (state = initialStep, action) => {
  let nextState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_STEPS:
      for (let step in action.steps) {
        nextState[step.id] = step;
      }
      return nextState;
    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState
    case REMOVE_STEP:
      delete nextState[action.step.id]
      return nextState;
    default:
      return state;
  }
}



export default stepsReducer