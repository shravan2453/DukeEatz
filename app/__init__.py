from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    
    # Load configuration
    app.config.from_object('app.config.Config')
    
    # Enable CORS for React frontend - allow all origins in development
    CORS(app, resources={
        r"/api/*": {
            "origins": ["http://localhost:3000", "http://localhost:5001"],
            "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
            "allow_headers": ["Content-Type"],
            "supports_credentials": True
        }
    })
    
    # Register blueprints
    from app.routes.reviews import reviews_bp
    from app.routes.vendors import vendors_bp
    app.register_blueprint(reviews_bp, url_prefix='/api/reviews')
    app.register_blueprint(vendors_bp, url_prefix='/api/vendors')
    
    return app
