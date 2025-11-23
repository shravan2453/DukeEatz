import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './BrowseVendors.css';

const API_URL = 'http://127.0.0.1:5001';

const BrowseVendors = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [selectedCuisine, setSelectedCuisine] = useState('all');
  const [selectedPayment, setSelectedPayment] = useState('all');
  const [selectedDietary, setSelectedDietary] = useState('all');
  const [sortBy, setSortBy] = useState('name_asc');
  const [activeFilterType, setActiveFilterType] = useState('location'); // 'location', 'cuisine', 'payment', 'dietary'
  const [vendors, setVendors] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [user, setUser] = useState(null);
  const [showProfileMenu, setShowProfileMenu] = useState(false);

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
  }, []);

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
        if (selectedCuisine !== 'all') params.append('cuisine', selectedCuisine);
        if (selectedPayment !== 'all') params.append('payment_method', selectedPayment);
        if (selectedDietary !== 'all') params.append('dietary_tag', selectedDietary);
        params.append('sort_by', sortBy);
        
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
  }, [selectedCategory, selectedCuisine, selectedPayment, selectedDietary, searchQuery, sortBy]);

  // Handle category filter change
  const handleCategoryChange = (category) => {
    setSelectedCategory(category);
    // The useEffect will handle the refetch
  };

  // Handle sort change
  const handleSortChange = (e) => {
    setSortBy(e.target.value);
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
              : `No vendors found in ${formatText(selectedCategory)}.`}
          </p>
        </div>
      );
    }

    return (
      <div className="vendors-grid">
        {vendors.map((vendor) => (
          <div key={vendor.id} className="vendor-card" onClick={() => navigate(`/vendor/${vendor.id}`)}>
            <div className="vendor-image">
              {/* Add vendor image if available */}
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
            </div>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className="browse-vendors">
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

      {/* Main Content - Single Block */}
      <section className="main-content-section">
        <div className="main-content-wrapper">
            {/* Page Header */}
            <div className="page-header-section">
              <h2 className="page-title">Browse All Vendors</h2>
              <p className="page-description">
                Discover dining options across Duke's campus and surrounding areas
              </p>
            </div>
            
            {/* Search Bar */}
            <form className="search-form" onSubmit={(e) => e.preventDefault()}>
              <div className="search-container">
                <input
                  type="text"
                  placeholder="Search for vendors, cuisines, or menu items..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="search-input"
                />
                <button type="submit" className="search-btn">
                  Search
                </button>
              </div>
            </form>

            {/* Filters Section */}
            <div className="filters-content">
              {/* Filter Type Dropdown */}
              <div className="filter-section">
                <h3 className="filter-title">Filter by</h3>
                <select 
                  className="filter-type-select"
                  value={activeFilterType}
                  onChange={(e) => setActiveFilterType(e.target.value)}
                >
                  <option value="location">Location</option>
                  <option value="cuisine">Cuisine Type</option>
                  <option value="payment">Payment Method</option>
                  <option value="dietary">Dietary Options</option>
                </select>
              </div>

              {/* Dynamic Filter Options Based on Selection */}
              {activeFilterType === 'location' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Location</h3>
                  <div className="location-filters">
                    {[
                      { id: 'all', name: 'All Locations' },
                      { id: 'east_central_campus', name: 'East/Central' },
                      { id: 'west_campus', name: 'West Campus' },
                      { id: 'merchants_on_points', name: 'Merchants on Points' },
                      { id: 'food_trucks', name: 'Food Trucks' },
                      { id: 'off_campus', name: 'Off Campus' }
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
              )}

              {activeFilterType === 'cuisine' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Cuisine</h3>
                  <div className="location-filters">
                    {[
                      { id: 'all', name: 'All Cuisines' },
                      { id: 'american', name: 'American' },
                      { id: 'asian', name: 'Asian' },
                      { id: 'mexican', name: 'Mexican' },
                      { id: 'italian', name: 'Italian' },
                      { id: 'mediterranean', name: 'Mediterranean' },
                      { id: 'indian', name: 'Indian' },
                      { id: 'thai', name: 'Thai' },
                      { id: 'chinese', name: 'Chinese' },
                      { id: 'japanese', name: 'Japanese' },
                      { id: 'korean', name: 'Korean' },
                      { id: 'southern', name: 'Southern' },
                      { id: 'comfort_food', name: 'Comfort Food' },
                      { id: 'latin', name: 'Latin' },
                      { id: 'middle_eastern', name: 'Middle Eastern' },
                      { id: 'french', name: 'French' },
                      { id: 'vietnamese', name: 'Vietnamese' }
                    ].map(({ id, name }) => (
                      <button
                        key={id}
                        className={`location-filter-btn ${selectedCuisine === id ? 'active' : ''}`}
                        onClick={() => setSelectedCuisine(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {activeFilterType === 'payment' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Payment Method</h3>
                  <div className="location-filters">
                    {[
                      { id: 'all', name: 'All Payment Methods' },
                      { id: 'food_points', name: 'Food Points' },
                      { id: 'duke_card', name: 'Duke Card' },
                      { id: 'credit_card', name: 'Credit Card' },
                      { id: 'cash', name: 'Cash' },
                      { id: 'apple_pay', name: 'Apple Pay' },
                      { id: 'google_pay', name: 'Google Pay' },
                      { id: 'meal_swipe', name: 'Meal Swipe' },
                      { id: 'board_plan', name: 'Board Plan' }
                    ].map(({ id, name }) => (
                      <button
                        key={id}
                        className={`location-filter-btn ${selectedPayment === id ? 'active' : ''}`}
                        onClick={() => setSelectedPayment(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {activeFilterType === 'dietary' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Dietary Option</h3>
                  <div className="location-filters">
                    {[
                      { id: 'all', name: 'All Dietary Options' },
                      { id: 'vegetarian', name: 'Vegetarian' },
                      { id: 'vegan', name: 'Vegan' },
                      { id: 'gluten_free', name: 'Gluten Free' },
                      { id: 'nut_free', name: 'Nut Free' },
                      { id: 'dairy_free', name: 'Dairy Free' },
                      { id: 'halal', name: 'Halal' },
                      { id: 'kosher', name: 'Kosher' },
                      { id: 'organic', name: 'Organic' },
                      { id: 'local_sourced', name: 'Local Sourced' },
                      { id: 'sustainable', name: 'Sustainable' }
                    ].map(({ id, name }) => (
                      <button
                        key={id}
                        className={`location-filter-btn ${selectedDietary === id ? 'active' : ''}`}
                        onClick={() => setSelectedDietary(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {/* Sort Controls */}
              <div className="sort-section">
                <h3 className="filter-title">Sort by</h3>
                <select 
                  className="sort-select"
                  value={sortBy}
                  onChange={handleSortChange}
                >
                  <option value="name_asc">Alphabetical (A-Z)</option>
                  <option value="name_desc">Alphabetical (Z-A)</option>
                  <option value="location_asc">Location (A-Z)</option>
                  <option value="location_desc">Location (Z-A)</option>
                </select>
              </div>
            </div>

            {/* Vendors Section */}
            <div className="vendors-content-section">
              <div className="vendors-header">
                <h3 className="vendors-title">Available Vendors</h3>
                <div className="vendors-count-header">
                  <span>{vendors.length} {vendors.length === 1 ? 'vendor' : 'vendors'} found</span>
                </div>
              </div>
              {renderVendors()}
            </div>
          </div>
      </section>

      {/* Footer - matching LandingPage */}
      <footer className="footer">
        <div className="container">
          <p>&copy; 2024 DukeEatz. Built for the Duke community.</p>
        </div>
      </footer>
    </div>
  );
};

export default BrowseVendors;