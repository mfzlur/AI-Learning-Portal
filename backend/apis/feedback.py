from flask import request, jsonify
from flask_restful import Resource
from models import db, Feedback

class FeedbackAPI(Resource):
    def get(self, feedback_id=None):
        """Fetch all feedback entries or a specific feedback entry."""
        if feedback_id:
            feedback = Feedback.query.get(feedback_id)
            if not feedback:
                return jsonify({"error": "Feedback not found"}), 404
            return jsonify({
                "id": feedback.id,
                "title": feedback.title,
                "comment": feedback.conmment,  # Note: "comment" had a typo in your model
                "attachments": feedback.attachments
            })

        feedbacks = Feedback.query.all()
        return jsonify([
            {
                "id": fb.id,
                "title": fb.title,
                "comment": fb.conmment,
                "attachments": fb.attachments
            }
            for fb in feedbacks
        ])

    def post(self):
        """Create a new feedback entry."""
        data = request.get_json()
        title = data.get("title")
        comment = data.get("comment")
        attachments = data.get("attachments")

        if not title or not comment:
            return jsonify({"error": "Title and comment are required"}), 400

        feedback = Feedback(title=title, conmment=comment, attachments=attachments)
        db.session.add(feedback)
        db.session.commit()

        return jsonify({"message": "Feedback added successfully", "id": feedback.id})

    def put(self, feedback_id):
        """Update an existing feedback entry."""
        feedback = Feedback.query.get(feedback_id)
        if not feedback:
            return jsonify({"error": "Feedback not found"}), 404

        data = request.get_json()
        title = data.get("title")
        comment = data.get("comment")
        attachments = data.get("attachments")

        if title is not None:
            feedback.title = title
        if comment is not None:
            feedback.conmment = comment  # Note: typo in model, "conmment" should be "comment"
        if attachments is not None:
            feedback.attachments = attachments

        db.session.commit()
        return jsonify({"message": "Feedback updated successfully"})

    def delete(self, feedback_id):
        """Delete a feedback entry."""
        feedback = Feedback.query.get(feedback_id)
        if not feedback:
            return jsonify({"error": "Feedback not found"}), 404

        db.session.delete(feedback)
        db.session.commit()
        return jsonify({"message": "Feedback deleted successfully"})
