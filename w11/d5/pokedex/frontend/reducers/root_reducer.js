import { combineReducers } from "redux";

const rootReducer = combineReducer({
  entities: entitiesReducer, 
  pokemon: pokemonReducer,
  
})

export default rootReducer;