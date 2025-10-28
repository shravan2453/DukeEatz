from flask import Blueprint, request, jsonify
from app.db import get_cursor
import psycopg2

vendors_bp = Blueprint('vendors', __name__)

@vendors_bp.route('', methods=['GET'])
def get_all_vendors():
    """Get all vendors"""
    try:
        with get_cursor() as cur:
            query = """
                SELECT 
                    vendor_id,
                    name,
                    contact_info,
                    location_category,
                    address,
                    operating_hours,
                    cuisine_type,
                    payment_methods,
                    dietary_tags,
                    created_by
                FROM vendors
                ORDER BY name ASC
            """
            cur.execute(query)
            vendors = [dict(row) for row in cur.fetchall()]
            return jsonify(vendors)
    except psycopg2.Error as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': f'Database error: {str(e)}'}), 500

@vendors_bp.route('/<int:vendor_id>', methods=['GET'])
def get_vendor(vendor_id):
    """Get a specific vendor by ID"""
    try:
        with get_cursor() as cur:
            query = """
                SELECT 
                    vendor_id,
                    name,
                    contact_info,
                    location_category,
                    address,
                    operating_hours,
                    cuisine_type,
                    payment_methods,
                    dietary_tags,
                    created_by
                FROM vendors
                WHERE vendor_id = %s
            """
            cur.execute(query, (vendor_id,))
            vendor = cur.fetchone()
            
            if not vendor:
                return jsonify({'error': 'Vendor not found'}), 404
                
            return jsonify(dict(vendor))
    except psycopg2.Error as e:
        print(f"Database error: {str(e)}")
        return jsonify({'error': f'Database error: {str(e)}'}), 500
