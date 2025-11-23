import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './LeaveReviewPage.css';

const API_URL = 'http://127.0.0.1:5001';

const LeaveReviewPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const [user, setUser] = useState(null);
  const [showProfileMenu, setShowProfileMenu] = useState(false);
  const [vendors, setVendors] = useState([]);
  const [selectedVendor, setSelectedVendor] = useState('');
  const [menuItems, setMenuItems] = useState([]);
  const [selectedMenuItem, setSelectedMenuItem] = useState('');
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');
  const [messageType, setMessageType] = useState('');
  const [existingReview, setExistingReview] = useState(null);
  const [menuItemReviews, setMenuItemReviews] = useState([]);
  const [selectedMenuItemData, setSelectedMenuItemData] = useState(null);

  const fetchVendors = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/vendors`);
      if (response.ok) {
        const data = await response.json();
        setVendors(data);
      }
    } catch (err) {
      console.error('Error fetching vendors:', err);
    }
  }, []);

  const checkExistingReview = useCallback(async () => {
    if (!selectedVendor || !user) return;
    try {
      const userId = user.user_id || user.id;
      const response = await fetch(`${API_URL}/api/reviews/user/${userId}`);
      if (response.ok) {
        const data = await response.json();
        // If menu item is selected, check for menu item review, otherwise check vendor review
        let existing;
        if (selectedMenuItem) {
          existing = data.find(r => r.vendor_id === selectedVendor && r.menu_item_id === selectedMenuItem);
        } else {
          existing = data.find(r => r.vendor_id === selectedVendor && !r.menu_item_id);
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
  }, [selectedVendor, selectedMenuItem, user]);

  const fetchMenuItems = useCallback(async () => {
    if (!selectedVendor) return;
    try {
      const response = await fetch(`${API_URL}/api/menu-items/vendor/${selectedVendor}`);
      if (response.ok) {
        const data = await response.json();
        setMenuItems(data);
      }
    } catch (err) {
      console.error('Error fetching menu items:', err);
    }
  }, [selectedVendor]);

  const fetchMenuItemReviews = useCallback(async () => {
    if (!selectedMenuItem) {
      setMenuItemReviews([]);
      setSelectedMenuItemData(null);
      return;
    }
    try {
      // Get menu item details
      const itemResponse = await fetch(`${API_URL}/api/menu-items/${selectedMenuItem}`);
      if (itemResponse.ok) {
        const itemData = await itemResponse.json();
        setSelectedMenuItemData(itemData);
      }
      
      // Get reviews for this menu item
      const reviewsResponse = await fetch(`${API_URL}/api/reviews`);
      if (reviewsResponse.ok) {
        const allReviews = await reviewsResponse.json();
        const itemReviews = allReviews.filter(r => r.menu_item_id === selectedMenuItem);
        setMenuItemReviews(itemReviews);
      }
    } catch (err) {
      console.error('Error fetching menu item reviews:', err);
    }
  }, [selectedMenuItem]);

  useEffect(() => {
    fetchMenuItemReviews();
  }, [selectedMenuItem, fetchMenuItemReviews]);

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    } else {
      navigate('/');
    }
    fetchVendors();
  }, [navigate, fetchVendors]);

  useEffect(() => {
    if (selectedVendor && user) {
      checkExistingReview();
      fetchMenuItems();
    } else {
      setMenuItems([]);
      setSelectedMenuItem('');
      setSelectedMenuItemData(null);
      setMenuItemReviews([]);
    }
  }, [selectedVendor, user, checkExistingReview, fetchMenuItems]);

  // Re-check existing review when menu item changes
  useEffect(() => {
    if (selectedVendor && user) {
      checkExistingReview();
    }
  }, [selectedMenuItem, selectedVendor, user, checkExistingReview]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!selectedVendor) {
      showMessage('Please select a vendor', 'error');
      return;
    }

    setLoading(true);
    try {
      const userId = user.user_id || user.id;
      const response = await fetch(`${API_URL}/api/reviews`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          user_id: userId,
          vendor_id: selectedVendor,
          menu_item_id: selectedMenuItem || null,
          rating: rating,
          comment: comment
        })
      });

      const data = await response.json();
      if (response.ok) {
        showMessage(existingReview ? 'Review updated successfully!' : 'Review submitted successfully!', 'success');
        setExistingReview(data.review);
        setTimeout(() => {
          navigate('/browse-vendors');
        }, 2000);
      } else {
        showMessage(data.error || 'Failed to submit review', 'error');
      }
    } catch (err) {
      showMessage('Error submitting review. Please try again.', 'error');
    } finally {
      setLoading(false);
    }
  };

  const showMessage = (msg, type) => {
    setMessage(msg);
    setMessageType(type);
    setTimeout(() => {
      setMessage('');
      setMessageType('');
    }, 5000);
  };

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

  const selectedVendorData = vendors.find(v => v.id === selectedVendor);

  return (
    <div className="leave-review-page">
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

      {/* Main Content */}
      <section className="main-content-section">
        <div className="container">
          <div className="main-content-wrapper">
            <div className="page-header-section">
              <h2 className="page-title">Leave a Review</h2>
              <p className="page-description">
                Share your dining experience and help the Duke community discover great food
              </p>
            </div>

            {message && (
              <div className={`message ${messageType}`}>
                {message}
              </div>
            )}

            <form className="review-form" onSubmit={handleSubmit}>
              <div className="form-section">
                <label className="form-label">Select Vendor *</label>
                <select
                  className="form-select"
                  value={selectedVendor}
                  onChange={(e) => setSelectedVendor(e.target.value)}
                  required
                >
                  <option value="">Choose a vendor...</option>
                  {vendors.map((vendor) => (
                    <option key={vendor.id} value={vendor.id}>
                      {vendor.name} - {formatText(vendor.location)}
                    </option>
                  ))}
                </select>
                {selectedVendorData && (
                  <div className="selected-vendor-info">
                    <p><strong>{selectedVendorData.name}</strong></p>
                    <p>{selectedVendorData.description}</p>
                    <div className="vendor-tags-preview">
                      <span className="tag location">{formatText(selectedVendorData.location)}</span>
                      <span className="tag cuisine">{formatText(selectedVendorData.cuisine)}</span>
                    </div>
                  </div>
                )}
              </div>

              {selectedVendor && (
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
                  
                  {/* Show menu item info and reviews if selected */}
                  {selectedMenuItemData && (
                    <div className="selected-menu-item-info">
                      <div className="menu-item-header">
                        <h4>{selectedMenuItemData.name}</h4>
                        {selectedMenuItemData.price && (
                          <span className="menu-item-price-display">${selectedMenuItemData.price.toFixed(2)}</span>
                        )}
                      </div>
                      {selectedMenuItemData.description && (
                        <p className="menu-item-desc">{selectedMenuItemData.description}</p>
                      )}
                      
                      {/* Show existing reviews for this menu item */}
                      {menuItemReviews.length > 0 && (
                        <div className="menu-item-reviews-preview">
                          <h5>Reviews for this item ({menuItemReviews.length})</h5>
                          <div className="reviews-list">
                            {menuItemReviews.slice(0, 3).map((review) => (
                              <div key={review.review_id} className="review-preview-card">
                                <div className="review-preview-header">
                                  <span className="review-preview-author">{review.user_name || 'Anonymous'}</span>
                                  <span className="review-preview-rating">
                                    {'⭐'.repeat(review.rating)}{'☆'.repeat(5 - review.rating)}
                                  </span>
                                </div>
                                {review.comment && (
                                  <p className="review-preview-comment">{review.comment}</p>
                                )}
                              </div>
                            ))}
                            {menuItemReviews.length > 3 && (
                              <p className="more-reviews">+{menuItemReviews.length - 3} more reviews</p>
                            )}
                          </div>
                        </div>
                      )}
                    </div>
                  )}
                </div>
              )}

              <div className="form-section">
                <label className="form-label">Rating *</label>
                <div className="rating-input">
                  {[5, 4, 3, 2, 1].map((star) => (
                    <button
                      key={star}
                      type="button"
                      className={`star-btn ${rating >= star ? 'active' : ''}`}
                      onClick={() => setRating(star)}
                    >
                      ⭐
                    </button>
                  ))}
                  <span className="rating-text">{rating} out of 5 stars</span>
                </div>
              </div>

              <div className="form-section">
                <label className="form-label">Your Review</label>
                <textarea
                  className="form-textarea"
                  value={comment}
                  onChange={(e) => setComment(e.target.value)}
                  placeholder="Share your experience... What did you order? How was the service? Would you recommend this vendor?"
                  rows="6"
                />
                <div className="char-count">{comment.length} characters</div>
              </div>

              {existingReview && (
                <div className="existing-review-notice">
                  <p>⚠️ You already have a review for this vendor. Submitting will update your existing review.</p>
                </div>
              )}

              <div className="form-actions">
                <button
                  type="button"
                  className="cancel-btn"
                  onClick={() => navigate('/browse-vendors')}
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  className="submit-btn"
                  disabled={loading || !selectedVendor}
                >
                  {loading ? 'Submitting...' : existingReview ? 'Update Review' : 'Submit Review'}
                </button>
              </div>
            </form>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer">
        <div className="container">
          <p>&copy; 2024 DukeEatz. Built for the Duke community.</p>
        </div>
      </footer>
    </div>
  );
};

export default LeaveReviewPage;

