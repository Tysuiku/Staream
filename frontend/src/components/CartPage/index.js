// CartPage.js
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
import GameNavbar from "../HomePage/GameNavbar/GameNavbar";
import { fetchGames } from "../../store/games";

const CartPage = () => {
  const dispatch = useDispatch();
  const history = useHistory();
  const cartItems = useSelector((state) => state.cartItems);

  useEffect(() => {
    dispatch(fetchCartItems());
    dispatch(fetchGames());
  }, [dispatch]);

  const games2 = useSelector((state) => {
    return Object.values(state.games);
  });

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

  const handleContinueShopping = () => {
    history.push("/home");
  };

  return (
    <div className="cartPageItemsBox">
      <div>
        <GameNavbar games={games2} />
      </div>
      <h2 className="youShopCart">YOUR SHOPPING CART</h2>
      <div className="cartVisualEffect"></div>

      <div className="cartPageBox">
        <div>
          <ul className="cartItemList">
            {cartItemsList.map((cartItem) => (
              <li key={cartItem.id} className="cartItem">
                <img
                  src={cartItem.game.mainImage}
                  alt={cartItem.game.name}
                  className="cartItemImage"
                />
                <div className="cartItemInfo">
                  <div>
                    <span className="gameNameCart">{cartItem.game.name}</span>
                  </div>
                  <div className="priceAndRemove">
                    <span className="price">
                      ${cartItem.game.price.toFixed(2)}
                    </span>
                    <button
                      onClick={() => handleRemoveCartItem(cartItem.id)}
                      className="removeItemButton"
                    >
                      Remove
                    </button>
                  </div>
                </div>
              </li>
            ))}
          </ul>
          <p className="totalCartPrice">Total: ${totalPrice.toFixed(2)}</p>
          <button onClick={handleCheckout} className="purchaseButton">
            Purchase for myself
          </button>
          <button
            onClick={handleContinueShopping}
            className="continueShoppingButton"
          >
            Continue Shopping
          </button>
          <span
            onClick={() => dispatch(deleteAllCartItems())}
            className="removeAllItems"
          >
            Remove All Items
          </span>
        </div>
      </div>
      <p className="salesTax">
        Sales tax will be calculated during checkout where applicable
      </p>
    </div>
  );
};

export default CartPage;
