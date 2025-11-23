import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './MenuItemsPage.css';

const API_URL = 'http://127.0.0.1:5001';

const MenuItemsPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { id } = useParams();
  const [vendor, setVendor] = useState(null);
  const [menuItems, setMenuItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [user, setUser] = useState(null);
  const [showProfileMenu, setShowProfileMenu] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [filterCategory, setFilterCategory] = useState('all');
  const [filterMealType, setFilterMealType] = useState('all');

  const fetchVendor = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/vendors`);
      if (!response.ok) throw new Error('Failed to fetch vendors');
      const vendors = await response.json();
      const foundVendor = vendors.find(v => v.id === id);
      if (!foundVendor) throw new Error('Vendor not found');
      setVendor(foundVendor);
    } catch (err) {
      setError(err.message);
    }
  }, [id]);

  const fetchMenuItems = useCallback(async () => {
    try {
      setLoading(true);
      const response = await fetch(`${API_URL}/api/menu-items/vendor/${id}`);
      if (!response.ok) throw new Error('Failed to fetch menu items');
      const data = await response.json();
      setMenuItems(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [id]);

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
    fetchVendor();
    fetchMenuItems();
  }, [id, fetchVendor, fetchMenuItems]);

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

  // Get unique categories and meal types for filters
  const categories = ['all', ...new Set(menuItems.map(item => item.category).filter(Boolean))];
  const mealTypes = ['all', ...new Set(menuItems.map(item => item.meal_type).filter(Boolean))];

  // Filter menu items
  const filteredItems = menuItems.filter(item => {
    const matchesSearch = !searchQuery || 
      item.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (item.description && item.description.toLowerCase().includes(searchQuery.toLowerCase()));
    const matchesCategory = filterCategory === 'all' || item.category === filterCategory;
    const matchesMealType = filterMealType === 'all' || item.meal_type === filterMealType;
    return matchesSearch && matchesCategory && matchesMealType;
  });

  // Group items by category
  const groupedItems = filteredItems.reduce((acc, item) => {
    const category = item.category || 'Other';
    if (!acc[category]) {
      acc[category] = [];
    }
    acc[category].push(item);
    return acc;
  }, {});

  if (loading) return <div className="loading">Loading menu items...</div>;
  if (error) return <div className="error">Error: {error}</div>;
  if (!vendor) return <div className="error">Vendor not found</div>;

  return (
    <div className="menu-items-page">
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

      <div className="menu-items-content">
        <div className="container">
          <div className="menu-header">
            <button className="back-btn" onClick={() => navigate(`/vendor/${id}`)}>
              ← Back to {vendor.name}
            </button>
            <h1>{vendor.name} - Menu</h1>
          </div>

          {/* Search and Filters */}
          <div className="menu-filters">
            <div className="search-box">
              <input
                type="text"
                placeholder="Search menu items..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="search-input"
              />
            </div>
            <div className="filter-controls">
              <select
                value={filterCategory}
                onChange={(e) => setFilterCategory(e.target.value)}
                className="filter-select"
              >
                {categories.map(cat => (
                  <option key={cat} value={cat}>
                    {cat === 'all' ? 'All Categories' : formatText(cat)}
                  </option>
                ))}
              </select>
              <select
                value={filterMealType}
                onChange={(e) => setFilterMealType(e.target.value)}
                className="filter-select"
              >
                {mealTypes.map(type => (
                  <option key={type} value={type}>
                    {type === 'all' ? 'All Meal Types' : formatText(type)}
                  </option>
                ))}
              </select>
            </div>
          </div>

          {/* Menu Items by Category */}
          {Object.keys(groupedItems).length > 0 ? (
            Object.entries(groupedItems).map(([category, items]) => (
              <section key={category} className="menu-category-section">
                <h2 className="category-title">{formatText(category)}</h2>
                <div className="menu-items-grid">
                  {items.map((item) => (
                    <div key={item.menu_item_id} className="menu-item-card">
                      {item.image_url && (
                        <img src={item.image_url} alt={item.name} className="menu-item-image" />
                      )}
                      <div className="menu-item-info">
                        <h3>{item.name}</h3>
                        {item.description && (
                          <p className="menu-item-description">{item.description}</p>
                        )}
                        <div className="menu-item-meta">
                          {item.price && (
                            <span className="menu-item-price">${item.price.toFixed(2)}</span>
                          )}
                          {item.meal_type && (
                            <span className="menu-item-meal-type">{formatText(item.meal_type)}</span>
                          )}
                        </div>
                        {item.dietary_tags && item.dietary_tags.length > 0 && (
                          <div className="menu-item-tags">
                            {item.dietary_tags.map((tag, idx) => (
                              <span key={idx} className="dietary-tag-small">
                                {formatText(tag)}
                              </span>
                            ))}
                          </div>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              </section>
            ))
          ) : (
            <div className="no-items">
              <p>No menu items found matching your criteria.</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default MenuItemsPage;

