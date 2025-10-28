import React, { useState, useEffect } from 'react';
import { Card, Button, Spinner, Alert } from 'react-bootstrap';
import { StarFill } from 'react-bootstrap-icons';
import ReviewItem from './ReviewItem';
import ReviewForm from './ReviewForm';
import { reviewsAPI } from '../../services/api';
import './Reviews.css';

const ReviewList = ({ vendorId, currentUser }) => {
  const [reviews, setReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showForm, setShowForm] = useState(false);
  const [averageRating, setAverageRating] = useState(0);

  useEffect(() => {
    loadReviews();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [vendorId]);

  const loadReviews = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await reviewsAPI.getVendorReviews(vendorId);
      setReviews(data);
      calculateAverageRating(data);
    } catch (err) {
      setError('Failed to load reviews. Please try again later.');
      console.error('Error loading reviews:', err);
    } finally {
      setLoading(false);
    }
  };

  const calculateAverageRating = (reviewsList) => {
    if (reviewsList.length === 0) {
      setAverageRating(0);
      return;
    }
    const total = reviewsList.reduce((sum, review) => sum + review.rating, 0);
    setAverageRating((total / reviewsList.length).toFixed(1));
  };

  const handleAddReview = async (reviewData) => {
    try {
      const newReview = await reviewsAPI.createReview({
        ...reviewData,
        user_id: currentUser.user_id,
        vendor_id: vendorId
      });
      setReviews([newReview, ...reviews]);
      calculateAverageRating([newReview, ...reviews]);
      setShowForm(false);
    } catch (err) {
      console.error('Error adding review:', err);
      alert('Failed to add review. Please try again.');
    }
  };

  const handleUpdateReview = async (reviewId, reviewData) => {
    try {
      const updatedReview = await reviewsAPI.updateReview(reviewId, reviewData);
      const updatedReviews = reviews.map(review =>
        review.review_id === reviewId ? updatedReview : review
      );
      setReviews(updatedReviews);
      calculateAverageRating(updatedReviews);
    } catch (err) {
      console.error('Error updating review:', err);
      alert('Failed to update review. Please try again.');
    }
  };

  const handleDeleteReview = async (reviewId) => {
    if (!window.confirm('Are you sure you want to delete this review?')) {
      return;
    }

    try {
      await reviewsAPI.deleteReview(reviewId);
      const updatedReviews = reviews.filter(review => review.review_id !== reviewId);
      setReviews(updatedReviews);
      calculateAverageRating(updatedReviews);
    } catch (err) {
      console.error('Error deleting review:', err);
      alert('Failed to delete review. Please try again.');
    }
  };

  if (loading) {
    return (
      <div className="text-center py-5">
        <Spinner animation="border" variant="primary" />
        <p className="mt-2">Loading reviews...</p>
      </div>
    );
  }

  return (
    <div className="reviews-container">
      <div className="reviews-header d-flex justify-content-between align-items-center mb-4">
        <div>
          <h3 className="mb-1">Reviews</h3>
          {reviews.length > 0 && (
            <div className="rating-summary">
              <span className="average-rating">
                <StarFill className="text-warning me-1" />
                <strong>{averageRating}</strong>
              </span>
              <span className="text-muted ms-2">({reviews.length} {reviews.length === 1 ? 'review' : 'reviews'})</span>
            </div>
          )}
        </div>
        {currentUser && (
          <Button 
            variant="primary" 
            className="duke-blue-btn"
            onClick={() => setShowForm(true)}
          >
            Write a Review
          </Button>
        )}
      </div>

      {error && (
        <Alert variant="danger" dismissible onClose={() => setError(null)}>
          {error}
        </Alert>
      )}

      {showForm && (
        <ReviewForm
          onSubmit={handleAddReview}
          onCancel={() => setShowForm(false)}
          currentUser={currentUser}
        />
      )}

      <div className="reviews-list">
        {reviews.length === 0 ? (
          <Card className="empty-state">
            <Card.Body className="text-center py-5">
              <StarFill size={48} className="text-muted mb-3" />
              <h5 className="text-muted">No reviews yet</h5>
              <p className="text-muted">Be the first to share your experience!</p>
            </Card.Body>
          </Card>
        ) : (
          reviews.map((review) => (
            <ReviewItem
              key={review.review_id}
              review={review}
              currentUser={currentUser}
              onUpdate={handleUpdateReview}
              onDelete={handleDeleteReview}
            />
          ))
        )}
      </div>
    </div>
  );
};

export default ReviewList;
