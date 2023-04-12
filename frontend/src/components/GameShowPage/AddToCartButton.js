import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchCartItems } from "../../store/cartItems";
import { useHistory } from "react-router-dom";
import { createCartItem } from "../../store/cartItems";
import "./cartbutton.css";

const AddToCartButton = ({ game }) => {
  const dispatch = useDispatch();
  const history = useHistory();
  const user = useSelector((state) => state.session.user);
  const cartItems = useSelector((state) => state.cartItems) || {};
  const isInCart = Object.values(cartItems).some(
    (cartItem) => cartItem.userId === user.id && cartItem.gameId === game.id
  );

  useEffect(() => {
    if (user) {
      dispatch(fetchCartItems());
    }
  }, [dispatch, user]);

  const handleAddToCart = async () => {
    const existingCartItem = Object.values(cartItems).find(
      (cartItem) => cartItem.userId === user.id && cartItem.gameId === game.id
    );
    if (existingCartItem && existingCartItem.purchased) {
      console.log("This game has already been purchased.");
      return;
    }

    if (user) {
      await dispatch(createCartItem(game.id));
      history.push("/cart");
    } else {
      history.push("/login");
    }
  };

  const isPurchased = Object.values(cartItems).some(
    (cartItem) =>
      cartItem.userId === user.id &&
      cartItem.gameId === game.id &&
      cartItem.purchased
  );

  return (
    <div className="playBuyButtonBox">
      <div className="gameName">{game.name}</div>
      {isPurchased ? (
        <button className="playButton" disabled>
          Play
        </button>
      ) : isInCart ? (
        <button className="inCartButton" disabled>
          In Cart
        </button>
      ) : (
        <button onClick={handleAddToCart} className="addToCartButton">
          Add to Cart
        </button>
      )}
    </div>
  );
};

export default AddToCartButton;
