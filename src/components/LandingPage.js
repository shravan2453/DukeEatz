import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import './LandingPage.css';
import dukeLogo from '../images/dukelogo.png';

const LandingPage = () => {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');

  const handleSearch = (e) => {
    e.preventDefault();
    // TODO: Implement search functionality
    console.log('Searching for:', searchQuery);
  };

  const handleBrowseVendors = () => {
    navigate('/browse-vendors');
  };

  const handleSignIn = () => {
    // TODO: Navigate to sign in page
    console.log('Navigate to sign in');
  };

  const handleSignUp = () => {
    // TODO: Navigate to sign up page
    console.log('Navigate to sign up');
  };

  return (
    <div className="landing-page">
      {/* Header */}
      <header className="header">
        <div className="container">
          <div className="logo">
            <div className="dukeeatz-brand">
              <h1>DukeEatz</h1>
              <p className="tagline">Your Duke Dining Guide</p>
            </div>
          </div>
          <nav className="nav">
            <button className="nav-btn" onClick={handleBrowseVendors}>
              Browse Vendors
            </button>
            <button className="nav-btn" onClick={handleSignIn}>
              Log In
            </button>
            <button className="nav-btn primary" onClick={handleSignUp}>
              Sign Up
            </button>
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
            
            {/* Search Bar */}
            <form className="search-form" onSubmit={handleSearch}>
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

            {/* Quick Actions */}
            <div className="quick-actions">
              <button className="action-btn" onClick={handleBrowseVendors}>
                Browse All Vendors
              </button>
              <button className="action-btn secondary" onClick={handleSignUp}>
                Create Account
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
