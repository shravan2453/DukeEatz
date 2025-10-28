import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import VendorList from './components/vendors/VendorList';
import './App.css';

function App() {
  // Mock current user - replace with actual authentication
  const currentUser = {
    user_id: 1,
    username: 'john_doe',
    name: 'John Doe'
  };

  return (
    <div className="App">
      <header className="app-header">
        <div className="container">
          <h1>DukeEatz</h1>
          <p className="subtitle">Discover and Review Duke Dining Locations</p>
        </div>
      </header>

      <main className="mt-4">
        <VendorList currentUser={currentUser} />
      </main>

      <footer className="app-footer mt-5">
        <div className="container text-center">
          <p>&copy; 2025 DukeEatz. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
}

export default App;
