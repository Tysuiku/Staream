import csrfFetch from "./csrf";

const SET_GAMES = "games/SET_GAMES";
const ADD_GAME = "games/ADD_GAME";
const ADD_GAMES = "games/ADD_GAMES";

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

export const fetchGame = (gameId) => async (dispatch) => {
  const res = await csrfFetch(`/api/games/${gameId}`);
  const game = await res.json();
  dispatch(addGame(game));
};

const gamesReducer = (state = {}, action) => {
  switch (action.type) {
    case SET_GAMES:
      return action.payload;
    case ADD_GAMES:
      return { ...state, ...action.payload };
    case ADD_GAME:
      return { ...state, [action.game.id]: action.game };
    default:
      return state;
  }
};

export default gamesReducer;
