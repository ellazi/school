class Student
  attr_reader :name, :level, :age
  attr_accessor :course_id, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @level = attributes[:level]
    @course_id = attributes[:course_id]
  end
end
