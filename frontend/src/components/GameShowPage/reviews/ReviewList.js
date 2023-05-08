import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchReviews, clearReviews } from "../../../store/reviews";
import Review from "./Review";

const ReviewList = ({ gameId, currentUserId }) => {
  const dispatch = useDispatch();
  const reviews = useSelector((state) => Object.values(state.reviews));

  useEffect(() => {
    if (gameId) {
      dispatch(fetchReviews(gameId));
    }

    // Clear reviews when the component unmounts
    return () => {
      dispatch(clearReviews());
    };
  }, [dispatch, gameId]);

  return (
    <div className="review-list">
      <h2>Customer Reviews</h2>
      <div className="reviews">
        {reviews.map((review) => (
          <Review
            key={review.id}
            review={review}
            currentUserId={currentUserId}
          />
        ))}
      </div>
    </div>
  );
};

export default ReviewList;
