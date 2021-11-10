import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { createLogger } from 'redux-logger';
import rootReducer from './reducer';


const middleware = applyMiddleware(thunk, createLogger());

const store = createStore(
    rootReducer,
    middleware
);

export default store;

