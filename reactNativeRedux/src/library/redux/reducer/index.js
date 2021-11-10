import { combineReducers } from 'redux';
// import sourcesKehilangan from './sourcesKehilangan';
import sourcesKehilangan from './reducerKehilangan';
import actionSearch from './reducerSearch'

const rootReducer = combineReducers({
    sourcesKehilangan,
});


export default rootReducer;