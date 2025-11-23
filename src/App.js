import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import RegistrationLanding from './components/RegistrationLanding';
import LandingPage from './components/LandingPage';
import BrowseVendors from './components/BrowseVendors';
import VendorDetailsPage from './components/VendorDetailsPage';
import VendorReviewsPage from './components/VendorReviewsPage';
import UserProfilePage from './components/UserProfilePage';
import LeaveReviewPage from './components/LeaveReviewPage';
import MenuItemsPage from './components/MenuItemsPage';
import BrowseMenuItems from './components/BrowseMenuItems';
import './App.css';

function App() {
  // Protected route component
  const ProtectedRoute = ({ children }) => {
    const user = localStorage.getItem('user');
    return user ? children : <Navigate to="/" replace />;
  };

  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<RegistrationLanding />} />
        <Route 
          path="/home" 
          element={
            <ProtectedRoute>
              <LandingPage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/browse-vendors" 
          element={
            <ProtectedRoute>
              <BrowseVendors />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/browse-menu-items" 
          element={
            <ProtectedRoute>
              <BrowseMenuItems />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/vendor/:id" 
          element={
            <ProtectedRoute>
              <VendorDetailsPage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/vendor/:id/reviews" 
          element={
            <ProtectedRoute>
              <VendorReviewsPage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/vendor/:id/menu" 
          element={
            <ProtectedRoute>
              <MenuItemsPage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/profile" 
          element={
            <ProtectedRoute>
              <UserProfilePage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/leave-review" 
          element={
            <ProtectedRoute>
              <LeaveReviewPage />
            </ProtectedRoute>
          } 
        />
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </div>
  );
}

export default App;