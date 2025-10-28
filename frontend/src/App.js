import React, { useState } from 'react';
import Login from './components/Login';
import Register from './components/Register';
import './App.css';

function App() {
  const [currentView, setCurrentView] = useState('login');
  const [message, setMessage] = useState('');
  const [messageType, setMessageType] = useState('');

  const showMessage = (msg, type) => {
    setMessage(msg);
    setMessageType(type);
    setTimeout(() => {
      setMessage('');
      setMessageType('');
    }, 5000);
  };

  return (
    <div className="App" style={{ 
      backgroundImage: `url(${process.env.PUBLIC_URL}/DukeEatz.jpg)`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
      minHeight: '100vh',
      position: 'relative'
    }}>
      <div className="overlay"></div>
      <div className="content">
        <header className="App-header">
          <h1>DukeEatz</h1>
          <p>Discover dining locations at Duke University</p>
        </header>

      <div className="container">
        <div className="nav-buttons">
          <button
            className={currentView === 'login' ? 'active' : ''}
            onClick={() => setCurrentView('login')}
          >
            Login
          </button>
          <button
            className={currentView === 'register' ? 'active' : ''}
            onClick={() => setCurrentView('register')}
          >
            Register
          </button>
        </div>

        {message && (
          <div className={`message ${messageType}`}>
            {message}
          </div>
        )}

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

export default App;
