from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource
from models import db, InstructorContent

class InstructorContentResource(Resource):
    def get(self, content_id=None):
        if content_id:
            content = db.session.get(InstructorContent, content_id)
            if content:
                return jsonify({
                    'id': content.id,
                    'difficult_topics': content.difficult_topics,
                    'most_frequent_doubts': content.most_frequent_doubts,
                    'average_assignment_scores': content.average_assignment_scores,
                    'quiz_completion_rates': content.quiz_completion_rates,
                    'avg_lecture_watch_time_percentage': content.avg_lecture_watch_time_percentage
                })
            return {'message': 'Content not found'}, 404
        
        all_content = InstructorContent.query.all()
        return jsonify([{
            'id': content.id,
            'difficult_topics': content.difficult_topics,
            'most_frequent_doubts': content.most_frequent_doubts,
            'average_assignment_scores': content.average_assignment_scores,
            'quiz_completion_rates': content.quiz_completion_rates,
            'avg_lecture_watch_time_percentage': content.avg_lecture_watch_time_percentage
        } for content in all_content])

    

