from flask import Blueprint, request, jsonify
from app.db import get_cursor
import psycopg2
from psycopg2 import sql
from datetime import datetime

reviews_bp = Blueprint('reviews', __name__)

@reviews_bp.route('', methods=['POST'])
def create_review():
    """Create a new review"""
    data = request.get_json()
    print(f"Received review data: {data}")  # Debug logging
    
    # Validate required fields
    required_fields = ['user_id', 'vendor_id', 'rating']
    if not all(field in data for field in required_fields):
        print(f"Missing fields. Data: {data}")  # Debug logging
        return jsonify({'error': 'Missing required fields: user_id, vendor_id, rating'}), 400
    
    # Validate rating range
    if not isinstance(data['rating'], int) or not 1 <= data['rating'] <= 5:
        print(f"Invalid rating: {data['rating']}")  # Debug logging
        return jsonify({'error': 'Rating must be an integer between 1 and 5'}), 400
    
    try:
        with get_cursor() as cur:
            query = """
                INSERT INTO reviews (user_id, vendor_id, menu_item_id, rating, review_text)
                VALUES (%s, %s, %s, %s, %s)
                RETURNING review_id, user_id, vendor_id, menu_item_id, rating, review_text, created_at
            """
            cur.execute(query, (
                data['user_id'],
                data['vendor_id'],
                data.get('menu_item_id'),
                data['rating'],
                data.get('review_text', '')
            ))
            review = cur.fetchone()
            print(f"Review created successfully: {review}")  # Debug logging
            return jsonify(dict(review)), 201
    except psycopg2.Error as e:
        print(f"Database error: {str(e)}")  # Debug logging
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@reviews_bp.route('/vendor/<int:vendor_id>', methods=['GET'])
def get_vendor_reviews(vendor_id):
    """Get all reviews for a specific vendor"""
    try:
        with get_cursor() as cur:
            query = """
                SELECT 
                    r.review_id, 
                    r.user_id, 
                    r.vendor_id, 
                    r.menu_item_id, 
                    r.rating, 
                    r.review_text, 
                    r.created_at,
                    u.username,
                    u.name as user_name
                FROM reviews r
                LEFT JOIN users u ON r.user_id = u.user_id
                WHERE r.vendor_id = %s
                ORDER BY r.created_at DESC
            """
            cur.execute(query, (vendor_id,))
            reviews = cur.fetchall()
            return jsonify([dict(row) for row in reviews])
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@reviews_bp.route('/user/<int:user_id>', methods=['GET'])
def get_user_reviews(user_id):
    """Get all reviews by a specific user"""
    try:
        with get_cursor() as cur:
            query = """
                SELECT 
                    r.review_id, 
                    r.user_id, 
                    r.vendor_id, 
                    r.menu_item_id, 
                    r.rating, 
                    r.review_text, 
                    r.created_at,
                    v.name as vendor_name,
                    m.name as menu_item_name
                FROM reviews r
                LEFT JOIN vendors v ON r.vendor_id = v.vendor_id
                LEFT JOIN menu_items m ON r.menu_item_id = m.menu_item_id
                WHERE r.user_id = %s
                ORDER BY r.created_at DESC
            """
            cur.execute(query, (user_id,))
            reviews = cur.fetchall()
            return jsonify([dict(row) for row in reviews])
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@reviews_bp.route('/<int:review_id>', methods=['GET'])
def get_review(review_id):
    """Get a specific review by ID"""
    try:
        with get_cursor() as cur:
            query = """
                SELECT 
                    r.review_id, 
                    r.user_id, 
                    r.vendor_id, 
                    r.menu_item_id, 
                    r.rating, 
                    r.review_text, 
                    r.created_at,
                    u.username,
                    u.name as user_name,
                    v.name as vendor_name,
                    m.name as menu_item_name
                FROM reviews r
                LEFT JOIN users u ON r.user_id = u.user_id
                LEFT JOIN vendors v ON r.vendor_id = v.vendor_id
                LEFT JOIN menu_items m ON r.menu_item_id = m.menu_item_id
                WHERE r.review_id = %s
            """
            cur.execute(query, (review_id,))
            review = cur.fetchone()
            
            if not review:
                return jsonify({'error': 'Review not found'}), 404
                
            return jsonify(dict(review))
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@reviews_bp.route('/<int:review_id>', methods=['PUT'])
def update_review(review_id):
    """Update an existing review"""
    data = request.get_json()
    
    # Validate rating if provided
    if 'rating' in data:
        if not isinstance(data['rating'], int) or not 1 <= data['rating'] <= 5:
            return jsonify({'error': 'Rating must be an integer between 1 and 5'}), 400
    
    updates = []
    values = []
    
    if 'rating' in data:
        updates.append("rating = %s")
        values.append(data['rating'])
    if 'review_text' in data:
        updates.append("review_text = %s")
        values.append(data['review_text'])
    if 'menu_item_id' in data:
        updates.append("menu_item_id = %s")
        values.append(data['menu_item_id'])
    
    if not updates:
        return jsonify({'error': 'No fields to update'}), 400
    
    # Add updated timestamp
    updates.append("created_at = CURRENT_TIMESTAMP")
    values.append(review_id)
    
    try:
        with get_cursor() as cur:
            # Check if review exists
            cur.execute("SELECT review_id FROM reviews WHERE review_id = %s", (review_id,))
            if not cur.fetchone():
                return jsonify({'error': 'Review not found'}), 404
            
            # Update the review
            query = f"""
                UPDATE reviews
                SET {', '.join(updates)}
                WHERE review_id = %s
                RETURNING review_id, user_id, vendor_id, menu_item_id, rating, review_text, created_at
            """
            cur.execute(query, values)
            review = cur.fetchone()
            
            return jsonify(dict(review))
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@reviews_bp.route('/<int:review_id>', methods=['DELETE'])
def delete_review(review_id):
    """Delete a review"""
    try:
        with get_cursor() as cur:
            cur.execute("DELETE FROM reviews WHERE review_id = %s RETURNING review_id", (review_id,))
            deleted = cur.fetchone()
            
            if not deleted:
                return jsonify({'error': 'Review not found'}), 404
            
            return jsonify({'message': 'Review deleted successfully', 'review_id': deleted['review_id']})
    except psycopg2.Error as e:
        return jsonify({'error': f'Database error: {str(e)}'}), 500
