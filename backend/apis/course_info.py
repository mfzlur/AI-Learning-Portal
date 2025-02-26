from flask import request
from flask_restful import Resource, reqparse
from models import  db, Course

from flask import jsonify

class EnrolledCourses(Resource):
    def get(self):
        courses = Course.query.all()
        courses = [
            {
                "id": 1,
                "name": "DSA",
                "assignments": [
                    {"week": 1, "score": "100"},
                    {"week": 2, "score": "100"},
                    {"week": 3, "score": "100"},
                ]
            },
            {
                "id": 2,
                "name": "Machine Learning Techniques",
                "assignments": [
                    {"week": 1, "score": "95"},
                    {"week": 2, "score": "90"},
                    {"week": 3, "score": "85"},
                ]
            }
        ]
        print(courses)
        return jsonify(courses)


