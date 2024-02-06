# require_relative 'course'
require_relative 'courses_view'
require_relative 'students_view'

class CoursesController
  def initialize(course_repository, student_repository)
    @repo = course_repository
    @student_repo = student_repository
    @view = CoursesView.new
    @student_view = StudentsView.new
  end

  def list
    courses = @repo.all
    @view.display(courses)
  end

  def add
    n_hours = @view.ask_user_to_add_course_n_hours
    capacity = @view.ask_user_to_add_course_capacity
    course = Course.new(capacity: capacity, n_hours: n_hours)
    @repo.create(course)
  end

  def add_student_to_course
    students = @student_repo.all
    @student_view.display(students)
    student_index = @view.ask_user_to_select_student
    student = students[student_index]
    courses = @repo.all
    @view.display(courses)
    course_index = @view.ask_user_course_index
    course = courses[course_index]
    @student_repo.add_to_course(student, course)
    course.add(student)
  end

  def remove
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
