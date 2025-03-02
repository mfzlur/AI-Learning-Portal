from flask import request
from flask_restful import Resource, reqparse
from models import  db, Course, ProgrammingAssignment, TestCases
import csv
from flask import jsonify
import json


class ProgAssignments(Resource):
    def get(self):
        prog_assignments = ProgrammingAssignment.query.all()
        data = []
        for prog_assignment in prog_assignments:
            id = prog_assignment.id
            course_id = prog_assignment.course_id
            week_id = prog_assignment.week_id
            question = prog_assignment.question
            data.append({"id": id, "course_id": course_id, "week_id": week_id, "question": question})
        return jsonify(data)
    

class ProgAssignment(Resource):

    
    def get(self, prog_assignment_id):
        prog_assignments = ProgrammingAssignment.query.filter_by(id=prog_assignment_id).first()
        if prog_assignments is None:
            return {"message": "Prog Assignment not found"}, 404
        
        data = {
            "id": prog_assignments.id,
            "course_id": prog_assignments.course_id,
            "week_id": prog_assignments.week_id,
            "question": prog_assignments.question
            }

        test_cases = TestCases.query.filter_by(progassignment_id=prog_assignment_id).all()

        test_cases_data = []
        for test_case in test_cases:
            test_cases_data.append({
                "input": json.loads(test_case.input),
                "output": json.loads(test_case.output)
            })

        data["test_cases"] = test_cases_data

        return jsonify(data)



    # Allow users to post thier code for evaluation
    def post(self, prog_assignment_id):
        # get the code to evalaute from json
        data = request.get_json()

        # Handing no data provided
        if not data:
            return {"message": "No data provided"}, 400
        
        code = data.get("code")

        # Handing no code provided
        if code is None:
            return {"message": "No code provided"}, 400
        

        # Retrieve test cases
        print(prog_assignment_id)
        test_cases = TestCases.query.filter_by(progassignment_id=prog_assignment_id).all()

        # test_cases = [[[1,2,3], [6]], [[5,5,4], [14]]]
        if test_cases is None:
            return {"message": "No test cases found"}, 400
        

        # Evaluate the code
        results = []
        for test_case in test_cases:
            print(test_case)
            input = json.loads(test_case.input)
            output = test_case.output
            try:
                # First, try to parse JSON (for numbers, lists, and booleans)
                output =  json.loads(output)
            except (json.JSONDecodeError, TypeError):
                # If it's not JSON, return as a string
                output = output

            # Evaluate the code
            func_call = f"code_output = solution({', '.join(repr(arg) for arg in input)})"

            code_to_exec = code + '\n' + func_call
            print(code_to_exec)

            try:
                local_scope = {}
                exec(code_to_exec, {}, local_scope)

                code_output = local_scope.get("code_output")

                if code_output == output:
                    results.append(True)
                else:
                    results.append(False)

            except Exception as e:
                print(e)
                results.append(str(e))

        

        return jsonify(results)
    