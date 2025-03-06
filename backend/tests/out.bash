============================= test session starts ==============================
platform linux -- Python 3.12.3, pytest-8.3.5, pluggy-1.5.0
rootdir: /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend
collected 67 items

tests/test_course_info.py s.F..F                                         [  8%]
tests/test_feedback.py ..F...                                            [ 17%]
tests/test_ga.py s.Fss                                                   [ 25%]
tests/test_instructor.py ......                                          [ 34%]
tests/test_lecture_bookmarks.py ....                                     [ 40%]
tests/test_main.py .....                                                 [ 47%]
tests/test_notes.py ....                                                 [ 53%]
tests/test_personalised_notes.py ..F..F.                                 [ 64%]
tests/test_prog_assignment_eval.py .....                                 [ 71%]
tests/test_query.py ssss                                                 [ 77%]
tests/test_questions.py s...sss                                          [ 88%]
tests/test_recommendations.py ..F..F.                                    [ 98%]
tests/test_utils.py F                                                    [100%]

=================================== FAILURES ===================================
__________________ CoursesAPITest.test_get_nonexistent_course __________________

self = <tests.test_course_info.CoursesAPITest testMethod=test_get_nonexistent_course>

    def test_get_nonexistent_course(self):
        """Test fetching a course that doesn't exist."""
>       response = self.app.get('/course/999')

tests/test_course_info.py:75: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1162: in get
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8da6c170>
o = <Response 34 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
____________________ CoursesAPITest.test_put_update_course _____________________

self = <tests.test_course_info.CoursesAPITest testMethod=test_put_update_course>

    def test_put_update_course(self):
        """Test updating an existing course."""
        update_data = {
            "name": "Advanced Python Programming"
        }
        response = self.app.put(
            f'/course/{self.course_id}',
            data=json.dumps(update_data),
            content_type='application/json'
        )
>       self.assertEqual(response.status_code, 200)
E       AssertionError: 405 != 200

tests/test_course_info.py:102: AssertionError
________________ FeedbackAPITest.test_get_nonexistent_feedback _________________

self = <tests.test_feedback.FeedbackAPITest testMethod=test_get_nonexistent_feedback>

    def test_get_nonexistent_feedback(self):
        """Test attempting to fetch a nonexistent feedback entry."""
>       response = self.app.get('/feedback/999')

tests/test_feedback.py:123: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1162: in get
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8d96acc0>
o = <Response 36 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
______________ GradedAssignmentTest.test_get_specific_assignment _______________

self = <tests.test_ga.GradedAssignmentTest testMethod=test_get_specific_assignment>

    def test_get_specific_assignment(self):
        """Test fetching a specific assignment."""
        # Check main.py shows routes are defined as:
        # api.add_resource(GradedAssignment, "/ga/<int:course_id>", "/ga/<int:course_id>/<int:assignment_id>")
        # Try direct path instead of using query parameter
>       response = self.app.get(f'/ga/{self.course_id}/{self.assignment_id}')

tests/test_ga.py:65: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1162: in get
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:489: in wrapper
    resp = resource(*args, **kwargs)
../venv/lib/python3.12/site-packages/flask/views.py:110: in view
    return current_app.ensure_sync(self.dispatch_request)(**kwargs)  # type: ignore[no-any-return]
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <apis.ga.GradedAssignment object at 0x7f6e8d977a10>, args = ()
kwargs = {'assignment_id': 1, 'course_id': 1}
meth = <bound method GradedAssignment.get of <apis.ga.GradedAssignment object at 0x7f6e8d977a10>>
decorators = []

    def dispatch_request(self, *args, **kwargs):
    
        # Taken from flask
        #noinspection PyUnresolvedReferences
        meth = getattr(self, request.method.lower(), None)
        if meth is None and request.method == 'HEAD':
            meth = getattr(self, 'get', None)
        assert meth is not None, 'Unimplemented method %r' % request.method
    
        if isinstance(self.method_decorators, Mapping):
            decorators = self.method_decorators.get(request.method.lower(), [])
        else:
            decorators = self.method_decorators
    
        for decorator in decorators:
            meth = decorator(meth)
    
>       resp = meth(*args, **kwargs)
E       TypeError: GradedAssignment.get() got an unexpected keyword argument 'assignment_id'

../venv/lib/python3.12/site-packages/flask_restful/__init__.py:604: TypeError
______________ PersonalisedNotesAPITest.test_get_nonexistent_note ______________

self = <tests.test_personalised_notes.PersonalisedNotesAPITest testMethod=test_get_nonexistent_note>

    def test_get_nonexistent_note(self):
        """Test attempting to fetch a nonexistent note."""
>       response = self.app.get('/personalised-notes/999')

tests/test_personalised_notes.py:134: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1162: in get
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8d93f020>
o = <Response 45 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
_____________ PersonalisedNotesAPITest.test_post_note_missing_data _____________

self = <tests.test_personalised_notes.PersonalisedNotesAPITest testMethod=test_post_note_missing_data>

    def test_post_note_missing_data(self):
        """Test creating a note with missing data."""
        note_data = {
            "title": "Incomplete Note"
            # Missing content
        }
>       response = self.app.post(
            '/personalised-notes',
            data=json.dumps(note_data),
            content_type='application/json'
        )

tests/test_personalised_notes.py:124: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1167: in post
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8d92e090>
o = <Response 48 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
__________ RecommendationsAPITest.test_get_nonexistent_recommendation __________

self = <tests.test_recommendations.RecommendationsAPITest testMethod=test_get_nonexistent_recommendation>

    def test_get_nonexistent_recommendation(self):
        """Test attempting to fetch a nonexistent recommendation."""
>       response = self.app.get('/recommendations/999')

tests/test_recommendations.py:118: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1162: in get
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8da6f770>
o = <Response 42 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
_________ RecommendationsAPITest.test_post_recommendation_missing_data _________

self = <tests.test_recommendations.RecommendationsAPITest testMethod=test_post_recommendation_missing_data>

    def test_post_recommendation_missing_data(self):
        """Test creating a recommendation with missing data."""
        rec_data = {
            # Missing content
        }
>       response = self.app.post(
            '/recommendations',
            data=json.dumps(rec_data),
            content_type='application/json'
        )

tests/test_recommendations.py:108: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
../venv/lib/python3.12/site-packages/werkzeug/test.py:1167: in post
    return self.open(*args, **kw)
../venv/lib/python3.12/site-packages/flask/testing.py:235: in open
    response = super().open(
../venv/lib/python3.12/site-packages/werkzeug/test.py:1116: in open
    response_parts = self.run_wsgi_app(request.environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:988: in run_wsgi_app
    rv = run_wsgi_app(self.application, environ, buffered=buffered)
../venv/lib/python3.12/site-packages/werkzeug/test.py:1264: in run_wsgi_app
    app_rv = app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1488: in __call__
    return self.wsgi_app(environ, start_response)
../venv/lib/python3.12/site-packages/flask/app.py:1466: in wsgi_app
    response = self.handle_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:1463: in wsgi_app
    response = self.full_dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:872: in full_dispatch_request
    rv = self.handle_user_exception(e)
../venv/lib/python3.12/site-packages/flask_cors/extension.py:176: in wrapped_function
    return cors_after_request(app.make_response(f(*args, **kwargs)))
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:298: in error_router
    return original_handler(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:295: in error_router
    return self.handle_error(e)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:310: in handle_error
    _handle_flask_propagate_exceptions_config(current_app, e)
../venv/lib/python3.12/site-packages/flask/app.py:870: in full_dispatch_request
    rv = self.dispatch_request()
../venv/lib/python3.12/site-packages/flask/app.py:855: in dispatch_request
    return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:493: in wrapper
    return self.make_response(data, code, headers=headers)
../venv/lib/python3.12/site-packages/flask_restful/__init__.py:522: in make_response
    resp = self.representations[mediatype](data, *args, **kwargs)
../venv/lib/python3.12/site-packages/flask_restful/representations/json.py:21: in output_json
    dumped = dumps(data, **settings) + "\n"
/usr/lib/python3.12/json/__init__.py:238: in dumps
    **kw).encode(obj)
/usr/lib/python3.12/json/encoder.py:202: in encode
    chunks = list(chunks)
/usr/lib/python3.12/json/encoder.py:439: in _iterencode
    o = _default(o)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

self = <json.encoder.JSONEncoder object at 0x7f6e8d6b03e0>
o = <Response 37 bytes [200 OK]>

    def default(self, o):
        """Implement this method in a subclass such that it returns
        a serializable object for ``o``, or calls the base implementation
        (to raise a ``TypeError``).
    
        For example, to support arbitrary iterators, you could
        implement default like this::
    
            def default(self, o):
                try:
                    iterable = iter(o)
                except TypeError:
                    pass
                else:
                    return list(iterable)
                # Let the base class default method raise the TypeError
                return super().default(o)
    
        """
>       raise TypeError(f'Object of type {o.__class__.__name__} '
                        f'is not JSON serializable')
E       TypeError: Object of type Response is not JSON serializable

/usr/lib/python3.12/json/encoder.py:180: TypeError
___________________________ test_api_with_fallbacks ____________________________

client = None, resource_id = None, data = None, primary_method = 'get'
primary_url = None, fallbacks = None, expected_codes = None

    def test_api_with_fallbacks(client=None, resource_id=None, data=None,
                               primary_method='get', primary_url=None,
                               fallbacks=None, expected_codes=None):
        """Test an API endpoint with multiple fallback methods/routes.
    
        Args:
            client: Flask test client
            resource_id: Optional ID of the resource being accessed
            data: Optional data to send in request body
            primary_method: Primary HTTP method to try first
            primary_url: Primary URL to try first
            fallbacks: List of (method, url) tuples to try if primary fails
            expected_codes: List of acceptable status codes
    
        Returns:
            tuple: (response, success_flag)
        """
        # This is a testing helper function, not a test itself
        # Let's implement a simple test case to make it pass
    
        if client is None:
            # Create a test client if none provided
>           with app.test_client() as test_client:
E           NameError: name 'app' is not defined

tests/test_utils.py:109: NameError
=============================== warnings summary ===============================
models.py:33
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/models.py:33: PytestCollectionWarning: cannot collect test class 'TestCases' because it has a __init__ constructor (from: tests/test_prog_assignment_eval.py)
    class TestCases(db.Model):

tests/test_course_info.py::CoursesAPITest::test_get_nonexistent_course
tests/test_course_info.py::CoursesAPITest::test_get_specific_course
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/course_info.py:11: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    course = Course.query.get(course_id)

tests/test_feedback.py::FeedbackAPITest::test_delete_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/apis/feedback.py:69: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_delete_feedback
  /mnt/c/Users/sjlaz/Laptop-Workspace/IITM 15.3.23/7. Term 7 - Degree  26.12.24/3. Software Engineering  11.1.25/Milestone 5 - 6.3.25/Code/soft-engg-project-jan-2025-se-Jan-7/backend/tests/test_feedback.py:118: LegacyAPIWarning: The Query.get() method is considered legacy as of the 1.x series of SQLAlchemy and becomes a legacy construct in 2.0. The method is now available as Session.get() (deprecated since: 2.0) (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    feedback = Feedback.query.get(self.feedback_id)

tests/test_feedback.py::FeedbackAPITest::test_get_nonexistent_feedback
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

tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_get_nonexistent_note
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

tests/test_recommendations.py::RecommendationsAPITest::test_get_nonexistent_recommendation
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

-- Docs: https://docs.pytest.org/en/stable/how-to/capture-warnings.html
=========================== short test summary info ============================
FAILED tests/test_course_info.py::CoursesAPITest::test_get_nonexistent_course
FAILED tests/test_course_info.py::CoursesAPITest::test_put_update_course - As...
FAILED tests/test_feedback.py::FeedbackAPITest::test_get_nonexistent_feedback
FAILED tests/test_ga.py::GradedAssignmentTest::test_get_specific_assignment
FAILED tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_get_nonexistent_note
FAILED tests/test_personalised_notes.py::PersonalisedNotesAPITest::test_post_note_missing_data
FAILED tests/test_recommendations.py::RecommendationsAPITest::test_get_nonexistent_recommendation
FAILED tests/test_recommendations.py::RecommendationsAPITest::test_post_recommendation_missing_data
FAILED tests/test_utils.py::test_api_with_fallbacks - NameError: name 'app' i...
============ 9 failed, 46 passed, 12 skipped, 43 warnings in 32.10s ============
