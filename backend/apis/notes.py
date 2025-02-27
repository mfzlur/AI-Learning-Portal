from flask import request, jsonify
from flask_restful import Resource
from models import db, Notes, Course

class NotesAPI(Resource):
    def get(self, course_id):
        """Fetch all notes for a given course."""
        course = Course.query.get(course_id)
        if not course:
            return jsonify({"error": "Course not found"}), 404

        notes = Notes.query.filter_by(course_id=course_id).all()
        return jsonify([
            {
                "id": note.id,
                "week": note.week,
                "title": note.title,
                "content": note.content
            }
            for note in notes
        ])

    def post(self, course_id):
        """Add a new note to a course."""
        course = Course.query.get(course_id)
        if not course:
            return jsonify({"error": "Course not found"}), 404

        data = request.get_json()
        week = data.get("week")
        title = data.get("title")
        content = data.get("content")

        if not week or not title or not content:
            return jsonify({"error": "Week, title, and content are required"}), 400

        note = Notes(course_id=course_id, week=week, title=title, content=content)
        db.session.add(note)
        db.session.commit()

        return jsonify({"message": "Note added successfully", "id": note.id})

    def put(self, course_id):
        """Update an existing note for a course."""
        course = Course.query.get(course_id)
        if not course:
            return jsonify({"error": "Course not found"}), 404

        data = request.get_json()
        note_id = data.get("id")
        week = data.get("week")
        title = data.get("title")
        content = data.get("content")

        if not note_id:
            return jsonify({"error": "Note ID is required"}), 400

        note = Notes.query.filter_by(id=note_id, course_id=course_id).first()
        if not note:
            return jsonify({"error": "Note not found"}), 404

        if week is not None:
            note.week = week
        if title is not None:
            note.title = title
        if content is not None:
            note.content = content

        db.session.commit()
        return jsonify({"message": "Note updated successfully"})

class DeleteNotesAPI(Resource):
    def delete(self, note_id):
        """Delete a note."""
        note = Notes.query.get(note_id)
        if not note:
            return jsonify({"error": "Note not found"}), 404

        db.session.delete(note)
        db.session.commit()
        return jsonify({"message": "Note deleted successfully"})
