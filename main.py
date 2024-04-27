# Online Python compiler (interpreter) to run Python online.
# lment data
import csv
import random

# Function to generate student data
def generate_students(num_students):
    students = []
    for i in range(num_students):
        student_id = i + 1
        student_name = f"Student {student_id}"
        students.append((student_id, student_name))
    return students

# Function to generate course data
def generate_courses(num_courses):
    courses = []
    for i in range(num_courses):
        course_id = i + 1
        course_name = f"Course {course_id}"
        courses.append((course_id, course_name))
    return courses

# Function to generate enrollment data
def generate_enrollments(num_students, num_courses):
    enrollments = []
    for student_id in range(1, num_students + 1):
        for course_id in random.sample(range(1, num_courses + 1), random.randint(1, num_courses)):
            enrollments.append((student_id, course_id))
    return enrollments

# Function to print data as CSV format
def print_as_csv(data, headers):
    print(','.join(headers))
    for row in data:
        print(','.join(map(str, row)))

# Generate data
num_students = 10
num_courses = 5

students = generate_students(num_students)
courses = generate_courses(num_courses)
enrollments = generate_enrollments(num_students, num_courses)

# Print data as CSV format
print("Student Data:")
print_as_csv(students, ['StudentID', 'StudentName'])

print("\nCourse Data:")
print_as_csv(courses, ['CourseID', 'CourseName'])

print("\nEnrollment Data:")
print_as_csv(enrollments, ['StudentID', 'CourseID'])