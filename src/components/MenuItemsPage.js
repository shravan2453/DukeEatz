import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { formatText } from '../utils/formatText';
import './MenuItemsPage.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const MenuItemsPage = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const [vendor, setVendor] = useState(null);
  const [menuItems, setMenuItems] = useState([]);
  const [menuItemsWithReviews, setMenuItemsWithReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [user, setUser] = useState(null);
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
      
      // Fetch reviews for all menu items
      const reviewsResponse = await fetch(`${API_URL}/api/reviews`);
      if (reviewsResponse.ok) {
        const allReviews = await reviewsResponse.json();
        const itemsWithReviews = data.map(item => {
          const itemReviews = allReviews.filter(r => r.menu_item_id === item.menu_item_id);
          return {
            ...item,
            reviewCount: itemReviews.length,
            avgRating: itemReviews.length > 0 
              ? (itemReviews.reduce((sum, r) => sum + r.rating, 0) / itemReviews.length).toFixed(1)
              : null
          };
        });
        setMenuItemsWithReviews(itemsWithReviews);
      } else {
        setMenuItemsWithReviews(data.map(item => ({ ...item, reviewCount: 0, avgRating: null })));
      }
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

  // Get unique categories and meal types for filters
  const categories = ['all', ...new Set(menuItems.map(item => item.category).filter(Boolean))];
  const mealTypes = ['all', ...new Set(menuItems.map(item => item.meal_type).filter(Boolean))];

  // Filter menu items (use menuItemsWithReviews if available, otherwise menuItems)
  const itemsToFilter = menuItemsWithReviews.length > 0 ? menuItemsWithReviews : menuItems;
  const filteredItems = itemsToFilter.filter(item => {
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
      <Header />

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
                  {items.map((item, index) => (
                    <div 
                      key={item.menu_item_id} 
                      className="menu-item-card"
                      style={{ animationDelay: `${index * 0.05}s` }}
                    >
                      <div className="menu-item-image-container">
                        {item.image_url ? (
                          <img src={item.image_url} alt={item.name} className="menu-item-image" />
                        ) : (
                          <div className="menu-item-image-placeholder">
                            <span className="menu-item-icon">🍽️</span>
                          </div>
                        )}
                        {item.price && (
                          <div className="price-badge">
                            ${item.price.toFixed(2)}
                          </div>
                        )}
                      </div>
                      <div className="menu-item-info">
                        <div className="menu-item-header">
                          <h3>{item.name}</h3>
                          {item.meal_type && (
                            <span className="meal-type-badge">{formatText(item.meal_type)}</span>
                          )}
                        </div>
                        {item.description && (
                          <p className="menu-item-description">{item.description}</p>
                        )}
                        {item.dietary_tags && item.dietary_tags.length > 0 && (
                          <div className="menu-item-tags">
                            {item.dietary_tags.map((tag, idx) => (
                              <span key={idx} className="dietary-tag-small">
                                {formatText(tag)}
                              </span>
                            ))}
                          </div>
                        )}
                        <div className="menu-item-reviews-section">
                          <div className="reviews-info">
                            {item.reviewCount > 0 ? (
                              <div className="reviews-display">
                                <span className="reviews-count">
                                  ⭐ {item.avgRating} ({item.reviewCount} {item.reviewCount === 1 ? 'review' : 'reviews'})
                                </span>
                              </div>
                            ) : (
                              <span className="no-reviews-text">No reviews left</span>
                            )}
                          </div>
                          <button 
                            className="leave-review-btn"
                            onClick={(e) => {
                              e.stopPropagation();
                              navigate('/leave-review', {
                                state: {
                                  vendorId: id,
                                  menuItemId: item.menu_item_id,
                                  vendorName: vendor?.name,
                                  menuItemName: item.name
                                }
                              });
                            }}
                          >
                            Leave Review
                          </button>
                        </div>
                        <div className="menu-item-footer">
                          {item.price && (
                            <span className="menu-item-price-large">${item.price.toFixed(2)}</span>
                          )}
                        </div>
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

      <Footer />
    </div>
  );
};

export default MenuItemsPage;

