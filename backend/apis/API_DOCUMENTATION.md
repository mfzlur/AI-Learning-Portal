Here's the documentation for **API** using a structured format:

---

# **Courses API Documentation**

## **Endpoint**
`GET /courses`  
`GET /courses/<int:course_id>`

## **Description**
This API allows users to retrieve information about  courses.  
- If `course_id` is provided, detailed information about a specific course is returned.  
- If `course_id` is omitted, a list of all courses is returned with basic details.

---

## **Request**
### **1. Retrieve All Courses**
- **Method**: `GET`
- **URL**: `/courses`

#### **Query Parameters**: None  
#### **Request Example**:
```http
GET /courses
```

---

### **2. Retrieve a Specific Course**
- **Method**: `GET`
- **URL**: `/courses/<course_id>`

#### **Path Parameters**:
| Parameter | Type  | Required | Description |
|-----------|-------|----------|-------------|
| `course_id` | `integer` | Yes | ID of the course to fetch details |

#### **Request Example**:
```http
GET /courses/1
```

---

## **Responses**

### **1. Success Response - List of Courses**
#### **Response (200 OK)**
If `course_id` is not provided, returns a list of all courses.

```json
[
    {
        "id": 1,
        "name": "Machine Learning",
        "assignments": [
            {
                "id": 101,
                "week": 1,
                "due_date": "2025-03-01",
                "submitted": true,
                "score": 85
            }
        ]
    },
    {
        "id": 2,
        "name": "Deep Learning",
        "assignments": [
            {
                "id": 102,
                "week": 2,
                "due_date": "2025-03-10",
                "submitted": false,
                "score": null
            }
        ]
    }
]
```

---

### **2. Success Response - Specific Course Details**
#### **Response (200 OK)**
If `course_id` is provided, returns detailed information about the course.

```json
{
    "id": 1,
    "name": "Machine Learning",
    "progress_percentage": 75,
    "assignments": [
        {
            "id": 101,
            "week": 1,
            "due_date": "2025-03-01",
            "submitted": true,
            "score": 85
        }
    ],
    "lectures": [
        {
            "id": 201,
            "week": 1,
            "title": "Introduction to Machine Learning",
            "video_url": "https://youtu.be/KMcUe7GQnf0",
            "video_embed_code": "<iframe src='https://www.youtube.com/embed/KMcUe7GQnf0' allowfullscreen></iframe>",
            "bookmarks": [
                {
                    "id": 301,
                    "timestamp": "00:05:12",
                    "remarks": "Important concept"
                }
            ]
        }
    ],
    "notes": [
        {
            "id": 401,
            "course_id": 1,
            "week": 1,
            "title": "Lecture 1 Notes",
            "content": "Introduction to ML concepts..."
        }
    ]
}
```

---

### **3. Error Response - Course Not Found**
#### **Response (404 Not Found)**
If the requested `course_id` does not exist.

```json
{
    "error": "Course not found"
}
```

---

## **Error Handling**
| Error Code | Description |
|------------|-------------|
| `404 Not Found` | The requested course does not exist in the database. |

---

## **Usage Notes**
- Ensure `course_id` is a valid integer when making requests to retrieve specific course details.
- The API response includes **assignments, lectures, and notes** associated with the course.
- If a user requests all courses, only basic details are returned.  
  To get full details, request a specific course using `/courses/<course_id>`.

---

Let me know if you need modifications or additional details! 🚀