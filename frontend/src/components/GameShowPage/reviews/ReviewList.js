import React, { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchReviews } from "../../../store/reviews";
import Review from "./Review";
import ReviewForm from "./ReviewForm";

const ReviewList = ({ gameId }) => {
  const dispatch = useDispatch();
  const reviews = useSelector((state) => Object.values(state.reviews));

  const currentUserId = useSelector((state) => state.session.user.id);

  const [userHasReviewed, setUserHasReviewed] = useState(false);

  useEffect(() => {
    dispatch(fetchReviews(gameId)).then(() => {
      const userReview = reviews.find(
        (review) => review.author.id === currentUserId
      );
      setUserHasReviewed(Boolean(userReview));
    });
  }, [dispatch, gameId, currentUserId]);

  const handleNewReview = () => {
    setUserHasReviewed(true);
  };

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
      {!userHasReviewed && (
        <ReviewForm gameId={gameId} onSubmit={handleNewReview} />
      )}
      {userHasReviewed && <p>You have already written a review.</p>}
    </div>
  );
};

export default ReviewList;
