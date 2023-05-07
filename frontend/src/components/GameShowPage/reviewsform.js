import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createReview, updateReview } from "../../store/reviews";

const ReviewForm = ({ gameId }) => {
  const [body, setBody] = useState("");
  const [recommended, setRecommended] = useState(true);
  const [reviewId, setReviewId] = useState(null);
  const dispatch = useDispatch();
  const currentUserId = useSelector((state) => state.session.user.id);

  useEffect(() => {
    const fetchExistingReview = async () => {
      // Add logic to fetch the existing review for the current user and game
      // and update the form fields and reviewId state accordingly
    };
    fetchExistingReview();
  }, [gameId, currentUserId]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const reviewData = {
      author_id: currentUserId,
      game_id: gameId,
      body,
      recommended,
    };

    if (reviewId) {
      await dispatch(updateReview({ ...reviewData, id: reviewId }));
    } else {
      await dispatch(createReview(reviewData));
    }

    // Clear the form fields
    setBody("");
    setRecommended(true);
  };

  return (
    <div className="review-form">
      <h3>Write a Review</h3>
      <form onSubmit={handleSubmit}>
        <textarea
          placeholder="Your review..."
          value={body}
          onChange={(e) => setBody(e.target.value)}
          required
        ></textarea>
        <div>
          <label>
            <input
              type="radio"
              name="recommended"
              value="true"
              checked={recommended === true}
              onChange={() => setRecommended(true)}
            />
            Yes
          </label>
          <label>
            <input
              type="radio"
              name="recommended"
              value="false"
              checked={recommended === false}
              onChange={() => setRecommended(false)}
            />
            No
          </label>
        </div>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
};

export default ReviewForm;
