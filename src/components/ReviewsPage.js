import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './ReviewsPage.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const ReviewsPage = () => {
  const navigate = useNavigate();
  const [vendors, setVendors] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchVendors = async () => {
      try {
        setLoading(true);
        setError(null);
        const response = await fetch(`${API_URL}/api/vendors`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setVendors(data);
      } catch (err) {
        console.error("Error fetching vendors:", err);
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchVendors();
  }, []);

  const handleVendorClick = (vendorId) => {
    navigate(`/vendor/${vendorId}/reviews`);
  };

  const filteredVendors = vendors.filter(vendor => {
    if (!searchQuery) return true;
    const query = searchQuery.toLowerCase();
    return (
      vendor.name.toLowerCase().includes(query) ||
      vendor.description?.toLowerCase().includes(query) ||
      formatText(vendor.location).toLowerCase().includes(query) ||
      formatText(vendor.cuisine).toLowerCase().includes(query)
    );
  });

  return (
    <div className="reviews-page">
      <Header />

      <section className="main-content-section">
          <div className="main-content-wrapper">
            <div className="page-header-section">
              <h2 className="page-title">Browse Reviews</h2>
              <p className="page-description">
                Select a vendor to view all reviews and ratings
              </p>
            </div>

            <form className="search-form" onSubmit={(e) => e.preventDefault()}>
              <div className="search-container">
                <input
                  type="text"
                  placeholder="Search for vendors..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="search-input"
                />
                <button type="submit" className="search-btn">
                  Search
                </button>
              </div>
            </form>

            <div className="vendors-content-section">
              <div className="vendors-header">
                <h3 className="vendors-title">Select a Vendor</h3>
                <div className="vendors-count-header">
                  <span>{filteredVendors.length} {filteredVendors.length === 1 ? 'vendor' : 'vendors'} found</span>
                </div>
              </div>

              {loading ? (
                <div className="loading">Loading vendors...</div>
              ) : error ? (
                <div className="error">Error: {error}</div>
              ) : filteredVendors.length === 0 ? (
                <div className="empty-state">
                  <div className="empty-state-icon">🍽️</div>
                  <h3 className="empty-state-title">No vendors found</h3>
                  <p className="empty-state-description">
                    {searchQuery 
                      ? `No vendors match "${searchQuery}".` 
                      : "No vendors are currently available."}
                  </p>
                </div>
              ) : (
                <div className="vendors-grid">
                  {filteredVendors.map((vendor) => (
                    <div 
                      key={vendor.id} 
                      className="vendor-card" 
                      onClick={() => handleVendorClick(vendor.id)}
                    >
                      <div className="vendor-image">
                        <div className="vendor-image-placeholder">
                          {vendor.name.charAt(0)}
                        </div>
                      </div>
                      <div className="vendor-info">
                        <h3>{vendor.name}</h3>
                        <p className="vendor-description">{vendor.description}</p>
                        <div className="vendor-tags-container">
                          <div className="vendor-tags-row">
                            <span className="tag-label">Location:</span>
                            <span className="tag location">{formatText(vendor.location)}</span>
                          </div>
                          <div className="vendor-tags-row">
                            <span className="tag-label">Cuisine:</span>
                            <span className="tag cuisine">{formatText(vendor.cuisine)}</span>
                          </div>
                          {vendor.dietary_tags && vendor.dietary_tags.length > 0 && (
                            <div className="vendor-tags-row">
                              <span className="tag-label">Dietary:</span>
                              <div className="dietary-tags-group">
                                {vendor.dietary_tags.map((tag, index) => (
                                  <span key={index} className="dietary-tag">{formatText(tag)}</span>
                                ))}
                              </div>
                            </div>
                          )}
                        </div>
                        <div className="view-reviews-hint">
                          Click to view reviews →
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
      </section>

      <Footer />
    </div>
  );
};

export default ReviewsPage;
