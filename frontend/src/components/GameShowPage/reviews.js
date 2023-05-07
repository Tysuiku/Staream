import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchReviews } from "../../store/reviews";
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

  useEffect(() => {
    dispatch(fetchReviews(gameId));
  }, [dispatch, gameId]);

  const handleVote = (reviewId, value) => {
    const existingVote = Object.values(reviewVotes).find(
      (vote) => vote.user_id === currentUserId && vote.review_id === reviewId
    );

    if (existingVote) {
      if (existingVote.value === value) {
        dispatch(deleteReviewVote(existingVote.id));
      } else {
        dispatch(updateReviewVote({ ...existingVote, value }));
      }
    } else {
      dispatch(createReviewVote({ review_id: reviewId, value }));
    }
  };

  const renderReview = (review) => {
    const reviewVote = reviewVotes[review.id];
    const voteCount = reviewVote ? reviewVote.value : 0;

    return (
      <div key={review.id} className="review">
        <h4>{review.author.display_name}</h4>
        <p>{review.body}</p>
        <p>{review.recommended ? "Recommended" : "Not Recommended"}</p>
        <div className="review-votes">
          <button onClick={() => handleVote(review.id, "yes")}>
            Helpful ({voteCount})
          </button>
          <button onClick={() => handleVote(review.id, "no")}>
            Not Helpful ({voteCount})
          </button>
        </div>
      </div>
    );
  };

  return (
    <div className="reviews">
      <h3>Reviews</h3>
      {Object.values(reviews).map(renderReview)}
    </div>
  );
};

export default Reviews;
