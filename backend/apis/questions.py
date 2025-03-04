from flask import Flask, jsonify
from flask_restful import Resource
from models import db, Question

class QuestionList(Resource):
    def get(self):
        questions = Question.query.all()
        data = []
        for q in questions:
            data.append({
                "id": q.id,
                "text": q.text,
                "options": q.options,
                "correct_answer": q.correct_answer,
                "user_answer": q.user_answer,
                "week": q.assignment.week  # Get `week` from `Assignment` table
            })
        return jsonify(data)



