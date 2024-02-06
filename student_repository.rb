require 'csv'
require_relative 'student'
require_relative 'course_repository'

class StudentRepository
  def initialize(csv_path, course_repository)
    @csv_path = csv_path
    @repo = course_repository
    @students = []
    @next_id = 1
    load_csv
  end

  def add(student)
    student.id = @next_id
    @students << student
    @next_id += 1
    save_csv
  end

  def add_to_course(student, course)
    student.course = course
  end

  def all
    @students
  end

  def find(index)
    @students[index]
  end

  def destroy(index)
    @students.delete_at(index)
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i
      row[:level] = row[:level].to_f
      student = Student.new(row)
      course = @repo.find(row[:course_id].to_i)
      student.course = course
      @students << student
    end

    @next_id = @students.empty? ? 1 : @students.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["id", "name", "age", "level", "course_id"]
      @students.each do |student|
        csv << [student.id, student.name, student.age, student.level, student.course.id]
      end
    end
  end
end
