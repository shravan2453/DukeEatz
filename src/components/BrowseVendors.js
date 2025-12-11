import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import Fuse from 'fuse.js';
import { formatText } from '../utils/formatText';
import { isVendorOpen } from '../utils/isVendorOpen';
import './BrowseVendors.css';
import Header from './Header';
import Footer from './Footer';

const API_URL = 'http://127.0.0.1:5001';

const BrowseVendors = () => {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategories, setSelectedCategories] = useState([]); // Multi-select
  const [selectedCuisines, setSelectedCuisines] = useState([]); // Multi-select
  const [selectedPayments, setSelectedPayments] = useState([]); // Multi-select
  const [selectedDietaries, setSelectedDietaries] = useState([]); // Multi-select
  const [showOpenOnly, setShowOpenOnly] = useState(false);
  const [sortBy, setSortBy] = useState('name_asc');
  const [activeFilterTypes, setActiveFilterTypes] = useState({
    location: true,
    cuisine: false,
    payment: false,
    dietary: false
  }); // Multiple filter types can be active at once
  const [vendors, setVendors] = useState([]);
  const [allVendors, setAllVendors] = useState([]); // Store all vendors for fuzzy search
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Apply filters function
  const applyFilters = useCallback((vendorsToFilter) => {
    let filtered = [...vendorsToFilter];
    
    // Apply multi-select filters
    if (selectedCategories.length > 0) {
      filtered = filtered.filter(v => selectedCategories.includes(v.location));
    }
    if (selectedCuisines.length > 0) {
      filtered = filtered.filter(v => selectedCuisines.includes(v.cuisine));
    }
    if (selectedPayments.length > 0) {
      filtered = filtered.filter(v => 
        v.payment_methods && selectedPayments.some(pm => v.payment_methods.includes(pm))
      );
    }
    if (selectedDietaries.length > 0) {
      filtered = filtered.filter(v => 
        v.dietary_tags && selectedDietaries.some(dt => v.dietary_tags.includes(dt))
      );
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
    } else if (sortBy === 'location_asc') {
      filtered.sort((a, b) => (a.location || '').localeCompare(b.location || ''));
    } else if (sortBy === 'location_desc') {
      filtered.sort((a, b) => (b.location || '').localeCompare(a.location || ''));
    }
    
    return filtered;
  }, [selectedCategories, selectedCuisines, selectedPayments, selectedDietaries, sortBy]);

  // Fetch vendors from backend
  const fetchVendors = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      
      // Build query parameters
      // Don't send search query to backend - we'll use fuzzy search on frontend
      // For multi-select, we'll filter on frontend after fetching
      const params = new URLSearchParams();
      params.append('sort_by', sortBy);
      
      const url = `${API_URL}/api/vendors${params.toString() ? `?${params.toString()}` : ''}`;
      
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setAllVendors(data); // Store all vendors
      // Don't set vendors here - let the useEffect handle filtering
    } catch (err) {
      console.error("Error fetching vendors:", err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [sortBy]);

  // Fetch vendors on load and when sort changes
  useEffect(() => {
    fetchVendors();
  }, [fetchVendors]);

  // Re-apply filters when data, filters, or search change
  useEffect(() => {
    if (allVendors.length === 0) return;

    let filteredVendors = allVendors;

    if (searchQuery) {
      const fuseOptions = {
        keys: [
          { name: 'name', weight: 0.7 },
          { name: 'description', weight: 0.3 },
          { name: 'location', weight: 0.2 },
          { name: 'cuisine', weight: 0.2 }
        ],
        threshold: 0.4,
        includeScore: true,
        minMatchCharLength: 2
      };
      const fuse = new Fuse(allVendors, fuseOptions);
      const results = fuse.search(searchQuery);
      filteredVendors = results.map(result => result.item);
    }

    const finalFiltered = applyFilters(filteredVendors);
    setVendors(finalFiltered);
  }, [allVendors, searchQuery, selectedCategories, selectedCuisines, selectedPayments, selectedDietaries, applyFilters]);

  // Fuzzy search using Fuse.js when search query is provided
  useEffect(() => {
    if (allVendors.length === 0) {
      return;
    }

    let filteredVendors = allVendors;

    // Apply fuzzy search if there's a search query
    if (searchQuery) {
      const fuseOptions = {
        keys: [
          { name: 'name', weight: 0.7 },
          { name: 'description', weight: 0.3 },
          { name: 'location', weight: 0.2 },
          { name: 'cuisine', weight: 0.2 }
        ],
        threshold: 0.4,
        includeScore: true,
        minMatchCharLength: 2
      };

      const fuse = new Fuse(allVendors, fuseOptions);
      const results = fuse.search(searchQuery);
      filteredVendors = results.map(result => result.item);
    }
    
    // Always apply filters (whether or not there's a search query)
    const finalFiltered = applyFilters(filteredVendors);
    setVendors(finalFiltered);
  }, [searchQuery, allVendors, applyFilters]);

  // Toggle functions for multi-select
  const toggleCategory = (category) => {
    setSelectedCategories(prev => 
      prev.includes(category) 
        ? prev.filter(c => c !== category)
        : [...prev, category]
    );
  };

  const toggleCuisine = (cuisine) => {
    setSelectedCuisines(prev => 
      prev.includes(cuisine) 
        ? prev.filter(c => c !== cuisine)
        : [...prev, cuisine]
    );
  };

  const togglePayment = (payment) => {
    setSelectedPayments(prev => 
      prev.includes(payment) 
        ? prev.filter(p => p !== payment)
        : [...prev, payment]
    );
  };

  const toggleDietary = (dietary) => {
    setSelectedDietaries(prev => 
      prev.includes(dietary) 
        ? prev.filter(d => d !== dietary)
        : [...prev, dietary]
    );
  };

  // Toggle filter type visibility
  const toggleFilterType = (filterType) => {
    setActiveFilterTypes(prev => ({
      ...prev,
      [filterType]: !prev[filterType]
    }));
  };

  // Handle sort change
  const handleSortChange = (e) => {
    setSortBy(e.target.value);
  };

  // Render vendor cards
  const renderVendors = () => {
    if (loading) {
      return <div className="loading">Loading vendors...</div>;
    }

    if (error) {
      return <div className="error">Error: {error}</div>;
    }

    // Filter vendors by open status if filter is enabled
    const filteredVendors = showOpenOnly 
      ? vendors.filter(vendor => isVendorOpen(vendor.operating_hours))
      : vendors;

    if (filteredVendors.length === 0) {
      return (
        <div className="empty-state">
          <div className="empty-state-icon">🍽️</div>
          <h3 className="empty-state-title">No vendors found</h3>
          <p className="empty-state-description">
            {showOpenOnly 
              ? "No vendors are currently open. Try removing the 'Open Now' filter to see all vendors."
              : (selectedCategories.length === 0 && selectedCuisines.length === 0 && selectedPayments.length === 0 && selectedDietaries.length === 0)
                ? "No vendors are currently available." 
                : "No vendors match your current filters. Try adjusting your filter selections."}
          </p>
        </div>
      );
    }

    return (
      <div className="vendors-grid">
        {filteredVendors.map((vendor) => {
          const open = isVendorOpen(vendor.operating_hours);
          return (
            <div key={vendor.id} className="vendor-card" onClick={() => navigate(`/vendor/${vendor.id}`)}>
              <div className="vendor-image">
                {/* Add vendor image if available */}
                <div className="vendor-image-placeholder">
                  {vendor.name.charAt(0)}
                </div>
              </div>
              <div className="vendor-info">
                <div className="vendor-header-with-status">
                  <h3>{vendor.name}</h3>
                  <span className={`status-tag ${open ? 'status-open' : 'status-closed'}`}>
                    {open ? 'Open' : 'Closed'}
                  </span>
                </div>
                <p className="vendor-description">{vendor.description}</p>
                <div className="vendor-rating-display">
                  {vendor.avg_rating && vendor.avg_rating > 0 ? (
                    <>
                      <span className="vendor-rating-stars">
                        {'⭐'.repeat(Math.round(vendor.avg_rating))}
                      </span>
                      <span className="vendor-rating-value">{vendor.avg_rating.toFixed(1)}</span>
                    </>
                  ) : (
                    <span className="vendor-rating-none">No rating yet</span>
                  )}
                </div>
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
          );
        })}
      </div>
    );
  };

  return (
    <div className="browse-vendors">
      <Header />

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
              {/* Filter Type Checkboxes */}
              <div className="filter-section">
                <h3 className="filter-title">Enable Filter Types</h3>
                <div className="filter-type-checkboxes">
                  <label className="filter-type-checkbox">
                    <input
                      type="checkbox"
                      checked={activeFilterTypes.location}
                      onChange={() => toggleFilterType('location')}
                    />
                    <span>Location</span>
                  </label>
                  <label className="filter-type-checkbox">
                    <input
                      type="checkbox"
                      checked={activeFilterTypes.cuisine}
                      onChange={() => toggleFilterType('cuisine')}
                    />
                    <span>Cuisine Type</span>
                  </label>
                  <label className="filter-type-checkbox">
                    <input
                      type="checkbox"
                      checked={activeFilterTypes.payment}
                      onChange={() => toggleFilterType('payment')}
                    />
                    <span>Payment Method</span>
                  </label>
                  <label className="filter-type-checkbox">
                    <input
                      type="checkbox"
                      checked={activeFilterTypes.dietary}
                      onChange={() => toggleFilterType('dietary')}
                    />
                    <span>Dietary Options</span>
                  </label>
                </div>
              </div>

              {/* Show all enabled filter types simultaneously */}
              {activeFilterTypes.location && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Locations (Multi-select)</h3>
                  <div className="location-filters">
                    {[
                      { id: 'east_central_campus', name: 'East/Central' },
                      { id: 'west_campus', name: 'West Campus' },
                      { id: 'merchants_on_points', name: 'Merchants on Points' },
                      { id: 'food_trucks', name: 'Food Trucks' },
                      { id: 'off_campus', name: 'Off Campus' }
                    ].map(({ id, name }) => (
                      <button
                        key={id}
                        className={`location-filter-btn ${selectedCategories.includes(id) ? 'active' : ''}`}
                        onClick={() => toggleCategory(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                  {selectedCategories.length > 0 && (
                    <button 
                      className="clear-filters-btn"
                      onClick={() => setSelectedCategories([])}
                    >
                      Clear Location Filters
                    </button>
                  )}
                </div>
              )}

              {activeFilterTypes.cuisine && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Cuisines (Multi-select)</h3>
                  <div className="location-filters">
                    {[
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
                        className={`location-filter-btn ${selectedCuisines.includes(id) ? 'active' : ''}`}
                        onClick={() => toggleCuisine(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                  {selectedCuisines.length > 0 && (
                    <button 
                      className="clear-filters-btn"
                      onClick={() => setSelectedCuisines([])}
                    >
                      Clear Cuisine Filters
                    </button>
                  )}
                </div>
              )}

              {activeFilterTypes.payment && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Payment Methods (Multi-select)</h3>
                  <div className="location-filters">
                    {[
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
                        className={`location-filter-btn ${selectedPayments.includes(id) ? 'active' : ''}`}
                        onClick={() => togglePayment(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                  {selectedPayments.length > 0 && (
                    <button 
                      className="clear-filters-btn"
                      onClick={() => setSelectedPayments([])}
                    >
                      Clear Payment Filters
                    </button>
                  )}
                </div>
              )}

              {activeFilterTypes.dietary && (
                <div className="filter-section">
                  <h3 className="filter-title">Select Dietary Options (Multi-select)</h3>
                  <div className="location-filters">
                    {[
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
                        className={`location-filter-btn ${selectedDietaries.includes(id) ? 'active' : ''}`}
                        onClick={() => toggleDietary(id)}
                      >
                        {name}
                      </button>
                    ))}
                  </div>
                  {selectedDietaries.length > 0 && (
                    <button 
                      className="clear-filters-btn"
                      onClick={() => setSelectedDietaries([])}
                    >
                      Clear Dietary Filters
                    </button>
                  )}
                </div>
              )}

              {/* Open Now Filter */}
              <div className="filter-section">
                <h3 className="filter-title">Availability</h3>
                <div className="location-filters">
                  <button
                    className={`location-filter-btn ${!showOpenOnly ? 'active' : ''}`}
                    onClick={() => setShowOpenOnly(false)}
                  >
                    All Vendors
                  </button>
                  <button
                    className={`location-filter-btn ${showOpenOnly ? 'active' : ''}`}
                    onClick={() => setShowOpenOnly(true)}
                  >
                    Open Now
                  </button>
                </div>
              </div>

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
                  <option value="rating_desc">Rating (High to Low)</option>
                  <option value="rating_asc">Rating (Low to High)</option>
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
                  <span>
                    {showOpenOnly 
                      ? vendors.filter(v => isVendorOpen(v.operating_hours)).length 
                      : vendors.length
                    } {showOpenOnly 
                      ? vendors.filter(v => isVendorOpen(v.operating_hours)).length === 1 
                        ? 'vendor' 
                        : 'vendors'
                      : vendors.length === 1 
                        ? 'vendor' 
                        : 'vendors'
                    } found
                  </span>
                </div>
              </div>
              {renderVendors()}
            </div>
          </div>
      </section>

      <Footer />
    </div>
  );
};

export default BrowseVendors;