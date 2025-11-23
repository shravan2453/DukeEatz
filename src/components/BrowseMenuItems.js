import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './BrowseMenuItems.css';

const API_URL = 'http://127.0.0.1:5001';

const BrowseMenuItems = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedVendor, setSelectedVendor] = useState('all');
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [selectedMealType, setSelectedMealType] = useState('all');
  const [activeFilterType, setActiveFilterType] = useState('vendor');
  const [menuItems, setMenuItems] = useState([]);
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
    fetchVendors();
  }, []);

  // Fetch vendors for filter
  const fetchVendors = async () => {
    try {
      const response = await fetch(`${API_URL}/api/vendors`);
      if (response.ok) {
        const data = await response.json();
        setVendors(data);
      }
    } catch (err) {
      console.error('Error fetching vendors:', err);
    }
  };

  // Fetch menu items from backend
  useEffect(() => {
    const fetchMenuItems = async () => {
      try {
        setLoading(true);
        setError(null);
        
        // Build query parameters
        const params = new URLSearchParams();
        if (searchQuery) params.append('q', searchQuery);
        if (selectedVendor !== 'all') params.append('vendor_id', selectedVendor);
        if (selectedCategory !== 'all') params.append('category', selectedCategory);
        if (selectedMealType !== 'all') params.append('meal_type', selectedMealType);
        
        const url = `${API_URL}/api/menu-items${params.toString() ? `?${params.toString()}` : ''}`;
        
        const response = await fetch(url);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setMenuItems(data);
      } catch (err) {
        console.error("Error fetching menu items:", err);
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchMenuItems();
  }, [selectedVendor, selectedCategory, selectedMealType, searchQuery]);

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

  // Get unique categories and meal types
  const categories = ['all', ...new Set(menuItems.map(item => item.category).filter(Boolean))];
  const mealTypes = ['all', ...new Set(menuItems.map(item => item.meal_type).filter(Boolean))];

  // Render menu item cards
  const renderMenuItems = () => {
    if (loading) {
      return <div className="loading">Loading menu items...</div>;
    }

    if (error) {
      return <div className="error">Error: {error}</div>;
    }

    if (menuItems.length === 0) {
      return (
        <div className="empty-state">
          <div className="empty-state-icon">🍽️</div>
          <h3 className="empty-state-title">No menu items found</h3>
          <p className="empty-state-description">
            Try adjusting your filters or search query.
          </p>
        </div>
      );
    }

    return (
      <div className="menu-items-grid">
        {menuItems.map((item) => (
          <div 
            key={item.menu_item_id} 
            className="menu-item-card"
            onClick={() => navigate(`/vendor/${item.vendor_id}`)}
          >
            <div className="menu-item-image">
              {item.image_url ? (
                <img src={item.image_url} alt={item.name} />
              ) : (
                <div className="menu-item-image-placeholder">
                  {item.name.charAt(0)}
                </div>
              )}
            </div>
            <div className="menu-item-info">
              <h3>{item.name}</h3>
              <p className="menu-item-description">{item.description || 'No description available'}</p>
              <div className="menu-item-vendor">
                <span className="vendor-name">{item.vendor_name}</span>
                {item.vendor_location && (
                  <span className="vendor-location">{formatText(item.vendor_location)}</span>
                )}
              </div>
              <div className="menu-item-tags-container">
                {item.category && (
                  <div className="menu-item-tags-row">
                    <span className="tag-label">Category:</span>
                    <span className="tag category">{formatText(item.category)}</span>
                  </div>
                )}
                {item.meal_type && (
                  <div className="menu-item-tags-row">
                    <span className="tag-label">Meal:</span>
                    <span className="tag meal-type">{formatText(item.meal_type)}</span>
                  </div>
                )}
                {item.dietary_tags && item.dietary_tags.length > 0 && (
                  <div className="menu-item-tags-row">
                    <span className="tag-label">Dietary:</span>
                    <div className="dietary-tags-group">
                      {item.dietary_tags.slice(0, 3).map((tag, index) => (
                        <span key={index} className="dietary-tag">{formatText(tag)}</span>
                      ))}
                      {item.dietary_tags.length > 3 && (
                        <span className="dietary-tag">+{item.dietary_tags.length - 3}</span>
                      )}
                    </div>
                  </div>
                )}
              </div>
              <div className="menu-item-rating">
                <div className="rating-stars">
                  {item.avg_rating > 0 ? (
                    <>
                      <span className="stars">
                        {'⭐'.repeat(Math.round(item.avg_rating))}
                        {'☆'.repeat(5 - Math.round(item.avg_rating))}
                      </span>
                      <span className="rating-value">{item.avg_rating.toFixed(1)}</span>
                      <span className="rating-count">
                        ({item.review_count} {item.review_count === 1 ? 'review' : 'reviews'})
                      </span>
                    </>
                  ) : (
                    <>
                      <span className="stars empty-stars">☆☆☆☆☆</span>
                      <span className="rating-value">0.0</span>
                      <span className="rating-count">(No reviews left)</span>
                    </>
                  )}
                </div>
                {item.price && (
                  <div className="menu-item-price">${item.price.toFixed(2)}</div>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className="browse-menu-items">
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
              <h2 className="page-title">Browse All Menu Items</h2>
              <p className="page-description">
                Discover menu items from dining options across Duke's campus with reviews and ratings
              </p>
            </div>
            
            {/* Search Bar */}
            <form className="search-form" onSubmit={(e) => e.preventDefault()}>
              <div className="search-container">
                <input
                  type="text"
                  placeholder="Search for menu items..."
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
                  <option value="vendor">Restaurant/Dining Option</option>
                  <option value="category">Category</option>
                  <option value="meal_type">Meal Type</option>
                </select>
              </div>

              {/* Dynamic Filter Options Based on Selection */}
              {activeFilterType === 'vendor' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Restaurant/Dining Option</h3>
                  <div className="location-filters">
                    <button
                      className={`location-filter-btn ${selectedVendor === 'all' ? 'active' : ''}`}
                      onClick={() => setSelectedVendor('all')}
                    >
                      All Restaurants
                    </button>
                    {vendors.map((vendor) => (
                      <button
                        key={vendor.id}
                        className={`location-filter-btn ${selectedVendor === vendor.id ? 'active' : ''}`}
                        onClick={() => setSelectedVendor(vendor.id)}
                      >
                        {vendor.name}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {activeFilterType === 'category' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Category</h3>
                  <div className="location-filters">
                    {categories.map((cat) => (
                      <button
                        key={cat}
                        className={`location-filter-btn ${selectedCategory === cat ? 'active' : ''}`}
                        onClick={() => setSelectedCategory(cat)}
                      >
                        {cat === 'all' ? 'All Categories' : formatText(cat)}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {activeFilterType === 'meal_type' && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Meal Type</h3>
                  <div className="location-filters">
                    {mealTypes.map((type) => (
                      <button
                        key={type}
                        className={`location-filter-btn ${selectedMealType === type ? 'active' : ''}`}
                        onClick={() => setSelectedMealType(type)}
                      >
                        {type === 'all' ? 'All Meal Types' : formatText(type)}
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>

            {/* Menu Items Grid */}
            <div className="vendors-content-section">
              {renderMenuItems()}
            </div>
        </div>
      </section>
    </div>
  );
};

export default BrowseMenuItems;

