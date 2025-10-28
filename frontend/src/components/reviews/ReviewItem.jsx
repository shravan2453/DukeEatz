import React, { useState } from 'react';
import { Card, Button, Badge } from 'react-bootstrap';
import { StarFill, Star, PencilSquare, Trash } from 'react-bootstrap-icons';
import ReviewForm from './ReviewForm';
import './Reviews.css';

const ReviewItem = ({ review, currentUser, onUpdate, onDelete }) => {
  const [isEditing, setIsEditing] = useState(false);
  const isOwner = currentUser && currentUser.user_id === review.user_id;

  const handleUpdate = async (reviewData) => {
    await onUpdate(review.review_id, reviewData);
    setIsEditing(false);
  };

  const handleDelete = () => {
    onDelete(review.review_id);
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    const now = new Date();
    const diffTime = Math.abs(now - date);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    if (diffDays === 0) {
      return 'Today';
    } else if (diffDays === 1) {
      return 'Yesterday';
    } else if (diffDays < 7) {
      return `${diffDays} days ago`;
    } else {
      return date.toLocaleDateString('en-US', { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
      });
    }
  };

  if (isEditing) {
    return (
      <ReviewForm
        review={review}
        onSubmit={handleUpdate}
        onCancel={() => setIsEditing(false)}
        currentUser={currentUser}
      />
    );
  }

  return (
    <Card className="review-item mb-3">
      <Card.Body>
        <div className="d-flex justify-content-between">
          <div className="flex-grow-1">
            <div className="d-flex align-items-center mb-2">
              <div className="user-avatar me-2">
                {review.user_name ? review.user_name.charAt(0).toUpperCase() : 'U'}
              </div>
              <div>
                <h6 className="mb-0">{review.user_name || 'Anonymous User'}</h6>
                <small className="text-muted">{formatDate(review.created_at)}</small>
              </div>
            </div>

            <div className="rating mb-2">
              {[...Array(5)].map((_, i) => (
                i < review.rating ? 
                  <StarFill key={i} className="text-warning me-1" size={18} /> : 
                  <Star key={i} className="text-muted me-1" size={18} />
              ))}
            </div>

            {review.menu_item_name && (
              <Badge bg="secondary" className="mb-2">
                {review.menu_item_name}
              </Badge>
            )}

            {review.review_text && (
              <p className="review-text mb-0">{review.review_text}</p>
            )}
          </div>

          {isOwner && (
            <div className="review-actions ms-3">
              <Button
                variant="outline-primary"
                size="sm"
                className="me-2"
                onClick={() => setIsEditing(true)}
              >
                <PencilSquare className="me-1" />
                Edit
              </Button>
              <Button
                variant="outline-danger"
                size="sm"
                onClick={handleDelete}
              >
                <Trash className="me-1" />
                Delete
              </Button>
            </div>
          )}
        </div>
      </Card.Body>
    </Card>
  );
};

export default ReviewItem;
