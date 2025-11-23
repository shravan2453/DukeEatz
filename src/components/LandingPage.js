import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import './LandingPage.css';
import dukeLogo from '../images/dukelogo.png';

const LandingPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const [user, setUser] = useState(null);
  const [showProfileMenu, setShowProfileMenu] = useState(false);

  useEffect(() => {
    const userData = localStorage.getItem('user');
    if (userData) {
      setUser(JSON.parse(userData));
    }
  }, []);

  const handleBrowseVendors = () => {
    navigate('/browse-vendors');
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

  return (
    <div className="landing-page">
      {/* Header */}
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
              onClick={handleBrowseVendors}
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

      {/* Hero Section */}
      <section className="hero">
        <div className="container">
          <div className="hero-content">
            <div className="duke-logo-hero">
              <img 
                src={dukeLogo} 
                alt="Duke Blue Devil Logo" 
                className="duke-logo-image"
              />
            </div>
            <h2 className="hero-title">
              Discover the Best Food on Duke's Campus
            </h2>
            <p className="hero-description">
              DukeEatz is your comprehensive dining guide for the Duke community. 
              Find the perfect meal with student reviews, detailed menus, and 
              payment options that work with your Duke ID.
            </p>
            
            {/* Giant Browse Vendors Button */}
            <div className="browse-vendors-cta">
              <button className="giant-browse-btn" onClick={handleBrowseVendors}>
                Browse Vendors
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="features">
        <div className="container">
          <h3 className="features-title">Why Choose DukeEatz?</h3>
          <div className="features-grid">
            <div className="feature-card">
              <div className="feature-icon">🍽️</div>
              <h4>Comprehensive Menus</h4>
              <p>Detailed menus with real-time updates from Duke Dining and local vendors</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">⭐</div>
              <h4>Student Reviews</h4>
              <p>Read reviews from fellow Duke students who understand your dining needs</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">💳</div>
              <h4>Payment Options</h4>
              <p>Find vendors that accept Food Points, credit cards, and other payment methods</p>
            </div>
            <div className="feature-card">
              <div className="feature-icon">📍</div>
              <h4>Campus Focused</h4>
              <p>Curated specifically for Duke's campus and surrounding areas</p>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer">
        <div className="container">
          <p>&copy; 2024 DukeEatz. Built for the Duke community.</p>
        </div>
      </footer>
    </div>
  );
};

export default LandingPage;
