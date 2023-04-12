import React from "react";
import { useDispatch, useSelector } from "react-redux"; // Import useSelector
import { useHistory } from "react-router-dom";
import { createCartItem } from "../../store/cartItems";
import "./cartbutton.css";

const AddToCartButton = ({ game }) => {
  const dispatch = useDispatch();
  const history = useHistory();
  const user = useSelector((state) => state.session.user); // Access the user from the Redux state

  const handleAddToCart = async () => {
    if (!user) {
      history.push("/login"); // Redirect to the login page if the user is not logged in
    } else {
      await dispatch(createCartItem(game.id));
      history.push("/cart");
    }
  };

  return (
    <button onClick={handleAddToCart} className="addToCartButton">
      Add to Cart
    </button>
  );
};

export default AddToCartButton;
