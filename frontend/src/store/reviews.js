import csrfFetch from "./csrf";

// Action types
const SET_REVIEWS = "reviews/SET_REVIEWS";
const ADD_REVIEW = "reviews/ADD_REVIEW";
const UPDATE_REVIEW = "reviews/UPDATE_REVIEW";
const REMOVE_REVIEW = "reviews/REMOVE_REVIEW";
const CLEAR_REVIEWS = "reviews/CLEAR_REVIEWS";

// Action creators
export const setReviews = (reviews) => ({ type: SET_REVIEWS, reviews });
export const addReview = (review) => ({ type: ADD_REVIEW, review });
export const updateReview = (review) => ({ type: UPDATE_REVIEW, review });
export const removeReview = (reviewId) => ({ type: REMOVE_REVIEW, reviewId });
export const clearReviews = () => ({
  type: CLEAR_REVIEWS,
});

// Thunk action creators
export const fetchReviews = (gameId) => async (dispatch) => {
  const response = await csrfFetch(`/api/games/${gameId}/reviews`);
  const data = await response.json();
  console.log("Fetched reviews:", data);

  dispatch(setReviews(data.reviews)); // Access the array using the key 'reviews'
};

export const createReview = (review, gameId) => async (dispatch) => {
  const response = await csrfFetch(`/api/games/${gameId}/reviews`, {
    method: "POST",
    body: JSON.stringify({ review }),
  });
  if (response.status === 200 || response.status === 201) {
    const newReview = await response.json();
    dispatch(addReview(newReview));
  }
};

export const editReview = (review, reviewId) => async (dispatch) => {
  const response = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "PUT",
    body: JSON.stringify({ review }),
  });
  if (response.ok) {
    const updatedReview = await response.json();
    dispatch(updateReview(updatedReview));
  }
};

export const deleteReview = (reviewId) => async (dispatch) => {
  const response = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "DELETE",
  });
  if (response.ok) {
    dispatch(removeReview(reviewId));
  }
};

// Reducer
const reviewsReducer = (state = {}, action) => {
  let newState;
  switch (action.type) {
    case SET_REVIEWS:
      newState = { ...state };
      action.reviews.forEach((review) => {
        newState[review.id] = review;
      });
      return newState;
    case ADD_REVIEW:
      newState = { ...state, [action.review.id]: action.review };
      return newState;
    case UPDATE_REVIEW:
      newState = { ...state, [action.review.id]: action.review };
      return newState;
    case REMOVE_REVIEW:
      newState = { ...state };
      delete newState[action.reviewId];
      return newState;
    case CLEAR_REVIEWS:
      return {};
    default:
      return state;
  }
};

export default reviewsReducer;
