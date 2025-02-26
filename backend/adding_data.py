from flask import Flask
from flask_restful import Api
from config import Config
from models import *
from apis.course_info import EnrolledCourses
from flask_cors import CORS
from flask_migrate import Migrate
from ques_bank.mlt_GA1 import GA1
from ques_bank.mlt_GA2 import GA2
from ques_bank.mlt_GA3 import GA3
from ques_bank.mlt_GA4 import GA4


app = Flask(__name__)
app.config.from_object(Config)
api = Api(app)
db.init_app(app)
CORS(app)

# Register API endpoints
api.add_resource(EnrolledCourses, '/enrolled_courses')

# Migrate database
migrate = Migrate(app, db)



with app.app_context():
    db.create_all()

    # Check if courses already exist before adding
    if not Course.query.filter_by(name="Machine Learning Techniques").first():
        course2 = Course(name="Machine Learning Techniques")
        db.session.add(course2)
    
    if not Course.query.filter_by(name="Data Structures and Algorithms").first():
        course1 = Course(name="Data Structures and Algorithms")
        db.session.add(course1)

    db.session.commit()  # Commit after course creation to get IDs

    # Fetch the courses again after commit
    course2 = Course.query.filter_by(name="Machine Learning Techniques").first()
    course1 = Course.query.filter_by(name="Data Structures and Algorithms").first()

    # Check if assignments already exist before adding
    if not Assignment.query.filter_by(week=1, course_id=course2.id).first():
        assignment1 = Assignment(week=1, course_id=course2.id, due_date=datetime(2025, 3, 5))
        db.session.add(assignment1)

    if not Assignment.query.filter_by(week=2, course_id=course2.id).first():
        assignment2 = Assignment(week=2, course_id=course2.id, due_date=datetime(2025, 3, 12))
        db.session.add(assignment2)

    if not Assignment.query.filter_by(week=3, course_id=course2.id).first():
        assignment3 = Assignment(week=3, course_id=course2.id, due_date=datetime(2025, 3, 19))
        db.session.add(assignment3)

    if not Assignment.query.filter_by(week=4, course_id=course2.id).first():
        assignment4 = Assignment(week=4, course_id=course2.id, due_date=datetime(2025, 3, 26))
        db.session.add(assignment4)

    db.session.commit()  # Commit after assignment creation to get IDs

    # Fetch assignments again after commit
    assignment1 = Assignment.query.filter_by(week=1, course_id=course2.id).first()
    assignment2 = Assignment.query.filter_by(week=2, course_id=course2.id).first()
    assignment3 = Assignment.query.filter_by(week=3, course_id=course2.id).first()
    assignment4 = Assignment.query.filter_by(week=4, course_id=course2.id).first()

    # Prevent duplicate questions
    def add_questions(assignment, question_data):
        for q_data in question_data:
            if not Question.query.filter_by(assignment_id=assignment.id, text=q_data["text"]).first():
                question = Question(
                    assignment_id=assignment.id,
                    text=q_data["text"],
                    options=q_data["options"],
                    correct_answer=q_data["correct_answer"]
                )
                db.session.add(question)

    add_questions(assignment1, GA1)
    add_questions(assignment2, GA2)
    add_questions(assignment3, GA3)
    add_questions(assignment4, GA4)

    db.session.commit()


if __name__ == '__main__':
    app.run(debug=True)