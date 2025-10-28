"""
Review model - utility functions for review operations
This file provides helper functions for review-related database operations
"""

from app.db import get_cursor
from datetime import datetime

class Review:
    """Review model class with utility methods"""
    
    @staticmethod
    def get_average_rating(vendor_id):
        """Get average rating for a vendor"""
        try:
            with get_cursor() as cur:
                query = """
                    SELECT AVG(rating)::NUMERIC(3,2) as avg_rating, COUNT(*) as review_count
                    FROM reviews
                    WHERE vendor_id = %s
                """
                cur.execute(query, (vendor_id,))
                result = cur.fetchone()
                return {
                    'average_rating': float(result['avg_rating']) if result['avg_rating'] else 0,
                    'review_count': result['review_count']
                }
        except Exception as e:
            return {'average_rating': 0, 'review_count': 0}
    
    @staticmethod
    def get_rating_distribution(vendor_id):
        """Get distribution of ratings for a vendor"""
        try:
            with get_cursor() as cur:
                query = """
                    SELECT rating, COUNT(*) as count
                    FROM reviews
                    WHERE vendor_id = %s
                    GROUP BY rating
                    ORDER BY rating DESC
                """
                cur.execute(query, (vendor_id,))
                results = cur.fetchall()
                return [dict(row) for row in results]
        except Exception as e:
            return []
    
    @staticmethod
    def user_has_reviewed(user_id, vendor_id):
        """Check if user has already reviewed a vendor"""
        try:
            with get_cursor() as cur:
                query = """
                    SELECT COUNT(*) as count
                    FROM reviews
                    WHERE user_id = %s AND vendor_id = %s
                """
                cur.execute(query, (user_id, vendor_id))
                result = cur.fetchone()
                return result['count'] > 0
        except Exception as e:
            return False
