import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import { isVendorOpen } from '../utils/isVendorOpen';
import './VendorDetailsPage.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const VendorDetailsPage = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const [vendor, setVendor] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isFavorite, setIsFavorite] = useState(false);
  const [user, setUser] = useState(null);
  const [reviews, setReviews] = useState([]);
  const [showReviewForm, setShowReviewForm] = useState(false);
  const [reviewForm, setReviewForm] = useState({ rating: 5, comment: '' });
  const [trendingItems, setTrendingItems] = useState([]);

  const fetchVendor = useCallback(async () => {
    try {
      setLoading(true);
      const response = await fetch(`${API_URL}/api/vendors`);
      if (!response.ok) throw new Error('Failed to fetch vendors');
      const vendors = await response.json();
      const foundVendor = vendors.find(v => v.id === id);
      if (!foundVendor) throw new Error('Vendor not found');
      setVendor(foundVendor);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [id]);

  const checkFavorite = useCallback(async () => {
    try {
      const userData = JSON.parse(localStorage.getItem('user'));
      if (!userData) return;
      const userId = userData.user_id || userData.id;  // Handle both field names
      const response = await fetch(`${API_URL}/api/favorites/${userId}/${id}`);
      if (response.ok) {
        const data = await response.json();
        setIsFavorite(data.isFavorite || data.is_favorite || false);
      }
    } catch (err) {
      console.error('Error checking favorite:', err);
    }
  }, [id]);

  const fetchReviews = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/reviews/vendor/${id}`);
      if (response.ok) {
        const data = await response.json();
        setReviews(data);
      }
    } catch (err) {
      console.error('Error fetching reviews:', err);
    }
  }, [id]);

  const fetchTrendingItems = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/menu-items/vendor/${id}/trending`);
      if (response.ok) {
        const data = await response.json();
        setTrendingItems(data);
      }
    } catch (err) {
      console.error('Error fetching trending items:', err);
    }
  }, [id]);

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
    fetchVendor();
    fetchTrendingItems();
    if (userData) {
      checkFavorite();
      fetchReviews();
    }
  }, [id, fetchVendor, checkFavorite, fetchReviews, fetchTrendingItems]);

  const toggleFavorite = async () => {
    if (!user) {
      navigate('/');
      return;
    }
    try {
      const userId = user.user_id || user.id;  // Handle both field names
      const response = await fetch(`${API_URL}/api/favorites`, {
        method: isFavorite ? 'DELETE' : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: userId, vendor_id: id })
      });
      if (response.ok) {
        setIsFavorite(!isFavorite);
      }
    } catch (err) {
      console.error('Error toggling favorite:', err);
    }
  };


  const submitReview = async (e) => {
    e.preventDefault();
    if (!user) {
      navigate('/');
      return;
    }
    try {
      const userId = user.user_id || user.id;  // Handle both field names
      const response = await fetch(`${API_URL}/api/reviews`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          user_id: userId,
          vendor_id: id,
          rating: reviewForm.rating,
          comment: reviewForm.comment
        })
      });
      if (response.ok) {
        setShowReviewForm(false);
        setReviewForm({ rating: 5, comment: '' });
        fetchReviews();
      }
    } catch (err) {
      console.error('Error submitting review:', err);
    }
  };

  const averageRating = reviews.length > 0
    ? (reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length).toFixed(1)
    : '0.0';

  const handleViewAllReviews = () => {
    navigate(`/vendor/${id}/reviews`);
  };

  if (loading) return <div className="loading">Loading vendor details...</div>;
  if (error) return <div className="error">Error: {error}</div>;
  if (!vendor) return <div className="error">Vendor not found</div>;

  return (
    <div className="vendor-details-page">
      <Header />

      <div className="vendor-details-content">
        <div className="container">
          <div className="vendor-actions-top">
            <button className="back-btn" onClick={() => navigate('/browse-vendors')}>← Back</button>
            {user && (
              <button className="favorite-btn" onClick={toggleFavorite}>
                {isFavorite ? '❤️ Favorited' : '🤍 Favorite'}
              </button>
            )}
          </div>
          <div className="vendor-header">
            <div className="vendor-title-row">
              <h1>{vendor.name}</h1>
              <span className={`status-tag ${isVendorOpen(vendor.operating_hours) ? 'status-open' : 'status-closed'}`}>
                {isVendorOpen(vendor.operating_hours) ? 'Open' : 'Closed'}
              </span>
            </div>
            <div className="vendor-meta">
              <span className="cuisine-badge">{formatText(vendor.cuisine)}</span>
              <span className="location-badge">{formatText(vendor.location)}</span>
              <div className="rating-display">
                <span className={`stars ${reviews.length === 0 ? 'empty-stars' : ''}`}>
                  {reviews.length > 0 
                    ? '⭐'.repeat(Math.round(parseFloat(averageRating))) 
                    : '☆☆☆☆☆'
                  }
                </span>
                <span className="rating-value">{reviews.length > 0 ? averageRating : '0.0'}</span>
                <span className="rating-count">
                  ({reviews.length > 0 
                    ? `${reviews.length} ${reviews.length === 1 ? 'review' : 'reviews'}`
                    : 'No reviews left'
                  })
                </span>
              </div>
            </div>
          </div>

          {/* Trending Menu Items Section */}
          {trendingItems.length > 0 && (
            <section className="trending-items-section">
              <div className="trending-items-header">
                <h2>🔥 Trending Menu Items</h2>
                <button 
                  className="view-all-menu-btn"
                  onClick={() => navigate(`/vendor/${id}/menu`)}
                >
                  View All Menu Items →
                </button>
              </div>
              <div className="trending-items-grid">
                {trendingItems.map((item) => (
                  <div key={item.menu_item_id} className="trending-item-card">
                    {item.image_url && (
                      <img src={item.image_url} alt={item.name} className="item-image" />
                    )}
                    <div className="item-info">
                      <h3>{item.name}</h3>
                      {item.description && <p className="item-description">{item.description}</p>}
                      <div className="item-meta">
                        {item.price && <span className="item-price">${item.price.toFixed(2)}</span>}
                        {item.avg_rating > 0 && (
                          <span className="item-rating">
                            ⭐ {item.avg_rating.toFixed(1)} ({item.review_count} reviews)
                          </span>
                        )}
                        {item.avg_rating === 0 && (
                          <span className="item-rating">No reviews yet</span>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </section>
          )}

          {/* View All Menu Items Button (if no trending items) */}
          {trendingItems.length === 0 && (
            <div className="view-menu-section">
              <button 
                className="view-all-menu-btn-large"
                onClick={() => navigate(`/vendor/${id}/menu`)}
              >
                View All Menu Items
              </button>
            </div>
          )}

          <div className="vendor-info-grid">
            <div className="vendor-main">
              <section className="vendor-section">
                <h2>About</h2>
                <p>{vendor.description}</p>
              </section>

              <section className="vendor-section">
                <h2>Operating Hours</h2>
                <div className="hours-display">
                  {Object.entries(vendor.operating_hours || {}).map(([day, hours]) => (
                    <div key={day} className="hours-row">
                      <span className="day">{day.charAt(0).toUpperCase() + day.slice(1)}</span>
                      <span className="time">
                        {hours ? Object.entries(hours).map(([meal, time]) => `${meal}: ${time}`).join(', ') : 'Closed'}
                      </span>
                    </div>
                  ))}
                </div>
              </section>

              <section className="vendor-section">
                <h2>Payment Methods</h2>
                <div className="payment-methods">
                  {vendor.payment_methods?.map((method, idx) => (
                    <span key={idx} className="payment-badge">{formatText(method)}</span>
                  ))}
                </div>
              </section>

              <section className="vendor-section">
                <h2>Dietary Options</h2>
                <div className="dietary-tags">
                  {vendor.dietary_tags?.map((tag, idx) => (
                    <span key={idx} className="dietary-badge">{formatText(tag)}</span>
                  ))}
                </div>
              </section>

              <section className="vendor-section">
                <div className="reviews-section-header">
                  <h2>Reviews</h2>
                  {reviews.length > 0 && (
                    <button className="view-all-reviews-btn-inline" onClick={handleViewAllReviews}>
                      View All {reviews.length} Reviews →
                    </button>
                  )}
                </div>
                {user && (
                  <button className="add-review-btn" onClick={() => setShowReviewForm(!showReviewForm)}>
                    {showReviewForm ? 'Cancel Review' : 'Write a Review'}
                  </button>
                )}
                {showReviewForm && (
                  <form className="review-form" onSubmit={submitReview}>
                    <div className="form-group">
                      <label>Rating</label>
                      <select value={reviewForm.rating} onChange={(e) => setReviewForm({...reviewForm, rating: parseInt(e.target.value)})}>
                        {[5, 4, 3, 2, 1].map(r => <option key={r} value={r}>{r} ⭐</option>)}
                      </select>
                    </div>
                    <div className="form-group">
                      <label>Comment</label>
                      <textarea
                        value={reviewForm.comment}
                        onChange={(e) => setReviewForm({...reviewForm, comment: e.target.value})}
                        rows="4"
                        required
                      />
                    </div>
                    <button type="submit" className="submit-review-btn">Submit Review</button>
                  </form>
                )}
                <div className="reviews-list">
                  {reviews.length === 0 ? (
                    <p>No reviews yet. Be the first to review!</p>
                  ) : (
                    reviews.map(review => (
                      <div key={review.review_id} className="review-item">
                        <div className="review-header">
                          <span className="review-rating">{'⭐'.repeat(review.rating)}</span>
                          <span className="review-author">{review.user_name || 'Anonymous'}</span>
                          <span className="review-date">{new Date(review.created_at).toLocaleDateString()}</span>
                        </div>
                        <div className="review-meta">
                          <div className="review-meta-line">
                            <span className="review-label">Vendor:</span>
                            <span className="review-value">{review.vendor_name || vendor.name}</span>
                          </div>
                          <div className="review-meta-line">
                            <span className="review-label">Item:</span>
                            <span className="review-value">
                              {review.menu_item_name ? review.menu_item_name : 'General vendor review'}
                            </span>
                          </div>
                        </div>
                        <p className="review-comment">{review.comment}</p>
                      </div>
                    ))
                  )}
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
      
      <Footer />
    </div>
  );
};

export default VendorDetailsPage;

