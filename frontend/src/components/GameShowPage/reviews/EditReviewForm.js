import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { editReview } from "../../../store/reviews";
import "./EditReviewForm.css";

const EditReviewForm = ({ review, onFinishEditing }) => {
  const dispatch = useDispatch();
  const [body, setBody] = useState(review.body);
  const [recommended, setRecommended] = useState(review.recommended);

  const handleSubmit = (e) => {
    e.preventDefault();
    const updatedReview = { ...review, body, recommended };
    dispatch(editReview(updatedReview, review.id));
    onFinishEditing();
  };

  return (
    <form className="edit-review-form" onSubmit={handleSubmit}>
      <h3>Edit your review</h3>
      <textarea
        value={body}
        onChange={(e) => setBody(e.target.value)}
        placeholder="Edit your review here..."
        required
      />
      <div className="review-recommendation-edit">
        <input
          id="recommend-yes"
          type="radio"
          name="recommendation"
          value="true"
          checked={recommended}
          onChange={() => setRecommended(true)}
        />
        <label htmlFor="recommend-yes">Yes</label>

        <input
          id="recommend-no"
          type="radio"
          name="recommendation"
          value="false"
          checked={!recommended}
          onChange={() => setRecommended(false)}
        />
        <label htmlFor="recommend-no">No</label>
      </div>
      <button type="submit">Save Changes</button>
      <button type="button" onClick={onFinishEditing}>
        Cancel
      </button>
    </form>
  );
};

export default EditReviewForm;
