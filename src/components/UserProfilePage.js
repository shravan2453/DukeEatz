import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './UserProfilePage.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const UserProfilePage = () => {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [favorites, setFavorites] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isEditing, setIsEditing] = useState(false);
  const [editForm, setEditForm] = useState({ name: '', username: '', email: '', password: '' });
  const [updateMessage, setUpdateMessage] = useState('');
  const [deleteModal, setDeleteModal] = useState({ open: false, reviewId: null });

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (!userData) {
      navigate('/');
      return;
    }
    const parsedUser = JSON.parse(userData);
    setUser(parsedUser);
    fetchFavorites(parsedUser.user_id);
    fetchReviews(parsedUser.user_id);
  }, [navigate]);

  const fetchFavorites = async (userId) => {
    try {
      const response = await fetch(`${API_URL}/api/favorites/${userId}`);
      if (response.ok) {
        const data = await response.json();
        setFavorites(data);
      }
    } catch (err) {
      console.error('Error fetching favorites:', err);
    } finally {
      setLoading(false);
    }
  };

  const fetchReviews = async (userId) => {
    try {
      const response = await fetch(`${API_URL}/api/reviews/user/${userId}`);
      if (response.ok) {
        const data = await response.json();
        setReviews(data);
      }
    } catch (err) {
      console.error('Error fetching reviews:', err);
    }
  };

  const confirmDeleteReview = async () => {
    if (!user || !deleteModal.reviewId) return;
    try {
      const response = await fetch(`${API_URL}/api/reviews/${deleteModal.reviewId}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: user.user_id || user.id })
      });

      if (response.ok) {
        fetchReviews(user.user_id || user.id);
        setDeleteModal({ open: false, reviewId: null });
      } else {
        const data = await response.json();
        alert(data.error || 'Failed to delete review');
      }
    } catch (err) {
      console.error('Error deleting review:', err);
      alert('Error deleting review. Please try again.');
    }
  };

  const openDeleteModal = (reviewId) => {
    setDeleteModal({ open: true, reviewId });
  };

  const closeDeleteModal = () => {
    setDeleteModal({ open: false, reviewId: null });
  };

  const handleEditClick = () => {
    setIsEditing(true);
    setEditForm({
      name: user.name || '',
      username: user.username || '',
      email: user.email || '',
      password: '' // Don't pre-fill password
    });
    setUpdateMessage('');
  };

  const handleCancelEdit = () => {
    setIsEditing(false);
    setEditForm({ name: '', username: '', email: '', password: '' });
    setUpdateMessage('');
  };

  const handleUpdateProfile = async (e) => {
    e.preventDefault();
    try {
      const userId = user.user_id || user.id;
      const updateData = {
        name: editForm.name,
        username: editForm.username,
        email: editForm.email
      };
      
      // Only include password if it's provided
      if (editForm.password && editForm.password.trim()) {
        updateData.password = editForm.password;
      }

      const response = await fetch(`${API_URL}/api/users/${userId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(updateData)
      });

      if (response.ok) {
        const data = await response.json();
        setUser(data.user);
        localStorage.setItem('user', JSON.stringify(data.user));
        setIsEditing(false);
        setUpdateMessage('Profile updated successfully!');
        setEditForm({ name: '', username: '', email: '', password: '' });
        setTimeout(() => setUpdateMessage(''), 3000);
      } else {
        const errorData = await response.json();
        setUpdateMessage(errorData.error || 'Failed to update profile');
      }
    } catch (err) {
      console.error('Error updating profile:', err);
      setUpdateMessage('Error updating profile. Please try again.');
    }
  };

  if (loading) return <div className="loading">Loading profile...</div>;
  if (!user) return null;

  return (
    <div className="user-profile-page">
      <Header />

      <div className="profile-content">
        <div className="container">
          <div className="profile-header-section">
            <div className="profile-avatar">
              <span className="avatar-icon">👤</span>
            </div>
            {!isEditing ? (
              <div className="profile-info">
                <h1>{user.name}</h1>
                <p className="username">@{user.username}</p>
                <p className="email">{user.email}</p>
                {user.created_at && (
                  <p className="user-since">User since {new Date(user.created_at).toLocaleDateString('en-US', { year: 'numeric', month: 'long' })}</p>
                )}
                <button className="update-profile-btn" onClick={handleEditClick}>
                  Update Profile
                </button>
                {updateMessage && (
                  <p className={`update-message ${updateMessage.includes('successfully') ? 'success' : 'error'}`}>
                    {updateMessage}
                  </p>
                )}
              </div>
            ) : (
              <div className="profile-edit-form">
                <form onSubmit={handleUpdateProfile}>
                  <div className="form-group">
                    <label htmlFor="name">Name</label>
                    <input
                      type="text"
                      id="name"
                      value={editForm.name}
                      onChange={(e) => setEditForm({...editForm, name: e.target.value})}
                      required
                    />
                  </div>
                  <div className="form-group">
                    <label htmlFor="username">Username</label>
                    <input
                      type="text"
                      id="username"
                      value={editForm.username}
                      onChange={(e) => setEditForm({...editForm, username: e.target.value})}
                      required
                    />
                  </div>
                  <div className="form-group">
                    <label htmlFor="email">Email</label>
                    <input
                      type="email"
                      id="email"
                      value={editForm.email}
                      onChange={(e) => setEditForm({...editForm, email: e.target.value})}
                      required
                    />
                  </div>
                  <div className="form-group">
                    <label htmlFor="password">New Password (leave blank to keep current)</label>
                    <input
                      type="password"
                      id="password"
                      value={editForm.password}
                      onChange={(e) => setEditForm({...editForm, password: e.target.value})}
                      placeholder="Enter new password or leave blank"
                    />
                  </div>
                  {updateMessage && (
                    <p className={`update-message ${updateMessage.includes('successfully') ? 'success' : 'error'}`}>
                      {updateMessage}
                    </p>
                  )}
                  <div className="form-actions">
                    <button type="submit" className="save-btn">Save Changes</button>
                    <button type="button" className="cancel-btn" onClick={handleCancelEdit}>Cancel</button>
                  </div>
                </form>
              </div>
            )}
          </div>

          <div className="profile-sections">
            <section className="profile-section">
              <h2>Favorite Vendors</h2>
              {favorites.length === 0 ? (
                <p className="empty-state">You haven't favorited any vendors yet.</p>
              ) : (
                <div className="favorites-grid">
                  {favorites.map(fav => (
                    <div key={fav.vendor_id} className="favorite-card" onClick={() => navigate(`/vendor/${fav.vendor_id}`)}>
                      <h3>{fav.vendor_name}</h3>
                      <p className="vendor-cuisine">{fav.cuisine_type}</p>
                      <p className="vendor-location">{fav.location_category}</p>
                    </div>
                  ))}
                </div>
              )}
            </section>

            <section className="profile-section">
              <h2>My Reviews</h2>
              {reviews.length === 0 ? (
                <p className="empty-state">You haven't submitted any reviews yet.</p>
              ) : (
                <div className="reviews-list">
                  {reviews.map(review => (
                    <div key={review.review_id} className="review-card">
                      <div className="review-card-header">
                        <h3 onClick={() => navigate(`/vendor/${review.vendor_id}`)}>
                          {review.vendor_name}
                        </h3>
                        <span className="review-rating">{'⭐'.repeat(review.rating)}</span>
                        <button
                          className="delete-review-btn"
                          onClick={() => openDeleteModal(review.review_id)}
                          title="Delete this review"
                        >
                          Delete
                        </button>
                      </div>
                      <div className="review-card-meta">
                        <div className="review-meta-line">
                          <span className="review-label">Vendor:</span>
                          <span className="review-value">{review.vendor_name || 'Unknown'}</span>
                        </div>
                        <div className="review-meta-line">
                          <span className="review-label">Item:</span>
                          <span className="review-value">
                            {review.menu_item_name ? review.menu_item_name : 'General vendor review'}
                          </span>
                        </div>
                      </div>
                      <p className="review-comment">{review.comment}</p>
                      <p className="review-date">{new Date(review.created_at).toLocaleDateString()}</p>
                    </div>
                  ))}
                </div>
              )}
            </section>
          </div>
        </div>
      </div>

      {deleteModal.open && (
        <div className="modal-backdrop">
          <div className="modal">
            <h3>Delete Review</h3>
            <p>Are you sure you want to delete this review? This cannot be undone.</p>
            <div className="modal-actions">
              <button className="modal-cancel-btn" onClick={closeDeleteModal}>Cancel</button>
              <button className="modal-delete-btn" onClick={confirmDeleteReview}>Delete</button>
            </div>
          </div>
        </div>
      )}

      <Footer />
    </div>
  );
};

export default UserProfilePage;

