import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createReview } from "../../../store/reviews";
import "./ReviewForm.css";

const ReviewForm = ({ gameId, user, gamename }) => {
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
  }, [user, gameId, cartItems, userOwns, reviews]); // added 'reviews' to dependency array

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (user) {
      await dispatch(createReview(gameId, body, recommended, user.id));
      setBody("");
      setRecommended(true);
    }
  };

  if (!userOwns) {
    return (
      <div className="center-content-gameReview">
        <p>You need to own this game to write a review.</p>
      </div>
    );
  }

  if (userHasReviewed()) {
    return (
      <div className="center-content-gameReview">
        <div>You have already reviewed this game.</div>
      </div>
    );
  }

  return (
    <form className="review-form" onSubmit={handleSubmit}>
      <h3 id="write-review">Write a review for {gamename}</h3>
      <p id="write-review-des">
        Please describe what you liked or disliked about this game and whether
        you recommend it to others. Please remember to be polite and follow the
        Rules and Guidelines.
      </p>
      <textarea
        value={body}
        onChange={(e) => setBody(e.target.value)}
        placeholder="Write your review here..."
        required
      />
      <div className="review-recommendation2">
        <input
          type="radio"
          id="recommended"
          name="recommendation"
          value="true"
          checked={recommended}
          onChange={() => setRecommended(true)}
        />
        <label htmlFor="recommended">Yes</label>

        <input
          type="radio"
          id="not-recommended"
          name="recommendation"
          value="false"
          checked={!recommended}
          onChange={() => setRecommended(false)}
        />
        <label htmlFor="not-recommended">No</label>
      </div>
      <button type="submit">Submit Review</button>
    </form>
  );
};

export default ReviewForm;
