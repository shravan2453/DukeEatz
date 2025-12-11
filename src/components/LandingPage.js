import React from 'react';
import { useNavigate } from 'react-router-dom';
import './LandingPage.css';
import dukeLogo from '../images/dukelogo.png';
import Header from './Header';
import Footer from './Footer';

const LandingPage = () => {
  const navigate = useNavigate();

  const handleBrowseVendors = () => {
    navigate('/browse-vendors');
  };

  return (
    <div className="landing-page">
      <Header />

      {/* Hero Section */}
      <section className="hero">
        <div className="container-why">
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
        <div className="container-why">
          <div className="features-header">
            <span className="features-badge">Why Us?</span>
            <h3 className="features-title">Why Choose DukeEatz?</h3>
            <p className="features-subtitle">Everything you need to navigate Duke dining, all in one place</p>
          </div>
          <div className="features-grid">
            <div className="feature-card">
              <div className="feature-icon-wrapper">
                <div className="feature-icon">🍽️</div>
                <div className="feature-glow"></div>
              </div>
              <h4>Comprehensive Menus</h4>
              <p>Detailed menus with real-time updates from Duke Dining and local vendors</p>
              <div className="feature-card-accent"></div>
            </div>
            <div className="feature-card">
              <div className="feature-icon-wrapper">
                <div className="feature-icon">⭐</div>
                <div className="feature-glow"></div>
              </div>
              <h4>Student Reviews</h4>
              <p>Read reviews from fellow Duke students who understand your dining needs</p>
              <div className="feature-card-accent"></div>
            </div>
            <div className="feature-card">
              <div className="feature-icon-wrapper">
                <div className="feature-icon">💳</div>
                <div className="feature-glow"></div>
              </div>
              <h4>Payment Options</h4>
              <p>Find vendors that accept Food Points, credit cards, and other payment methods</p>
              <div className="feature-card-accent"></div>
            </div>
            <div className="feature-card">
              <div className="feature-icon-wrapper">
                <div className="feature-icon">📍</div>
                <div className="feature-glow"></div>
              </div>
              <h4>Campus Focused</h4>
              <p>Curated specifically for Duke's campus and surrounding areas</p>
              <div className="feature-card-accent"></div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default LandingPage;
