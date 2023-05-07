import React, { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import {
  fetchReviews,
  createReview,
  updateReview,
  deleteReview,
} from "../../store/reviews";
import {
  createReviewVote,
  updateReviewVote,
  deleteReviewVote,
} from "../../store/reviewVotes";

const Reviews = ({ gameId }) => {
  const dispatch = useDispatch();
  const reviews = useSelector((state) => state.reviews);
  const reviewVotes = useSelector((state) => state.reviewVotes);
  const currentUserId = useSelector((state) => state.session.user.id);

  const [reviewText, setReviewText] = useState("");
  const [recommended, setRecommended] = useState(false);

  useEffect(() => {
    dispatch(fetchReviews(gameId));
  }, [dispatch, gameId]);

  const handleVote = (reviewId, value) => {
    // ... (same as before)
  };

  const renderReview = (review) => {
    // ... (same as before)
  };

  const handleSubmitReview = async (e) => {
    e.preventDefault();
    const newReview = {
      gameId: gameId,
      userId: currentUserId,
      body: reviewText,
      recommended: recommended,
    };
    await dispatch(createReview(newReview));
    setReviewText("");
    setRecommended(false);
  };

  return (
    <div className="reviews">
      <h3>Reviews</h3>
      {Object.values(reviews).map(renderReview)}

      <form onSubmit={handleSubmitReview}>
        <h4>Write a review:</h4>
        <textarea
          value={reviewText}
          onChange={(e) => setReviewText(e.target.value)}
          placeholder="Your review here..."
        />
        <div>
          <input
            type="checkbox"
            id="recommended"
            checked={recommended}
            onChange={(e) => setRecommended(e.target.checked)}
          />
          <label htmlFor="recommended">Recommended</label>
        </div>
        <button type="submit">Submit Review</button>
      </form>
    </div>
  );
};

export default Reviews;
