import csrfFetch from "./csrf";

const RECEIVE_USER = "session/receiveUser";
export const REMOVE_USER = "session/removeUser";

//action creator
export const receiveUser = (user) => ({
  type: RECEIVE_USER,
  payload: user,
});

export const removeUser = () => ({
  type: REMOVE_USER,
});

const storeCSRFToken = (response) => {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
};

const storeCurrentUser = (user) => {
  if (user) sessionStorage.setItem("currentUser", JSON.stringify(user));
  else {
    sessionStorage.removeItem("currentUser");
  }
};

//thunk action creator
export const restoreSession = () => async (dispatch) => {
  const res = await csrfFetch("api/session");
  storeCSRFToken(res);
  const data = await res.json();
  storeCurrentUser(data.user);
  dispatch(receiveUser(data.user));
  return res;
};
export const login = (user) => async (dispatch) => {
  const { credential, password } = user;
  const res = await csrfFetch("/api/session", {
    method: "POST",
    body: JSON.stringify({
      credential,
      password,
    }),
  });
  const data = await res.json();
  storeCurrentUser(data.user);
  dispatch(receiveUser(data.user));
  return res;
};

export const signup = (user) => async (dispatch) => {
  const { username, email, password } = user;
  const res = await csrfFetch("/api/users", {
    method: "POST",
    body: JSON.stringify({
      username,
      email,
      password,
    }),
  });
  let data = await res.json();
  storeCurrentUser(data.user);
  dispatch(receiveUser(data.user));
  return res;
};

export const logout = () => async (dispatch) => {
  const res = await csrfFetch("/api/session", {
    method: "DELETE",
  });

  storeCurrentUser(null);
  dispatch(removeUser());
  return res;
};

const initialState = {
  user: JSON.parse(sessionStorage.getItem("currentUser")),
};
const sessionReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_USER:
      return { ...state, user: action.payload };
    case REMOVE_USER:
      return { ...state, user: null };
    default:
      return state;
  }
};

export default sessionReducer;
