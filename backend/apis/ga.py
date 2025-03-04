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
                    "correct_answer": question.correct_answer,
                    "user_answer": question.user_answer
                }
                for question in assignment.questions
            ]
        } for assignment in assignments]

        return jsonify(response)


    def post(self, course_id, assignment_id):
        data = request.get_json()
        if not data or "answers" not in data:
            return {"error": "Missing answers data"}, 400

        assignment = Assignment.query.get(assignment_id)
        if not assignment:
            return {"error": "Assignment not found"}, 404

        correct_count = 0
        total_questions = len(assignment.questions)

        for question in assignment.questions:
            user_answer = data["answers"].get(str(question.id))  # Answers sent as a dict {question_id: user_answer}
            if user_answer != -1:
                question.user_answer = user_answer
                if user_answer == question.correct_answer:
                    correct_count += 1

        assignment.score = (correct_count / total_questions) * 100  # Calculate percentage score
        assignment.submitted = True
        db.session.commit()

        # Update course progress
        course = Course.query.get(course_id)
        if course:
            total_submitted_assignments = sum(1 for a in course.assignments if a.submitted)
            course.progress_percentage = (total_submitted_assignments / len(course.assignments)) * 100
            db.session.commit()

        return {"message": "Graded assignment successfully", "score": assignment.score}, 200

