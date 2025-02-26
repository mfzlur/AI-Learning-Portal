from flask import Flask
from flask_restful import Api
from config import Config
from models import *
from apis.course_info import EnrolledCourses
from flask_cors import CORS
from flask_migrate import Migrate
from ques_bank.lecture_data import lectures_data
from models import Lectures


app = Flask(__name__)
app.config.from_object(Config)
api = Api(app)
db.init_app(app)
CORS(app)

# Register API endpoints
api.add_resource(EnrolledCourses, "/courses", "/course/<int:course_id>")

# Migrate database
migrate = Migrate(app, db)



with app.app_context():

    db.create_all()


    

if __name__ == '__main__':
    app.run(debug=True)
