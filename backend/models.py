from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Course(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(120), nullable=False)
    weeks = db.relationship('Week', backref='course', lazy=True)
    assignment_scores = db.Column(db.JSON)

class Week(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'), nullable=False)
    week_number = db.Column(db.Integer, nullable=False)
    assignment = db.relationship('Assignment', uselist=False, backref='week')

class Assignment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    week_id = db.Column(db.Integer, db.ForeignKey('week.id'), nullable=False)
    due_date = db.Column(db.DateTime)
    
    questions = db.relationship('Question', backref='assignment', lazy=True)

class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    assignment_id = db.Column(db.Integer, db.ForeignKey('assignment.id'), nullable=False)
    text = db.Column(db.Text, nullable=False)
    options = db.Column(db.JSON)  # ["Option A", "B", "C", "D"]
    correct_answer = db.Column(db.Integer)  # 0-3 index

class Answer(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'), nullable=False)
    selected_option = db.Column(db.Integer)  # 0-3 index

class Progress(db.Model):
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'), primary_key=True)
    completed_weeks = db.Column(db.Integer, default=0)
    total_score = db.Column(db.Float, default=0.0)

def update_progress(course_id):
    course = Course.query.get(course_id)
    progress = Progress.query.get(course_id) or Progress(course_id=course_id)
    
    total_weeks = len(course.weeks)
    completed = 0
    
    for week in course.weeks:
        assignment = week.assignment
        if not assignment:
            continue
            
        # Check completion conditions
        due_date_passed = assignment.due_date and assignment.due_date < datetime.now()
        all_answered = all(Answer.query.filter_by(question_id=q.id).first() 
                         for q in assignment.questions)
        
        if due_date_passed or all_answered:
            completed += 1
    
    progress.completed_weeks = completed
    progress.total_score = (completed / total_weeks * 100) if total_weeks > 0 else 0
    db.session.add(progress)
    db.session.commit()
