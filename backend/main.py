from flask import Flask
from flask_restful import Api
from config import Config

from models import *
from apis.course_info import Courses
from flask_cors import CORS
from flask_migrate import Migrate
# from data.mlt_lectures import mlt_lectures
# from data.dsa_lectures import dsa_lectures
# from models import Lectures
from apis.ga import GradedAssignment
from apis.lecture_bookmarks import *
from apis.notes import *
from apis.feedback import *
from apis.personalised_notes import *
from apis.recommendations import *
from apis.instructor import *
from apis.instructor import *


from apis.prog_assignment_eval import ProgAssignment, ProgAssignments
from flask_cors import CORS
from config_tests import save_tests


app = Flask(__name__)
app.config.from_object(Config)
api = Api(app)
db.init_app(app)
CORS(app)

# Register API endpoints
api.add_resource(Courses, "/courses", "/course/<int:course_id>")
api.add_resource(GradedAssignment, "/ga/<int:course_id>", "/ga/<int:course_id>/<int:assignment_id>")
api.add_resource(LectureBookmarksAPI, "/lecturebookmarks/<int:lecture_id>")
api.add_resource(DeleteLectureBookmarkAPI, "/lecturebookmarks/delete/<int:bookmark_id>")
api.add_resource(NotesAPI, "/notes/<int:course_id>")
api.add_resource(DeleteNotesAPI, "/notes/delete/<int:note_id>")
api.add_resource(FeedbackAPI, "/feedback", "/feedback/<int:feedback_id>")
api.add_resource(RecommendationsAPI, "/recommendations", "/recommendations/<int:recommendation_id>")
api.add_resource(PersonalisedNotesAPI, "/personalised-notes", "/personalised-notes/<int:note_id>")
api.add_resource(InstructorContentResource, '/content', '/content/<int:content_id>')
api.add_resource(ProgAssignment, '/programming_assignmnet/<int:prog_assignment_id>')
api.add_resource(ProgAssignments, '/programming_assignmnets')




# Migrate database
migrate = Migrate(app, db)




with app.app_context():

    db.create_all()

# with app.app_context():
#     for lecture in dsa_lectures:
#         existing_lecture = Lectures.query.filter_by(title=lecture["title"]).first()
#         if not existing_lecture:
#             new_lecture = Lectures(**lecture)
#             db.session.add(new_lecture)
    
#     db.session.commit()
    save_tests()

if __name__ == '__main__':
    app.run(debug=True)
