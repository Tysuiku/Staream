import React, { useState } from "react";
import EditReviewForm from "./EditReviewForm";

const Review = ({ review, currentUserId }) => {
  const [editing, setEditing] = useState(false);

  const toggleEditing = () => {
    setEditing(!editing);
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
        <button onClick={toggleEditing}>Edit</button>
      )}
    </div>
  );
};

export default Review;
