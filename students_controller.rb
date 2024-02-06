require_relative 'student'
require_relative 'students_view'

class StudentsController
  def initialize(students_repository)
    @repo = students_repository
    @view = StudentsView.new
  end

  def list
    students = @repo.all
    @view.display(students)
  end

  def add
    name = @view.ask_user_to_add_student_name
    age = @view.ask_user_to_add_student_age
    level = @view.ask_user_to_add_student_level
    student = Student.new(name: name, age: age, level: level)
    @repo.add(student)
  end

  def add_to_course
    list
    index = @view.ask_user_to_select_student
    student = @repo.find(index)
    course_id = @view.ask_user_to_add_student_to_course
    course = @repo.find_course(course_id)
    @repo.add_to_course(student, course)
  end
end
