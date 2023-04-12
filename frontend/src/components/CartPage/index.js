import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  fetchCartItems,
  deleteCartItem,
  deleteAllCartItems,
  checkoutCart,
} from "../../store/cartItems";

import { useHistory } from "react-router-dom";
import "./cartpage.css";

const CartPage = () => {
  const dispatch = useDispatch();
  const history = useHistory();
  const cartItems = useSelector((state) => state.cartItems);

  useEffect(() => {
    dispatch(fetchCartItems());
  }, [dispatch]);

  const handleRemoveCartItem = (cartItemId) => {
    dispatch(deleteCartItem(cartItemId));
  };

  const cartItemsList = Object.values(cartItems).filter(
    (cartItem) => !cartItem.purchased
  );

  const totalPrice = cartItemsList.reduce(
    (total, cartItem) => total + cartItem.game.price,
    0
  );

  const handleCheckout = async () => {
    await dispatch(checkoutCart());
    history.push("/home");
  };

  return (
    <div className="cartPageBox">
      <h2>Your Cart</h2>
      {cartItemsList.length > 0 ? (
        <div>
          <ul>
            {cartItemsList.map((cartItem) => (
              <li key={cartItem.id}>
                {cartItem.game.name} - ${cartItem.game.price.toFixed(2)}
                <button onClick={() => handleRemoveCartItem(cartItem.id)}>
                  Remove
                </button>
              </li>
            ))}
          </ul>
          <p>Total: ${totalPrice.toFixed(2)}</p>
          <button onClick={handleCheckout}>Checkout</button>
          <button onClick={() => dispatch(deleteAllCartItems())}>
            Remove All Items
          </button>
        </div>
      ) : (
        <p>Your cart is empty.</p>
      )}
    </div>
  );
};

export default CartPage;
