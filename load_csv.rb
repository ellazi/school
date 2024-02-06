require 'csv'
require_relative 'student'

students = []
CSV.foreach('students.csv', headers: true, header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i
  row[:age] = row[:age].to_i
  row[:level] = row[:level].to_f
  student = Student.new(row)
  students << student
  p students
end
