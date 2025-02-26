from flask import Flask
from flask_restful import Api
from config import Config
from models import db
from backend.apis.course_info import EnrolledCourses
from flask_cors import CORS

app = Flask(__name__)
app.config.from_object(Config)
api = Api(app)
db.init_app(app)
CORS(app)

# Register API endpoints
api.add_resource(EnrolledCourses, '/enrolled_courses')


with app.app_context():
    db.create_all()


if __name__ == '__main__':
    app.run(debug=True)
