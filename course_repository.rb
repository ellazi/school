require 'csv'
require_relative 'course'

class CourseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @courses = []
    load_csv
  end

  def find(index)
    @course[index]
  end

  def create(course)
    course.id = @next_id
    @courses << course
    @next_id += 1
    save_csv
  end

  def all
    @courses
  end

  def destroy(index)
    @courses.delete_at(index)
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      row[:n_hours] = row[:n_hours].to_i
      p row
      course = Course.new(row)
      @courses << course
    end

    @next_id = @courses.empty? ? 1 : @courses.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["id", "n_hours", "capacity"]
      @courses.each do |course|
        csv << [course.id, course.n_hours, course.capacity]
      end
    end
  end
end
