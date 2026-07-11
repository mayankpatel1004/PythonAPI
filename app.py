from flask import Flask, jsonify
from flask_cors import CORS
from auth import auth_bp
from routes.users import users_bp
from routes.item_sections import sections_bp
from routes.items import items_bp
from routes.configs import configs_bp
from web import web_bp          # <-- Import the web blueprint
from config import Config

app = Flask(__name__)
app.secret_key = Config.SECRET_KEY
app.config['SECRET_KEY'] = Config.SECRET_KEY   # redundancy
CORS(app)  # Enable CORS for Postman testing

# Register blueprints
app.register_blueprint(auth_bp)
app.register_blueprint(users_bp)
app.register_blueprint(sections_bp)
app.register_blueprint(items_bp)
app.register_blueprint(configs_bp)
app.register_blueprint(web_bp) 

# Global error handlers
@app.errorhandler(404)
def not_found(error):
    return jsonify({'message': 'Resource not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({'message': 'Internal server error'}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)