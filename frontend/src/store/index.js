import { createStore, combineReducers, applyMiddleware, compose } from "redux";
import thunk from "redux-thunk";
import session from "./session";
import gamesReducer from "./games";
import cartItemsReducer from "./cartItems";
import reviewsReducer from "./reviews";
import reviewVotesReducer from "./reviewVotes";

export const rootReducer = combineReducers({
  session,
  games: gamesReducer,
  cartItems: cartItemsReducer,
  reviews: reviewsReducer,
  reviewVotes: reviewVotesReducer,
});

let enhancer;

if (process.env.NODE_ENV === "production") {
  enhancer = applyMiddleware(thunk);
} else {
  const logger = require("redux-logger").default;
  const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
  enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState) => {
  return createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore;
