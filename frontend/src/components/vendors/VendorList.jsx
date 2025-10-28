import React, { useState, useEffect } from 'react';
import { Container, Spinner, Alert, Form, Row, Col } from 'react-bootstrap';
import VendorCard from './VendorCard';
import './Vendors.css';

const VendorList = ({ currentUser }) => {
  const [vendors, setVendors] = useState([]);
  const [filteredVendors, setFilteredVendors] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [cuisineFilter, setCuisineFilter] = useState('all');

  useEffect(() => {
    loadVendors();
  }, []);

  useEffect(() => {
    filterVendors();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [searchTerm, cuisineFilter, vendors]);

  const loadVendors = async () => {
    try {
      setLoading(true);
      const response = await fetch('http://localhost:5001/api/vendors');
      if (!response.ok) throw new Error('Failed to fetch vendors');
      const data = await response.json();
      setVendors(data);
      setFilteredVendors(data);
    } catch (err) {
      setError('Failed to load vendors. Please try again later.');
      console.error('Error loading vendors:', err);
    } finally {
      setLoading(false);
    }
  };

  const filterVendors = () => {
    let filtered = vendors;

    // Filter by search term
    if (searchTerm) {
      filtered = filtered.filter(vendor =>
        vendor.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        vendor.cuisine_type.toLowerCase().includes(searchTerm.toLowerCase()) ||
        vendor.address.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }

    // Filter by cuisine type
    if (cuisineFilter !== 'all') {
      filtered = filtered.filter(vendor => vendor.cuisine_type === cuisineFilter);
    }

    setFilteredVendors(filtered);
  };

  const getCuisineTypes = () => {
    const types = [...new Set(vendors.map(v => v.cuisine_type))];
    return types.sort();
  };

  if (loading) {
    return (
      <Container className="text-center py-5">
        <Spinner animation="border" variant="primary" />
        <p className="mt-2">Loading Duke dining locations...</p>
      </Container>
    );
  }

  if (error) {
    return (
      <Container className="py-5">
        <Alert variant="danger">{error}</Alert>
      </Container>
    );
  }

  return (
    <Container className="vendors-container py-4">
      <div className="filters-section mb-4">
        <Row>
          <Col md={8}>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="Search by name, cuisine, or location..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="search-input"
              />
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Select
                value={cuisineFilter}
                onChange={(e) => setCuisineFilter(e.target.value)}
                className="cuisine-filter"
              >
                <option value="all">All Cuisines</option>
                {getCuisineTypes().map(type => (
                  <option key={type} value={type}>{type}</option>
                ))}
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>
      </div>

      <div className="results-info mb-3">
        <h5>
          {filteredVendors.length} {filteredVendors.length === 1 ? 'Location' : 'Locations'} Found
        </h5>
      </div>

      <div className="vendors-list">
        {filteredVendors.length === 0 ? (
          <Alert variant="info">
            No vendors match your search criteria. Try adjusting your filters.
          </Alert>
        ) : (
          filteredVendors.map(vendor => (
            <VendorCard
              key={vendor.vendor_id}
              vendor={vendor}
              currentUser={currentUser}
            />
          ))
        )}
      </div>
    </Container>
  );
};

export default VendorList;
