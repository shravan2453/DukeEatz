const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:5001/api';

// Reviews API
export const reviewsAPI = {
  // Create a new review
  createReview: async (reviewData) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(reviewData),
        credentials: 'include',
      });
      
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to create review');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error creating review:', error);
      throw error;
    }
  },

  // Get all reviews for a vendor
  getVendorReviews: async (vendorId) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews/vendor/${vendorId}`);
      
      if (!response.ok) {
        throw new Error('Failed to fetch reviews');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error fetching vendor reviews:', error);
      throw error;
    }
  },

  // Get all reviews by a user
  getUserReviews: async (userId) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews/user/${userId}`);
      
      if (!response.ok) {
        throw new Error('Failed to fetch user reviews');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error fetching user reviews:', error);
      throw error;
    }
  },

  // Get a specific review
  getReview: async (reviewId) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews/${reviewId}`);
      
      if (!response.ok) {
        throw new Error('Failed to fetch review');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error fetching review:', error);
      throw error;
    }
  },

  // Update a review
  updateReview: async (reviewId, reviewData) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews/${reviewId}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(reviewData),
        credentials: 'include',
      });
      
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to update review');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error updating review:', error);
      throw error;
    }
  },

  // Delete a review
  deleteReview: async (reviewId) => {
    try {
      const response = await fetch(`${API_BASE_URL}/reviews/${reviewId}`, {
        method: 'DELETE',
        credentials: 'include',
      });
      
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to delete review');
      }
      
      return await response.json();
    } catch (error) {
      console.error('Error deleting review:', error);
      throw error;
    }
  },
};

export default reviewsAPI;
