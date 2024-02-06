require_relative 'student'

class Course
  attr_accessor :id, :n_hours, :capacity, :students

  class FullCourse < Exception; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @n_hours = attributes[:n_hours]
    @capacity = attributes[:capacity] || 0
    @students = attributes[:students] || []
  end

  def full?
    @students.size == @capacity
  end

  def add(student)
    if full?
      fail FullCourse, "Course is full"
    else
      student.course_id = self.id
      @students << student
    end
  end
end
