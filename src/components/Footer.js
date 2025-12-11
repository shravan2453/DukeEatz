import React from 'react';
import { useNavigate } from 'react-router-dom';
import './Footer.css';

const Footer = () => {
  const navigate = useNavigate();

  return (
    <>
      {/* Footer */}
      <footer className="footer-new">
        <div className="footer-inner">
          <div className="footer-left">
            <span className="footer-brand">DukeEatz</span>
            <span className="footer-separator">•</span>
            <span className="footer-tagline">Your Duke Dining Guide</span>
          </div>
          <div className="footer-center">
            <span className="footer-link" onClick={() => navigate('/browse-vendors')}>Vendors</span>
            <span className="footer-link" onClick={() => navigate('/browse-menu-items')}>Menu</span>
            <span className="footer-link" onClick={() => navigate('/reviews')}>Reviews</span>
            <span className="footer-link" onClick={() => navigate('/leave-review')}>Leave a Review</span>
            <span className="footer-link" onClick={() => navigate('/profile')}>Profile</span>
          </div>
          <div className="footer-right">
            <span className="footer-copyright">© 2025 DukeEatz</span>
            <span className="footer-devils">Go Blue Devils! 😈</span>
          </div>
        </div>
      </footer>
    </>
  );
};

export default Footer;
