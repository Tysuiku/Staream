import csrfFetch from "./csrf";
import { REMOVE_USER } from "./session";

export const SET_CART_ITEMS = "cartItems/SET_CART_ITEMS";
const ADD_CART_ITEM = "cartItems/ADD_CART_ITEM";
const REMOVE_CART_ITEM = "cartItems/REMOVE_CART_ITEM";
const CLEAR_CART = "cartItems/CLEAR_CART";

const setCartItems = (payload) => {
  return {
    type: SET_CART_ITEMS,
    payload,
  };
};

const addCartItem = (cartItem) => {
  return {
    type: ADD_CART_ITEM,
    payload: cartItem,
  };
};

const removeCartItem = (cartItemId) => {
  return {
    type: REMOVE_CART_ITEM,
    payload: cartItemId,
  };
};

const clearCart = () => {
  return {
    type: CLEAR_CART,
  };
};

export const fetchCartItems = () => async (dispatch) => {
  const res = await csrfFetch("/api/cart_items");
  const data = await res.json();
  dispatch(setCartItems(data));
};

export const createCartItem = (gameId) => async (dispatch) => {
  const res = await csrfFetch("/api/cart_items", {
    method: "POST",
    body: JSON.stringify({ gameId: gameId }),
  });

  if (res.ok) {
    const data = await res.json();
    dispatch(addCartItem(data));
  } else if (res.status === 422) {
    alert("This game is already in your cart.");
    return;
  } else {
    console.error("Error adding game to cart:", res.statusText);
  }
};

export const deleteCartItem = (cartItemId) => async (dispatch) => {
  await csrfFetch("/api/cart_items/" + cartItemId, {
    method: "DELETE",
  });
  dispatch(removeCartItem(cartItemId));
};

export const deleteAllCartItems = () => async (dispatch) => {
  await csrfFetch("/api/cart_items/all", {
    method: "DELETE",
  });
  dispatch(clearCart());
};

export const CHECKOUT_CART = "cartItems/CHECKOUT_CART";

export const checkoutCart = () => async (dispatch) => {
  const response = await csrfFetch("/api/cart_items/checkout", {
    method: "POST",
  });

  if (response.ok) {
    // Dispatch the CHECKOUT_CART action instead of fetching the cart items
    dispatch({ type: CHECKOUT_CART });
  } else {
    const errorData = await response.json();
    console.error("Error checking out:", errorData);
  }
};

export default function cartItemsReducer(state = {}, action) {
  switch (action.type) {
    case SET_CART_ITEMS:
      const cartItems = action.payload.reduce((accumulator, cartItem) => {
        accumulator[cartItem.id] = cartItem;
        return accumulator;
      }, {});
      return cartItems;
    case ADD_CART_ITEM:
      const cartItem = action.payload;
      return { ...state, [cartItem.id]: cartItem };
    case REMOVE_CART_ITEM:
      const newState = { ...state };
      delete newState[action.payload];
      return newState;
    case CLEAR_CART:
      return {};
    case REMOVE_USER:
      return {};
    case CHECKOUT_CART: {
      const newState = { ...state };
      Object.keys(newState).forEach((key) => {
        if (newState[key].purchased) {
          delete newState[key];
        }
      });
      return newState;
    }
    default:
      return state;
  }
}
