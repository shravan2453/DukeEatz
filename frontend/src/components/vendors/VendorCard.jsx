import React, { useState } from 'react';
import { Card, Badge, Collapse, Button } from 'react-bootstrap';
import { ChevronDown, ChevronUp } from 'react-bootstrap-icons';
import ReviewList from '../reviews/ReviewList';
import './Vendors.css';

const VendorCard = ({ vendor, currentUser }) => {
  const [isExpanded, setIsExpanded] = useState(false);

  // West Union image for all vendors in West Union
  const getVendorImage = () => {
    if (vendor.address === 'West Union') {
      return '/images/west-union.jpg'; // West Union image
    }
    return null;
  };

  const vendorImage = getVendorImage();

  return (
    <Card className="vendor-card mb-3">
      {vendorImage && (
        <div className="vendor-image-container">
          <Card.Img 
            variant="top" 
            src={vendorImage} 
            alt={vendor.address}
            className="vendor-image"
          />
          <div className="vendor-location-badge">
            <Badge bg="dark">{vendor.address}</Badge>
          </div>
        </div>
      )}
      <Card.Body>
        <div 
          className="vendor-header d-flex justify-content-between align-items-center"
          onClick={() => setIsExpanded(!isExpanded)}
          style={{ cursor: 'pointer' }}
        >
          <div>
            <h4 className="vendor-name mb-1">{vendor.name}</h4>
            <div className="vendor-info">
              <Badge bg="primary" className="me-2">{vendor.cuisine_type}</Badge>
              {!vendorImage && <span className="text-muted">{vendor.address}</span>}
            </div>
          </div>
          <Button variant="link" className="expand-btn">
            {isExpanded ? <ChevronUp size={24} /> : <ChevronDown size={24} />}
          </Button>
        </div>

        <Collapse in={isExpanded}>
          <div className="vendor-details mt-3">
            <div className="vendor-meta mb-3">
              <p className="mb-1"><strong>Contact:</strong> {vendor.contact_info}</p>
              <p className="mb-1"><strong>Location:</strong> {vendor.location_category}</p>
            </div>
            <hr />
            <ReviewList 
              vendorId={vendor.vendor_id} 
              currentUser={currentUser}
              vendorName={vendor.name}
            />
          </div>
        </Collapse>
      </Card.Body>
    </Card>
  );
};

export default VendorCard;
