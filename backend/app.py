import os
from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv
from db import init_db_pool, close_all_connections
from routes.auth_routes import auth_bp
from utils.hash_utils import bcrypt

# Load environment variables
load_dotenv()

# Initialize Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev-secret-key')

# Initialize bcrypt with app
bcrypt.init_app(app)

# Enable CORS for frontend
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})

# Initialize database connection pool
init_db_pool()

# Register blueprints
app.register_blueprint(auth_bp)

# Health check endpoint
@app.route('/health', methods=['GET'])
def health_check():
    return {'status': 'healthy', 'message': 'DukeEatz API is running'}, 200

# Cleanup on shutdown
@app.teardown_appcontext
def shutdown_session(exception=None):
    pass

if __name__ == '__main__':
    try:
        print("🚀 Starting DukeEatz Backend Server...")
        print("📍 Server running on http://localhost:5001")
        print("🔗 Accepting requests from http://localhost:3000")
        app.run(host='0.0.0.0', port=5001, debug=True)
    except KeyboardInterrupt:
        print("\n👋 Shutting down server...")
        close_all_connections()
