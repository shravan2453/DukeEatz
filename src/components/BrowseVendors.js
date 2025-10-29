import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './BrowseVendors.css';

const API_URL = 'http://127.0.0.1:5000';  // Update if your backend runs on a different port

const BrowseVendors = () => {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [vendors, setVendors] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Fetch vendors from backend
  useEffect(() => {
    const fetchVendors = async () => {
      try {
        setLoading(true);
        setError(null);
        
        // Build query parameters
        const params = new URLSearchParams();
        if (searchQuery) params.append('q', searchQuery);
        if (selectedCategory !== 'all') params.append('location', selectedCategory);
        
        const url = `${API_URL}/api/vendors${params.toString() ? `?${params.toString()}` : ''}`;
        
        const response = await fetch(url);
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
  }, [selectedCategory, searchQuery]);  // Refetch when category or search query changes

  // Handle search
  const handleSearch = async (e) => {
    e.preventDefault();
    if (!searchQuery.trim()) return;
    
    try {
      const response = await fetch(`${API_URL}/vendors?q=${encodeURIComponent(searchQuery)}`);
      const data = await response.json();
      setVendors(data);
    } catch (err) {
      console.error("Search error:", err);
      setError("Failed to search vendors");
    }
  };

  // Handle category filter change
  const handleCategoryChange = (category) => {
    setSelectedCategory(category);
    // The useEffect will handle the refetch
  };

  // Handle back to home
  const handleBackToHome = () => {
    navigate('/');
  };

  // Handle sign in
  const handleSignIn = () => {
    console.log('Navigate to sign in');
  };

  // Handle sign up
  const handleSignUp = () => {
    console.log('Navigate to sign up');
  };

  // Render vendor cards
  const renderVendors = () => {
    if (loading) {
      return <div className="loading">Loading vendors...</div>;
    }

    if (error) {
      return <div className="error">Error: {error}</div>;
    }

    if (vendors.length === 0) {
      return (
        <div className="empty-state">
          <div className="empty-state-icon">🍽️</div>
          <h3 className="empty-state-title">No vendors found</h3>
          <p className="empty-state-description">
            {selectedCategory === 'all' 
              ? "No vendors are currently available." 
              : `No vendors found in ${selectedCategory.replace('_', ' ')}.`}
          </p>
        </div>
      );
    }

    return (
      <div className="vendors-grid">
        {vendors.map((vendor) => (
          <div key={vendor.id} className="vendor-card">
            <div className="vendor-image">
              {/* Add vendor image if available */}
              <div className="vendor-image-placeholder">
                {vendor.name.charAt(0)}
              </div>
            </div>
            <div className="vendor-info">
              <h3>{vendor.name}</h3>
              <p className="vendor-description">{vendor.description}</p>
              <div className="vendor-tags">
                <span className="tag location">{vendor.location.replace(/_/g, ' ')}</span>
                <span className="tag cuisine">{vendor.cuisine.replace(/_/g, ' ')}</span>
              </div>
              <div className="vendor-tags">
                {vendor.dietary_tags && vendor.dietary_tags.map((tag, index) => (
                  <span key={index} className="dietary-tag">{tag}</span>
                ))}
              </div>
            </div>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className="browse-vendors">
      {/* Header */}
      <header className="header">
        <div className="container">
          <div className="logo" onClick={handleBackToHome} style={{ cursor: 'pointer' }}>
            <div className="dukeeatz-brand">
              <h1>DukeEatz</h1>
              <p className="tagline">Your Duke Dining Guide</p>
            </div>
          </div>
          <nav className="nav">
            <button className="nav-btn active">Browse Vendors</button>
            <button className="nav-btn" onClick={handleSignIn}>Log In</button>
            <button className="nav-btn primary" onClick={handleSignUp}>Sign Up</button>
          </nav>
        </div>
      </header>

      {/* Main Content */}
      <main className="main-content">
        <div className="container">
          {/* Breadcrumb */}
          <div className="breadcrumb">
            <button className="breadcrumb-link" onClick={handleBackToHome}>
              <span className="breadcrumb-arrow">←</span> Home
            </button>
            <span className="breadcrumb-separator">/</span>
            <span className="breadcrumb-current">Browse Vendors</span>
          </div>

          {/* Page Header */}
          <div className="page-header">
            <h1 className="page-title">Browse All Vendors</h1>
            <p className="page-description">
              Discover dining options across Duke's campus and surrounding areas
            </p>
          </div>

          {/* Search and Filter Section */}
          <section className="search-filter-section">
            <form className="search-form" onSubmit={handleSearch}>
              <div className="search-container">
                <div className="search-icon">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M11 19C15.4183 19 19 15.4183 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                    <path d="M21 21L16.65 16.65" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                  </svg>
                </div>
                <input
                  type="text"
                  placeholder="Search vendors, cuisines, or menu items..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="search-input"
                />
                {searchQuery && (
                  <button type="button" className="clear-search" onClick={() => setSearchQuery('')}>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M18 6L6 18M6 6L18 18" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                    </svg>
                  </button>
                )}
                <button type="submit" className="search-btn">Search</button>
              </div>
            </form>

            {/* Category Filter */}
            <div className="filter-section">
              <div className="filter-header">
                <span className="filter-label">Filter by Location:</span>
              </div>
              <div className="location-filters">
                {[
                  { id: 'all', name: 'All Locations' },
                  { id: 'east_central_campus', name: 'East/Central' },
                  { id: 'west_campus', name: 'West Campus' },
                  { id: 'merchants_on_points', name: 'Merchants on Points' },
                  { id: 'food_trucks', name: 'Food Trucks' }
                ].map(({ id, name }) => (
                  <button
                    key={id}
                    className={`location-filter-btn ${selectedCategory === id ? 'active' : ''}`}
                    onClick={() => handleCategoryChange(id)}
                  >
                    {name}
                  </button>
                ))}
              </div>
            </div>
          </section>

          {/* Vendors Section */}
          <section className="vendors-section">
            <div className="vendors-header">
              <h2 className="vendors-title">Available Vendors</h2>
              <div className="vendors-count">
                <span>{vendors.length} {vendors.length === 1 ? 'vendor' : 'vendors'} found</span>
              </div>
            </div>

            {renderVendors()}
          </section>
        </div>
      </main>

      {/* Footer */}
      <footer className="footer">
        <div className="container">
          <p>&copy; 2024 DukeEatz. Built for the Duke community.</p>
        </div>
      </footer>
    </div>
  );
};

export default BrowseVendors;