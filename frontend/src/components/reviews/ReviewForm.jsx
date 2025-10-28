import React, { useState } from 'react';
import { Card, Button, Form, Alert } from 'react-bootstrap';
import { Star, StarFill } from 'react-bootstrap-icons';
import './Reviews.css';

const ReviewForm = ({ review, onSubmit, onCancel, currentUser }) => {
  const [rating, setRating] = useState(review?.rating || 0);
  const [hover, setHover] = useState(0);
  const [reviewText, setReviewText] = useState(review?.review_text || '');
  const [menuItemId, setMenuItemId] = useState(review?.menu_item_id || '');
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    if (rating === 0) {
      setError('Please select a rating');
      return;
    }

    if (!reviewText.trim()) {
      setError('Please write a review');
      return;
    }

    setIsSubmitting(true);
    setError('');

    const reviewData = {
      rating,
      review_text: reviewText.trim(),
      menu_item_id: menuItemId || null
    };

    try {
      await onSubmit(reviewData);
    } catch (err) {
      setError('Failed to submit review. Please try again.');
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <Card className="review-form mb-4">
      <Card.Body>
        <h5 className="mb-3">{review ? 'Edit Your Review' : 'Write a Review'}</h5>
        
        {error && (
          <Alert variant="danger" dismissible onClose={() => setError('')}>
            {error}
          </Alert>
        )}

        <Form onSubmit={handleSubmit}>
          <Form.Group className="mb-3">
            <Form.Label>Rating *</Form.Label>
            <div className="star-rating-input">
              {[...Array(5)].map((_, index) => {
                const ratingValue = index + 1;
                return (
                  <span
                    key={ratingValue}
                    className="star-icon"
                    onMouseEnter={() => setHover(ratingValue)}
                    onMouseLeave={() => setHover(0)}
                    onClick={() => setRating(ratingValue)}
                  >
                    {ratingValue <= (hover || rating) ? (
                      <StarFill className="text-warning" size={32} />
                    ) : (
                      <Star className="text-warning" size={32} />
                    )}
                  </span>
                );
              })}
              {rating > 0 && (
                <span className="ms-3 rating-text">
                  {rating} {rating === 1 ? 'star' : 'stars'}
                </span>
              )}
            </div>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Your Review *</Form.Label>
            <Form.Control
              as="textarea"
              rows={4}
              value={reviewText}
              onChange={(e) => setReviewText(e.target.value)}
              placeholder="Share your experience with this vendor. What did you like? What could be improved?"
              maxLength={1000}
              required
            />
            <Form.Text className="text-muted">
              {reviewText.length}/1000 characters
            </Form.Text>
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Menu Item (Optional)</Form.Label>
            <Form.Control
              type="number"
              value={menuItemId}
              onChange={(e) => setMenuItemId(e.target.value)}
              placeholder="Enter menu item ID if reviewing a specific item"
            />
            <Form.Text className="text-muted">
              Leave blank if reviewing the vendor in general
            </Form.Text>
          </Form.Group>

          <div className="d-flex justify-content-end gap-2">
            <Button 
              variant="outline-secondary" 
              onClick={onCancel}
              disabled={isSubmitting}
            >
              Cancel
            </Button>
            <Button 
              type="submit" 
              variant="primary"
              className="duke-blue-btn"
              disabled={isSubmitting || rating === 0}
            >
              {isSubmitting ? 'Submitting...' : review ? 'Update Review' : 'Submit Review'}
            </Button>
          </div>
        </Form>
      </Card.Body>
    </Card>
  );
};

export default ReviewForm;
