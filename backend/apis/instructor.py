from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource

class InstructorContentResource(Resource):
    def get(self, content_id=None):
        if content_id:
            content = InstructorContent.query.get(content_id)
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

    def post(self):
        data = request.get_json()
        new_content = InstructorContent(
            difficult_topics=data.get('difficult_topics'),
            most_frequent_doubts=data.get('most_frequent_doubts'),
            average_assignment_scores=data.get('average_assignment_scores'),
            quiz_completion_rates=data.get('quiz_completion_rates'),
            avg_lecture_watch_time_percentage=data.get('avg_lecture_watch_time_percentage')
        )
        db.session.add(new_content)
        db.session.commit()
        return {'message': 'Content added successfully', 'id': new_content.id}, 201

    def put(self, content_id):
        content = InstructorContent.query.get(content_id)
        if not content:
            return {'message': 'Content not found'}, 404
        
        data = request.get_json()
        content.difficult_topics = data.get('difficult_topics', content.difficult_topics)
        content.most_frequent_doubts = data.get('most_frequent_doubts', content.most_frequent_doubts)
        content.average_assignment_scores = data.get('average_assignment_scores', content.average_assignment_scores)
        content.quiz_completion_rates = data.get('quiz_completion_rates', content.quiz_completion_rates)
        content.avg_lecture_watch_time_percentage = data.get('avg_lecture_watch_time_percentage', content.avg_lecture_watch_time_percentage)
        
        db.session.commit()
        return {'message': 'Content updated successfully'}

    def delete(self, content_id):
        content = InstructorContent.query.get(content_id)
        if not content:
            return {'message': 'Content not found'}, 404
        
        db.session.delete(content)
        db.session.commit()
        return {'message': 'Content deleted successfully'}


