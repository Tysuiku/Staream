import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createReview } from "../../../store/reviews";

const ReviewForm = ({ gameId, user }) => {
  const dispatch = useDispatch();
  const [body, setBody] = useState("");
  const [recommended, setRecommended] = useState(true);
  const [userOwns, setUserOwns] = useState(false);

  const cartItems = useSelector((state) => Object.values(state.cartItems));
  const reviews = useSelector((state) => Object.values(state.reviews));

  const userHasReviewed = () => {
    if (user && reviews.length > 0) {
      const userReview = reviews.find(
        (review) => review.author && review.author.id === user.id
      );
      return userReview !== undefined;
    }
    return false;
  };

  useEffect(() => {
    const userOwnsGame = () => {
      if (!user || !cartItems) {
        return false;
      }
      return cartItems.some(
        (cartItem) =>
          cartItem.userId === user.id &&
          cartItem.gameId === gameId &&
          cartItem.purchased === true
      );
    };

    const newOwnsGame = userOwnsGame();
    if (newOwnsGame !== userOwns) {
      setUserOwns(newOwnsGame);
    }
  }, [user, gameId, cartItems, userOwns]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (user) {
      await dispatch(createReview(gameId, body, recommended, user.id));
      setBody("");
      setRecommended(true);
    }
  };

  if (!userOwns) {
    return <p>You need to own this game to write a review.</p>;
  }

  if (userHasReviewed()) {
    return <div>You have already reviewed this game.</div>;
  }

  return (
    <form className="review-form" onSubmit={handleSubmit}>
      <h3>Write a review</h3>
      <textarea
        value={body}
        onChange={(e) => setBody(e.target.value)}
        placeholder="Write your review here..."
        required
      />
      <div className="review-recommendation">
        <label>
          <input
            type="radio"
            name="recommendation"
            value="true"
            checked={recommended}
            onChange={() => setRecommended(true)}
          />
          Recommended
        </label>
        <label>
          <input
            type="radio"
            name="recommendation"
            value="false"
            checked={!recommended}
            onChange={() => setRecommended(false)}
          />
          Not Recommended
        </label>
      </div>
      <button type="submit">Submit Review</button>
    </form>
  );
};

export default ReviewForm;
