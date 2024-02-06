require_relative 'student'
require_relative 'students_view'

class StudentsController
  def initialize(student_repository)
    @repo = student_repository
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
    student = Student.new(name: name, age: age, level: level, course_id: 0)
    @repo.add(student)
  end

  # def add_to_course
  #   list
  #   index = @view.ask_user_to_select_student
  #   student = @repo.find(index)
  #   course_id = @view.ask_user_to_add_student_to_course
  #   course = @repo.find_course(course_id)
  #   @repo.add_to_course(student, course)
  # end

  def remove_student
    list
    index = @view.ask_user_to_select_student
    @repo.destroy(index)
  end

  private

  def display_students
    students = @repository.all
    @view.display(students)
  end
end
