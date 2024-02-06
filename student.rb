class Student
  attr_reader :name, :level
  attr_accessor :course, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @level = attributes[:level]
  end
end
