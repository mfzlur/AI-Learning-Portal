============================= test session starts ==============================
platform linux -- Python 3.12.3, pytest-8.3.5, pluggy-1.5.0
rootdir: /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend
collected 67 items

tests/test_course_info.py s.s..s                                         [  8%]
tests/test_feedback.py ..s...                                            [ 17%]
tests/test_ga.py s.sss                                                   [ 25%]
tests/test_instructor.py ......                                          [ 34%]
tests/test_lecture_bookmarks.py ....                                     [ 40%]
tests/test_main.py .....                                                 [ 47%]
tests/test_notes.py ....                                                 [ 53%]
tests/test_personalised_notes.py ..s..s.                                 [ 64%]
tests/test_prog_assignment_eval.py .....                                 [ 71%]
tests/test_query.py ssss                                                 [ 77%]
tests/test_questions.py s...sss                                          [ 88%]
tests/test_recommendations.py ..s..s.                                    [ 98%]
tests/test_utils.py .                                                    [100%]

=============================== warnings summary ===============================
models.py:33
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/models.py:33: PytestCollectionWarning: cannot collect test class 'TestCases' because it has a __init__ constructor (from: tests/test_prog_assignment_eval.py)
    class TestCases(db.Model):

tests/test_course_info.py::CoursesAPITest::test_get_specific_course
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/course_info.py:11: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    course = Course.query.get(course_id)

tests/test_feedback.py::FeedbackAPITest::test_delete_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/feedback.py:69: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_delete_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_feedback.py:118: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(self.feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_get_specific_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/feedback.py:9: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_put_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/feedback.py:48: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_put_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_feedback.py:106: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(self.feedback_id)

tests/test_instructor.py::InstructorContentResourceTest::test_delete_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/instructor.py:60: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(content_id)

tests/test_instructor.py::InstructorContentResourceTest::test_delete_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_instructor.py:121: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(self.content_id)

tests/test_instructor.py::InstructorContentResourceTest::test_get_nonexistent_content
tests/test_instructor.py::InstructorContentResourceTest::test_get_specific_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/instructor.py:9: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(content_id)

tests/test_instructor.py::InstructorContentResourceTest::test_post_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_instructor.py:87: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(data['id'])

tests/test_instructor.py::InstructorContentResourceTest::test_put_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/instructor.py:45: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(content_id)

tests/test_instructor.py::InstructorContentResourceTest::test_put_content
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_instructor.py:110: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    content = InstructorContent.query.get(self.content_id)

tests/test_lecture_bookmarks.py::test_get_bookmarks
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/lecture_bookmarks.py:8: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    lecture = Lecture.query.get(lecture_id)

tests/test_lecture_bookmarks.py::test_post_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/lecture_bookmarks.py:24: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    lecture = Lecture.query.get(lecture_id)

tests/test_lecture_bookmarks.py::test_post_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_lecture_bookmarks.py:82: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    bookmark = LectureBookmark.query.get(data['id'])

tests/test_lecture_bookmarks.py::test_put_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/lecture_bookmarks.py:43: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    lecture = Lecture.query.get(lecture_id)

tests/test_lecture_bookmarks.py::test_put_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_lecture_bookmarks.py:104: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    bookmark = LectureBookmark.query.get(test_bookmark)

tests/test_lecture_bookmarks.py::test_delete_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/lecture_bookmarks.py:70: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    bookmark = LectureBookmark.query.get(bookmark_id)

tests/test_lecture_bookmarks.py::test_delete_bookmark
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_lecture_bookmarks.py:124: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    bookmark = LectureBookmark.query.get(test_bookmark)

tests/test_notes.py::test_get_notes
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/notes.py:8: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    course = Course.query.get(course_id)

tests/test_notes.py::test_post_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/notes.py:25: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    course = Course.query.get(course_id)

tests/test_notes.py::test_post_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_notes.py:92: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = Note.query.get(data['id'])

tests/test_notes.py::test_put_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_notes.py:111: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = Note.query.get(note_id)

tests/test_notes.py::test_put_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_notes.py:119: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = Note.query.get(note_id)

tests/test_notes.py::test_delete_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/notes.py:75: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = Note.query.get(note_id)

tests/test_notes.py::test_delete_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_notes.py:154: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = Note.query.get(note_id)

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_delete_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/personalised_notes.py:60: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = PersonalisedNote.query.get(note_id)

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_delete_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_personalised_notes.py:115: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = PersonalisedNote.query.get(self.note_id)

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_get_specific_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/personalised_notes.py:11: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = PersonalisedNote.query.get(note_id)

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_put_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/personalised_notes.py:42: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = PersonalisedNote.query.get(note_id)

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_put_note
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_personalised_notes.py:104: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    note = PersonalisedNote.query.get(self.note_id)

tests/test_recommendations.py::RecommendationsAPITest::test_delete_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/recommendations.py:53: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    recommendation = Recommendation.query.get(recommendation_id)

tests/test_recommendations.py::RecommendationsAPITest::test_delete_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_recommendations.py:100: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    rec = Recommendation.query.get(self.recommendation_id)

tests/test_recommendations.py::RecommendationsAPITest::test_get_specific_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/recommendations.py:9: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    recommendation = Recommendation.query.get(recommendation_id)

tests/test_recommendations.py::RecommendationsAPITest::test_post_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_recommendations.py:72: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    rec = Recommendation.query.get(data['id'])

tests/test_recommendations.py::RecommendationsAPITest::test_put_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/recommendations.py:38: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    recommendation = Recommendation.query.get(recommendation_id)

tests/test_recommendations.py::RecommendationsAPITest::test_put_recommendation
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_recommendations.py:90: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    rec = Recommendation.query.get(self.recommendation_id)

tests/test_utils.py::test_api_with_fallbacks
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/venv/lib/python3.12/site-packages/_pytest/python.py:163: PytestReturnNotNoneWarning: Expected None, but tests/test_utils.py::test_api_with_fallbacks returned (<WrapperTestResponse streamed [404 NOT FOUND]>, False), which will be an error in a future version of pytest.  Did you mean to use `assert` instead of `return`?
    warnings.warn(

-- Docs: https://docs.pytest.org/en/stable/how-to/capture-warnings.html
================= 47 passed, 20 skipped, 40 warnings in 35.68s =================
