import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createReview } from "../../../store/reviews";

const ReviewForm = ({ gameId, onSubmit, user }) => {
  const dispatch = useDispatch();
  const [body, setBody] = useState("");
  const [recommended, setRecommended] = useState(true);

  const reviews = useSelector((state) => Object.values(state.reviews));

  const handleSubmit = (e) => {
    e.preventDefault();
    const review = { body, recommended };
    dispatch(createReview(review, gameId)).then(() => {
      setBody("");
      onSubmit();
    });
  };

  const userHasWrittenReview = () => {
    if (!user || !reviews) return false;
    return reviews.some(
      (review) => review.userId === user.id && review.gameId === gameId
    );
  };

  if (userHasWrittenReview()) {
    return <p>You have already written a review for this game.</p>;
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
