require_relative 'course_repository'
require_relative 'courses_controller'
require_relative 'student_repository'
require_relative 'students_controller'
require_relative 'router'

course_repository = CourseRepository.new('courses.csv')
student_repository = StudentRepository.new('students.csv', course_repository)
courses_controller = CoursesController.new(course_repository, student_repository)
students_controller = StudentsController.new(student_repository)
router = Router.new(courses_controller, students_controller)
router.run
