import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { deleteReview } from "../../../store/reviews";
import EditReviewForm from "./EditReviewForm";
import "./Review.css";
import badapple from "./touhou badapple.jpeg";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faPencilAlt,
  faTimesCircle,
  faThumbsUp,
  faThumbsDown,
} from "@fortawesome/free-solid-svg-icons";

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
        <div id="review-temp-img-container">
          <img src={badapple} className="temp-profile-pic2" />
          <div className="review-author">{review.author.username}</div>
        </div>

        <div
          className={`review-recommendation ${
            review.recommended ? "recommended" : "not-recommended"
          }`}
        >
          <FontAwesomeIcon
            icon={review.recommended ? faThumbsUp : faThumbsDown}
            className={`recommendation-icon ${
              review.recommended ? "thumbs-up" : "thumbs-down"
            }`}
          />
          <span className="recommendation-text">
            {review.recommended ? "Recommended" : "Not Recommended"}
          </span>
        </div>
      </div>
      <div className="review-body">{review.body}</div>
      {review.author.id === currentUserId && (
        <div className="review-buttons-2">
          <button onClick={toggleEditing}>
            <FontAwesomeIcon icon={faPencilAlt} className="edit-icon2" /> Edit
          </button>
          <button onClick={handleDelete}>
            <FontAwesomeIcon icon={faTimesCircle} className="delete-icon2" />{" "}
            Delete
          </button>
        </div>
      )}
    </div>
  );
};

export default Review;
