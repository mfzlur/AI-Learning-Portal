from flask import Flask
from flask_restful import Api
from config import Config
from models import db
from apis.course_info import EnrolledCourses
from apis.prog_assignment_eval import ProgAssignment
from flask_cors import CORS
from config_tests import save_tests

app = Flask(__name__)
app.config.from_object(Config)
api = Api(app)
db.init_app(app)
CORS(app)

# Register API endpoints
api.add_resource(EnrolledCourses, '/enrolled_courses')
api.add_resource(ProgAssignment, '/programming_assignmnet/<int:prog_assignment_id>')


with app.app_context():
    db.create_all()
    save_tests()

if __name__ == '__main__':
    app.run(debug=True)
