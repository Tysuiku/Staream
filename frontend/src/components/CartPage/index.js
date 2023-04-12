import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  fetchCartItems,
  deleteCartItem,
  deleteAllCartItems,
} from "../../store/cartItems";

import "./cartpage.css";

const CartPage = () => {
  const dispatch = useDispatch();
  const cartItems = useSelector((state) => state.cartItems);

  useEffect(() => {
    dispatch(fetchCartItems());
  }, [dispatch]);

  const handleRemoveCartItem = (cartItemId) => {
    dispatch(deleteCartItem(cartItemId));
  };

  const handleClearCart = () => {
    dispatch(deleteAllCartItems());
  };

  const cartItemsList = Object.values(cartItems);

  return (
    <div className="cartPageBox">
      <h1>Your Cart</h1>
      {cartItemsList.length > 0 ? (
        <div>
          <ul>
            {cartItemsList.map((cartItem) => (
              <li key={cartItem.id}>
                {cartItem.game.name} - ${cartItem.game.price}
                <button onClick={() => handleRemoveCartItem(cartItem.id)}>
                  Remove
                </button>
              </li>
            ))}
          </ul>
          <button onClick={handleClearCart}>Clear Cart</button>
        </div>
      ) : (
        <p>Your cart is empty.</p>
      )}
    </div>
  );
};

export default CartPage;
