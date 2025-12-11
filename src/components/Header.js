import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import './Header.css';

const Header = () => {
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

  // Listen for storage changes (for login/logout across tabs)
  useEffect(() => {
    const handleStorageChange = () => {
      const userData = localStorage.getItem('user');
      if (userData) {
        setUser(JSON.parse(userData));
      } else {
        setUser(null);
      }
    };

    window.addEventListener('storage', handleStorageChange);
    return () => window.removeEventListener('storage', handleStorageChange);
  }, []);

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
    <header className="header">
      <div className="header-container">
        <div className="logo" onClick={() => navigate('/home')} style={{ cursor: 'pointer' }}>
          <div className="dukeeatz-brand">
            <h1>DukeEatz</h1>
            <p className="tagline">Your Duke Dining Guide</p>
          </div>
        </div>
        <nav className="nav">
          <button 
            className={`nav-btn-new ${location.pathname === '/home' ? 'active' : ''}`}
            onClick={() => navigate('/home')}
          >
            HOME
          </button>
          <button 
            className={`nav-btn-new ${location.pathname === '/browse-vendors' ? 'active' : ''}`}
            onClick={() => navigate('/browse-vendors')}
          >
            BROWSE VENDORS
          </button>
          <button 
            className={`nav-btn-new ${location.pathname === '/browse-menu-items' ? 'active' : ''}`}
            onClick={() => navigate('/browse-menu-items')}
          >
            BROWSE MENU ITEMS
          </button>
          <button 
            className={`nav-btn-new ${location.pathname === '/leave-review' ? 'active' : ''}`}
            onClick={() => navigate('/leave-review')}
          >
            LEAVE A REVIEW
          </button>
          <button 
            className={`nav-btn-new ${location.pathname === '/reviews' ? 'active' : ''}`}
            onClick={() => navigate('/reviews')}
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
  );
};

export default Header;
