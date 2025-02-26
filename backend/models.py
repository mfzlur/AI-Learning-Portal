from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Course(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)
    assignments = db.relationship('Assignment', backref='course', lazy=True)
    progress_percentage = db.Column(db.Integer, default=0)
    lectures = db.relationship('Lectures', backref='course', lazy=True)
    notes = db.relationship('Notes', backref='course', lazy=True)


class Assignment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    week = db.Column(db.Integer, nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'), nullable=False)
    due_date = db.Column(db.DateTime)

    questions = db.relationship('Question', backref='assignment', lazy=True)
    submitted = db.Column(db.Boolean, default=False)
    score = db.Column(db.Integer, default=-1)

class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    assignment_id = db.Column(db.Integer, db.ForeignKey('assignment.id'), nullable=False)
    
    text = db.Column(db.Text, nullable=False)
    options = db.Column(db.JSON)  # ["Option A", "B", "C", "D"]
    correct_answer = db.Column(db.Integer)  # 0-3 index
    user_answer = db.Column(db.Integer, default=-1)


class Lectures(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'), nullable=False)
    week = db.Column(db.Integer, nullable=False)
    title = db.Column(db.String(200), nullable=False)
    video_url = db.Column(db.String(240), nullable=False)
    video_embed_code = db.Column(db.Text, nullable=False)
    bookmarks = db.relationship('LectureBookmarks', backref='lectures', lazy=True)


class Notes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'), nullable=False)
    week = db.Column(db.Integer, nullable=False)
    title = db.Column(db.String(200), nullable=False)
    content = db.Column(db.Text, nullable=False)


class LectureBookmarks(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    timestamp = db.Column(db.Integer, nullable=False)
    lecture_id = db.Column(db.Integer, db.ForeignKey('lectures.id'), nullable=False)
    remarks = db.Column(db.Text, nullable=True)



