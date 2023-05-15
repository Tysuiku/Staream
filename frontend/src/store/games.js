import csrfFetch from "./csrf";

const SET_GAMES = "games/SET_GAMES";
const ADD_GAME = "games/ADD_GAME";
const ADD_GAMES = "games/ADD_GAMES";
const SET_RANDOM_GAMES = "games/SET_RANDOM_GAMES";

export const setRandomGames = (games) => {
  return {
    type: SET_RANDOM_GAMES,
    payload: games,
  };
};

export const setGames = (games) => {
  return {
    type: SET_GAMES,
    payload: games,
  };
};

export const addGames = (games) => {
  return {
    type: ADD_GAMES,
    payload: games,
  };
};

const addGame = (game) => {
  return {
    type: ADD_GAME,
    game,
  };
};

export const fetchGames = () => async (dispatch) => {
  const res = await csrfFetch("/api/games");
  const games = await res.json();
  dispatch(setGames(games));
};

export const fetchRandomGames = () => async (dispatch) => {
  const res = await csrfFetch("/api/games/random");
  const games = await res.json();
  dispatch(setRandomGames(games));
};

export const fetchGame = (gameId) => async (dispatch) => {
  const res = await csrfFetch(`/api/games/${gameId}`);
  const game = await res.json();
  dispatch(addGame(game));
};

const gamesReducer = (state = {}, action) => {
  switch (action.type) {
    case SET_GAMES:
      return { ...state, all: action.payload };
    case SET_RANDOM_GAMES:
      return { ...state, random: action.payload };
    case ADD_GAMES:
      return { ...state, all: { ...state.all, ...action.payload } };
    case ADD_GAME:
      return { ...state, all: { ...state.all, [action.game.id]: action.game } };
    default:
      return state;
  }
};

export default gamesReducer;
