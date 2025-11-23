import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Login from './Login';
import Register from './Register';
import dukeEatzBg from '../images/DukeEatz.jpg';
import '../App.css';

function RegistrationLanding() {
  const [currentView, setCurrentView] = useState('login');
  const [message, setMessage] = useState('');
  const [messageType, setMessageType] = useState('');
  const navigate = useNavigate();

  // Check if user is already logged in
  useEffect(() => {
    const user = localStorage.getItem('user');
    if (user) {
      navigate('/home');
    }
  }, [navigate]);

  const showMessage = (msg, type) => {
    setMessage(msg);
    setMessageType(type);
    setTimeout(() => {
      setMessage('');
      setMessageType('');
    }, 5000);
  };

  return (
    <div className="registration-landing" style={{ 
      backgroundImage: `url(${dukeEatzBg})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
      backgroundAttachment: 'fixed'
    }}>
      <div className="registration-overlay"></div>
      <div className="registration-content">
        <header className="registration-header">
          <h1>DukeEatz</h1>
          <p>Discover dining locations at Duke University</p>
        </header>

        {message && (
          <div className={`message ${messageType}`} style={{ marginBottom: '20px', maxWidth: '500px', width: '100%' }}>
            {message}
          </div>
        )}

        <div className="registration-container">
          <div className="registration-nav-buttons">
            <button
              className={`registration-nav-btn ${currentView === 'login' ? 'active' : ''}`}
              onClick={() => setCurrentView('login')}
            >
              Login
            </button>
            <button
              className={`registration-nav-btn ${currentView === 'register' ? 'active' : ''}`}
              onClick={() => setCurrentView('register')}
            >
              Register
            </button>
          </div>

          {currentView === 'login' ? (
            <Login showMessage={showMessage} switchToRegister={() => setCurrentView('register')} />
          ) : (
            <Register showMessage={showMessage} switchToLogin={() => setCurrentView('login')} />
          )}
        </div>
      </div>
    </div>
  );
}

export default RegistrationLanding;

