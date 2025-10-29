import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import LandingPage from './components/LandingPage';
import BrowseVendors from './components/BrowseVendors';
import './App.css';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<LandingPage />} />
          <Route path="/browse-vendors" element={<BrowseVendors />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
