from flask import request, jsonify
from flask_restful import Resource
from models import  *




class GradedAssignment(Resource):
    def get(self, course_id):  
        assignments = Assignment.query.filter_by(course_id=course_id).all()

        response = [{
            "id": assignment.id,
            "week": assignment.week,
            "due_date": assignment.due_date.strftime('%Y-%m-%d'),
            "submitted": assignment.submitted,
            "score": assignment.score,
            "questions": [
                {
                    "id": question.id,
                    "text": question.text,
                    "options": question.options,
                    "correct_answer": question.correct_answer
                }
                for question in assignment.questions
            ]
        } for assignment in assignments]

        return jsonify(response)
    
    def post(self, course_id, assignment_id):
        # Extract form-data
        assignment_id = request.form.get('assignment_id')
        score = request.form.get('score')

        if not assignment_id or not score:
            return {"error": "Missing assignment_id or score"}, 400

        assignment = Assignment.query.get(assignment_id)
        if assignment:
            assignment.score = int(score)  # Ensure score is an integer
            assignment.submitted = True
            db.session.commit()

            course = Course.query.get(course_id)
            if course:
                total_submitted_assignments = sum(1 for a in course.assignments if a.submitted)
                course.progress_percentage = (total_submitted_assignments / len(course.assignments)) * 100
                db.session.commit()

            return {"message": "Graded assignment successfully"}, 200
        else:
            return {"error": "Assignment not found"}, 404
