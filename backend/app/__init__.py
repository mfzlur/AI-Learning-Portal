from flask import Flask
from flask_pymongo import PyMongo
from flask_cors import CORS
from config import Config

mongo = PyMongo()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    print(Config.MONGO_URI)
    CORS(app)
    mongo.init_app(app)
    print(mongo.db)
    # Import and register blueprints (routes)
    from app.routes.auth_routes import auth_bp
    app.register_blueprint(auth_bp, url_prefix="/auth")

    return app
