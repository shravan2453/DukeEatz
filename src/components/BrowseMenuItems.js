import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import Fuse from 'fuse.js';
import { formatText } from '../utils/formatText';
import './BrowseMenuItems.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const BrowseMenuItems = () => {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedVendors, setSelectedVendors] = useState([]); // Multi-select
  const [selectedCategories, setSelectedCategories] = useState([]); // Multi-select
  const [selectedMealTypes, setSelectedMealTypes] = useState([]); // Multi-select
  const [activeFilterTypes, setActiveFilterTypes] = useState({
    vendor: true,
    category: false,
    mealType: false
  }); // Multiple filter types can be active at once
  const [sortBy, setSortBy] = useState('name_asc');
  const [vendors, setVendors] = useState([]);
  const [menuItems, setMenuItems] = useState([]);
  const [allMenuItems, setAllMenuItems] = useState([]); // Store all items for fuzzy search
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Apply filters function (shared for search/no-search)
  const applyFilters = useCallback((itemsToFilter) => {
    let filtered = [...itemsToFilter];
    
    // Apply multi-select filters
    if (selectedVendors.length > 0) {
      filtered = filtered.filter(item => selectedVendors.includes(item.vendor_id));
    }
    if (selectedCategories.length > 0) {
      filtered = filtered.filter(item => selectedCategories.includes(item.category));
    }
    if (selectedMealTypes.length > 0) {
      filtered = filtered.filter(item => selectedMealTypes.includes(item.meal_type));
    }
    
    // Apply sorting
    if (sortBy === 'rating_desc') {
      filtered.sort((a, b) => (b.avg_rating || 0) - (a.avg_rating || 0));
    } else if (sortBy === 'rating_asc') {
      filtered.sort((a, b) => (a.avg_rating || 0) - (b.avg_rating || 0));
    } else if (sortBy === 'name_asc') {
      filtered.sort((a, b) => a.name.localeCompare(b.name));
    } else if (sortBy === 'name_desc') {
      filtered.sort((a, b) => b.name.localeCompare(a.name));
    } else if (sortBy === 'price_asc') {
      filtered.sort((a, b) => (a.price || 0) - (b.price || 0));
    } else if (sortBy === 'price_desc') {
      filtered.sort((a, b) => (b.price || 0) - (a.price || 0));
    } else if (sortBy === 'category_asc') {
      filtered.sort((a, b) => (a.category || '').localeCompare(b.category || ''));
    } else if (sortBy === 'category_desc') {
      filtered.sort((a, b) => (b.category || '').localeCompare(a.category || ''));
    } else if (sortBy === 'vendor_asc') {
      filtered.sort((a, b) => (a.vendor_name || '').localeCompare(b.vendor_name || ''));
    } else if (sortBy === 'vendor_desc') {
      filtered.sort((a, b) => (b.vendor_name || '').localeCompare(a.vendor_name || ''));
    }
    
    return filtered;
  }, [selectedVendors, selectedCategories, selectedMealTypes, sortBy]);

  const fetchVendors = useCallback(async () => {
    try {
      const response = await fetch(`${API_URL}/api/vendors?sort_by=name_asc`);
      if (!response.ok) throw new Error('Failed to fetch vendors');
      const data = await response.json();
      // Remove duplicates by vendor ID
      const uniqueVendors = Array.from(
        new Map(data.map(vendor => [vendor.id, vendor])).values()
      );
      setVendors(uniqueVendors);
    } catch (err) {
      console.error('Error fetching vendors:', err);
    }
  }, []);

  const fetchMenuItems = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      
      // Don't send search query to backend - we'll use fuzzy search on frontend
      const params = new URLSearchParams();
      // For multi-select, we'll filter on frontend after fetching
      params.append('sort_by', sortBy);
      
      const url = `${API_URL}/api/menu-items${params.toString() ? `?${params.toString()}` : ''}`;
      
      const response = await fetch(url);
      if (!response.ok) throw new Error('Failed to fetch menu items');
      const data = await response.json();
      setAllMenuItems(data); // Store all items
      // Don't set menuItems here - let the useEffect handle filtering
    } catch (err) {
      console.error('Error fetching menu items:', err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [sortBy]);

  // Fetch vendors on load
  useEffect(() => {
    fetchVendors();
  }, [fetchVendors]);

  // Fetch menu items on load and when sort changes
  useEffect(() => {
    fetchMenuItems();
  }, [fetchMenuItems]);

  // Apply filters and search whenever data, search, or filters change
  useEffect(() => {
    if (allMenuItems.length === 0) {
      return;
    }

    let filteredItems = allMenuItems;

    // Apply fuzzy search if there's a search query
    if (searchQuery) {
      const fuseOptions = {
        keys: [
          { name: 'name', weight: 0.7 },
          { name: 'description', weight: 0.3 },
          { name: 'vendor_name', weight: 0.2 },
          { name: 'category', weight: 0.1 }
        ],
        threshold: 0.4,
        includeScore: true,
        minMatchCharLength: 2
      };
      const fuse = new Fuse(allMenuItems, fuseOptions);
      const results = fuse.search(searchQuery);
      filteredItems = results.map(result => result.item);
    }
    
    // Always apply filters (whether or not there's a search query)
    const finalFiltered = applyFilters(filteredItems);
    setMenuItems(finalFiltered);
  }, [searchQuery, allMenuItems, applyFilters, selectedVendors, selectedCategories, selectedMealTypes]);

  // Get unique categories and meal types from all items
  const categories = [...new Set(allMenuItems.map(item => item.category).filter(Boolean))];
  const mealTypes = [...new Set(allMenuItems.map(item => item.meal_type).filter(Boolean))];

  // Toggle functions for multi-select
  const toggleVendor = (vendorId) => {
    setSelectedVendors(prev => 
      prev.includes(vendorId) 
        ? prev.filter(id => id !== vendorId)
        : [...prev, vendorId]
    );
  };

  const toggleCategory = (category) => {
    setSelectedCategories(prev => 
      prev.includes(category) 
        ? prev.filter(c => c !== category)
        : [...prev, category]
    );
  };

  const toggleMealType = (mealType) => {
    setSelectedMealTypes(prev => 
      prev.includes(mealType) 
        ? prev.filter(m => m !== mealType)
        : [...prev, mealType]
    );
  };

  // Toggle filter type visibility
  const toggleFilterType = (filterType) => {
    setActiveFilterTypes(prev => ({
      ...prev,
      [filterType]: !prev[filterType]
    }));
  };

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
          <div key={item.id} className="menu-item-card" onClick={() => navigate(`/vendor/${item.vendor_id}/menu`)}>
            <div className="menu-item-image">
              <div className="menu-item-image-placeholder">
                {item.name.charAt(0)}
              </div>
            </div>
            <div className="menu-item-info">
              <h3>{item.name}</h3>
              <p className="menu-item-vendor">{item.vendor_name}</p>
              <div className="menu-item-rating-display">
                {item.avg_rating && item.avg_rating > 0 ? (
                  <>
                    <span className="menu-item-rating-stars">
                      {'⭐'.repeat(Math.round(item.avg_rating))}
                    </span>
                    <span className="menu-item-rating-value">{item.avg_rating.toFixed(1)}</span>
                  </>
                ) : (
                  <span className="menu-item-rating-none">No rating yet</span>
                )}
              </div>
              <p className="menu-item-description">{item.description}</p>
              <div className="menu-item-details">
                <span className="menu-item-price">${item.price?.toFixed(2) || 'N/A'}</span>
                {item.category && (
                  <span className="menu-item-category">{formatText(item.category)}</span>
                )}
              </div>
              {item.dietary_tags && item.dietary_tags.length > 0 && (
                <div className="menu-item-tags">
                  {item.dietary_tags.map((tag, index) => (
                    <span key={index} className="dietary-tag">{formatText(tag)}</span>
                  ))}
                </div>
              )}
            </div>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className="browse-menu-items">
      <Header />

      {/* Main Content - Single Block */}
      <section className="main-content-section">
        <div className="main-content-wrapper">
          {/* Page Header */}
          <div className="page-header-section">
            <h2 className="page-title">Browse Menu Items</h2>
            <p className="page-description">
              Explore dishes from all Duke dining locations
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
            {/* Filter Type Checkboxes */}
            <div className="filter-section">
              <h3 className="filter-title">Enable Filter Types</h3>
              <div className="filter-type-checkboxes">
                <label className="filter-type-checkbox">
                  <input
                    type="checkbox"
                    checked={activeFilterTypes.vendor}
                    onChange={() => toggleFilterType('vendor')}
                  />
                  <span>Vendor</span>
                </label>
                <label className="filter-type-checkbox">
                  <input
                    type="checkbox"
                    checked={activeFilterTypes.category}
                    onChange={() => toggleFilterType('category')}
                  />
                  <span>Category</span>
                </label>
                <label className="filter-type-checkbox">
                  <input
                    type="checkbox"
                    checked={activeFilterTypes.mealType}
                    onChange={() => toggleFilterType('mealType')}
                  />
                  <span>Meal Type</span>
                </label>
              </div>
            </div>

            {/* Show all enabled filter types simultaneously */}
            {activeFilterTypes.vendor && (
              <div className="filter-section">
                <h3 className="filter-title">Select Vendors (Multi-select)</h3>
                <div className="location-filters">
                  {vendors.map(vendor => (
                    <button
                      key={vendor.id}
                      className={`location-filter-btn ${selectedVendors.includes(vendor.id) ? 'active' : ''}`}
                      onClick={() => toggleVendor(vendor.id)}
                    >
                      {vendor.name}
                    </button>
                  ))}
                </div>
                {selectedVendors.length > 0 && (
                  <button 
                    className="clear-filters-btn"
                    onClick={() => setSelectedVendors([])}
                  >
                    Clear Vendor Filters
                  </button>
                )}
              </div>
            )}

            {activeFilterTypes.category && (
              <div className="filter-section">
                <h3 className="filter-title">Select Categories (Multi-select)</h3>
                <div className="location-filters">
                  {categories.map(category => (
                    <button
                      key={category}
                      className={`location-filter-btn ${selectedCategories.includes(category) ? 'active' : ''}`}
                      onClick={() => toggleCategory(category)}
                    >
                      {formatText(category)}
                    </button>
                  ))}
                </div>
                {selectedCategories.length > 0 && (
                  <button 
                    className="clear-filters-btn"
                    onClick={() => setSelectedCategories([])}
                  >
                    Clear Category Filters
                  </button>
                )}
              </div>
            )}

            {activeFilterTypes.mealType && (
              <div className="filter-section">
                <h3 className="filter-title">Select Meal Types (Multi-select)</h3>
                <div className="location-filters">
                  {mealTypes.map(mealType => (
                    <button
                      key={mealType}
                      className={`location-filter-btn ${selectedMealTypes.includes(mealType) ? 'active' : ''}`}
                      onClick={() => toggleMealType(mealType)}
                    >
                      {formatText(mealType)}
                    </button>
                  ))}
                </div>
                {selectedMealTypes.length > 0 && (
                  <button 
                    className="clear-filters-btn"
                    onClick={() => setSelectedMealTypes([])}
                  >
                    Clear Meal Type Filters
                  </button>
                )}
              </div>
            )}

            <div className="filter-section">
              <h3 className="filter-title">Sort By</h3>
              <select 
                className="filter-type-select"
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
              >
                <option value="name_asc">Name (A-Z)</option>
                <option value="name_desc">Name (Z-A)</option>
                <option value="rating_desc">Rating (High to Low)</option>
                <option value="rating_asc">Rating (Low to High)</option>
                <option value="price_asc">Price (Low to High)</option>
                <option value="price_desc">Price (High to Low)</option>
                <option value="category_asc">Category (A-Z)</option>
                <option value="category_desc">Category (Z-A)</option>
                <option value="vendor_asc">Vendor (A-Z)</option>
                <option value="vendor_desc">Vendor (Z-A)</option>
              </select>
            </div>
          </div>

          {/* Menu Items Section */}
          <div className="vendors-content-section">
            <div className="vendors-header">
              <h3 className="vendors-title">Available Items</h3>
              <div className="vendors-count-header">
                <span>{menuItems.length} {menuItems.length === 1 ? 'item' : 'items'} found</span>
              </div>
            </div>
            {renderMenuItems()}
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default BrowseMenuItems;
