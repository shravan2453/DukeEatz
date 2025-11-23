import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './VendorReviewsPage.css';

const API_URL = 'http://127.0.0.1:5001';

const VendorReviewsPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { id } = useParams(); // vendor_id
  const [vendor, setVendor] = useState(null);
  const [reviews, setReviews] = useState([]);
  const [filteredReviews, setFilteredReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [user, setUser] = useState(null);
  const [showProfileMenu, setShowProfileMenu] = useState(false);
  const [ratingFilter, setRatingFilter] = useState('all');
  const [sortBy, setSortBy] = useState('newest');
  const [searchQuery, setSearchQuery] = useState('');
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [menuItems, setMenuItems] = useState([]);
  const [selectedMenuItem, setSelectedMenuItem] = useState('');
  const [existingReview, setExistingReview] = useState(null);
  const [message, setMessage] = useState('');
  const [messageType, setMessageType] = useState('');
  const [submitting, setSubmitting] = useState(false);

  const fetchVendor = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/vendors`);
      if (!response.ok) throw new Error('Failed to fetch vendors');
      const vendorsData = await response.json();
      const foundVendor = vendorsData.find(v => v.id === id);
      if (!foundVendor) throw new Error('Vendor not found');
      setVendor(foundVendor);
    } catch (err) {
      setError(err.message);
    }
  }, [id]);

  const fetchReviews = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/reviews/vendor/${id}`);
      if (!response.ok) throw new Error('Failed to fetch reviews');
      const data = await response.json();
      setReviews(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [id]);

  const fetchMenuItems = useCallback(async () => {
    if (!id) return;
    try {
      const response = await fetch(`${API_URL}/api/menu-items/vendor/${id}`);
      if (response.ok) {
        const data = await response.json();
        setMenuItems(data);
      }
    } catch (err) {
      console.error('Error fetching menu items:', err);
    }
  }, [id]);

  const checkExistingReview = useCallback(async () => {
    if (!id || !user) return;
    try {
      const userId = user.user_id || user.id;
      const response = await fetch(`${API_URL}/api/reviews/user/${userId}`);
      if (response.ok) {
        const data = await response.json();
        // If menu item is selected, check for menu item review, otherwise check vendor review
        let existing;
        if (selectedMenuItem) {
          existing = data.find(r => r.vendor_id === id && r.menu_item_id === selectedMenuItem);
        } else {
          existing = data.find(r => r.vendor_id === id && !r.menu_item_id);
        }
        
        if (existing) {
          setExistingReview(existing);
          setRating(existing.rating);
          setComment(existing.comment || '');
        } else {
          setExistingReview(null);
          setRating(5);
          setComment('');
        }
      }
    } catch (err) {
      console.error('Error checking existing review:', err);
    }
  }, [id, user, selectedMenuItem]);

  const showMessage = (msg, type) => {
    setMessage(msg);
    setMessageType(type);
    setTimeout(() => {
      setMessage('');
      setMessageType('');
    }, 5000);
  };

  const handleSubmitReview = async (e) => {
    e.preventDefault();
    if (!user) {
      showMessage('Please log in to leave a review', 'error');
      return;
    }

    setSubmitting(true);
    try {
      const userId = user.user_id || user.id;
      const url = existingReview 
        ? `${API_URL}/api/reviews/${existingReview.review_id}`
        : `${API_URL}/api/reviews`;
      
      const method = existingReview ? 'PUT' : 'POST';
      
      const response = await fetch(url, {
        method: method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          user_id: userId,
          vendor_id: id,
          menu_item_id: selectedMenuItem || null,
          rating: rating,
          comment: comment
        })
      });

      const data = await response.json();
      if (response.ok) {
        showMessage(existingReview ? 'Review updated successfully!' : 'Review submitted successfully!', 'success');
        setExistingReview(data.review || data);
        // Refresh reviews list
        await fetchReviews();
        // Reset form if it was a new review
        if (!existingReview) {
          setRating(5);
          setComment('');
          setSelectedMenuItem('');
        }
      } else {
        showMessage(data.error || 'Failed to submit review', 'error');
      }
    } catch (err) {
      showMessage('Error submitting review. Please try again.', 'error');
    } finally {
      setSubmitting(false);
    }
  };

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
    fetchVendor();
    fetchReviews();
    fetchMenuItems();
  }, [id, fetchVendor, fetchReviews, fetchMenuItems]);

  useEffect(() => {
    if (user && id) {
      checkExistingReview();
    }
  }, [user, id, checkExistingReview]);

  // Re-check existing review when menu item changes
  useEffect(() => {
    if (user && id && selectedMenuItem) {
      checkExistingReview();
    } else if (user && id && !selectedMenuItem) {
      // If menu item is cleared, check for vendor review
      checkExistingReview();
    }
  }, [selectedMenuItem, user, id, checkExistingReview]);

  const applyFilters = useCallback(() => {
    let tempReviews = [...reviews];

    // Filter by rating
    if (ratingFilter !== 'all') {
      tempReviews = tempReviews.filter(review => review.rating === parseInt(ratingFilter));
    }

    // Search by comment or user name
    if (searchQuery) {
      const lowerCaseQuery = searchQuery.toLowerCase();
      tempReviews = tempReviews.filter(review =>
        (review.comment && review.comment.toLowerCase().includes(lowerCaseQuery)) ||
        (review.user_name && review.user_name.toLowerCase().includes(lowerCaseQuery))
      );
    }

    // Sort
    tempReviews.sort((a, b) => {
      if (sortBy === 'newest') {
        return new Date(b.created_at) - new Date(a.created_at);
      } else if (sortBy === 'oldest') {
        return new Date(a.created_at) - new Date(b.created_at);
      } else if (sortBy === 'highest_rating') {
        return b.rating - a.rating;
      } else if (sortBy === 'lowest_rating') {
        return a.rating - b.rating;
      }
      return 0;
    });

    setFilteredReviews(tempReviews);
  }, [reviews, ratingFilter, sortBy, searchQuery]);

  useEffect(() => {
    applyFilters();
  }, [reviews, ratingFilter, sortBy, searchQuery, applyFilters]);

  const handleLogout = () => {
    localStorage.removeItem('user');
    setUser(null);
    setShowProfileMenu(false);
    navigate('/');
  };

  const handleProfile = () => {
    setShowProfileMenu(false);
    navigate('/profile');
  };

  const averageRating = reviews.length > 0
    ? (reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length).toFixed(1)
    : '0.0';

  const ratingDistribution = {
    5: reviews.filter(r => r.rating === 5).length,
    4: reviews.filter(r => r.rating === 4).length,
    3: reviews.filter(r => r.rating === 3).length,
    2: reviews.filter(r => r.rating === 2).length,
    1: reviews.filter(r => r.rating === 1).length,
  };

  const maxRatingCount = Math.max(...Object.values(ratingDistribution), 1); // Avoid division by zero

  if (loading) return <div className="loading">Loading reviews...</div>;
  if (error) return <div className="error">Error: {error}</div>;
  if (!vendor) return <div className="error">Vendor not found</div>;

  return (
    <div className="vendor-reviews-page">
      {/* Header - matching LandingPage */}
      <header className="header">
        <div className="container">
          <div className="logo" onClick={() => navigate('/home')} style={{ cursor: 'pointer' }}>
            <div className="dukeeatz-brand">
              <h1>DukeEatz</h1>
              <p className="tagline">Your Duke Dining Guide</p>
            </div>
          </div>
          <nav className="nav">
            <button
              className={`nav-btn ${location.pathname === '/home' ? 'active' : ''}`}
              onClick={() => navigate('/home')}
            >
              HOME
            </button>
            <button 
              className={`nav-btn ${location.pathname === '/browse-vendors' ? 'active' : ''}`}
              onClick={() => navigate('/browse-vendors')}
            >
              BROWSE VENDORS
            </button>
            <button 
              className={`nav-btn ${location.pathname === '/browse-menu-items' ? 'active' : ''}`}
              onClick={() => navigate('/browse-menu-items')}
            >
              BROWSE MENU ITEMS
            </button>
            <button 
              className={`nav-btn ${location.pathname === '/leave-review' ? 'active' : ''}`}
              onClick={() => navigate('/leave-review')}
            >
              REVIEWS
            </button>
            {user ? (
              <div className="profile-menu-container">
                <button
                  className="profile-btn"
                  onClick={() => setShowProfileMenu(!showProfileMenu)}
                >
                  <span className="profile-icon">👤</span>
                  <span className="profile-name">{user.name || user.username}</span>
                  <span className="dropdown-arrow">▼</span>
                </button>
                {showProfileMenu && (
                  <div className="profile-dropdown">
                    <button className="dropdown-item" onClick={handleProfile}>
                      My Profile
                    </button>
                    <button className="dropdown-item" onClick={handleLogout}>
                      Logout
                    </button>
                  </div>
                )}
              </div>
            ) : (
              <>
                <button className="nav-btn" onClick={() => navigate('/')}>
                  Log In
                </button>
                <button className="nav-btn primary" onClick={() => navigate('/')}>
                  Sign Up
                </button>
              </>
            )}
          </nav>
        </div>
      </header>

      <div className="vendor-reviews-content">
        <div className="container">
          <div className="reviews-header-section">
            <button className="back-btn" onClick={() => navigate(`/vendor/${id}`)}>← Back to {vendor.name}</button>
            <h1>Reviews for {vendor.name}</h1>
            <p className="vendor-description">{vendor.description}</p>
          </div>

          <div className="reviews-summary-grid">
            <div className="average-rating-card">
              <span className="average-rating-value">{averageRating}</span>
              <span className={`average-rating-stars ${reviews.length === 0 ? 'empty-stars' : ''}`}>
                {reviews.length > 0 ? '⭐'.repeat(Math.round(parseFloat(averageRating))) : '☆☆☆☆☆'}
              </span>
              <span className="total-reviews-count">
                {reviews.length} {reviews.length === 1 ? 'review' : 'reviews'}
              </span>
            </div>

            <div className="rating-distribution-card">
              {Object.entries(ratingDistribution).sort(([a], [b]) => b - a).map(([rating, count]) => (
                <div key={rating} className="rating-bar-row">
                  <span className="rating-number">{rating} ⭐</span>
                  <div className="rating-bar-container">
                    <div
                      className="rating-bar-fill"
                      style={{ width: `${(count / maxRatingCount) * 100}%` }}
                    ></div>
                  </div>
                  <span className="rating-count-text">{count}</span>
                </div>
              ))}
            </div>
          </div>

          {user && (
            <div className="leave-review-section">
              <h2>Leave a Review</h2>
              {message && (
                <div className={`message ${messageType}`}>
                  {message}
                </div>
              )}
              <form className="review-form" onSubmit={handleSubmitReview}>
                {menuItems.length > 0 && (
                  <div className="form-section">
                    <label className="form-label">Select Menu Item (Optional)</label>
                    <select
                      className="form-select"
                      value={selectedMenuItem}
                      onChange={(e) => setSelectedMenuItem(e.target.value)}
                    >
                      <option value="">General review (no specific item)</option>
                      {menuItems.map((item) => (
                        <option key={item.menu_item_id} value={item.menu_item_id}>
                          {item.name} {item.category ? `(${formatText(item.category)})` : ''}
                        </option>
                      ))}
                    </select>
                    <p className="form-hint">You can leave a review for a specific menu item or leave a general review for the vendor</p>
                  </div>
                )}

                <div className="form-section">
                  <label className="form-label">Rating *</label>
                  <div className="rating-input">
                    {[1, 2, 3, 4, 5].map((star) => (
                      <button
                        key={star}
                        type="button"
                        className={`star-btn ${rating >= star ? 'active' : ''}`}
                        onClick={() => setRating(star)}
                      >
                        ⭐
                      </button>
                    ))}
                    <span className="rating-text">{rating} {rating === 1 ? 'star' : 'stars'}</span>
                  </div>
                </div>

                <div className="form-section">
                  <label className="form-label">Your Review *</label>
                  <textarea
                    className="form-textarea"
                    value={comment}
                    onChange={(e) => setComment(e.target.value)}
                    placeholder="Share your experience..."
                    required
                    maxLength={1000}
                  />
                  <div className="char-count">{comment.length}/1000</div>
                </div>

                <button
                  type="submit"
                  className="submit-review-btn"
                  disabled={submitting}
                >
                  {submitting ? 'Submitting...' : existingReview ? 'Update Review' : 'Submit Review'}
                </button>
              </form>
            </div>
          )}

          <div className="reviews-filter-sort-section">
            <div className="filter-group">
              <label htmlFor="ratingFilter">Filter by Rating:</label>
              <select
                id="ratingFilter"
                value={ratingFilter}
                onChange={(e) => setRatingFilter(e.target.value)}
              >
                <option value="all">All Ratings</option>
                <option value="5">5 Stars</option>
                <option value="4">4 Stars</option>
                <option value="3">3 Stars</option>
                <option value="2">2 Stars</option>
                <option value="1">1 Star</option>
              </select>
            </div>

            <div className="filter-group">
              <label htmlFor="sortBy">Sort by:</label>
              <select
                id="sortBy"
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
              >
                <option value="newest">Newest</option>
                <option value="oldest">Oldest</option>
                <option value="highest_rating">Highest Rating</option>
                <option value="lowest_rating">Lowest Rating</option>
              </select>
            </div>

            <div className="filter-group search-group">
              <label htmlFor="searchReviews">Search Reviews:</label>
              <input
                type="text"
                id="searchReviews"
                placeholder="Search comments or names..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
              />
            </div>
          </div>

          <div className="reviews-list-section">
            <h2>All Reviews ({filteredReviews.length})</h2>
            {filteredReviews.length === 0 ? (
              <p className="empty-state">No reviews match your current filters.</p>
            ) : (
              <div className="reviews-grid">
                {filteredReviews.map(review => (
                  <div key={review.review_id} className="review-item">
                    <div className="review-header">
                      <span className="review-rating">{'⭐'.repeat(review.rating)}</span>
                      <span className="review-author">{review.user_name || 'Anonymous'}</span>
                      <span className="review-date">{new Date(review.created_at).toLocaleDateString()}</span>
                    </div>
                    <p className="review-comment">{review.comment}</p>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>

      <footer className="footer">
        <div className="container">
          <p>&copy; 2024 DukeEatz. Built for the Duke community.</p>
        </div>
      </footer>
    </div>
  );
};

export default VendorReviewsPage;
