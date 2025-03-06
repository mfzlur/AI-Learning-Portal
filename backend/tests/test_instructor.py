"""
Tests for instructor content API endpoints.
Tests the InstructorContentResource class and its methods.
"""

import unittest
import json
from main import app
from models import db, InstructorContent


class InstructorContentResourceTest(unittest.TestCase):
    """Test cases for InstructorContentResource."""
    
    def setUp(self):
        """Set up test client and create test database."""
        app.config['TESTING'] = True
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
        self.app = app.test_client()
        with app.app_context():
            db.create_all()
            
            # Create test instructor content
            content1 = InstructorContent(
                difficult_topics="Recursion, Dynamic Programming",
                most_frequent_doubts="How to optimize algorithms?",
                average_assignment_scores=78.5,
                quiz_completion_rates=85.2,
                avg_lecture_watch_time_percentage=76.3
            )
            content2 = InstructorContent(
                difficult_topics="Object-Oriented Programming, Design Patterns",
                most_frequent_doubts="How to structure large applications?",
                average_assignment_scores=82.1,
                quiz_completion_rates=88.7,
                avg_lecture_watch_time_percentage=79.5
            )
            db.session.add_all([content1, content2])
            db.session.commit()
            self.content_id = content1.id

    def tearDown(self):
        """Clean up after test."""
        with app.app_context():
            db.session.remove()
            db.drop_all()

    def test_get_all_content(self):
        """Test fetching all instructor content."""
        response = self.app.get('/content')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data)
        self.assertEqual(len(data), 2)
        self.assertIn('difficult_topics', data[0])
        self.assertIn('most_frequent_doubts', data[0])
        self.assertIn('average_assignment_scores', data[0])

    def test_get_specific_content(self):
        """Test fetching specific instructor content."""
        response = self.app.get(f'/content/{self.content_id}')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data)
        self.assertEqual(data['difficult_topics'], "Recursion, Dynamic Programming")
        self.assertEqual(data['most_frequent_doubts'], "How to optimize algorithms?")
        self.assertEqual(data['average_assignment_scores'], 78.5)

    def test_post_content(self):
        """Test creating new instructor content."""
        content_data = {
            "difficult_topics": "Memory Management, Concurrency",
            "most_frequent_doubts": "How to debug memory leaks?",
            "average_assignment_scores": 75.3,
            "quiz_completion_rates": 82.7,
            "avg_lecture_watch_time_percentage": 71.8
        }
        response = self.app.post(
            '/content',
            data=json.dumps(content_data),
            content_type='application/json'
        )
        self.assertEqual(response.status_code, 201)
        data = json.loads(response.data)
        self.assertIn('id', data)
        
        # Verify content was added
        with app.app_context():
            content = InstructorContent.query.get(data['id'])
            self.assertIsNotNone(content)
            self.assertEqual(content.difficult_topics, "Memory Management, Concurrency")
            self.assertEqual(content.average_assignment_scores, 75.3)

    def test_put_content(self):
        """Test updating existing instructor content."""
        update_data = {
            "difficult_topics": "Updated Topics",
            "most_frequent_doubts": "Updated doubts",
            "average_assignment_scores": 90.0,
            "quiz_completion_rates": 95.0,
            "avg_lecture_watch_time_percentage": 85.0
        }
        response = self.app.put(
            f'/content/{self.content_id}',
            data=json.dumps(update_data),
            content_type='application/json'
        )
        self.assertEqual(response.status_code, 200)
        
        # Verify content was updated
        with app.app_context():
            content = InstructorContent.query.get(self.content_id)
            self.assertEqual(content.difficult_topics, "Updated Topics")
            self.assertEqual(content.average_assignment_scores, 90.0)

    def test_delete_content(self):
        """Test deleting instructor content."""
        response = self.app.delete(f'/content/{self.content_id}')
        self.assertEqual(response.status_code, 200)
        
        # Verify content was deleted
        with app.app_context():
            content = InstructorContent.query.get(self.content_id)
            self.assertIsNone(content)

    def test_get_nonexistent_content(self):
        """Test attempting to fetch nonexistent content."""
        response = self.app.get('/content/999')
        self.assertEqual(response.status_code, 404)


if __name__ == '__main__':
    unittest.main()
