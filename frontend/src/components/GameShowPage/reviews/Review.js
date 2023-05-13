import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { deleteReview } from "../../../store/reviews";
import EditReviewForm from "./EditReviewForm";
import "./Review.css";

const Review = ({ review, currentUserId }) => {
  const dispatch = useDispatch();
  const [editing, setEditing] = useState(false);

  const toggleEditing = () => {
    setEditing(!editing);
  };

  const handleDelete = () => {
    dispatch(deleteReview(review.id));
  };

  if (!review.author) {
    return null;
  }

  if (editing) {
    return <EditReviewForm review={review} onFinishEditing={toggleEditing} />;
  }

  return (
    <div className="review">
      <div className="review-header">
        <div className="review-author">{review.author.username}</div>
        <div
          className={`review-recommendation ${
            review.recommended ? "recommended" : "not-recommended"
          }`}
        >
          {review.recommended ? "Recommended" : "Not Recommended"}
        </div>
      </div>
      <div className="review-body">{review.body}</div>
      {review.author.id === currentUserId && (
        <div className="review-buttons-2">
          <button onClick={toggleEditing}>Edit</button>
          <button onClick={handleDelete}>Delete</button>
        </div>
      )}
    </div>
  );
};

export default Review;
